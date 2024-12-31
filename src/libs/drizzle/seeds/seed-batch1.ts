import {
  PRODUCT_CATEGORIES,
  SEEDS_LENGTH,
  USER_ROLES,
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
  records: Object.values(USER_ROLES).map(
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
  records: Array.from({ length: 5 }, (_, index): ClientDiscount => {
    const start = 0.1;
    const step = 0.05;
    const decimals = 2;

    return {
      discount: (start + step * index).toFixed(decimals),
    };
  }),
};

const seedProductCategories = {
  schema: productCategoriesSchema,
  records: Object.values(PRODUCT_CATEGORIES).map(
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
