import { relations } from 'drizzle-orm';
import { pgTable, uuid, varchar } from 'drizzle-orm/pg-core';
import { baseDateColumns } from './columns';
import { usersToUserRolesSchema } from './users-to-user-roles.schema';

// Constants
export const TABLE_USER_ROLES = 'user_roles';

export const userRolesSchema = pgTable(TABLE_USER_ROLES, {
  id: uuid().primaryKey().defaultRandom(),
  ...baseDateColumns,
  name: varchar('name', { length: 255 }).notNull().unique(),
});

export const userRolesRelations = relations(userRolesSchema, ({ many }) => ({
  usersToUserRoles: many(usersToUserRolesSchema),
}));
