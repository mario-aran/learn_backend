import { relations } from 'drizzle-orm';
import { integer, pgTable, timestamp, varchar } from 'drizzle-orm/pg-core';
import { productCategoriesSchema } from './product-categories.schema';
import { salesSchema } from './sales.schema';

export const productsSchema = pgTable('products', {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  name: varchar('name').notNull(),
  price: integer('price').notNull(),
  productCategoryId: integer('product_category_id')
    .notNull()
    .references(() => productCategoriesSchema.id),
});

export const productsRelations = relations(productsSchema, ({ one, many }) => ({
  productCategory: one(productCategoriesSchema, {
    fields: [productsSchema.productCategoryId],
    references: [productCategoriesSchema.id],
  }),
  sales: many(salesSchema),
}));
