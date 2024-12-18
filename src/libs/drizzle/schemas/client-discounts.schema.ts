import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { decimal, pgTable, uuid, varchar } from 'drizzle-orm/pg-core';

export const clientDiscountsSchema = pgTable('client_discounts', {
  id: uuid().primaryKey().defaultRandom(),
  name: varchar('name').notNull(),
  discount: decimal('discount', { precision: 4, scale: 2 }),
  ...BASE_DATE_COLUMNS,
});
