      ******************************************************************
      * Author: Devin AI
      * Date: 2025-01-28
      * Purpose: Module to read Fund_table and display fund information
      * Tectonics: cobc -c AAAAAAA.cbl
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AAAAAAA.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FUND-TABLE-FILE ASSIGN TO "fund_table.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS WS-FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  FUND-TABLE-FILE.
       01  FUND-TABLE-RECORD                   PIC X(100).

       WORKING-STORAGE SECTION.
       01  WS-FILE-STATUS                      PIC XX.
       01  WS-EOF-SW                           PIC X VALUE 'N'.
           88  WS-EOF                          VALUE 'Y'.
           88  WS-NOT-EOF                      VALUE 'N'.
       01  WS-FUND-FOUND-SW                    PIC X VALUE 'N'.
           88  WS-FUND-FOUND                   VALUE 'Y'.
           88  WS-FUND-NOT-FOUND               VALUE 'N'.

       01  WS-PARSED-FUND-RECORD.
           05  WS-FUND-ID                      PIC X(8).
           05  WS-FUND-NAME                    PIC X(30).
           05  WS-FUND-TYPE                    PIC X(10).
           05  WS-MANAGER                      PIC X(20).
           05  WS-INCEPTION-DATE               PIC X(10).

       01  WS-FIELD-COUNT                      PIC 9(2).
       01  WS-FIELD-TABLE.
           05  WS-FIELD OCCURS 5 TIMES         PIC X(30).

       LINKAGE SECTION.
       01  L-FUND-ID                           PIC X(8).

       PROCEDURE DIVISION USING L-FUND-ID.
       MAIN-PROCEDURE.
           DISPLAY "Module AAAAAAA: Looking up Fund ID: " L-FUND-ID

           PERFORM OPEN-FUND-TABLE
           PERFORM SEARCH-FUND-TABLE
           PERFORM CLOSE-FUND-TABLE

           IF WS-FUND-NOT-FOUND
               DISPLAY "  Fund ID " L-FUND-ID " not found in fund table"
           END-IF

           GOBACK.

       OPEN-FUND-TABLE.
           OPEN INPUT FUND-TABLE-FILE
           IF WS-FILE-STATUS NOT = "00"
               DISPLAY "  ERROR: Cannot open fund table file"
               DISPLAY "  File Status: " WS-FILE-STATUS
               GOBACK
           END-IF.

       SEARCH-FUND-TABLE.
           SET WS-NOT-EOF TO TRUE
           SET WS-FUND-NOT-FOUND TO TRUE
           
           PERFORM UNTIL WS-EOF OR WS-FUND-FOUND
               READ FUND-TABLE-FILE
                   AT END
                       SET WS-EOF TO TRUE
                   NOT AT END
                       PERFORM PARSE-FUND-RECORD
                       IF WS-FUND-ID = L-FUND-ID
                           SET WS-FUND-FOUND TO TRUE
                           PERFORM DISPLAY-FUND-INFO
                       END-IF
               END-READ
           END-PERFORM.

       PARSE-FUND-RECORD.
           MOVE 1 TO WS-FIELD-COUNT
           UNSTRING FUND-TABLE-RECORD DELIMITED BY '|'
               INTO WS-FIELD(1), WS-FIELD(2), WS-FIELD(3),
                    WS-FIELD(4), WS-FIELD(5)
               COUNT IN WS-FIELD-COUNT
           END-UNSTRING

           MOVE WS-FIELD(1) TO WS-FUND-ID
           MOVE WS-FIELD(2) TO WS-FUND-NAME
           MOVE WS-FIELD(3) TO WS-FUND-TYPE
           MOVE WS-FIELD(4) TO WS-MANAGER
           MOVE WS-FIELD(5) TO WS-INCEPTION-DATE.

       DISPLAY-FUND-INFO.
           DISPLAY "  ================================"
           DISPLAY "  Fund Information:"
           DISPLAY "    Fund ID       : " WS-FUND-ID
           DISPLAY "    Fund Name     : " WS-FUND-NAME
           DISPLAY "    Fund Type     : " WS-FUND-TYPE
           DISPLAY "    Manager       : " WS-MANAGER
           DISPLAY "    Inception Date: " WS-INCEPTION-DATE
           DISPLAY "  ================================".

       CLOSE-FUND-TABLE.
           CLOSE FUND-TABLE-FILE
           IF WS-FILE-STATUS NOT = "00"
               DISPLAY "  WARNING: Error closing fund table file"
               DISPLAY "  File Status: " WS-FILE-STATUS
           END-IF.

       END PROGRAM AAAAAAA.
