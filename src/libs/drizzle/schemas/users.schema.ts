import { relations } from 'drizzle-orm';
import { pgTable, varchar } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';
import { createdAt, id, updatedAt } from './columns';
import { sellersSchema } from './sellers.schema';
import { usersToUserRolesSchema } from './users-to-user-roles.schema';

// Cosntants
export const TABLE_USERS = 'users';

export const usersSchema = pgTable(TABLE_USERS, {
  id,
  createdAt,
  updatedAt,
  name: varchar('name', { length: 255 }).notNull(),
  email: varchar('email', { length: 255 }).notNull().unique(),
  password: varchar('password', { length: 255 }).notNull(),
});

export const usersRelations = relations(usersSchema, ({ one, many }) => ({
  usersToUserRoles: many(usersToUserRolesSchema),
  seller: one(sellersSchema),
  client: one(clientsSchema),
}));
