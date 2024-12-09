import { SERVER_PORT } from '@/config/env';
import express from 'express';

const app = express();

app.listen(SERVER_PORT, () => {
  console.log(`Server is running on port: ${SERVER_PORT}`);
});
