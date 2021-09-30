//
//  ViewController.swift
//  MAPD714 - F2021 - Assignment 2 - Calculator
//  Student Id: 301232944
//  Author: Seth Alkins
//  Date: 9/29/21.

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var CalculatorWorkings: UILabel!
    @IBOutlet weak var CalculatorResults: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clearAll()
        
    }
    func clearAll()
    {
        workings = ""
        CalculatorWorkings.text = ""
        CalculatorResults.text = ""
        
    }
    @IBAction func EqualsTap(_ sender: Any)
    {
        if validInput()
        {
        let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkedWorkingsForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        CalculatorResults.text = resultString
        }
        else
        {
            let alert = UIAlertController(title: "Invalid Input",
                                          message: "Calculator Unable to Compute",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() ->Bool
        {
            var count = 0
            var funcCharIndexes = [Int]()
            
            for char in workings
            {
                if(specialCharacter(char: char))
                {
                    funcCharIndexes.append(count)
                }
                count += 1
            }
            
            var previous: Int = -1
            
            for index in funcCharIndexes
            {
                if(index == 0)
                {
                    return false
                }
                
                if(index == workings.count - 1)
                {
                    return false
                }
                
                if (previous != -1)
                {
                    if(index - previous == 1)
                    {
                        return false
                    }
                }
                previous = index
            }
            
            return true
        }
        
        func specialCharacter (char: Character) -> Bool
        {
            if(char == "*")
            {
                return true
            }
            if(char == "/")
            {
                return true
            }
            if(char == "+")
            {
                return true
            }
            return false
        }
        
        func formatResult(result: Double) -> String
        {
            if(result.truncatingRemainder(dividingBy: 1) == 0)
            {
                return String(format: "%.0f", result)
            }
            else
            {
                return String(format: "%.2f", result)
            }
        }
        
        @IBAction func ClearTap(_ sender: Any)
        {
            clearAll()
        }
        
        @IBAction func BackTap(_ sender: Any)
        {
            if(!workings.isEmpty)
            {
                workings.removeLast()
                CalculatorWorkings.text = workings
            }
        }
        
        func addToWorkings(value: String)
        {
            workings = workings + value
            CalculatorWorkings.text = workings
        }
        
        @IBAction func PercentTap(_ sender: Any)
        {
            addToWorkings(value: "%")
        }
        
        @IBAction func DivideTap(_ sender: Any)
        {
            addToWorkings(value: "/")
        }
        
        @IBAction func TimesTap(_ sender: Any)
        {
            addToWorkings(value: "*")
        }
        
        @IBAction func MinusTap(_ sender: Any)
        {
            addToWorkings(value: "-")
        }
        
        @IBAction func AddTap(_ sender: Any)
        {
            addToWorkings(value: "+")
        }
        
        @IBAction func DecimalTap(_ sender: Any)
        {
            addToWorkings(value: ".")
        }
        
        @IBAction func ZeroTap(_ sender: Any)
        {
            addToWorkings(value: "0")
        }
        
        @IBAction func OneTap(_ sender: Any)
        {
            addToWorkings(value: "1")
        }
        
        @IBAction func TwoTap(_ sender: Any)
        {
            addToWorkings(value: "2")
        }
        
        @IBAction func ThreeTap(_ sender: Any)
        {
            addToWorkings(value: "3")
        }
        
        @IBAction func FourTap(_ sender: Any)
        {
            addToWorkings(value: "4")
        }
        
        @IBAction func FiveTap(_ sender: Any)
        {
            addToWorkings(value: "5")
        }
        
        @IBAction func SixTap(_ sender: Any)
        {
            addToWorkings(value: "6")
        }
        
        @IBAction func SevenTap(_ sender: Any)
        {
            addToWorkings(value: "7")
        }
        
        @IBAction func EightTap(_ sender: Any)
        {
            addToWorkings(value: "8")
        }
        
        @IBAction func NineTap(_ sender: Any)
        {
            addToWorkings(value: "9")
        }
    }

