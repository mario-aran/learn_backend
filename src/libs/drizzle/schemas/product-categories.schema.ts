import { relations } from 'drizzle-orm';
import { pgTable, varchar } from 'drizzle-orm/pg-core';
import { createdAt, id, updatedAt } from './columns';
import { productsSchema } from './products.schema';

// Constants
export const TABLE_PRODUCT_CATEGORIES = 'product_categories';

export const productCategoriesSchema = pgTable(TABLE_PRODUCT_CATEGORIES, {
  id,
  createdAt,
  updatedAt,
  name: varchar('name', { length: 255 }).notNull().unique(),
});

export const productCategoriesRelations = relations(
  productCategoriesSchema,
  ({ many }) => ({
    products: many(productsSchema),
  }),
);
