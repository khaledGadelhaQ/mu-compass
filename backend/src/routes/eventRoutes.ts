import { Router } from 'express';
import { createEvent, getEventById, getAllEvents, updateEvent, deleteEvent } from '../controllers/eventController';

const router = Router();

// POST /api/events/ - Create a new event
router.post('/', createEvent);

// GET /api/events/ - Retrieve all events
router.get('/', getAllEvents);

// GET /api/events/:eventId - Retrieve a single event by ID
router.get('/:eventId', getEventById);

// PUT /api/events/:eventId - Update an event by ID
router.put('/:eventId', updateEvent);

// DELETE /api/events/:eventId - Delete an event by ID
router.delete('/:eventId', deleteEvent);

export default router;
