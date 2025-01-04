import { db } from '@/libs/drizzle/db';

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

export const truncateTables = async () => {
  // Fetch tables
  const { rows }: SelectTablesResults = await db.execute(SELECT_TABLES_QUERY);
  if (rows.length === 0) return console.log('No tables to truncate');

  // Prepare truncate tables query
  const joinedTableNames = rows.map(({ table_name }) => table_name).join(', ');
  const truncateTablesQuery = `
    TRUNCATE TABLE ${joinedTableNames} 
    RESTART IDENTITY 
    CASCADE;
  `;

  try {
    // Run transaction
    await db.transaction(async (tx) => tx.execute(truncateTablesQuery));

    console.log(`All tables truncated successfully: ${joinedTableNames}`);
  } catch (err) {
    // Error type assertion
    const errorMessage = err instanceof Error ? err.message : 'Unknown error';

    throw new Error(`Truncate tables error: ${errorMessage}`);
  }
};
