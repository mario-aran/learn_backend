import { SEEDS_LENGTH } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { productsSchema } from '@/libs/drizzle/schemas';
import { Product } from '@/libs/drizzle/types';
import { faker } from '@faker-js/faker';
import { getRandomObjectId } from './utils/get-random';

export const seedProducts = async () => {
  // Query product category ids
  const productCategoryIds = await db.query.productCategoriesSchema.findMany({
    columns: { id: true },
  });
  if (!productCategoryIds.length)
    throw new Error('No product category ids found');

  // Prepare mocked data
  const mockedProducts = faker.helpers
    .uniqueArray(faker.commerce.productName, SEEDS_LENGTH)
    .map(
      (name): Product => ({
        productCategoryId: getRandomObjectId(productCategoryIds),
        name,
        unitPrice: faker.commerce.price({ min: 100, max: 1000, dec: 2 }),
      }),
    );

  // Insert seeds
  const result = await db.insert(productsSchema).values(mockedProducts);
  console.log('Seeding completed for: products');
  return result;
};
