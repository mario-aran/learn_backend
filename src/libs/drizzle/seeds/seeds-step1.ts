import {
  clientDiscountsSchema,
  productCategoriesSchema,
  userRolesSchema,
  usersSchema,
} from '@/libs/drizzle/schemas';
import { createSeed } from '@/libs/drizzle/utils';
import {
  mockClientDiscount,
  mockProductCategoryName,
  mockUserEmail,
  mockUserName,
  mockUserPassword,
  mockUserRoleName,
} from './mocks';

// Seed definitions
const userRoles = createSeed(userRolesSchema, {
  name: mockUserRoleName(),
});

const users = createSeed(usersSchema, {
  name: mockUserName(),
  email: mockUserEmail(),
  password: mockUserPassword(),
});

const clientDiscounts = createSeed(clientDiscountsSchema, {
  discount: mockClientDiscount(),
});

const productCategories = createSeed(productCategoriesSchema, {
  name: mockProductCategoryName(),
});

// Combinde and export all seeds
export const seedsStep1 = [
  userRoles,
  users,
  clientDiscounts,
  productCategories,
];
