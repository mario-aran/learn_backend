import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { pgTable, uuid, varchar } from 'drizzle-orm/pg-core';

export const usersSchema = pgTable('users', {
  id: uuid().primaryKey().defaultRandom(),
  ...BASE_DATE_COLUMNS,
  name: varchar('name', { length: 255 }).notNull(),
  email: varchar('email', { length: 255 }).notNull().unique(),
  password: varchar('password', { length: 255 }).notNull(),
});
