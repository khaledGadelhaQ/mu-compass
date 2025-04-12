// src/services/event/validationService.ts
import { IEvent } from '../../models/eventModel';

class EventValidationService {
  public validateEvent(data: Partial<IEvent>): boolean {
    // Basic validation: title, date, and location must be present.
    return !!(data.title && data.date && data.location);
  }
}

export default new EventValidationService();
