# IS NUMERIC Condition Testing

This example demonstrates the IS NUMERIC condition and various techniques for handling spaces in numeric validation.

## Purpose

The `is_numeric.cbl` program shows how COBOL's IS NUMERIC condition works and demonstrates three different approaches to handle spaces in user input when testing for numeric values.

## Key COBOL Features Demonstrated

- **IS NUMERIC condition**: Testing if data contains only digits
- **JUSTIFIED RIGHT**: Right-aligning input data
- **INSPECT statement**: Replacing characters (spaces with zeros)
- **TRIM function**: Removing leading and trailing spaces
- **Space handling**: Different strategies for numeric validation

## Compilation and Execution

```bash
cobc -x is_numeric.cbl
./is_numeric
```

## Expected Behavior

The program demonstrates three different approaches:

### 1. Plain Input (process-plain)
- Accepts input into a regular PIC X(10) field
- Tests IS NUMERIC directly
- **Issue**: Trailing spaces cause numeric test to fail, even for valid digits

### 2. Right Justify + Zero Fill (process-zero-fill)
- Accepts input into JUSTIFIED RIGHT field
- Uses INSPECT to replace leading spaces with zeros
- Tests IS NUMERIC on the modified data
- **Solution**: Handles spaces by converting them to zeros

### 3. TRIM Function (process-trim)
- Accepts input into regular field
- Uses FUNCTION TRIM to remove spaces before testing
- Tests IS NUMERIC on the trimmed data
- **Solution**: Removes spaces entirely before validation

## Example Run

```
(plain) Enter a value: 123
123        is not numeric.
(right justify, zero fill) Enter another value: 123
0000000123 is numeric!
(trim) Enter a third value: 123
123 is numeric!
```

## Learning Points

- IS NUMERIC requires contiguous digits with no spaces
- Trailing spaces in alphanumeric fields prevent numeric validation
- JUSTIFIED RIGHT moves data to the right side of the field
- INSPECT can systematically replace characters
- TRIM function is often the cleanest solution for space handling
- Different validation strategies suit different application needs
