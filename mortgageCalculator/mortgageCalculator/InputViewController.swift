//
//  InputViewController.swift
//  mortgageCalculator
//
//  Created by Lambda_School_Loaner_219 on 11/19/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

   
    @IBOutlet weak var mortgageAmountOutlet: UITextField!
  
    
    @IBOutlet weak var termOutlet: UITextField!
    
    @IBOutlet weak var interestRateOutlet: UITextField!
    
    @IBOutlet weak var startDateOutlet: UITextField!
   
    var mortgageAmount:Int = 1000000
    var term:Int = 30
    var interestRate:Float = 5.0
    var startDate:String = "7-10-2018"
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //STANDARD INPUTS
        
        mortgageAmountOutlet?.text = String(mortgageAmount)
        termOutlet.text? = String(term)
        interestRateOutlet.text? = String(interestRate)
       
       
        
        
        
        //DATE PICKER
        startDateOutlet.inputView = datePicker
        datePicker.setDate(Date(), animated:false)
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: .valueChanged)
        
        
       

        
      
        }
    @objc
    func datePickerChanged(datePicker:UIDatePicker){
        let selectedDate = datePicker.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let formattedDateString = dateFormatter.string(from: selectedDate)
        startDateOutlet.text = formattedDateString
    }
 
        // Do any additional setup after loading the view.
    var datePicker = UIDatePicker()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


