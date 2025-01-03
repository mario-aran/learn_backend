import { db } from '@/libs/drizzle/db';
import { TX } from '@/libs/drizzle/types';

// Types
interface SelectTablesResults {
  rows: { table_name: string }[];
}

// Constants
const SELECT_TABLES_QUERY = `
  SELECT table_name
  FROM information_schema.tables
  WHERE table_schema = 'public';
`;

// Utils
const txCallback = async (tx: TX) => {
  // Get tables
  const { rows } = (await tx.execute(
    SELECT_TABLES_QUERY,
  )) as SelectTablesResults;
  if (rows.length === 0) {
    console.log('No tables to truncate');
    return;
  }

  // Truncate tables
  const joinedTableNames = rows.map(({ table_name }) => table_name).join(', ');
  const truncateTablesQuery = `
        TRUNCATE TABLE ${joinedTableNames} 
        RESTART IDENTITY 
        CASCADE;
      `;
  await tx.execute(truncateTablesQuery);

  console.log(`All tables truncated successfully: ${joinedTableNames}`);
};

export const truncateTables = async () => {
  try {
    // Run transaction
    await db.transaction(txCallback);
  } catch (err) {
    // Error type assertion
    const errorMessage = err instanceof Error ? err.message : 'Unknown error';
    const errorStack =
      err instanceof Error ? err.stack : 'No stack trace available';
    throw new Error(`Truncate tables error: ${errorMessage}\n${errorStack}`);
  }
};
