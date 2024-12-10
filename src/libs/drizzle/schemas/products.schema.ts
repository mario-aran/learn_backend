import { relations } from 'drizzle-orm';
import { pgTable, timestamp, uuid, varchar } from 'drizzle-orm/pg-core';
import { productCategoriesSchema } from './product-categories.schema';

export const productsSchema = pgTable('products', {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
  id: uuid('id').primaryKey().defaultRandom(),
  name: varchar('name').notNull(),
  productCategoryId: uuid('product_category_id'),
});

export const productsRelations = relations(productsSchema, ({ one }) => ({
  productCategory: one(productCategoriesSchema, {
    fields: [productsSchema.productCategoryId],
    references: [productCategoriesSchema.id],
  }),
}));
