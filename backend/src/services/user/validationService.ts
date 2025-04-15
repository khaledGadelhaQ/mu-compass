import { IUser } from '../../models/userModel';

class UserValidationService {
  public validateUser(data: Partial<IUser>): boolean {
    return !!(data.name && data.email && data.password);
  }
}

export default new UserValidationService();
