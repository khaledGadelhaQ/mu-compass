import { Request, Response } from 'express';
import UserFacade from '../services/userFacade';
import asyncHandler from '../middleware/asyncHandler';

export const register = asyncHandler(async (req: Request, res: Response) => {
  const user = await UserFacade.registerUser(req.body);
  const token = await UserFacade.loginUser(user.email, req.body.password);

  res.status(201).json({
    success: true,
    token,
    data: user,
  });
});

export const login = asyncHandler(async (req: Request, res: Response) => {
  const { email, password } = req.body;
  const token = await UserFacade.loginUser(email, password);

  res.status(200).json({
    success: true,
    token,
  });
});

export const getMe = asyncHandler(async (req: Request, res: Response) => {
  const user = await UserFacade.getUserById(req.user!.id);
  res.status(200).json({ success: true, data: user });
});

export const updateMe = asyncHandler(async (req: Request, res: Response) => {
  const user = await UserFacade.updateUser(req.user!.id, req.body);
  res.status(200).json({ success: true, data: user });
});

export const deleteMe = asyncHandler(async (req: Request, res: Response) => {
  await UserFacade.deleteUser(req.user!.id);
  res.status(204).json({ success: true, data: null });
});
