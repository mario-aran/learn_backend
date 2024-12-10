import { relations } from 'drizzle-orm';
import { pgTable, primaryKey, uuid } from 'drizzle-orm/pg-core';
import { products } from './products.schema';
import { sales } from './sales.schema';

export const productsToSales = pgTable(
  'products_to_sales',
  {
    productId: uuid('product_id')
      .notNull()
      .references(() => products.id),
    saleId: uuid('sale_id')
      .notNull()
      .references(() => sales.id),
  },
  (t) => [primaryKey({ columns: [t.productId, t.saleId] })],
);

export const productsToSalesRelations = relations(
  productsToSales,
  ({ one }) => ({
    product: one(products, {
      fields: [productsToSales.productId],
      references: [products.id],
    }),
    sale: one(sales, {
      fields: [productsToSales.saleId],
      references: [sales.id],
    }),
  }),
);
