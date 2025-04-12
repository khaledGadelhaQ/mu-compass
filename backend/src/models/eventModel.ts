// src/models/eventModel.ts
import { Schema, model, Document } from 'mongoose';

export interface IEvent extends Document {
  title: string;
  description: string;
  date: Date;
  location: string;
  rsvpList: string[]; // Array of user IDs
  imageBackground?: string;
}

const EventSchema = new Schema<IEvent>({
  title: { type: String, required: true },
  description: { type: String },
  date: { type: Date, required: true },
  location: { type: String, required: true },
  rsvpList: { type: [String], default: [] },
  imageBackground: { type: String },
}, { timestamps: true });

const EventModel = model<IEvent>('Event', EventSchema);

export default EventModel;
