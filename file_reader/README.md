# File Reader COBOL Program

## Overview
This COBOL program demonstrates reading a file containing financial data with the following structure:
- **Fund ID**: VARCHAR(8) - Fund identifier
- **CUSIP**: CHAR(9) - Committee on Uniform Securities Identification Procedures number
- **Timestamp**: VARCHAR(26) - Date and time with microseconds
- **User ID**: CHAR(8) - User identifier
- **Shares**: NUMERIC(17,5) - Share quantity with 17 integer digits and 5 decimal places

## File Format
The input file uses pipe (|) delimited format:
```
FUND0001|123456789|2025-01-28 20:17:49.123456|USER0001|12345678901234567.12345
FUND0002|987654321|2025-01-28 20:18:15.654321|USER0002|98765432109876543.98765
```

## Features
- Sequential file reading with proper error handling
- File status checking for open/read/close operations
- Record validation (checks for missing data)
- Processing summary with record counts
- Structured display of each record's fields

## Compilation and Execution
```bash
# Compile the program
cobc -x file_reader.cbl

# Run the program
./file_reader
```

## Program Structure
- **File Section**: Defines input file structure with proper field layouts
- **Working Storage**: Contains file status, EOF flags, counters, and display areas
- **Main Logic**: Opens file, reads records sequentially, processes each record, closes file
- **Error Handling**: Checks file status codes and handles errors gracefully

## Output
The program displays each record in a formatted manner and provides a summary of total records processed and any errors encountered.
