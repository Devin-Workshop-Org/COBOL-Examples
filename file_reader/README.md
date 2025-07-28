# File Reader COBOL Program with Module AAAAAAA

## Overview
This COBOL program demonstrates reading a file containing financial data and calling a sub-program module to display fund information. The program includes:
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

## Module AAAAAAA
The program calls module AAAAAAA for each Fund_ID to display detailed fund information. Two implementations are provided:

### File-Based Version (AAAAAAA.cbl)
- Reads fund data from `fund_table.txt`
- Uses sequential file processing with pipe-delimited parsing
- No database setup required

### SQL Database Version (AAAAAAA_SQL.cbl)
- Uses EXEC SQL statements to query PostgreSQL database
- Requires esqlOC precompiler and database setup
- Production-ready with proper error handling

## Fund Table Structure
The fund table contains:
- **Fund ID**: CHAR(8) - Primary key fund identifier
- **Fund Name**: VARCHAR(30) - Full fund name
- **Fund Type**: VARCHAR(10) - Fund category (EQUITY, FIXED, MIXED, REIT)
- **Manager**: VARCHAR(20) - Fund manager name
- **Inception Date**: DATE - Fund creation date

## Compilation and Execution

### File-Based Version
```bash
# Compile module and main program
cobc -c AAAAAAA.cbl
cobc -x file_reader.cbl AAAAAAA.o

# Run the program
./file_reader
```

### SQL Database Version
```bash
# Setup database (requires PostgreSQL)
psql -d your_database -f create_fund_table.sql

# Precompile and compile SQL version
esqlOC -static -o AAAAAAA_SQL_generated.cbl AAAAAAA_SQL.cbl
cobc -x -static -locsql AAAAAAA_SQL_generated.cbl

# Update main program to use SQL module
cobc -x file_reader.cbl AAAAAAA_SQL_generated.o
./file_reader
```

## Features
- Sequential file reading with proper error handling
- Module calling using LINKAGE SECTION parameter passing
- Fund table lookup for each processed Fund_ID
- File status checking for open/read/close operations
- Record validation (checks for missing data)
- Processing summary with record counts
- Structured display of each record's fields and fund information

## Program Structure
- **File Section**: Defines input file structure with proper field layouts
- **Working Storage**: Contains file status, EOF flags, counters, and display areas
- **Main Logic**: Opens file, reads records sequentially, calls module AAAAAAA, closes file
- **Module AAAAAAA**: Sub-program that accepts Fund_ID and displays fund information
- **Error Handling**: Checks file status codes and handles errors gracefully

## Output
The program displays each record in a formatted manner, calls module AAAAAAA to show fund details, and provides a summary of total records processed and any errors encountered.
