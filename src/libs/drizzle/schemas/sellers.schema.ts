import { BASE_COLUMNS } from '@/libs/drizzle/constants/base-columns';
import { pgTable } from 'drizzle-orm/pg-core';

// Constants
const TABLE_NAME = 'sellers';

export const sellersSchema = pgTable(TABLE_NAME, {
  ...BASE_COLUMNS,
});
