import 'dotenv/config';

export const {
  NODE_ENV = '',
  SERVER_PORT = '',
  DATABASE_URL = '',
} = process.env;
