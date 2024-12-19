import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { relations } from 'drizzle-orm';
import { pgTable, uuid } from 'drizzle-orm/pg-core';
import { ordersSchema } from './orders.schema';
import { usersSchema } from './users.schema';

export const sellersSchema = pgTable('sellers', {
  id: uuid().primaryKey().defaultRandom(),
  userId: uuid('user_id')
    .notNull()
    .unique()
    .references(() => usersSchema.id),
  ...BASE_DATE_COLUMNS,
});

export const sellersRelations = relations(sellersSchema, ({ one, many }) => ({
  user: one(usersSchema, {
    fields: [sellersSchema.userId],
    references: [usersSchema.id],
  }),
  orders: many(ordersSchema),
}));
