# Homework Report - Lesson 2

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