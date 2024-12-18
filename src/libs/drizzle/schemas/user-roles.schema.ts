import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { pgTable, uuid, varchar } from 'drizzle-orm/pg-core';

export const userRolesSchema = pgTable('user_roles', {
  id: uuid().primaryKey().defaultRandom(),
  ...BASE_DATE_COLUMNS,
  name: varchar('name').notNull(),
});
