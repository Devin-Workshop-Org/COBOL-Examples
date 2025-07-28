# DISPLAY Statement Positioning and Formatting

This example demonstrates various DISPLAY statement options for screen positioning, formatting, and visual effects.

## Purpose

The `display-test.cbl` program shows different ways to control output positioning and appearance using DISPLAY statement clauses.

## Key COBOL Features Demonstrated

- **Screen positioning**: AT, LINE, COLUMN clauses for precise placement
- **Screen formatting**: BLANK LINE, ERASE EOL for screen control
- **Visual effects**: BELL for audio feedback
- **Color control**: BACKGROUND-COLOR and FOREGROUND-COLOR
- **Multiple syntax forms**: Compact (AT 0505) vs verbose (LINE/COLUMN)

## Compilation and Execution

```bash
cobc -x display-test.cbl
./display-test
```

## Expected Output

The program displays "hello world" in various positions and formats:
1. At line 5, column 5 (compact syntax)
2. At line 6, column 5 (verbose syntax)
3. At line 7, column 5 with blank line before
4. At line 8, column 5 with erase to end of line
5. At line 9, column 5 with bell sound
6. At line 10, column 5 with background color 3 and foreground color 6

## Learning Points

- Screen coordinates start at line 1, column 1
- BLANK LINE clears the line before displaying
- ERASE EOL clears from cursor position to end of line
- BELL produces an audible alert (if terminal supports it)
- Color codes are terminal-dependent (typically 0-7 range)
- Multiple positioning syntaxes provide flexibility for different coding styles

## Notes

- This program puts the terminal into screen mode, requiring specific positioning
- Color support depends on terminal capabilities
- Some effects may not be visible in all terminal environments
