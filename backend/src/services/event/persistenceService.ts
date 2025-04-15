import EventModel, { IEvent } from '../../models/eventModel';

class EventPersistenceService {
  public async saveEvent(data: Partial<IEvent>): Promise<IEvent> {
    return EventModel.create(data);
  }

  public async getEventById(id: string): Promise<IEvent | null> {
    return EventModel.findById(id);
  }

  public async getAllEvents(): Promise<IEvent[]> {
    return EventModel.find();
  }

  public async updateEvent(id: string, data: Partial<IEvent>): Promise<IEvent | null> {
    return EventModel.findByIdAndUpdate(id, { $set: data }, { new: true });
  }

  public async deleteEvent(id: string): Promise<IEvent | null> {
    return EventModel.findByIdAndDelete(id);
  }
}

export default new EventPersistenceService();
