import { getRandomString } from '@/utils';
import { faker } from '@faker-js/faker';

export const mockClientDiscount = () =>
  faker.number.float({ multipleOf: 0.05, min: 0, max: 0.8 }).toString();

export const mockProductName = () => faker.commerce.productName();
export const mockProductUnitPrice = () =>
  faker.commerce.price({ min: 100, max: 1000, dec: 2 });
export const mockProductQuantity = () => faker.number.int({ min: 1, max: 10 });
export const mockProductCategoryName = () =>
  getRandomString(['Basic', 'Medium', 'Premium']);

export const mockUserName = () => faker.person.fullName();
export const mockUserEmail = () => faker.internet.email();
export const mockUserPassword = () => faker.internet.password();
export const mockUserRoleName = () => getRandomString(['Seller', 'Client']);
