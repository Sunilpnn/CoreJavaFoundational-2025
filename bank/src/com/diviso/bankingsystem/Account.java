package com.diviso.bankingsystem;
import java.util.Scanner;

public class Account {
    private String accountNumber;
    private String holderName;
    private double balance;

    // Constructor
    public Account(String accountNumber, String holderName, double balance) {
        this.accountNumber = accountNumber;
        this.holderName = holderName;
        this.balance = balance;
    }

    // ✅ Static method to create account interactively
    public static Account createAccount() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Account Number: ");
        String accNo = sc.nextLine();
        System.out.print("Enter Holder Name: ");
        String name = sc.nextLine();
        System.out.print("Enter Initial Balance: ");
        double bal = sc.nextDouble();

        return new Account(accNo, name, bal);
    }

    // Getters
    public String getAccountNumber() { return accountNumber; }
    public String getHolderName() { return holderName; }
    public double getBalance() { return balance; }

    @Override
    public String toString() {
        return "Account No: " + accountNumber +
               " | Holder: " + holderName +
               " | Balance: ₹" + balance;
    }
}
