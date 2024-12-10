import { relations } from 'drizzle-orm';
import { pgTable, timestamp, uuid, varchar } from 'drizzle-orm/pg-core';
import { productCategories } from './product-categories.schema';
import { productsToSales } from './products-to-sales.schema';

export const products = pgTable('products', {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
  id: uuid('id').primaryKey().defaultRandom(),
  name: varchar('name').notNull(),
  productCategoryId: uuid('product_category_id')
    .notNull()
    .references(() => productCategories.id),
});

export const productsRelations = relations(products, ({ one, many }) => ({
  productCategory: one(productCategories, {
    fields: [products.productCategoryId],
    references: [productCategories.id],
  }),
  productsToSales: many(productsToSales),
}));
