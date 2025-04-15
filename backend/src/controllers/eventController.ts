import { Request, Response } from 'express';
import EventFacade from '../services/eventFacade';
import asyncHandler from '../middleware/asyncHandler';

export const createEvent = asyncHandler(async (req: Request, res: Response) => {
  const event = await EventFacade.createEvent(req.body);
  res.status(201).json({ success: true, data: event });
});

export const getEventById = asyncHandler(async (req: Request, res: Response) => {
  const event = await EventFacade.getEventById(req.params.eventId);
  if (!event) {
    res.status(404).json({ success: false, message: 'Event not found' });
    return;
  }
  res.status(200).json({ success: true, data: event });
});

export const getAllEvents = asyncHandler(async (_req: Request, res: Response) => {
  const events = await EventFacade.getAllEvents();
  res.status(200).json({ success: true, data: events });
});

export const updateEvent = asyncHandler(async (req: Request, res: Response) => {
  const event = await EventFacade.updateEvent(req.params.eventId, req.body);
  if (!event) {
    res.status(404).json({ success: false, message: 'Event not found or update failed' });
    return;
  }
  res.status(200).json({ success: true, data: event });
});

export const deleteEvent = asyncHandler(async (req: Request, res: Response) => {
  const event = await EventFacade.deleteEvent(req.params.eventId);
  if (!event) {
    res.status(404).json({ success: false, message: 'Event not found or deletion failed' });
    return;
  }
  res.status(200).json({ success: true, data: event });
});
