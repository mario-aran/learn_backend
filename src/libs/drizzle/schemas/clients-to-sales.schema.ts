import { relations } from 'drizzle-orm';
import { pgTable, primaryKey, uuid } from 'drizzle-orm/pg-core';
import { clients } from './clients.schema';
import { sales } from './sales.schema';

export const clientsToSales = pgTable(
  'clients_to_sales',
  {
    clientId: uuid('client_id')
      .notNull()
      .references(() => clients.id),
    saleId: uuid('sale_id')
      .notNull()
      .references(() => sales.id),
  },
  (t) => [primaryKey({ columns: [t.clientId, t.saleId] })],
);

export const clientsToSalesRelations = relations(clientsToSales, ({ one }) => ({
  client: one(clients, {
    fields: [clientsToSales.clientId],
    references: [clients.id],
  }),
  sale: one(sales, {
    fields: [clientsToSales.saleId],
    references: [sales.id],
  }),
}));
