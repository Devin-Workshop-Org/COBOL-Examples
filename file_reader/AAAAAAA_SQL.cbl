      ******************************************************************
      * Author: Devin AI
      * Date: 2025-01-28
      * Purpose: SQL version of module to read Fund_table and display
      * Tectonics: esqlOC -static -o AAAAAAA_SQL_generated.cbl AAAAAAA_SQL.cbl
      *           cobc -x -static -locsql AAAAAAA_SQL_generated.cbl
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AAAAAAA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-DB-CONNECTION-STRING             PIC X(100) 
           VALUE "DSN=PostgreSQL;UID=testuser;PWD=testpass;".
       01  WS-IS-CONNECTED-SW                  PIC X VALUE 'N'.
           88  WS-IS-CONNECTED                 VALUE 'Y'.
           88  WS-NOT-CONNECTED                VALUE 'N'.

       EXEC SQL
           BEGIN DECLARE SECTION
       END-EXEC.

       01  WS-SQL-FUND-RECORD.
           05  WS-SQL-FUND-ID                  PIC X(8).
           05  WS-SQL-FUND-NAME                PIC X(30).
           05  WS-SQL-FUND-TYPE                PIC X(10).
           05  WS-SQL-MANAGER                  PIC X(20).
           05  WS-SQL-INCEPTION-DATE           PIC X(10).

       EXEC SQL
           END DECLARE SECTION
       END-EXEC.

       EXEC SQL
           INCLUDE SQLCA
       END-EXEC.

       LINKAGE SECTION.
       01  L-FUND-ID                           PIC X(8).

       PROCEDURE DIVISION USING L-FUND-ID.
       MAIN-PROCEDURE.
           DISPLAY "Module AAAAAAA: Looking up Fund ID: " L-FUND-ID

           PERFORM CONNECT-TO-DATABASE
           PERFORM QUERY-FUND-TABLE
           PERFORM DISCONNECT-FROM-DATABASE

           GOBACK.

       CONNECT-TO-DATABASE.
           EXEC SQL
               CONNECT TO :WS-DB-CONNECTION-STRING
           END-EXEC
           PERFORM CHECK-SQL-STATE
           SET WS-IS-CONNECTED TO TRUE.

       QUERY-FUND-TABLE.
           EXEC SQL
               DECLARE FUND-CUR CURSOR FOR
               SELECT FUND_ID, FUND_NAME, FUND_TYPE, MANAGER, INCEPTION_DATE
               FROM FUND_TABLE
               WHERE FUND_ID = :L-FUND-ID
           END-EXEC
           PERFORM CHECK-SQL-STATE

           EXEC SQL
               OPEN FUND-CUR
           END-EXEC
           PERFORM CHECK-SQL-STATE

           EXEC SQL
               FETCH FUND-CUR
               INTO :WS-SQL-FUND-ID, :WS-SQL-FUND-NAME,
                    :WS-SQL-FUND-TYPE, :WS-SQL-MANAGER,
                    :WS-SQL-INCEPTION-DATE
           END-EXEC

           IF SQLCODE = 0
               PERFORM DISPLAY-FUND-INFO
           ELSE
               IF SQLCODE = 100
                   DISPLAY "  Fund ID " L-FUND-ID " not found in fund table"
               ELSE
                   PERFORM CHECK-SQL-STATE
               END-IF
           END-IF

           EXEC SQL
               CLOSE FUND-CUR
           END-EXEC
           PERFORM CHECK-SQL-STATE.

       DISPLAY-FUND-INFO.
           DISPLAY "  ================================"
           DISPLAY "  Fund Information:"
           DISPLAY "    Fund ID       : " WS-SQL-FUND-ID
           DISPLAY "    Fund Name     : " WS-SQL-FUND-NAME
           DISPLAY "    Fund Type     : " WS-SQL-FUND-TYPE
           DISPLAY "    Manager       : " WS-SQL-MANAGER
           DISPLAY "    Inception Date: " WS-SQL-INCEPTION-DATE
           DISPLAY "  ================================".

       DISCONNECT-FROM-DATABASE.
           IF WS-IS-CONNECTED
               EXEC SQL
                   CONNECT RESET
               END-EXEC
           END-IF.

       CHECK-SQL-STATE.
           IF SQLCODE = 0 OR SQLCODE = 100
               EXIT PARAGRAPH
           END-IF

           DISPLAY "  SQL Error:"
           DISPLAY "  SQLCODE: " SQLCODE
           DISPLAY "  SQLSTATE: " SQLSTATE

           IF SQLERRML > 0
               DISPLAY "  ERROR MESSAGE: " SQLERRMC(1:SQLERRML)
           END-IF

           PERFORM DISCONNECT-FROM-DATABASE
           STOP RUN.

       END PROGRAM AAAAAAA.
