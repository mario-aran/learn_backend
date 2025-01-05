import { relations } from 'drizzle-orm';
import { integer, pgTable } from 'drizzle-orm/pg-core';
import { createdAt, id, updatedAt } from './columns';
import { ordersSchema } from './orders.schema';
import { usersSchema } from './users.schema';

// Constants
export const TABLE_SELLERS = 'sellers';

export const sellersSchema = pgTable(TABLE_SELLERS, {
  id,
  userId: integer('user_id')
    .notNull()
    .unique()
    .references(() => usersSchema.id),
  createdAt,
  updatedAt,
});

export const sellersRelations = relations(sellersSchema, ({ one, many }) => ({
  orders: many(ordersSchema),
  user: one(usersSchema, {
    fields: [sellersSchema.userId],
    references: [usersSchema.id],
  }),
}));
