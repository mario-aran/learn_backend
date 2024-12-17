import { relations } from 'drizzle-orm';
import { integer, pgTable, varchar } from 'drizzle-orm/pg-core';
import { BASE_COLUMNS } from '../constants';
import { productsSchema } from './products.schema';

// Constants
const TABLE_NAME = 'product_categories';

export const productCategoriesSchema = pgTable(TABLE_NAME, {
  ...BASE_COLUMNS,
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  name: varchar('name').notNull(),
});

export const productCategoriesRelations = relations(
  productCategoriesSchema,
  ({ many }) => ({
    products: many(productsSchema),
  }),
);
