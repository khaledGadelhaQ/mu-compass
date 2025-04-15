// src/services/auth/authService.ts
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';

dotenv.config();

class AuthService {
  private static readonly SALT_ROUNDS = 10;
  private static readonly JWT_SECRET =
    process.env.JWT_SECRET || 'your-secret-key';
  private static readonly JWT_EXPIRES = process.env.JWT_EXPIRES || '30d';

  public static async hashPassword(password: string): Promise<string> {
    return bcrypt.hash(password, this.SALT_ROUNDS);
  }

  public static async comparePassword(
    password: string,
    hashedPassword: string
  ): Promise<boolean> {
    return bcrypt.compare(password, hashedPassword);
  }

  public static generateToken(userId: string): string {
    return jwt.sign(
      { id: userId },
      this.JWT_SECRET,
      { expiresIn: this.JWT_EXPIRES } as jwt.SignOptions // أضفنا Type assertion هنا
    );
  }

  public static verifyToken(token: string): { id: string } {
    return jwt.verify(token, this.JWT_SECRET) as { id: string };
  }
}

export default AuthService;
