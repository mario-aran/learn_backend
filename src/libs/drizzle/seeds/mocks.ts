import { faker } from '@faker-js/faker';

// Utils
const getRandomValue = (arr: string[]) =>
  arr[Math.floor(Math.random() * arr.length)];

// Mocks
export const mockClient = {
  discount: () =>
    faker.number.float({ multipleOf: 0.05, min: 0, max: 0.8 }).toString(),
};

export const mockProduct = {
  categoryName: () => getRandomValue(['Basic', 'Medium', 'Premium']),
  name: () => faker.commerce.productName(),
  unitPrice: () => faker.commerce.price({ min: 100, max: 1000, dec: 2 }),
  quantity: () => faker.number.int({ min: 1, max: 10 }),
};

export const mockUser = {
  roleName: () => getRandomValue(['Seller', 'Client']),
  name: () => faker.person.fullName(),
  email: () => faker.internet.email(),
  password: () => faker.internet.password(),
};
