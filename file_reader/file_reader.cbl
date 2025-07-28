      ******************************************************************
      * Author: Devin AI
      * Date: 2025-01-28
      * Purpose: Read file with fund_id, cusip, timestamp, user_id
      * Tectonics: cobc -x file_reader.cbl
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. file-reader.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FD-INPUT-FILE ASSIGN TO "input_data.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS WS-FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  FD-INPUT-FILE.
       01  F-INPUT-RECORD.
           05  F-FUND-ID                       PIC X(8).
           05  FILLER                          PIC X(1).
           05  F-CUSIP                         PIC X(9).
           05  FILLER                          PIC X(1).
           05  F-TIMESTAMP                     PIC X(26).
           05  FILLER                          PIC X(1).
           05  F-USER-ID                       PIC X(8).

       WORKING-STORAGE SECTION.
       01  WS-FILE-STATUS                      PIC XX.
       01  WS-EOF-SW                           PIC X VALUE 'N'.
           88  WS-EOF                          VALUE 'Y'.
           88  WS-NOT-EOF                      VALUE 'N'.
       01  WS-RECORD-COUNT                     PIC 9(5) VALUE ZERO.
       01  WS-ERROR-COUNT                      PIC 9(5) VALUE ZERO.

       01  WS-DISPLAY-RECORD.
           05  WS-FUND-ID                      PIC X(8).
           05  WS-CUSIP                        PIC X(9).
           05  WS-TIMESTAMP                    PIC X(26).
           05  WS-USER-ID                      PIC X(8).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Starting File Reader Program"
           DISPLAY "================================"

           PERFORM OPEN-INPUT-FILE
           PERFORM READ-AND-PROCESS-RECORDS
           PERFORM CLOSE-INPUT-FILE
           PERFORM DISPLAY-SUMMARY

           DISPLAY "File Reader Program Completed"
           GOBACK.

       OPEN-INPUT-FILE.
           OPEN INPUT FD-INPUT-FILE
           IF WS-FILE-STATUS NOT = "00"
               DISPLAY "ERROR: Cannot open input file"
               DISPLAY "File Status: " WS-FILE-STATUS
               PERFORM ABEND-PROGRAM
           END-IF.

       READ-AND-PROCESS-RECORDS.
           SET WS-NOT-EOF TO TRUE
           PERFORM UNTIL WS-EOF
               READ FD-INPUT-FILE
                   AT END
                       SET WS-EOF TO TRUE
                   NOT AT END
                       PERFORM PROCESS-RECORD
               END-READ
           END-PERFORM.

       PROCESS-RECORD.
           ADD 1 TO WS-RECORD-COUNT
           
           MOVE F-FUND-ID TO WS-FUND-ID
           MOVE F-CUSIP TO WS-CUSIP
           MOVE F-TIMESTAMP TO WS-TIMESTAMP
           MOVE F-USER-ID TO WS-USER-ID

           IF WS-FUND-ID = SPACES OR WS-CUSIP = SPACES
               ADD 1 TO WS-ERROR-COUNT
               DISPLAY "WARNING: Record " WS-RECORD-COUNT 
                       " has missing data"
           END-IF

           DISPLAY "Record " WS-RECORD-COUNT ":"
           DISPLAY "  Fund ID    : " WS-FUND-ID
           DISPLAY "  CUSIP      : " WS-CUSIP
           DISPLAY "  Timestamp  : " WS-TIMESTAMP
           DISPLAY "  User ID    : " WS-USER-ID
           DISPLAY " ".

       CLOSE-INPUT-FILE.
           CLOSE FD-INPUT-FILE
           IF WS-FILE-STATUS NOT = "00"
               DISPLAY "WARNING: Error closing input file"
               DISPLAY "File Status: " WS-FILE-STATUS
           END-IF.

       DISPLAY-SUMMARY.
           DISPLAY "================================"
           DISPLAY "Processing Summary:"
           DISPLAY "  Total Records: " WS-RECORD-COUNT
           DISPLAY "  Error Records: " WS-ERROR-COUNT
           DISPLAY "================================".

       ABEND-PROGRAM.
           DISPLAY "Program terminated due to error"
           STOP RUN.

       END PROGRAM file-reader.
