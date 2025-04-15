// src/app.ts
import express from 'express';
import cors from 'cors';
import Database from './config/db';
import eventRoutes from './routes/eventRoutes';
import authRoutes from './routes/authRoutes';
import path from 'path';

const app = express();
// singleton instance of Database
Database.getInstance();

app.use(cors());
app.use(express.json());

app.use('/images', express.static(path.join(__dirname, '../public/images')));

app.use('/api/v1/auth', authRoutes);
app.use('/api/events', eventRoutes);

export default app;
