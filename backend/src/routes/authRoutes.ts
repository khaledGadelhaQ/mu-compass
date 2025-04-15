// src/routes/authRoutes.ts
import { Router } from 'express';
import {
  login,
  register,
  getMe,
  updateMe,
  deleteMe,
} from '../controllers/authController';
import { protect } from '../middleware/authMiddleware';

const router = Router();

router.post('/register', register);
router.post('/login', login);

// Protect all routes after this middleware
router.use(protect);

router.get('/me', getMe);
router.put('/me', updateMe);
router.delete('/me', deleteMe);

export default router;
