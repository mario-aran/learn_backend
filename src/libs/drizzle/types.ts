import {
  clientDiscountsSchema,
  clientsSchema,
  productCategoriesSchema,
  productsSchema,
  sellersSchema,
  userRolesSchema,
  usersSchema,
  usersToUserRolesSchema,
} from '@/libs/drizzle/schemas';
import { PgTable, TableConfig } from 'drizzle-orm/pg-core';

export type RequiredKeys<T> = {
  [K in keyof T as undefined extends T[K] ? never : K]: T[K];
};

export type Schema = PgTable<TableConfig>;

export interface RecordId {
  id: string;
}

export interface Seed<T extends Schema = Schema> {
  schema: T;
  records: T['$inferInsert'][];
}

export type UserRole = RequiredKeys<typeof userRolesSchema.$inferInsert>;
export type User = RequiredKeys<typeof usersSchema.$inferInsert>;
export type ClientDiscount = RequiredKeys<
  typeof clientDiscountsSchema.$inferInsert
>;
export type ProductCategory = RequiredKeys<
  typeof productCategoriesSchema.$inferInsert
>;
export type UserToUserRole = RequiredKeys<
  typeof usersToUserRolesSchema.$inferInsert
>;
export type Seller = RequiredKeys<typeof sellersSchema.$inferInsert>;
export type Client = RequiredKeys<typeof clientsSchema.$inferInsert>;
export type Product = RequiredKeys<typeof productsSchema.$inferInsert>;
