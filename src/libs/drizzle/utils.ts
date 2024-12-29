import { sql } from 'drizzle-orm';
import { db } from './db';
import { Schema, Seed } from './types';

// Utils
export const getRandomIdFromSchema = async (schema: Schema) => {
  const records = await db
    .select()
    .from(schema)
    .orderBy(sql`RANDOM()`)
    .limit(1);

  return (records[0].id as string) || '';
};

export const createSeed = <T extends Schema>(
  schema: T,
  mockValue: T['$inferInsert'],
  valuesLength = 10,
) => ({
  schema,
  values: Array.from({ length: valuesLength }, () => mockValue),
});

export const insertSeeds = async (seeds: Seed[]) => {
  const promises = seeds.map(({ schema, values }) =>
    db.insert(schema).values(values),
  );

  return Promise.all(promises);
};
