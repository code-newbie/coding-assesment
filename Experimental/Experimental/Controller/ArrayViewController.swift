//
//  ArrayViewController.swift
//  Experimental
//
//  Created by ogya 1 on 03/05/20.
//  Copyright © 2020 ogya 1. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fieldInput: UITextField!
    
    @IBOutlet weak var btnProses: UIButton!
    
    @IBOutlet weak var txtLabel: UILabel!
    
    @IBOutlet weak var txtResult: UILabel!
    
    var result : [Int] = []
    var jmlGenap : Int = 0
    var jmlPrime : Int = 0
    var done = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldInput.delegate = self
    }
    
    @IBAction func Reset(_ sender: Any) {
        result = []
        txtLabel.text = "[]"
        jmlGenap = 0
        jmlPrime = 0
        done = false
        fieldInput.endEditing(true)
        txtResult.text = ""
    }
    
    // 2 adalah primer dan genap
    @IBAction func Proccess(_ sender: Any) {
        if(!done){
            let isEmpty = (fieldInput.text ?? "").isEmpty
            txtResult.text = "Ganjil dan Bukan Primer"
            if(!isEmpty){
                let label = fieldInput.text!
                let input = Int(label)
                checkPrime(input!)
                checkEven(input!)
                txtLabel.text = "\(result)"
                if(result.count >= 15){
                    done = true
                }
            }
            
        } else{
            txtResult.text = "Done"
        }
        fieldInput.endEditing(true)
    }
    
    func checkEven (_ number: Int) {
        if(number % 2 == 0){
            result.insert(number, at: result.count - jmlGenap)
            txtResult.text = "Genap"
            jmlGenap += 1
        }
    }
    
    
    func checkPrime (_ number: Int){
        var flag : Bool = false;
        if(number <= 1){
            flag = true
        }
        if(number <= 3){
            flag = false
        } else{
            for i in 2 ... number/2 {
                if(number % i == 0){
                    flag = true
                    break;
                }
            }
            
        }
        
        if flag == false {
            result.insert(number, at: jmlPrime)
            txtResult.text = "Primari"
            jmlPrime += 1
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fieldInput.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Tolong diisi"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        fieldInput.text = ""
    }
}
