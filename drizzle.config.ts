import { defineConfig } from 'drizzle-kit';

// "drizzle.config" is not in "tsconfig" so it can't use absolute import
import { DATABASE_URL } from './src/config/env';

export default defineConfig({
  dialect: 'postgresql',
  schema: './src/libs/drizzle/schemas/index.ts',
  out: './migrations',
  dbCredentials: { url: DATABASE_URL },
});
