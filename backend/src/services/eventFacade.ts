import { IEvent } from '../models/eventModel';
import EventValidationService from './event/validationService';
import EventPersistenceService from './event/persistenceService';
import EventNotificationService from './event/notificationService';

// Facade interface defining event operations.
export interface IEventFacade {
  createEvent(data: Partial<IEvent>): Promise<IEvent>;
  getEventById(id: string): Promise<IEvent | null>;
  getAllEvents(): Promise<IEvent[]>;
  updateEvent(id: string, data: Partial<IEvent>): Promise<IEvent | null>;
  deleteEvent(id: string): Promise<IEvent | null>;
}

class EventFacadeImpl implements IEventFacade {
  public async createEvent(data: Partial<IEvent>): Promise<IEvent> {
    // Step 1: Validate event data.
    if (!EventValidationService.validateEvent(data)) {
      throw new Error('Invalid event data');
    }
    // Step 2: Persist the event.
    const event = await EventPersistenceService.saveEvent(data);
    // Step 3: Send notification.
    EventNotificationService.notifyNewEvent(event);
    return event;
  }

  public async getEventById(id: string): Promise<IEvent | null> {
    return EventPersistenceService.getEventById(id);
  }

  public async getAllEvents(): Promise<IEvent[]> {
    return EventPersistenceService.getAllEvents();
  }

  public async updateEvent(id: string, data: Partial<IEvent>): Promise<IEvent | null> {
    return EventPersistenceService.updateEvent(id, data);
  }

  public async deleteEvent(id: string): Promise<IEvent | null> {
    return EventPersistenceService.deleteEvent(id);
  }
}

export default new EventFacadeImpl();
