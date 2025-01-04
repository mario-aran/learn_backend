import { relations } from 'drizzle-orm';
import { decimal, pgTable, uuid } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';
import { baseDateColumns } from './columns';

// Constants
export const TABLE_CLIENT_DISCOUNTS = 'client_discounts';

export const clientDiscountsSchema = pgTable(TABLE_CLIENT_DISCOUNTS, {
  id: uuid().primaryKey().defaultRandom(),
  ...baseDateColumns,
  discount: decimal('discount', { precision: 4, scale: 2 }).notNull().unique(),
});

export const clientDiscountsRelations = relations(
  clientDiscountsSchema,
  ({ many }) => ({
    clients: many(clientsSchema),
  }),
);
