import { en, es, Faker } from '@faker-js/faker';

export const fakerLocale = new Faker({
  locale: [es, en],
});
