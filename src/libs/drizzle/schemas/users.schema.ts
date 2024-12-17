import { BASE_COLUMNS } from '@/libs/drizzle/constants/base-columns';
import { pgTable } from 'drizzle-orm/pg-core';

// Constants
const TABLE_NAME = 'users';

export const usersSchema = pgTable(TABLE_NAME, {
  ...BASE_COLUMNS,
});
