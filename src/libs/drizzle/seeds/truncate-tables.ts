import { db } from '@/libs/drizzle/db';
import { TX } from '@/libs/drizzle/types';

// Constants
const SELECT_TABLES_QUERY = `
  SELECT table_name
  FROM information_schema.tables
  WHERE table_schema = 'public';
`;

export const truncateTables = async (tx: TX): Promise<string> => {
  // Fetch tables
  const { rows } = await db.execute<{ table_name: string }>(
    SELECT_TABLES_QUERY,
  );
  if (rows.length === 0) return 'No tables to truncate';

  // Prepare truncate query
  const joinedTableNames = rows.map(({ table_name }) => table_name).join(', ');
  const truncateTablesQuery = `
    TRUNCATE TABLE ${joinedTableNames} 
    RESTART IDENTITY 
    CASCADE;
  `;

  // Run transaction
  await tx.execute(truncateTablesQuery);
  return `Tables truncated successfully: ${joinedTableNames}`;
};
