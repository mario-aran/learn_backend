import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { pgTable, uuid } from 'drizzle-orm/pg-core';
import { usersSchema } from './users.schema';

export const sellersSchema = pgTable('sellers', {
  id: uuid().primaryKey().defaultRandom(),
  userId: uuid('user_id')
    .notNull()
    .unique()
    .references(() => usersSchema.id),
  ...BASE_DATE_COLUMNS,
});
