// src/middleware/authMiddleware.ts
import { Request, Response, NextFunction } from 'express';
import AuthService from '../services/auth/authService';
import UserPersistenceService from '../services/user/persistenceService';
import type { IUser } from '../models/userModel';

declare global {
  namespace Express {
    interface Request {
      user?: IUser;
    }
  }
}

export const protect = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    let token: string | undefined;

    if (
      req.headers.authorization &&
      req.headers.authorization.startsWith('Bearer')
    ) {
      token = req.headers.authorization.split(' ')[1];
    }

    if (!token) {
      return res
        .status(401)
        .json({ success: false, message: 'Not authorized' });
    }

    const decoded = AuthService.verifyToken(token);
    const user = await UserPersistenceService.getUserById(decoded.id);

    if (!user) {
      return res
        .status(401)
        .json({ success: false, message: 'User not found' });
    }

    req.user = user;
    next();
  } catch (error) {
    return res.status(401).json({ success: false, message: 'Not authorized' });
  }
};

export const restrictTo = (...roles: string[]) => {
  return (req: Request, res: Response, next: NextFunction) => {
    if (!roles.includes(req.user!.role)) {
      return res
        .status(403)
        .json({ success: false, message: 'Permission denied' });
    }
    next();
  };
};
