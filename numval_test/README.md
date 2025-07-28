# NUMVAL Function for Data Conversion

This example demonstrates using the NUMVAL intrinsic function to convert alphanumeric data (PIC X) to numeric values for arithmetic operations.

## Purpose

The `numval_test.cbl` program shows how to safely convert string input to numeric values using the NUMVAL function, enabling arithmetic operations on user-entered data.

## Key COBOL Features Demonstrated

- **NUMVAL function**: Converting PIC X data to numeric values
- **Mixed data types**: Working with both PIC X and PIC 9 fields
- **COMP-2 arithmetic**: Using floating-point for calculations
- **COMPUTE statement**: Performing arithmetic with function calls
- **Data type conversion**: Automatic handling of different numeric formats

## Compilation and Execution

```bash
cobc -x numval_test.cbl
./numval_test
```

## Expected Behavior

The program:
1. Accepts first number as alphanumeric (PIC X)
2. Accepts second number as numeric (PIC 9)
3. Uses NUMVAL to convert the alphanumeric input to numeric
4. Adds both numbers using COMPUTE
5. Displays the total result

## Example Run

```
Enter first number: 123.45
Enter second number: 0000000678
Total: +9.0145000000000000E+02
```

## Learning Points

- NUMVAL converts alphanumeric strings containing valid numeric data
- The function handles decimal points, signs, and leading/trailing spaces
- COMP-2 provides floating-point arithmetic for decimal calculations
- COMPUTE statement can mix different data types in expressions
- NUMVAL is safer than direct moves for user input conversion
- The function returns a numeric value suitable for arithmetic operations

## Use Cases

- Processing user input that may contain decimal points
- Converting file data read as alphanumeric to numeric
- Handling numeric data with varying formats
- Validating and converting external data sources

## Notes

- NUMVAL will cause a runtime error if the input contains non-numeric characters
- Consider using IS NUMERIC validation before calling NUMVAL
- The result format depends on the receiving field's picture clause
