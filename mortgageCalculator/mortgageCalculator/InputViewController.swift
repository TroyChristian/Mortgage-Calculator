//
//  InputViewController.swift
//  mortgageCalculator
//
//  Created by Lambda_School_Loaner_219 on 11/19/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

   
    @IBOutlet weak var mortgageAmountOutlet: UITextField!
  
    
    @IBOutlet weak var termOutlet: UITextField!
    
    @IBOutlet weak var interestRateOutlet: UITextField!
    
    @IBOutlet weak var startDateOutlet: UITextField!
   
    var mortgageAmount:Float = 0.00
    var term:Float = 30
    var interestRate:Float = 5.0
    var startDate:String = "7-10-2018"
    var amt:Int = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mortgageAmountOutlet.delegate = self
        mortgageAmountOutlet.placeholder = updateAmount()
        //STANDARD INPUTS
        
        mortgageAmountOutlet?.text = String(mortgageAmount)
        termOutlet.text? = String(term)
        interestRateOutlet.text? = String(interestRate)
       
       
        
        
        
        //DATE PICKER
        startDateOutlet.inputView = datePicker
        datePicker.setDate(Date(), animated:false)
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: .valueChanged)
        view.endEditing(true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        

       

        
      
        }
    @objc
    func datePickerChanged(datePicker:UIDatePicker){
        let selectedDate = datePicker.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let formattedDateString = dateFormatter.string(from: selectedDate)
        startDateOutlet.text = formattedDateString
    }
 
      
    var datePicker = UIDatePicker()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string:String) -> Bool {
        if let digit = Int(string) {
            amt = amt * 10 + digit
            
            mortgageAmountOutlet.text = updateAmount()
        }
        
        if string == "" {
            amt = amt/10
            mortgageAmountOutlet.text = updateAmount()
        }
        return false
    }
   
    
    
    
    
    func updateAmount() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        let amount = Double(amt/100) + Double(amt%100)/100
        return formatter.string(from: NSNumber(value:amount))
    }
    
    @objc
    func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
        
        
    }
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
