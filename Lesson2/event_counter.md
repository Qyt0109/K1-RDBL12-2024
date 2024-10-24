# Entity: event_counter 

- **File**: event_counter.sv
## Diagram

![Diagram](event_counter.svg "Diagram")
## Ports

| Port name       | Direction | Type      | Description                                          |
| --------------- | --------- | --------- | ---------------------------------------------------- |
| event_triggered | input     |           | Event occurred, increment the count                  |
| rst             | input     |           | Reset the count to zero                              |
| hold            | input     |           | Hold the current count even if an event is triggered |
| count           | output    | reg [7:0] | Count the number of events that have occurred        |
