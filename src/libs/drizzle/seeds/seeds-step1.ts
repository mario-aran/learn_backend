import {
  PRODUCT_CATEGORY_NAMES,
  SEEDS_LENGTH,
  USER_ROLE_NAMES,
} from '@/libs/drizzle/constants';
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
  records: faker.helpers.uniqueArray(faker.internet.email, SEEDS_LENGTH).map(
    (email): User => ({
      name: faker.person.fullName(),
      email,
      password: faker.internet.password(),
    }),
  ),
};

const seedClientDiscounts = {
  schema: clientDiscountsSchema,
  records: (() => {
    const discounts = [];
    const start = 10;
    const end = 30;
    const step = 5;

    for (let i = start; i <= end; i += step) {
      discounts.push((i / 100).toFixed(2));
    }

    return discounts;
  })().map((discount): ClientDiscount => ({ discount })),
};

const seedProductCategories = {
  schema: productCategoriesSchema,
  records: PRODUCT_CATEGORY_NAMES.map(
    (name): ProductCategory => ({
      name,
    }),
  ),
};

// Combine and export all seeds
export const seedsStep1 = [
  seedUserRoles,
  seedUsers,
  seedClientDiscounts,
  seedProductCategories,
];
