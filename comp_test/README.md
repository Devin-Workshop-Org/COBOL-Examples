# COMP Data Type Conversion Test

This example demonstrates converting COBOL COMP (computational) data types to display format.

## Purpose

The `comp_test.cbl` program shows how COBOL handles conversion between:
- COMP (binary/computational) storage format
- Display (character) format  
- Dynamic display format with zero suppression

## Key COBOL Features Demonstrated

- **COMP data type**: Binary storage format for numeric efficiency
- **Data conversion**: Moving between COMP and display formats
- **Zero suppression**: Using PIC ZZ9 for formatted numeric display
- **ACCEPT/DISPLAY**: Interactive input/output operations

## Compilation and Execution

```bash
cobc -x comp_test.cbl
./comp_test
```

## Expected Output

The program will:
1. Initialize a COMP value to 12, multiply by 2 (result: 24)
2. Display the COMP value directly
3. Convert to display format and show the result
4. Convert to dynamic display format with zero suppression
5. Accept user input and demonstrate conversion back to COMP

Example run:
```
COMP: 024
DISP:024
DYNA: 24
INPUT: 123
INPUT: 123
COMP: 123
```

## Learning Points

- COMP storage is more efficient for arithmetic operations
- Conversion between storage formats is automatic when moving data
- Zero suppression (ZZ9) provides cleaner numeric display
- User input is always accepted as display format and converted as needed
