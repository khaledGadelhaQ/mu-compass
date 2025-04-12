// src/app.ts
import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';
import Database from './config/db';
import eventRoutes from './routes/eventRoutes';
import path from 'path';

const app = express();
// singleton instance of Database
Database.getInstance();

app.use(cors());
app.use(bodyParser.json());

app.use('/images', express.static(path.join(__dirname, '../public/images')));

app.use('/api/events', eventRoutes);

export default app;
