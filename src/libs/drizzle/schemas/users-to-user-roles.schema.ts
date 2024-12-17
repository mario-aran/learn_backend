import { BASE_COLUMNS } from '@/libs/drizzle/constants/base-columns';
import { pgTable } from 'drizzle-orm/pg-core';

// Constants
const TABLE_NAME = 'users_to_user_roles';

export const usersToUserRolesSchema = pgTable(TABLE_NAME, {
  ...BASE_COLUMNS,
});
