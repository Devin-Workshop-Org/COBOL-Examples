import java.io.*;
import java.nio.file.*;
import java.util.*;

public class MergeSortExample {
    
    public static void main(String[] args) {
        try {
            createTestData();
            mergeAndDisplayFiles();
            sortAndDisplayFile();
            System.out.println("Done.");
        } catch (IOException e) {
            System.err.println("Error: " + e.getMessage());
            System.exit(1);
        }
    }
    
    private static void createTestData() throws IOException {
        System.out.println("Creating test data files...");
        
        try (PrintWriter writer1 = new PrintWriter(new FileWriter("test-file-1.txt"))) {
            writer1.println(new Customer(1, "last-1", "first-1", 5423, "comment-1"));
            writer1.println(new Customer(5, "last-5", "first-5", 12323, "comment-5"));
            writer1.println(new Customer(10, "last-10", "first-10", 653, "comment-10"));
            writer1.println(new Customer(50, "last-50", "first-50", 5050, "comment-50"));
            writer1.println(new Customer(25, "last-25", "first-25", 7725, "comment-25"));
            writer1.println(new Customer(75, "last-75", "first-75", 1175, "comment-75"));
        }
        
        try (PrintWriter writer2 = new PrintWriter(new FileWriter("test-file-2.txt"))) {
            writer2.println(new Customer(999, "last-999", "first-999", 1610, "comment-99"));
            writer2.println(new Customer(3, "last-03", "first-03", 3331, "comment-03"));
            writer2.println(new Customer(30, "last-30", "first-30", 8765, "comment-30"));
            writer2.println(new Customer(85, "last-85", "first-85", 4567, "comment-85"));
            writer2.println(new Customer(24, "last-24", "first-24", 247, "comment-24"));
        }
    }
    
    private static void mergeAndDisplayFiles() throws IOException {
        System.out.println("Merging and sorting files...");
        
        List<Customer> customers = new ArrayList<>();
        
        try (BufferedReader reader1 = new BufferedReader(new FileReader("test-file-1.txt"))) {
            String line;
            while ((line = reader1.readLine()) != null) {
                customers.add(Customer.fromString(line));
            }
        }
        
        try (BufferedReader reader2 = new BufferedReader(new FileReader("test-file-2.txt"))) {
            String line;
            while ((line = reader2.readLine()) != null) {
                customers.add(Customer.fromString(line));
            }
        }
        
        customers.sort(Comparator.comparingInt(Customer::getCustomerId));
        
        try (PrintWriter writer = new PrintWriter(new FileWriter("merge-output.txt"))) {
            for (Customer customer : customers) {
                writer.println(customer);
                System.out.println(customer);
            }
        }
    }
    
    private static void sortAndDisplayFile() throws IOException {
        System.out.println("Sorting merged file on descending contract id....");
        
        List<Customer> customers = new ArrayList<>();
        
        try (BufferedReader reader = new BufferedReader(new FileReader("merge-output.txt"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                customers.add(Customer.fromString(line));
            }
        }
        
        customers.sort(Comparator.comparingInt(Customer::getCustomerContractId).reversed());
        
        try (PrintWriter writer = new PrintWriter(new FileWriter("sorted-contract-id.txt"))) {
            for (Customer customer : customers) {
                writer.println(customer);
                System.out.println(customer);
            }
        }
    }
}
