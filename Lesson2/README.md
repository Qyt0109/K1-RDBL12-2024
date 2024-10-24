# Homework Report - Lesson 2

# 3. Event counter

- **File**: [event_counter.sv](./rtl/event_counter.sv)
## Diagram

![Diagram](event_counter.svg "Diagram")
## Ports

| Port name       | Direction | Type      | Description                                          |
| --------------- | --------- | --------- | ---------------------------------------------------- |
| event_triggered | input     |           | Event occurred, increment the count                  |
| rst             | input     |           | Reset the count to zero                              |
| hold            | input     |           | Hold the current count even if an event is triggered |
| count           | output    | reg [7:0] | Count the number of events that have occurred        |

## Test

- **File**: [event_counter_tb.sv](./tb/event_counter_tb.sv)

![](./event_counter_tb.png)

Whenever the _event_triggered_ signal occurs, the counter value _count_ is incremented by one. However, when the _hold_ signal is high, the counter stops incrementing, even if _event_triggered_ occurs. At the end of the waveform, we can observe the reset signal _rst_, which resets the counter to zero.


# 4. Adder 4 bit with overflow bit check

- **File**: [adder4b.sv](./rtl/adder4b.sv)
## Diagram

![Diagram](adder4b.svg "Diagram")
## Ports

| Port name | Direction | Type  | Description                 |
| --------- | --------- | ----- | --------------------------- |
| a         | input     | [3:0] | Input value _a_ to be added |
| b         | input     | [3:0] | Input value _b_ to be added |
| s         | output    | [3:0] | Output sum _s = a + b_      |
| o         | output    |       | Overflow bit                |

## Test

- **File**: [adder4b_tb.sv](./tb/adder4b_tb.sv)

Output:

```
 4 +  1 =  5  
 9 +  3 = 12  
13 + 13 = 10 [OVERFLOWED]
 5 +  2 =  7  
 1 + 13 = 14  
 6 + 13 =  3 [OVERFLOWED]
13 + 12 =  9 [OVERFLOWED]
 9 +  6 = 15  
 5 + 10 = 15  
 5 +  7 = 12  
```

Waveform:

![](./adder_tb.png)

The testbench was run with 10 randomized values for each of the _a_ and _b_ inputs. The sum _s = a + b_ and the overflow bit _o_ worked as expected.