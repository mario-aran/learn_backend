import { BASE_COLUMNS } from '@/libs/drizzle/constants';
import { relations } from 'drizzle-orm';
import { integer, pgTable, varchar } from 'drizzle-orm/pg-core';
import { ordersSchema } from './orders.schema';

// Constants
const TABLE_NAME = 'clients';

export const clientsSchema = pgTable(TABLE_NAME, {
  ...BASE_COLUMNS,
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  name: varchar('name').notNull(),
});

export const clientsRelations = relations(clientsSchema, ({ many }) => ({
  sales: many(ordersSchema),
}));
