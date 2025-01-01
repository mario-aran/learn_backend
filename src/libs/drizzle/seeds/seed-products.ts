import { db } from '@/libs/drizzle/db';
import { productsSchema } from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker';
import { SEEDS_LENGTH } from './constants';

// Types
type Product = typeof productsSchema.$inferInsert;

export const seedProducts = async () => {
  // Queries
  const productCategories = await db.query.productCategoriesSchema.findMany({
    columns: { id: true },
  });
  if (productCategories.length === 0)
    throw new Error('No product categories found');

  // Mocked data
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
  const result = await db.insert(productsSchema).values(mockedProducts);
  console.log('Seeding completed for: products');
  return result;
};
