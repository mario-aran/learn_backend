import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { decimal, pgTable, uuid, varchar } from 'drizzle-orm/pg-core';
import { productCategoriesSchema } from './product-categories.schema';

export const productsSchema = pgTable('products', {
  id: uuid().primaryKey().defaultRandom(),
  productCategoryId: uuid('product_category_id')
    .notNull()
    .references(() => productCategoriesSchema.id),
  ...BASE_DATE_COLUMNS,
  name: varchar('name', { length: 255 }).notNull().unique(),
  unitPrice: decimal('unit_price', { precision: 10, scale: 2 }).notNull(),
});

// export const productsRelations = relations(productsSchema, ({ one, many }) => ({
//   productCategory: one(productCategoriesSchema, {
//     fields: [productsSchema.productCategoryId],
//     references: [productCategoriesSchema.id],
//   }),
//   orders: many(ordersSchema),
// }));
