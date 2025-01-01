import { relations } from 'drizzle-orm';
import { pgTable, uuid, varchar } from 'drizzle-orm/pg-core';
import { baseDateColumns } from './columns/base-date-columns';
import { productsSchema } from './products.schema';

export const productCategoriesSchema = pgTable('product_categories', {
  id: uuid().primaryKey().defaultRandom(),
  ...baseDateColumns,
  name: varchar('name', { length: 255 }).notNull().unique(),
});

export const productCategoriesRelations = relations(
  productCategoriesSchema,
  ({ many }) => ({
    products: many(productsSchema),
  }),
);
