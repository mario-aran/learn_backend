import { relations } from 'drizzle-orm';
import { pgTable, varchar } from 'drizzle-orm/pg-core';
import { createdAt, id, updatedAt } from './columns';
import { usersSchema } from './users.schema';

// Constants
export const TABLE_USER_ROLES = 'user_roles';

export const userRolesSchema = pgTable(TABLE_USER_ROLES, {
  id,
  createdAt,
  updatedAt,
  name: varchar('name', { length: 255 }).notNull().unique(),
});

export const userRolesRelations = relations(userRolesSchema, ({ many }) => ({
  users: many(usersSchema),
}));
