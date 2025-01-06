import {
  CLIENT_DISCOUNTS,
  PRODUCT_CATEGORIES,
  USER_ROLES,
} from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import {
  clientDiscountsSchema,
  productCategoriesSchema,
  TABLE_CLIENT_DISCOUNTS,
  TABLE_PRODUCT_CATEGORIES,
  TABLE_USER_ROLES,
  userRolesSchema,
} from '@/libs/drizzle/schemas';

// Types
type UserRoleRow = typeof userRolesSchema.$inferInsert;
type ClientDiscountRow = typeof clientDiscountsSchema.$inferInsert;
type ProductCategoryRow = typeof productCategoriesSchema.$inferInsert;

// Prepare mocks
const mockedUserRoles = Object.values(USER_ROLES).map(
  (name): UserRoleRow => ({
    name,
  }),
);

const mockedClientDiscounts = CLIENT_DISCOUNTS.map(
  (discount): ClientDiscountRow => ({
    discount,
  }),
);

const mockedProductCategories = Object.values(PRODUCT_CATEGORIES).map(
  (name): ProductCategoryRow => ({
    name,
  }),
);

// Prepare data mappings
const seedDataMappings = [
  { schema: userRolesSchema, values: mockedUserRoles },
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
    `Seeding completed for: ${TABLE_USER_ROLES}, ${TABLE_CLIENT_DISCOUNTS}, ${TABLE_PRODUCT_CATEGORIES}`,
  );
};
