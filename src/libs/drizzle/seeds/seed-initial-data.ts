import {
  PRODUCT_CATEGORIES,
  SEEDS_LENGTH,
  USER_ROLES,
} from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import {
  clientDiscountsSchema,
  productCategoriesSchema,
  userRolesSchema,
  usersSchema,
} from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker/.';

// Types
type UserRole = typeof userRolesSchema.$inferInsert;
type User = typeof usersSchema.$inferInsert;
type ClientDiscount = typeof clientDiscountsSchema.$inferInsert;
type ProductCategory = typeof productCategoriesSchema.$inferInsert;

// Prepare mocked data
const mockedUserRoles = Object.values(USER_ROLES).map(
  (name): UserRole => ({
    name,
  }),
);

const mockedUsers = faker.helpers
  .uniqueArray(faker.internet.email, SEEDS_LENGTH)
  .map(
    (email): User => ({
      name: faker.person.fullName(),
      email,
      password: faker.internet.password(),
    }),
  );

const mockedClientDiscounts = Array.from(
  { length: 7 },
  (_, index): ClientDiscount => {
    const start = 0.1;
    const step = 0.05;
    const decimals = 2;

    return {
      discount: (start + step * index).toFixed(decimals),
    };
  },
);

const mockedProductCategories = Object.values(PRODUCT_CATEGORIES).map(
  (name): ProductCategory => ({
    name,
  }),
);

// Prepare seed promises
const seedPromises = [
  db.insert(userRolesSchema).values(mockedUserRoles),
  db.insert(usersSchema).values(mockedUsers),
  db.insert(clientDiscountsSchema).values(mockedClientDiscounts),
  db.insert(productCategoriesSchema).values(mockedProductCategories),
];

export const seedInitialData = async () => {
  // Insert seed promises
  const result = await Promise.all(seedPromises);
  console.log(
    'Seeding completed for: userRoles, users, clientDiscounts, productCategories',
  );
  return result;
};
