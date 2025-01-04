import {
  CLIENT_DISCOUNTS,
  PRODUCT_CATEGORIES,
  SEEDS_LENGTH,
  USER_ROLES,
} from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import {
  clientDiscountsSchema,
  productCategoriesSchema,
  TABLE_CLIENT_DISCOUNTS,
  TABLE_PRODUCT_CATEGORIES,
  TABLE_USER_ROLES,
  TABLE_USERS,
  userRolesSchema,
  usersSchema,
} from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker';

// Types
type UserRole = typeof userRolesSchema.$inferInsert;
type User = typeof usersSchema.$inferInsert;
type ClientDiscount = typeof clientDiscountsSchema.$inferInsert;
type ProductCategory = typeof productCategoriesSchema.$inferInsert;

// Prepare mocks
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

const mockedClientDiscounts = CLIENT_DISCOUNTS.map(
  (discount): ClientDiscount => ({
    discount,
  }),
);

const mockedProductCategories = Object.values(PRODUCT_CATEGORIES).map(
  (name): ProductCategory => ({
    name,
  }),
);

// Prepare data mappings
const seedDataMappings = [
  { schema: userRolesSchema, values: mockedUserRoles },
  { schema: usersSchema, values: mockedUsers },
  { schema: clientDiscountsSchema, values: mockedClientDiscounts },
  { schema: productCategoriesSchema, values: mockedProductCategories },
];

export const seedBaseTables = async () => {
  // Prepare promises
  const seedPromises = seedDataMappings.map(({ schema, values }) =>
    db.insert(schema).values(values),
  );

  // Insert seed promises
  await Promise.all(seedPromises);

  console.log(
    `Seeding completed for: ${TABLE_USER_ROLES}, ${TABLE_USERS}, ${TABLE_CLIENT_DISCOUNTS}, ${TABLE_PRODUCT_CATEGORIES}`,
  );
};
