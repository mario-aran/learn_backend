import { SEEDS_LENGTH } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { productsSchema } from '@/libs/drizzle/schemas';
import { Product } from '@/libs/drizzle/types';
import { faker } from '@faker-js/faker';

export const seedProducts = async () => {
  // Fetch all product category ids
  const productCategoryIds = await db.query.productCategoriesSchema.findMany({
    columns: { id: true },
  });
  if (!productCategoryIds.length)
    throw new Error('No product category ids found');

  // Util to get a random product category id
  const getRandomProductCategoryId = () =>
    productCategoryIds[Math.floor(Math.random() * productCategoryIds.length)]
      .id;

  // Prepare mocked data
  const mockedProducts = faker.helpers
    .uniqueArray(faker.commerce.productName, SEEDS_LENGTH)
    .map(
      (name): Product => ({
        productCategoryId: getRandomProductCategoryId(),
        name,
        unitPrice: faker.commerce.price({ min: 100, max: 1000, dec: 2 }),
      }),
    );

  // Insert seeds
  const result = await db.insert(productsSchema).values(mockedProducts);
  console.log('Seeding completed for: products');
  return result;
};
