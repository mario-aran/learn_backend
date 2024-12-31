import { SEEDS_LENGTH } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { productsSchema } from '@/libs/drizzle/schemas';
import { Product } from '@/libs/drizzle/types';
import { faker } from '@faker-js/faker';

// Requires product categories to be seeded
export const seedProducts = async () => {
  // Fetch all product category ids
  const productCategoryIds = await db.query.productCategoriesSchema.findMany({
    columns: { id: true },
  });
  if (!productCategoryIds?.length)
    throw new Error('No product category ids found');

  // Util to get a random product category id
  const getRandomProductCategoryId = () =>
    productCategoryIds[Math.floor(Math.random() * productCategoryIds.length)]
      .id;

  // Prepare mock values
  const mockValues = faker.helpers
    .uniqueArray(faker.commerce.productName, SEEDS_LENGTH)
    .map(
      (name): Product => ({
        productCategoryId: getRandomProductCategoryId(),
        name,
        unitPrice: faker.commerce.price({ min: 100, max: 1000, dec: 2 }),
      }),
    );

  // Insert seeds
  const result = await db.insert(productsSchema).values(mockValues);
  console.log('Products seeded');
  return result;
};
