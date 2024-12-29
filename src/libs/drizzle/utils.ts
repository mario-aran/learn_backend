import { sql } from 'drizzle-orm';
import { db } from './db';
import { Schema, Seed } from './types';

export const getRandomString = (strings: string[]) =>
  strings[Math.floor(Math.random() * strings.length)];

export const queryRandomId = async (schema: Schema) => {
  const records = await db
    .select()
    .from(schema)
    .orderBy(sql`RANDOM()`)
    .limit(1);

  return (records[0].id as string) || '';
};

export const createSeed = <T extends Schema>(
  schema: T,
  mockRecord: T['$inferInsert'],
  recordsLength = 10,
) => ({
  schema,
  records: Array.from({ length: recordsLength }, () => mockRecord),
});

export const insertSeeds = async (seeds: Seed[]) => {
  const promises = seeds.map(({ schema, values }) =>
    db.insert(schema).values(values),
  );

  return Promise.all(promises);
};
