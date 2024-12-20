import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { relations } from 'drizzle-orm';
import { decimal, pgTable, uuid } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';

export const clientDiscountsSchema = pgTable('client_discounts', {
  id: uuid().primaryKey().defaultRandom(),
  ...BASE_DATE_COLUMNS,
  discount: decimal('discount', { precision: 4, scale: 2 }).unique(),
});

export const clientDiscountsRelations = relations(
  clientDiscountsSchema,
  ({ many }) => ({
    clients: many(clientsSchema),
  }),
);
