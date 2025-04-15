import { Schema, model, Document } from 'mongoose';

export interface IUser extends Document {
  name: string;
  email: string;
  password: string;
  photo?: string;
  courses: string[];
  role: 'user' | 'admin';
}

const UserSchema = new Schema<IUser>(
  {
    name: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true, select: false },
    photo: { type: String },
    courses: { type: [String], default: [] },
    role: { type: String, enum: ['user', 'admin'], default: 'user' },
  },
  { timestamps: true }
);

const UserModel = model<IUser>('User', UserSchema);

export default UserModel;
