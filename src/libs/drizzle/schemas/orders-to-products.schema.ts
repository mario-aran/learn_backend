import { relations } from 'drizzle-orm';
import { decimal, integer, pgTable, primaryKey } from 'drizzle-orm/pg-core';
import { createdAt, updatedAt } from './columns';
import { ordersSchema } from './orders.schema';
import { productsSchema } from './products.schema';

// Constants
export const TABLE_ORDERS_TO_PRODUCTS = 'orders_to_products';

export const ordersToProductsSchema = pgTable(
  TABLE_ORDERS_TO_PRODUCTS,
  {
    orderId: integer('order_id')
      .notNull()
      .references(() => ordersSchema.id),
    productId: integer('product_id')
      .notNull()
      .references(() => productsSchema.id),
    createdAt,
    updatedAt,
    unitPrice: decimal('unit_price', { precision: 10, scale: 2 }).notNull(),
    discount: decimal('discount', { precision: 4, scale: 2 }).notNull(),
    quantity: integer('quantity').notNull(),
  },
  (t) => [primaryKey({ columns: [t.orderId, t.productId] })],
);

export const ordersToProductsRelations = relations(
  ordersToProductsSchema,
  ({ one }) => ({
    order: one(ordersSchema, {
      fields: [ordersToProductsSchema.orderId],
      references: [ordersSchema.id],
    }),
    product: one(productsSchema, {
      fields: [ordersToProductsSchema.productId],
      references: [productsSchema.id],
    }),
  }),
);
