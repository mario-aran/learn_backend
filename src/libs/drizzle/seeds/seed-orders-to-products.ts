import { db } from '@/libs/drizzle/db';
import { ordersToProductsSchema } from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker/.';

// Types
type OrderToProduct = typeof ordersToProductsSchema.$inferInsert;

export const seedOrdersToProducts = async () => {
  // Queries
  const orders = await db.query.ordersSchema.findMany({
    columns: { id: true },
    with: {
      client: {
        with: {
          clientDiscount: { columns: { discount: true } },
        },
      },
    },
  });
  if (orders.length === 0) throw new Error('No orders found');

  const products = await db.query.productsSchema.findMany({
    columns: { id: true, unitPrice: true },
  });
  if (products.length === 0) throw new Error('No products found');

  // Mocked data
  const mockedOrdersToProducts = orders.map((order): OrderToProduct => {
    const randomProduct = faker.helpers.arrayElement(products);
    return {
      orderId: order.id,
      productId: randomProduct.id,
      unitPrice: randomProduct.unitPrice,
      discount: order.client.clientDiscount.discount,
      quantity: faker.number.int({ min: 1, max: 10 }),
    };
  });

  // Insert seeds
  const result = await db
    .insert(ordersToProductsSchema)
    .values(mockedOrdersToProducts);
  console.log('Seeding completed for: ordersToProducts');
  return result;
};
