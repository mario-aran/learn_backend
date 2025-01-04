import { relations } from 'drizzle-orm';
import { decimal, pgTable, uuid, varchar } from 'drizzle-orm/pg-core';
import { baseDateColumns } from './columns';
import { ordersToProductsSchema } from './orders-to-products.schema';
import { productCategoriesSchema } from './product-categories.schema';

// Constants
export const TABLE_PRODUCTS = 'products';

export const productsSchema = pgTable(TABLE_PRODUCTS, {
  id: uuid().primaryKey().defaultRandom(),
  productCategoryId: uuid('product_category_id')
    .notNull()
    .references(() => productCategoriesSchema.id),
  ...baseDateColumns,
  name: varchar('name', { length: 255 }).notNull().unique(),
  unitPrice: decimal('unit_price', { precision: 10, scale: 2 }).notNull(),
});

export const productsRelations = relations(productsSchema, ({ one, many }) => ({
  ordersToProducts: many(ordersToProductsSchema),
  productCategory: one(productCategoriesSchema, {
    fields: [productsSchema.productCategoryId],
    references: [productCategoriesSchema.id],
  }),
}));
