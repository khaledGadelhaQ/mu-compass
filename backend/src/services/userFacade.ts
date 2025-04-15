// src/services/userFacade.ts
import { IUser } from '../models/userModel';
import UserValidationService from './user/validationService';
import UserPersistenceService from './user/persistenceService';
import AuthService from './auth/authService';

export interface IUserFacade {
  registerUser(data: Partial<IUser>): Promise<IUser>;
  loginUser(email: string, password: string): Promise<string>;
  getUserById(id: string): Promise<IUser | null>;
  updateUser(id: string, data: Partial<IUser>): Promise<IUser | null>;
  deleteUser(id: string): Promise<IUser | null>;
}

class UserFacadeImpl implements IUserFacade {
  public async registerUser(data: Partial<IUser>): Promise<IUser> {
    if (!UserValidationService.validateUser(data)) {
      throw new Error('Invalid user data');
    }

    const hashedPassword = await AuthService.hashPassword(data.password!);
    const user = await UserPersistenceService.createUser({
      ...data,
      password: hashedPassword,
      role: 'user',
    } as IUser);

    return user;
  }

  public async loginUser(email: string, password: string): Promise<string> {
    const user = await UserPersistenceService.getUserByEmail(email, true);
    if (!user) throw new Error('User not found');

    const isValid = await AuthService.comparePassword(password, user.password);
    if (!isValid) throw new Error('Invalid credentials');

    return AuthService.generateToken(user._id.toString());
  }

  public async getUserById(id: string): Promise<IUser | null> {
    return UserPersistenceService.getUserById(id);
  }

  public async updateUser(
    id: string,
    data: Partial<IUser>
  ): Promise<IUser | null> {
    if (data.password) {
      data.password = await AuthService.hashPassword(data.password);
    }
    return UserPersistenceService.updateUser(id, data);
  }

  public async deleteUser(id: string): Promise<IUser | null> {
    return UserPersistenceService.deleteUser(id);
  }
}

export default new UserFacadeImpl();
