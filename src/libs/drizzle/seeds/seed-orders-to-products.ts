import { db } from '@/libs/drizzle/db';
import {
  ordersToProductsSchema,
  TABLE_ORDERS_TO_PRODUCTS,
} from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker';

// Types
type OrderToProduct = typeof ordersToProductsSchema.$inferInsert;

export const seedOrdersToProducts = async () => {
  // Queries
  const orders = await db.query.ordersSchema.findMany({
    columns: { id: true },
    with: {
      client: {
        columns: {},
        with: { clientDiscount: { columns: { discount: true } } },
      },
    },
  });
  if (orders.length === 0) throw new Error('No orders found');

  const products = await db.query.productsSchema.findMany({
    columns: { id: true, unitPrice: true },
  });
  if (products.length === 0) throw new Error('No products found');

  // Prepare mocks
  const mockedOrdersToProducts = orders.map(
    ({ id, client }): OrderToProduct => {
      const product = faker.helpers.arrayElement(products);
      return {
        orderId: id,
        productId: product.id,
        unitPrice: product.unitPrice,
        discount: client.clientDiscount.discount,
        quantity: faker.number.int({ min: 1, max: 10 }),
      };
    },
  );

  // Insert seeds
  await db.insert(ordersToProductsSchema).values(mockedOrdersToProducts);

  console.log(`Seeding completed for: ${TABLE_ORDERS_TO_PRODUCTS}`);
};
