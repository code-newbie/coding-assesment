package com.company;

import java.util.Scanner;

public class Main {
    private static int price=0;
    private static int aquaStock = 0;
    private static int tehBotolStock = 0;
    private static int pocariSweatStock = 0;

    private static int aquaPrice = 5000;
    private static int tehBotolPrice = 7000;
    private static int pocariSweatPrice = 10000;


    public static void main(String[] args) {
        while(aquaStock != 0 || tehBotolStock != 0 || pocariSweatStock != 0) {
            Scanner input = new Scanner(System.in);

            System.out.println("Masukkan minuman yang anda inginkan : ");
            String productView = input.nextLine();
            String product = productView.replaceAll("( )+", "");
            if (product.equalsIgnoreCase("aqua")) {
                price = aquaPrice;
                if (aquaStock == 0) {
                    System.out.println("Product Aqua habis ");
                    continue;
                }
            } else if (product.equalsIgnoreCase("tehbotol")) {
                price = tehBotolPrice;
                if (tehBotolStock == 0) {
                    System.out.println("Product Teh Botol Habis");
                    continue;
                }
            } else if (product.equalsIgnoreCase("pocarisweat")) {
                price = pocariSweatPrice;
                if (pocariSweatStock == 0) {
                    System.out.println("Product Pocari Sweat Habis");
                    continue;
                }
            } else {
                System.out.println("Product tidak tersedia");
                continue;
            }

            System.out.println("Masukkan uang yang anda bayarkan : ");
            int money = input.nextInt();

            if (money == 2000 || money == 5000 || money == 10000 || money == 20000) {
                if (money < price) {
                    System.out.println("Uang tidak cukup");
                    continue;
                } else {
                    if (product.equalsIgnoreCase("aqua")) {
                        aquaStock = aquaStock - 1;
                    } else if (product.equalsIgnoreCase("tehbotol")) {
                        tehBotolStock = tehBotolStock - 1;
                    } else if (product.equalsIgnoreCase("pocarisweat")) {
                        pocariSweatStock = pocariSweatStock - 1;
                    }
                    System.out.println("Ini " + productView + " anda. Kembaliannya : " + (money - price));
                }
            } else {
                System.out.println("Vending Machine hanya menerima uang dengan pecahan 2000, 5000, 10000, 20000");
                continue;
            }
        }

        System.out.println();
    }


}
