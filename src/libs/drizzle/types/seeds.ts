import {
  clientDiscountsSchema,
  clientsSchema,
  ordersSchema,
  ordersToProductsSchema,
  productCategoriesSchema,
  productsSchema,
  sellersSchema,
  userRolesSchema,
  usersSchema,
  usersToUserRolesSchema,
} from '@/libs/drizzle/schemas';
import { RequiredKeys } from '@/types';
import { Schema } from './schemas';

export interface Seed<T extends Schema = Schema> {
  schema: T;
  records: RequiredKeys<T['$inferInsert']>[];
}

export type UserRoles = Seed<typeof userRolesSchema>;
export type Users = Seed<typeof usersSchema>;
export type UsersToUserRoles = Seed<typeof usersToUserRolesSchema>;
export type Sellers = Seed<typeof sellersSchema>;
export type ClientDiscounts = Seed<typeof clientDiscountsSchema>;
export type Clients = Seed<typeof clientsSchema>;
export type ProductCategories = Seed<typeof productCategoriesSchema>;
export type Products = Seed<typeof productsSchema>;
export type Orders = Seed<typeof ordersSchema>;
export type OrdersToProducts = Seed<typeof ordersToProductsSchema>;
