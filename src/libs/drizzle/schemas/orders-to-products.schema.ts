import { baseDateColumns } from '@/libs/drizzle/columns';
import { relations } from 'drizzle-orm';
import {
  decimal,
  integer,
  pgTable,
  primaryKey,
  uuid,
} from 'drizzle-orm/pg-core';
import { ordersSchema } from './orders.schema';
import { productsSchema } from './products.schema';

export const ordersToProductsSchema = pgTable(
  'orders_to_products',
  {
    orderId: uuid('order_id')
      .notNull()
      .references(() => ordersSchema.id),
    productId: uuid('product_id')
      .notNull()
      .references(() => productsSchema.id),
    ...baseDateColumns,
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
