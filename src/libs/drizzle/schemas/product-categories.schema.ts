import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { pgTable, uuid, varchar } from 'drizzle-orm/pg-core';

export const productCategoriesSchema = pgTable('product_categories', {
  id: uuid().primaryKey().defaultRandom(),
  ...BASE_DATE_COLUMNS,
  name: varchar('name', { length: 255 }).notNull().unique(),
});

// export const productCategoriesRelations = relations(
//   productCategoriesSchema,
//   ({ many }) => ({
//     products: many(productsSchema),
//   }),
// );
