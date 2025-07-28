# COBOL Report Writer Feature

This example demonstrates COBOL's Report Writer facility for generating formatted reports with headers, detail lines, and automatic page management.

## Purpose

The `report_test.cbl` program shows how to use COBOL's Report Writer feature to create formatted reports from input data, including automatic page numbering and layout control.

## Key COBOL Features Demonstrated

- **Report Section**: Defining report structure and layout
- **Report Description (RD)**: Setting page limits and margins
- **Report Groups**: REPORT HEADING and DETAIL line types
- **INITIATE/TERMINATE**: Starting and ending report processing
- **GENERATE**: Creating report lines from data
- **PAGE-COUNTER**: Automatic page numbering
- **SOURCE clauses**: Linking report fields to data items

## Compilation and Execution

```bash
cobc -x report_test.cbl
./report_test
```

## Expected Behavior

The program:
1. Opens an input file (`input.txt`) containing student records
2. Initializes the report writer
3. Reads each record and generates a report line
4. Automatically handles page formatting and headers
5. Terminates the report and creates `report.txt`

## Input File Format

The program expects `input.txt` with records containing:
- Student ID (6 digits)
- Student Name (20 characters)
- Major (3 characters)  
- Number of Courses (2 digits)

Example input record:
```
123456John Smith         PHY12
```

## Report Output

The generated `report.txt` will contain:
- Page header with "Customer Order Report" title
- Page numbers in the upper right
- Detail lines with formatted student data
- Automatic page breaks when needed

## Learning Points

- Report Writer automates complex formatting tasks
- Page layout is controlled by the RD (Report Description)
- SOURCE clauses link report fields to working storage items
- GENERATE creates report lines without explicit WRITE statements
- Page numbering and headers are handled automatically
- Report sections define the visual structure independently from logic

## Use Cases

- Financial statements and summaries
- Student transcripts and grade reports
- Inventory listings and catalogs
- Any formatted output requiring consistent layout
- Reports with complex headers, footers, and page management

## Notes

- The Report Writer is a powerful but less commonly used COBOL feature
- Modern applications often use other formatting tools
- Excellent for batch reporting in traditional COBOL environments
- Provides precise control over report layout and pagination
- Input file must exist for the program to run successfully
