import UserModel, { IUser } from '../../models/userModel';

class UserPersistenceService {
  public async createUser(data: Partial<IUser>): Promise<IUser> {
    const user = await UserModel.create(data);
    return user.toObject(); 
  }

  public async getUserByEmail(email: string, withPassword = false): Promise<IUser | null> {
    const user = await UserModel.findOne({ email }).select(withPassword ? '+password' : '');
    return user ? user.toObject() : null; 
  }

  public async getUserById(id: string): Promise<IUser | null> {
    const user = await UserModel.findById(id);
    return user ? user.toObject() : null; 
  }

  public async updateUser(id: string, data: Partial<IUser>): Promise<IUser | null> {
    const user = await UserModel.findByIdAndUpdate(id, data, { new: true });
    return user ? user.toObject() : null; 
  }

  public async deleteUser(id: string): Promise<IUser | null> {
    const user = await UserModel.findByIdAndDelete(id);
    return user ? user.toObject() : null; 
  }
}

export default new UserPersistenceService();