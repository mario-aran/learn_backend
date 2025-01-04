import { relations } from 'drizzle-orm';
import { pgTable, uuid, varchar } from 'drizzle-orm/pg-core';
import { baseDateColumns } from './columns';
import { productsSchema } from './products.schema';

// Constants
export const TABLE_PRODUCT_CATEGORIES = 'product_categories';

export const productCategoriesSchema = pgTable(TABLE_PRODUCT_CATEGORIES, {
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
