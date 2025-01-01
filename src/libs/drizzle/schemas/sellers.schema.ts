import { relations } from 'drizzle-orm';
import { pgTable, uuid } from 'drizzle-orm/pg-core';
import { baseDateColumns } from './columns/base-date-columns';
import { ordersSchema } from './orders.schema';
import { usersSchema } from './users.schema';

export const sellersSchema = pgTable('sellers', {
  id: uuid().primaryKey().defaultRandom(),
  userId: uuid('user_id')
    .notNull()
    .unique()
    .references(() => usersSchema.id),
  ...baseDateColumns,
});

export const sellersRelations = relations(sellersSchema, ({ one, many }) => ({
  orders: many(ordersSchema),
  user: one(usersSchema, {
    fields: [sellersSchema.userId],
    references: [usersSchema.id],
  }),
}));
