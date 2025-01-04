import { SEEDS_LENGTH } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { productsSchema, TABLE_PRODUCTS } from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker';

// Types
type Product = typeof productsSchema.$inferInsert;

export const seedProducts = async () => {
  // Queries
  const productCategories = await db.query.productCategoriesSchema.findMany({
    columns: { id: true },
  });
  if (productCategories.length === 0)
    throw new Error('No product categories found');

  // Prepare mocks
  const mockedProducts = faker.helpers
    .uniqueArray(faker.commerce.productName, SEEDS_LENGTH)
    .map(
      (name): Product => ({
        productCategoryId: faker.helpers.arrayElement(productCategories).id,
        name,
        unitPrice: faker.commerce.price({ min: 100, max: 1000, dec: 2 }),
      }),
    );

  // Insert seeds
  await db.insert(productsSchema).values(mockedProducts);

  console.log(`Seeding completed for: ${TABLE_PRODUCTS}`);
};
