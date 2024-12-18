import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { decimal, pgTable, uuid, varchar } from 'drizzle-orm/pg-core';

export const clientDiscountsSchema = pgTable('client_discounts', {
  ...BASE_DATE_COLUMNS,
  id: uuid().primaryKey().defaultRandom(),
  name: varchar('name').notNull(),
  discount: decimal('discount', { precision: 4, scale: 2 }),
});
