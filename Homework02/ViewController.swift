//
//  ViewController.swift
//  Homework02
//
//  Created by William Sulca Talavera on 30/01/17.
//  Copyright © 2017 William Sulca Talavera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textFieldNum1: UITextField!
    @IBOutlet weak var textFieldNum2: UITextField!
    @IBOutlet weak var textFieldResult: UITextField!
    @IBOutlet weak var imageViewResult: UIImageView!
    
    var operation:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedControlChangeValue(_ sender: UISegmentedControl) {
        print("value: \(sender.selectedSegmentIndex)")
        operation = sender.selectedSegmentIndex
    }

    @IBAction func buttonCalculate(_ sender: UIButton) {
        let text1 = textFieldNum1.text!
        let text2 = textFieldNum2.text!
        
        if (text1.isEmpty) {
            showError(text: "Número 1 inválido")
            return
        } else if (text2.isEmpty) {
            showError(text: "Número 2 inválido")
            return
        }
        
        let num1:Double? = Double(text1)
        let num2:Double? = Double(text2)
        
        var status:Bool = false
        var result:Double = 0
        //:Dictionary<Bool, Double>
        //[D:] = ["rs": false, "value": 0]
        
        switch operation {
        case 0:
            let temp = addOperation(num1: num1!, num2: num2!)
            status = temp.rs
            if (status) {
                result = temp.value
            }
        case 1:
            let temp = subtractOperation(num1: num1!, num2: num2!)
            status = temp.rs
            if (status) {
                result = temp.value
            }
        case 2:
            let temp = multiplicationOperation(num1: num1!, num2: num2!)
            status = temp.rs
            if (status) {
                result = temp.value
            }
        case 3:
            let temp = divisionOperation(num1: num1!, num2: num2!)
            status = temp.rs
            if (status) {
                result = temp.value
            }
        default:
            print("default")
            //result = nil
        }
        
        if (status) {
            showResult(text: "\(result)")
        }
    }
    
    func addOperation(num1:Double, num2:Double) -> (rs:Bool, value:Double) {
        return (true, num1+num2)
    }
    
    func subtractOperation(num1:Double, num2:Double) -> (rs:Bool, value:Double) {
        return (true, num1-num2)
    }
    
    func multiplicationOperation(num1:Double, num2:Double) -> (rs:Bool, value:Double) {
        return (true, num1*num2)
    }
    
    func divisionOperation(num1:Double, num2:Double) -> (rs:Bool, value:Double) {
        if (num2 == 0) {
            showError(text: "Divisor inválido")
            return (false, 0)
        } else {
            return (true, num1/num2)
        }
    }
    
    func showResult(text:String) {
        textFieldResult.text = text
        imageViewResult.image = UIImage(named: "ic_ok")
    }

    func showError(text:String) {
        print("showError")
        textFieldResult.text = text
        imageViewResult.image = UIImage(named: "ic_cancel")
    }

}

