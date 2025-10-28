package com.diviso.bankingsystem;

import java.util.*;

public class Bank {
    private Map<String, Account> accounts = new HashMap<>();
    private Scanner sc = new Scanner(System.in);

    public void bankDetails() {
        while (true) {
            System.out.println("\n🏦 BANK MENU");
            System.out.println("1. Create Account");
            System.out.println("2. Display Accounts");
            System.out.println("3. Exit");
            System.out.print("Enter your choice: ");

            int choice = sc.nextInt();
            sc.nextLine(); // clear buffer

            switch (choice) {
                case 1 -> {
                    Account acc = Account.createAccount(); // call static method
                    accounts.put(acc.getAccountNumber(), acc);
                    System.out.println("✅ Account created successfully!");
                }
                case 2 -> displayAccounts();
                case 3 -> {
                    System.out.println("👋 Exiting Bank System...");
                    return;
                }
                default -> System.out.println("⚠️ Invalid choice!");
            }
        }
    }

    private void displayAccounts() {
        if (accounts.isEmpty()) {
            System.out.println("⚠️ No accounts available!");
        } else {
            System.out.println("\n📋 List of Accounts:");
            for (Account acc : accounts.values()) {
                System.out.println(acc);
            }
        }
    }
}
