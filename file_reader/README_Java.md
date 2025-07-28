# Java Version of COBOL File Reader

## Overview
This is a Java conversion of the COBOL file reader program. It reads the same pipe-delimited file format and produces equivalent output.

## Features
- **BigDecimal precision**: Uses BigDecimal for shares field to maintain exact decimal precision (17 integer digits, 5 decimal places)
- **Error handling**: Validates field count, checks for missing data, handles number format exceptions
- **Formatted output**: Matches COBOL program output format with proper field alignment
- **Processing summary**: Displays total records processed and error count

## Compilation and Execution
```bash
# Compile the Java program
javac FinancialFileReader.java

# Run the program
java FinancialFileReader

# Or use the provided script
./compile_and_run.sh
```

## Key Differences from COBOL
- Uses `BigDecimal` instead of COBOL's `PIC 9(17)V9(5)` for precise decimal handling
- String splitting on pipe delimiter instead of fixed-position field parsing
- Exception handling for NumberFormatException instead of COBOL file status codes
- Object-oriented structure with methods instead of COBOL paragraphs

## Output Comparison
Both COBOL and Java versions produce identical output:
```
Record 00001:
  Fund ID    : FUND0001
  CUSIP      : 123456789
  Timestamp  : 2025-01-28 20:17:49.123456
  User ID    : USER0001
  Shares     : 12345678901234567.12345
```
