import { relations } from 'drizzle-orm';
import { integer, pgTable, timestamp, varchar } from 'drizzle-orm/pg-core';
import { productsSchema } from './products.schema';

export const productCategoriesSchema = pgTable('product_categories', {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  name: varchar('name').notNull(),
});

export const productCategoriesRelations = relations(
  productCategoriesSchema,
  ({ many }) => ({
    products: many(productsSchema),
  }),
);
