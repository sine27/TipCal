//
//  ViewController.swift
//  TicCal
//
//  Created by Shayin Feng on 1/21/16.
//  Copyright © 2016 Shayin Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultDisplay: UILabel!
    @IBOutlet weak var firstLineStack: UIStackView!
    @IBOutlet weak var secondLineStack: UIStackView!
    @IBOutlet weak var thirdLineStack: UIStackView!
    @IBOutlet weak var fourthLineStack: UIStackView!
    @IBOutlet weak var stackHight: NSLayoutConstraint!
    @IBOutlet weak var resultHeight: NSLayoutConstraint!
    @IBOutlet weak var dividerWidth: NSLayoutConstraint!
    @IBOutlet weak var dividerLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var dividerDisplay: UILabel!
    @IBOutlet weak var amountDisplay: UILabel!
    @IBOutlet weak var percentageDisplay: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    var divider = false
    var amount = true
    var percentage = "15%"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        resultDisplay.numberOfLines = 1;
        resultDisplay.minimumScaleFactor = 0.5;
        resultDisplay.adjustsFontSizeToFitWidth = true;
        
        let lineStackHeight = 0.157 * UIScreen.mainScreen().bounds.height
        let lineStackWidth = 1 / 3 * UIScreen.mainScreen().bounds.width
        
        stackHight.constant = lineStackHeight
        resultHeight.constant = 1.15 * lineStackHeight
        dividerWidth.constant = lineStackWidth - 20
        dividerLabelWidth.constant = lineStackWidth - 20
        
    }

    @IBAction func dividerTapped (sender: AnyObject) {
        divider = true
        amount = false
        dividerDisplay.text = "0"
    }
    
    @IBAction func amountTapped(sender: AnyObject) {
        divider = false
        amount = true
        amountDisplay.text = "0"
    }
    
    @IBAction func percentageSelected(sender: AnyObject) {
        percentageDisplay.text = sender.currentTitle
    }
    
    
    @IBAction func numberTapped(sender: AnyObject) {
        
        let num = sender.currentTitle
        
        if ( amount == true ) {
            if ( amountDisplay.text != "" && num == "<" ) {
                amountDisplay.text = amountDisplay.text!.substringToIndex(amountDisplay.text!.endIndex.predecessor())
                if ( amountDisplay.text == "" ) {
                    amountDisplay.text = "0"
                }
            } else if ( num != "<" ) {
                if ( amountDisplay.text == "0" ) {
                    amountDisplay.text = ""
                }
                amountDisplay.text = amountDisplay.text! + num!!
            }
        }
            
        else if ( divider == true ) {
            if ( num == "." ) {}
            else if ( dividerDisplay.text != "" && num == "<" ) {
                dividerDisplay.text =  dividerDisplay.text!.substringToIndex( dividerDisplay.text!.endIndex.predecessor())
                if ( dividerDisplay.text == "" ) {
                    dividerDisplay.text = "1"
                }
            } else if ( num != "<" ) {
                if (  dividerDisplay.text == "0" ) {
                    dividerDisplay.text = ""
                }
                dividerDisplay.text =  dividerDisplay.text! + num!!
            }
        }
    }
    
    @IBAction func percentageButtonTapped(sender: AnyObject) {
        
        let bill : Double = NSNumberFormatter().numberFromString(amountDisplay.text!)!.doubleValue
        let divide = NSNumberFormatter().numberFromString( dividerDisplay.text!)!.doubleValue
        
        if ( percentageDisplay.text == "15%" ) {
            resultDisplay.text = "\( round((bill * 1.15 / divide) * 100) / 100 )"
        } else if ( percentageDisplay.text == "18%" ) {
            resultDisplay.text = "\( round((bill * 1.18 / divide) * 100) / 100 )"
        } else if ( percentageDisplay.text == "20%" ) {
            resultDisplay.text = "\( round((bill * 1.20 / divide) * 100) / 100 )"
        }
        
    }

}

