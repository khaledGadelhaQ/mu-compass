class EventNotificationService {
  public notifyNewEvent(event: { title: string }): void {
    // TODO: Implement actual notification logic (e.g., send email, push notification, etc.)
    console.log(`Notification: New event created - ${event.title}`);
  }
}

export default new EventNotificationService();
