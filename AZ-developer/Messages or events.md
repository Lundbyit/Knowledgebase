There is a distinction between messages and events.

# Messages
Contains raw data, not only reference to data
Produces by sender
Consumes by receiver

Sender expects the receiver to handle the message in a certain way

# Event
Light weight notification
Does not contain raw data
May reference where the data lives
Sender has no expectations

Broadcasting something has happened, may have recivers may not have receivers

# Message delivery guarantees
- At least once
- At most once
- FIFO

# Messages
## Service bus topic
we expect multiple receivers

## Service bus queue
At most once
Consume batch of messages

## Queue storage
Audit trail
If queue will exceed 1TB in size

# Events
## Event grid
Event routing service
Can handle events from different sources

### Topics
Publisher/event sources own the topic
#### System topics
Built in, can subscribe but not modify(?)

#### Custom topics
Created by developer

### Event subscription
Can add filters

### When to use
- **Simplicity:** It's straightforward to connect sources to subscribers in Event Grid.
- **Advanced filtering:** Subscriptions have close control over the events they receive from a topic.
- **Fan-out:** You can subscribe to an unlimited number of endpoints to the same events and topics.
- **Reliability:** Event Grid retries event delivery for up to 24 hours for each subscription.
- **Pay-per-event:** Pay only for the number of events that you transmit.

## Event hubs
it's optimized for extremely high throughput, a large number of publishers, security, and resiliency.

Divides inte partitions
Event digestor

## Choose Event Hubs if:
- You need to support authenticating a large number of publishers.
- You need to save a stream of events to Data Lake or Blob storage.
- You need aggregation or analytics on your event stream.
- You need reliable messaging or resiliency.