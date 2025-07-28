# COBOL to Java Merge Sort Conversion

## Overview

This directory contains a Java implementation that replicates the functionality of the COBOL merge sort program (`merge_sort_test.cbl`). The Java version maintains the same file-based sorting behavior and produces identical output to the original COBOL program.

## Files

- `merge_sort_test.cbl` - Original COBOL program
- `Customer.java` - Java class representing the customer record structure
- `MergeSortExample.java` - Main Java program implementing merge and sort operations
- `README.md` - This documentation file

## Customer Record Structure

Both programs use the same customer record structure with 5 fields:
- Customer ID (5 digits)
- Customer Last Name (50 characters)
- Customer First Name (50 characters) 
- Customer Contract ID (5 digits)
- Customer Comment (25 characters)

## Test Data

The programs create two test files:

**East File (test-file-1.txt):**
- Customer IDs: 1, 5, 10, 50, 25, 75
- Each with corresponding names, contract IDs, and comments

**West File (test-file-2.txt):**
- Customer IDs: 999, 3, 30, 85, 24
- Each with corresponding names, contract IDs, and comments

## Operations

### 1. Merge Operation
- Reads both test files
- Merges records by ascending customer ID
- Writes result to `merge-output.txt`
- Displays merged records

### 2. Sort Operation  
- Reads the merged file
- Sorts records by descending contract ID
- Writes result to `sorted-contract-id.txt`
- Displays sorted records

## Running the Programs

### COBOL Version
```bash
cobc -x merge_sort_test.cbl
./merge_sort_test
```

### Java Version
```bash
javac *.java
java MergeSortExample
```

## Implementation Details

### File-Based Operations
The Java implementation maintains true file-based sorting behavior:
- Creates intermediate files (`merge-output.txt`, `sorted-contract-id.txt`)
- Reads from and writes to files at each step
- Does not rely solely on in-memory collections

### Error Handling
- File I/O operations include proper exception handling
- Graceful error messages and program termination on failures
- Resource management with try-with-resources blocks

### Output Formatting
- Exact replication of COBOL fixed-width formatting
- Customer records formatted as 135-character strings
- Proper padding and alignment matching COBOL PIC clauses

## Verification

Both programs produce identical output:
1. Test data creation message
2. Merge operation with 11 records sorted by ascending customer ID
3. Sort operation with same 11 records sorted by descending contract ID
4. "Done." completion message

The Java implementation successfully converts the COBOL merge sort functionality while maintaining file-based operations and exact output compatibility.
