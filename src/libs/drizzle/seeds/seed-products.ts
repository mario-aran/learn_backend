import { SEEDS_LENGTH } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { productsSchema } from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker/.';

export const seedProducts = async () => {
  // Fetch all productCategories
  const productCategoryIds = await db.query.productCategoriesSchema.findMany({
    columns: { id: true },
  });
  if (!productCategoryIds.length)
    throw new Error('No productCategoryIds found');

  const getRandomProductCategoryId = () =>
    productCategoryIds[Math.floor(Math.random() * productCategoryIds.length)]
      .id;

  // Prepare values
  const values = faker.helpers
    .uniqueArray(faker.commerce.productName, SEEDS_LENGTH)
    .map((name) => ({
      productCategoryId: getRandomProductCategoryId(),
      name,
      unitPrice: faker.commerce.price({ min: 100, max: 1000, dec: 2 }),
    }));

  // Insert seeds
  const result = await db.insert(productsSchema).values(values);
  console.log('products seeded');
  return result;
};
