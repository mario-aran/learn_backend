import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { decimal, pgTable, uuid } from 'drizzle-orm/pg-core';

export const clientDiscountsSchema = pgTable('client_discounts', {
  id: uuid().primaryKey().defaultRandom(),
  ...BASE_DATE_COLUMNS,
  discount: decimal('discount', { precision: 4, scale: 2 }),
});
