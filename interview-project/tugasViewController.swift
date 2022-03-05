//
//  tugasViewController.swift
//  interview-project
//
//  Created by Aritio modernland on 04/03/22.
//

import Foundation
import UIKit

class tugasViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        func vendinMachine(){
            let aqua : Int = 5000;
            let tehBotol : Int = 7000;
            let pocariSweat : Int = 10000;
            
            //stok minuman
            let stockAqua : Int =  10;
            let stockTehBotol : Int = 0;
            let stockPocari : Int =  4;
            //customer input data
            print("===========================\n");
            print("1. Aqua         : 5000   =\n");
            print("2. Teh Botol    : 7000   =\n");
            print("3. Pocari Sweat : 10000  =\n");
            print("===========================\n");
            print("Pilih Minuman Anda (1, 2, 3) : ");
            let productValue = readLine()
            print("Jumlah minuman : ");
            let  itemValues = readLine()
            let itemValue = (itemValues! as NSString).integerValue
            
            if (stockAqua > itemValue || stockTehBotol > itemValue || stockPocari > itemValue){
                    print("===========================\n");
                    print("Masukan Uang Pecahan Anda \n");

                    print("Pecahan 2000  : ");
                    let  itemPrice1s = readLine()
                    let itemPrice1 = (itemPrice1s! as NSString).integerValue

                    print("Pecahan 5000  : ");
                    let  itemPrice2s = readLine()
                    let itemPrice2 = (itemPrice2s! as NSString).integerValue
                
                    print("Pecahan 10000 : ");
                    let  itemPrice3s = readLine()
                    let itemPrice3 = (itemPrice3s! as NSString).integerValue
                
                    print("Pecahan 20000 : ");
                    let  itemPrice4s = readLine()
                    let itemPrice4 = (itemPrice4s! as NSString).integerValue

                    print("===========================\n");
                
                    let itemPrice : Int = (itemPrice1 * 2000) + (itemPrice2 * 5000) + (itemPrice3 * 10000) + (itemPrice4 * 20000);
                switch (productValue) {
                            case "1":
                                if (itemPrice > aqua) {
                                    let totalPriceAqua : Int = itemPrice - (aqua * itemValue);
                                    print("Total Kembalian : ", totalPriceAqua);
                                }else{
                                    print("Maaf Uang Anda Tidak Cukup");
                                }
                                break;
                            case "2":
                                if (itemPrice > tehBotol) {
                                    let totalPriceTehBotol : Int = itemPrice - (tehBotol * itemValue);
                                   print("Total Kembalian : ", totalPriceTehBotol);
                                }else {
                                    print("Maaf Uang Anda Tidak Cukup");
                                }
                                break;
                            case "3":
                                if (itemPrice > pocariSweat) {
                                    let totalPricePocari : Int = itemPrice - (pocariSweat * itemValue);
                                   print("Total Kembalian : ",totalPricePocari);
                                }else {
                                    print("Maaf Uang Anda Tidak Cukup");
                                }
                        default:
                        print("Have you done something new?")
                        }
                } else  {
                    print("Maaf Stok Minuman Anda Kosong");
                }
        }
    }
    
}
	

