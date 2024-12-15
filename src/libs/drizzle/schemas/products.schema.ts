import { relations } from 'drizzle-orm';
import {
  integer,
  pgTable,
  timestamp,
  uuid,
  varchar,
} from 'drizzle-orm/pg-core';
import { productCategoriesSchema } from './product-categories.schema';
import { salesSchema } from './sales.schema';

export const products = pgTable('products', {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
  id: uuid('id').primaryKey().defaultRandom(),
  name: varchar('name').notNull(),
  price: integer('price').notNull(),
  productCategoryId: uuid('product_category_id')
    .notNull()
    .references(() => productCategoriesSchema.id),
});

export const productsRelations = relations(products, ({ one, many }) => ({
  productCategory: one(productCategoriesSchema, {
    fields: [products.productCategoryId],
    references: [productCategoriesSchema.id],
  }),
  sales: many(salesSchema),
}));
