import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { decimal, pgTable, uuid, varchar } from 'drizzle-orm/pg-core';

// Constants
const TABLE_NAME = 'client_discounts';

export const clientDiscountsSchema = pgTable(TABLE_NAME, {
  ...BASE_DATE_COLUMNS,
  id: uuid().primaryKey().defaultRandom(),
  name: varchar('name').notNull(),
  discount: decimal('discount').notNull(),
});
