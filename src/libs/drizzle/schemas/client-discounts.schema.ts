import { baseDateColumns } from '@/libs/drizzle/columns';
import { relations } from 'drizzle-orm';
import { decimal, pgTable, uuid } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';

export const clientDiscountsSchema = pgTable('client_discounts', {
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
