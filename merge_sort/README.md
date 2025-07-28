# SORT and MERGE Operations

This example demonstrates COBOL's SORT and MERGE statements for organizing and combining data files.

## Purpose

The `merge_sort_test.cbl` program shows how to use COBOL's built-in SORT and MERGE capabilities to process customer data files, demonstrating both merging multiple files and sorting by different criteria.

## Key COBOL Features Demonstrated

- **MERGE statement**: Combining multiple sorted files into one
- **SORT statement**: Ordering data by specified keys
- **File processing**: Creating, reading, and writing sequential files
- **Sort Description (SD)**: Defining sort work files
- **ASCENDING/DESCENDING keys**: Different sort orders
- **USING/GIVING clauses**: Input and output file specification

## Compilation and Execution

```bash
cobc -x merge_sort_test.cbl
./merge_sort_test
```

## Program Flow

1. **Create Test Data**: Generates two input files with customer records
   - `test-file-1.txt`: East region customers
   - `test-file-2.txt`: West region customers

2. **Merge and Sort**: Combines files and sorts by customer ID (ascending)
   - Output: `merge-output.txt`

3. **Re-sort**: Takes merged file and sorts by contract ID (descending)
   - Output: `sorted-contract-id.txt`

## Generated Files

The program creates these data files (included in repository):

- **test-file-1.txt**: Sample customer data from east region
- **test-file-2.txt**: Sample customer data from west region  
- **merge-output.txt**: Combined data sorted by customer ID
- **sorted-contract-id.txt**: Re-sorted data by contract ID (descending)

## Record Structure

Each customer record contains:
- Customer ID (5 digits)
- Last Name (50 characters)
- First Name (50 characters)
- Contract ID (5 digits)
- Comment (25 characters)

## Expected Output

The program displays progress messages and shows the sorted records:
```
Creating test data files...
Merging and sorting files...
[merged records displayed]
Sorting merged file on descending contract id....
[re-sorted records displayed]
Done.
```

## Learning Points

- MERGE requires input files to be pre-sorted by the merge key
- SORT can handle unsorted input data
- Sort work files (SD) define the record structure for sorting
- Multiple sort keys can be specified with different orders
- COBOL handles the complex file management automatically
- Both operations are highly efficient for large data sets

## Use Cases

- Combining data from multiple sources
- Preparing data for reporting in specific orders
- Data warehouse ETL operations
- Batch processing of transaction files
- Creating sorted master files from updates

## Notes

- Input files must exist and be properly formatted
- Sort operations use temporary work space automatically
- File status checking ensures robust error handling
- The program demonstrates both merge and sort in sequence
- Generated output files show the results of each operation
