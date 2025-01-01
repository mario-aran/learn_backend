import { relations } from 'drizzle-orm';
import { pgTable, uuid, varchar } from 'drizzle-orm/pg-core';
import { baseDateColumns } from './columns';
import { usersToUserRolesSchema } from './users-to-user-roles.schema';

export const userRolesSchema = pgTable('user_roles', {
  id: uuid().primaryKey().defaultRandom(),
  ...baseDateColumns,
  name: varchar('name', { length: 255 }).notNull().unique(),
});

export const userRolesRelations = relations(userRolesSchema, ({ many }) => ({
  usersToUserRoles: many(usersToUserRolesSchema),
}));
