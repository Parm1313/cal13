//
//  ViewController.swift
//  Calculator
//
//  Created by MacStudent on 2019-10-30.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber:Double = 0;
    var lastNumber:Double = 0;
    var performoperation = false
    var operation = 0
    
    var result = 0.0
    
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton)
        
    {
        
        if performoperation == true //after operation
        {
            label.text = ""
            if sender.tag == 18 //decimal after operation sec value
            {
                label.text = label.text! + String(".")
            }
            else{
                label.text = String(sender.tag-1) //int after operation sec value
            }
             currentNumber = Double(label.text!) ?? 0.0
            
            performoperation = false
        }
        else {
            if sender.tag == 18 //decimal
           {
                // print only one deciaml frst value float
                if (label.text?.contains("."))!{
                    return
                }
                
                
                label.text = label.text! + String(".")
            }
            else {
                label.text = label.text! + String(sender.tag-1) // frst value int
            }
            currentNumber = Double(label.text!) ?? 0.0
       
       
        }
       
        
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            lastNumber = Double(label.text!)!
            
            if sender.tag == 12  // Divide
            {
                label.text = "/";
            }
            else if sender.tag == 13  // multiply
            {
                label.text = "*";
            }
            else if sender.tag == 14  // subtract
            {
                label.text = "-";
            }
            else if sender.tag == 15  // addition
            {
                label.text = "+";
            }
           else if sender.tag == 17 // percentage
            {
                label.text = String(lastNumber/100)
            }
            else if sender.tag == 18  // period
            {
                label.text = ".";
            }
            
                
                   
            operation = sender.tag
            performoperation = true;
        }
            
        else if sender.tag == 16
        {
            if operation == 12 
            {
                label.text = String(format: "%.3f", lastNumber /  currentNumber)
                result = Double(label.text!) ?? 0.0
                roundDoubleInt()
            }
           else if operation == 13
            {
                label.text = String(format: "%.3f", lastNumber *  currentNumber)
                 result = Double(label.text!) ?? 0.0
                roundDoubleInt()
            }
            else if operation == 14
            {
                label.text = String(format: "%.3f", lastNumber - currentNumber)
                 result = Double(label.text!) ?? 0.0
                roundDoubleInt()
            }
           else if operation == 15
            {
                label.text = String(format: "%.3f", lastNumber +  currentNumber)
                 result = Double(label.text!) ?? 0.0
                roundDoubleInt()
            }
            else if operation == 17
            {
                label.text = String(format: "%.3f", lastNumber / 100)
                 result = Double(label.text!) ?? 0.0
                roundDoubleInt()
            }
            
    
    
        }
        else if sender.tag == 11 // clear
        {
            label.text = ""
            lastNumber = 0;
            currentNumber = 0;
            operation = 0;        }
        
    }
    func roundDoubleInt()  {

        print(result)
        
        if result.rounded(.up) == result.rounded(.down){
            
           //print(("rounded(.up)"))
            
            let result = Int(self.result) // 15.00...15 answer
            label.text = String(result)
            self.result = Double(result)
        }else{
            label.text = String(result)// 15.88 ....15.88 answer
        }
        
        
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
}

