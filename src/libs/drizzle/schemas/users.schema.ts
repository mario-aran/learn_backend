import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { relations } from 'drizzle-orm';
import { pgTable, uuid, varchar } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';
import { sellersSchema } from './sellers.schema';
import { usersToUserRolesSchema } from './users-to-user-roles.schema';

export const usersSchema = pgTable('users', {
  id: uuid().primaryKey().defaultRandom(),
  ...BASE_DATE_COLUMNS,
  name: varchar('name', { length: 255 }).notNull(),
  email: varchar('email', { length: 255 }).notNull().unique(),
  password: varchar('password', { length: 255 }).notNull(),
});

export const usersRelations = relations(usersSchema, ({ one, many }) => ({
  usersToUserRoles: many(usersToUserRolesSchema),
  seller: one(sellersSchema),
  client: one(clientsSchema),
}));
