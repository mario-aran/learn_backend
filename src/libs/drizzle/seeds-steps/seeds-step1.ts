import {
  clientDiscountsSchema,
  productCategoriesSchema,
  userRolesSchema,
  usersSchema,
} from '@/libs/drizzle/schemas';
import {
  createSeed,
  mockClientDiscount,
  mockProductCategoryName,
  mockUserEmail,
  mockUserName,
  mockUserPassword,
  mockUserRoleName,
} from '@/libs/drizzle/utils';

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

// Combine and export all seeds
export const seedsStep1 = [
  productCategories,
  userRoles,
  users,
  clientDiscounts,
];
