# Command Line Arguments Processing

This example demonstrates reading and processing command-line arguments in COBOL programs.

## Purpose

The `read_cmd_line_args.cbl` program shows how to access command-line arguments passed to a COBOL program and perform simple argument parsing.

## Key COBOL Features Demonstrated

- **ACCEPT FROM COMMAND-LINE**: Reading full command-line arguments
- **INSPECT TALLYING**: Counting occurrences of specific strings
- **LOWER-CASE function**: Converting text to lowercase for comparison
- **String searching**: Looking for specific argument patterns
- **Conditional processing**: Taking action based on argument presence

## Compilation and Execution

```bash
cobc -x read_cmd_line_args.cbl
./read_cmd_line_args
./read_cmd_line_args --test
./read_cmd_line_args --help --test --verbose
```

## Expected Behavior

The program:
1. Displays instructions about the `--test` argument
2. Reads all command-line arguments into a single string
3. Displays the complete argument string
4. Searches for the `--test` argument (case-insensitive)
5. Shows a special message if `--test` is found

## Example Runs

### Without arguments:
```
Pass arg '--test' for special message
Full command line args: 
```

### With --test argument:
```
Pass arg '--test' for special message
Full command line args: --test
You entered the '--test' cmd arg!
```

### With multiple arguments:
```
Pass arg '--test' for special message
Full command line args: --help --test --verbose
You entered the '--test' cmd arg!
```

## Learning Points

- ACCEPT FROM COMMAND-LINE captures all arguments as a single string
- Arguments include everything after the program name
- INSPECT TALLYING counts string occurrences efficiently
- LOWER-CASE function enables case-insensitive comparisons
- Simple argument parsing can be done with string functions
- More complex parsing would require UNSTRING or similar techniques

## Use Cases

- Processing configuration flags and options
- Enabling debug or test modes
- Accepting file names or parameters
- Creating flexible utility programs
- Implementing simple command-line interfaces

## Notes

- Arguments are space-separated in the received string
- For complex parsing, consider using UNSTRING with space delimiters
- Individual argument access requires additional parsing logic
- GnuCOBOL also supports accessing individual arguments via special registers
