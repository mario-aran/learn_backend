import { relations } from 'drizzle-orm';
import { integer, pgTable, varchar } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';
import { createdAt, id, updatedAt } from './columns';
import { sellersSchema } from './sellers.schema';
import { userRolesSchema } from './user-roles.schema';

// Cosntants
export const TABLE_USERS = 'users';

export const usersSchema = pgTable(TABLE_USERS, {
  id,
  userRoleId: integer('user_role_id')
    .notNull()
    .references(() => userRolesSchema.id),
  createdAt,
  updatedAt,
  name: varchar('name', { length: 255 }).notNull(),
  email: varchar('email', { length: 255 }).notNull().unique(),
  password: varchar('password', { length: 255 }).notNull(),
});

export const usersRelations = relations(usersSchema, ({ one }) => ({
  userRole: one(userRolesSchema, {
    fields: [usersSchema.userRoleId],
    references: [userRolesSchema.id],
  }),
  seller: one(sellersSchema),
  client: one(clientsSchema),
}));
