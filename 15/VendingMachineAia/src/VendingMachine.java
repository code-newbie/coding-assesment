import kotlin.reflect.jvm.internal.impl.types.checker.SimpleClassicTypeSystemContext;

import java.util.Scanner;

public class VendingMachine {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        final int aqua = 5000;
        final int tehBotol = 7000;
        final int pocariSweat = 10000;

        //stok minuman
        final int stockAqua = 10;
        final int stockTehBotol = 0;
        final int stockPocari = 4;

        //customer input data
        System.out.print("===========================\n");
        System.out.print("=1. Aqua         : 5000   =\n");
        System.out.print("=2. Teh Botol    : 7000   =\n");
        System.out.print("=3. Pocari Sweat : 10000  =\n");
        System.out.print("===========================\n");

        System.out.print("Pilih Minuman Anda (1, 2, 3) : ");
        int productValue = in.nextInt();

        System.out.print("Jumlah minuman : ");
        int itemValue = in.nextInt();

        if (stockAqua > itemValue || stockTehBotol > itemValue || stockPocari > itemValue){
            System.out.print("===========================\n");
            System.out.print("Masukan Uang Pecahan Anda \n");

            System.out.print("Pecahan 2000  : ");
            int itemPrice1 = in.nextInt();

            System.out.print("Pecahan 5000  : ");
            int itemPrice2 = in.nextInt();

            System.out.print("Pecahan 10000 : ");
            int itemPrice3 = in.nextInt();

            System.out.print("Pecahan 20000 : ");
            int itemPrice4 = in.nextInt();

            System.out.print("===========================\n");

            int itemPrice = (itemPrice1 * 2000) + (itemPrice2 * 5000) + (itemPrice3 * 10000) + (itemPrice4 * 20000);

            //calculate change
            switch (productValue) {
                case 1:
                    if (itemPrice > aqua) {
                        int totalPriceAqua = itemPrice - (aqua * itemValue);
                        System.out.printf("Total Kembalian : %d", totalPriceAqua);
                    }else{
                        System.out.println("Maaf Uang Anda Tidak Cukup");
                    }
                    break;
                case 2:
                    if (itemPrice > tehBotol) {
                        int totalPriceTehBotol = itemPrice - (tehBotol * itemValue);
                        System.out.printf("Total Kembalian : %d", totalPriceTehBotol);
                    }else {
                        System.out.println("Maaf Uang Anda Tidak Cukup");
                    }
                    break;
                case 3:
                    if (itemPrice > pocariSweat) {
                        int totalPricePocari = itemPrice - (pocariSweat * itemValue);
                        System.out.printf("Total Kembalian : %d",totalPricePocari);
                    }else {
                        System.out.println("Maaf Uang Anda Tidak Cukup");
                    }
                    break;
            }
        }else {
            System.out.println("Maaf Stok Minuman Anda Kosong");
        }

    }
}
