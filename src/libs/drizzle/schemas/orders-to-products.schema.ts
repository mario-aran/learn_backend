import { BASE_COLUMNS } from '@/libs/drizzle/constants/base-columns';
import { integer, pgTable } from 'drizzle-orm/pg-core';

// Constants
const TABLE_NAME = 'orders_to_products';

export const ordersToProductsSchema = pgTable(TABLE_NAME, {
  ...BASE_COLUMNS,
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
});
