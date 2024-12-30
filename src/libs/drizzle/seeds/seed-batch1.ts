import { CLIENT_DISCOUNTS } from '@/libs/drizzle/constants';
import {
  clientDiscountsSchema,
  productCategoriesSchema,
  userRolesSchema,
  usersSchema,
} from '@/libs/drizzle/schemas';
import {
  ClientDiscount,
  ProductCategory,
  User,
  UserRole,
} from '@/libs/drizzle/types';
import { faker } from '@faker-js/faker/.';

// Constants
const PRODUCT_CATEGORY_NAMES = ['Basic', 'Medium', 'Premium'];
const USER_ROLE_NAMES = ['Seller', 'Client'];
const USER_EMAILS = faker.helpers.uniqueArray(faker.internet.email, 20);

// Seed definitions
const seedUserRoles = {
  schema: userRolesSchema,
  records: USER_ROLE_NAMES.map(
    (name): UserRole => ({
      name,
    }),
  ),
};

const seedUsers = {
  schema: usersSchema,
  records: USER_EMAILS.map(
    (email): User => ({
      name: faker.person.fullName(),
      email,
      password: faker.internet.password(),
    }),
  ),
};

const seedClientDiscounts = {
  schema: clientDiscountsSchema,
  records: CLIENT_DISCOUNTS.map(
    (discount): ClientDiscount => ({
      discount,
    }),
  ),
};

const seedProductCategories = {
  schema: productCategoriesSchema,
  records: PRODUCT_CATEGORY_NAMES.map(
    (name): ProductCategory => ({
      name,
    }),
  ),
};

// Combine and export seed batch
export const seedBatch1 = [
  seedUserRoles,
  seedUsers,
  seedClientDiscounts,
  seedProductCategories,
];
