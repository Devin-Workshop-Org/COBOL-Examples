import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;

public class FinancialFileReader {
    private static final String INPUT_FILE = "input_data.txt";
    private int recordCount = 0;
    private int errorCount = 0;

    public static void main(String[] args) {
        FinancialFileReader reader = new FinancialFileReader();
        reader.processFile();
    }

    public void processFile() {
        System.out.println("Starting File Reader Program");
        System.out.println("================================");

        try (BufferedReader br = new BufferedReader(new java.io.FileReader(INPUT_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                processRecord(line.trim());
            }
        } catch (IOException e) {
            System.err.println("ERROR: Cannot open input file: " + e.getMessage());
            System.exit(1);
        }

        displaySummary();
        System.out.println("File Reader Program Completed");
    }

    private void processRecord(String line) {
        if (line.isEmpty()) {
            return;
        }

        recordCount++;
        String[] fields = line.split("\\|");

        if (fields.length != 5) {
            errorCount++;
            System.out.println("WARNING: Record " + String.format("%05d", recordCount) + 
                             " has incorrect number of fields (expected 5, got " + fields.length + ")");
            return;
        }

        try {
            String fundId = fields[0].trim();
            String cusip = fields[1].trim();
            String timestamp = fields[2].trim();
            String userId = fields[3].trim();
            BigDecimal shares = new BigDecimal(fields[4].trim()).setScale(5, RoundingMode.HALF_UP);

            if (fundId.isEmpty() || cusip.isEmpty()) {
                errorCount++;
                System.out.println("WARNING: Record " + String.format("%05d", recordCount) + 
                                 " has missing data");
            }

            System.out.println("Record " + String.format("%05d", recordCount) + ":");
            System.out.println("  Fund ID    : " + String.format("%-8s", fundId));
            System.out.println("  CUSIP      : " + String.format("%-9s", cusip));
            System.out.println("  Timestamp  : " + timestamp);
            System.out.println("  User ID    : " + String.format("%-8s", userId));
            System.out.println("  Shares     : " + formatShares(shares));
            System.out.println(" ");

        } catch (NumberFormatException e) {
            errorCount++;
            System.out.println("WARNING: Record " + String.format("%05d", recordCount) + 
                             " has invalid shares value: " + fields[4]);
        }
    }

    private String formatShares(BigDecimal shares) {
        return String.format("%23.5f", shares);
    }

    private void displaySummary() {
        System.out.println("================================");
        System.out.println("Processing Summary:");
        System.out.println("  Total Records: " + String.format("%05d", recordCount));
        System.out.println("  Error Records: " + String.format("%05d", errorCount));
        System.out.println("================================");
    }
}
