//
//  ViewController.swift
//  SwiftCalc
//
//  Created by Kartikeya Kaushal on 8/1/14.
//  Copyright (c) 2014 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var b1:UIButton = UIButton(), b2:UIButton = UIButton(), b3:UIButton = UIButton()
    var b4:UIButton = UIButton(), b5:UIButton = UIButton(), b6:UIButton = UIButton()
    var b7:UIButton = UIButton(), b8:UIButton = UIButton(), b9:UIButton = UIButton()
    var b0:UIButton = UIButton(), bC:UIButton = UIButton(), bDot:UIButton = UIButton()
    
    var bPlus:UIButton = UIButton(), bMinus:UIButton = UIButton(), bMulti:UIButton = UIButton()
    var bDivi:UIButton = UIButton(), bEquals:UIButton = UIButton()
    
    var primeView:UILabel = UILabel()
    var secondView:UILabel = UILabel()
    
    var calcOperator:Int = 0
    var preCalcOperator = 0
    var machineState:Int = -1   // -1 = start/resets, 0 = equals, 1 = operation, 2 = input
    var numHolder1:Float = 0.0
    var numHolder2:Float = 0.0
    var output:String = "0"
    var subOutput:String = ""
    
    //func used to load a custom view.  Usually done through .xib, but you can programmatically make one too
    override func loadView() {
        
        //make a UIView to load
        var frontView:UIView = UIView(frame: CGRectMake(0, 0, 1000, 1000))
        frontView.backgroundColor = UIColor.purpleColor()
        
        //set button values
        b1.setTitle("1", forState: UIControlState.Normal)
        b2.setTitle("2", forState: UIControlState.Normal)
        b3.setTitle("3", forState: UIControlState.Normal)
        b4.setTitle("4", forState: UIControlState.Normal)
        b5.setTitle("5", forState: UIControlState.Normal)
        b6.setTitle("6", forState: UIControlState.Normal)
        b7.setTitle("7", forState: UIControlState.Normal)
        b8.setTitle("8", forState: UIControlState.Normal)
        b9.setTitle("9", forState: UIControlState.Normal)
        b0.setTitle("0", forState: UIControlState.Normal)
        bC.setTitle("C", forState: UIControlState.Normal)
        bDot.setTitle(".", forState: UIControlState.Normal)
        bPlus.setTitle("+", forState: UIControlState.Normal)
        bMinus.setTitle("-", forState: UIControlState.Normal)
        bMulti.setTitle("*", forState: UIControlState.Normal)
        bDivi.setTitle("/", forState: UIControlState.Normal)
        bEquals.setTitle("=", forState: UIControlState.Normal)
        
        //make the button frames
        b1.frame = CGRectMake(85, 300, 25, 25)
        b2.frame = CGRectMake(145, 300, 25, 25)
        b3.frame = CGRectMake(205, 300, 25, 25)
        b4.frame = CGRectMake(85, 250, 25, 25)
        b5.frame = CGRectMake(145, 250, 25, 25)
        b6.frame = CGRectMake(205, 250, 25, 25)
        b7.frame = CGRectMake(85, 200, 25, 25)
        b8.frame = CGRectMake(145, 200, 25, 25)
        b9.frame = CGRectMake(205, 200, 25, 25)
        b0.frame = CGRectMake(145, 350, 25, 25)
        bC.frame = CGRectMake(85, 350, 25, 25)
        bDot.frame = CGRectMake(205, 350, 25, 25)
        bPlus.frame = CGRectMake(255, 175, 25, 25)
        bMinus.frame = CGRectMake(255, 225, 25, 25)
        bMulti.frame = CGRectMake(255, 275, 25, 25)
        bDivi.frame = CGRectMake(255, 325, 25, 25)
        bEquals.frame = CGRectMake(255, 375, 25, 25)
        
        //set the target actions for each button
        b1.addTarget(self, action: "click1:", forControlEvents: UIControlEvents.TouchUpInside)
        b2.addTarget(self, action: "click2:", forControlEvents: UIControlEvents.TouchUpInside)
        b3.addTarget(self, action: "click3:", forControlEvents: UIControlEvents.TouchUpInside)
        b4.addTarget(self, action: "click4:", forControlEvents: UIControlEvents.TouchUpInside)
        b5.addTarget(self, action: "click5:", forControlEvents: UIControlEvents.TouchUpInside)
        b6.addTarget(self, action: "click6:", forControlEvents: UIControlEvents.TouchUpInside)
        b7.addTarget(self, action: "click7:", forControlEvents: UIControlEvents.TouchUpInside)
        b8.addTarget(self, action: "click8:", forControlEvents: UIControlEvents.TouchUpInside)
        b9.addTarget(self, action: "click9:", forControlEvents: UIControlEvents.TouchUpInside)
        b0.addTarget(self, action: "click0:", forControlEvents: UIControlEvents.TouchUpInside)
        bC.addTarget(self, action: "clickC:", forControlEvents: UIControlEvents.TouchUpInside)
        bDot.addTarget(self, action: "clickDot:", forControlEvents: UIControlEvents.TouchUpInside)
        bPlus.addTarget(self, action: "clickPlus:", forControlEvents: UIControlEvents.TouchUpInside)
        bMinus.addTarget(self, action: "clickMinus:", forControlEvents: UIControlEvents.TouchUpInside)
        bMulti.addTarget(self, action: "clickMulti:", forControlEvents: UIControlEvents.TouchUpInside)
        bDivi.addTarget(self, action: "clickDivi:", forControlEvents: UIControlEvents.TouchUpInside)
        bEquals.addTarget(self, action: "clickEquals:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //add each button to the view
        frontView.addSubview(b1)
        frontView.addSubview(b2)
        frontView.addSubview(b3)
        frontView.addSubview(b4)
        frontView.addSubview(b5)
        frontView.addSubview(b6)
        frontView.addSubview(b7)
        frontView.addSubview(b8)
        frontView.addSubview(b9)
        frontView.addSubview(b0)
        frontView.addSubview(bC)
        frontView.addSubview(bDot)
        frontView.addSubview(bPlus)
        frontView.addSubview(bMinus)
        frontView.addSubview(bMulti)
        frontView.addSubview(bDivi)
        frontView.addSubview(bEquals)
        
        
        //set up the output and suboutput in the view
        primeView.frame = CGRectMake(0, 100, 280, 25)
        primeView.text = output
        primeView.textAlignment = NSTextAlignment.Right
        secondView.frame = CGRectMake(0, 75, 280, 25)
        secondView.text = subOutput
        secondView.textAlignment = NSTextAlignment.Right
        frontView.addSubview(primeView)
        frontView.addSubview(secondView)
        
        self.view = frontView
        
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func click1(sender:UIButton!){
        if machineState == 0 || machineState == 1 || machineState == -1
        {
            output = ""
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString("1")
        primeView.text = output
        machineState = 2
        
    }
    
    func click2(sender:UIButton!) {
        if machineState == 0 || machineState == 1 || machineState == -1
        {
            output = ""
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString("2")
        primeView.text = output
        machineState = 2
    }
    
    func click3(sender:UIButton!) {
        if machineState == 0 || machineState == 1 || machineState == -1
        {
            output = ""
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString("3")
        primeView.text = output
        machineState = 2
    }
    
    func click4(sender:UIButton!){
        if machineState == 0 || machineState == 1 || machineState == -1
        {
            output = ""
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString("4")
        primeView.text = output
        machineState = 2
        
    }
    
    func click5(sender:UIButton!) {
        if machineState == 0 || machineState == 1 || machineState == -1
        {
            output = ""
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString("5")
        primeView.text = output
        machineState = 2
    }
    
    func click6(sender:UIButton!) {
        if machineState == 0 || machineState == 1 || machineState == -1
        {
            output = ""
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString("6")
        primeView.text = output
        machineState = 2
    }
    
    func click7(sender:UIButton!){
        if machineState == 0 || machineState == 1 || machineState == -1
        {
            output = ""
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString("7")
        primeView.text = output
        machineState = 2
        
    }
    
    func click8(sender:UIButton!) {
        if machineState == 0 || machineState == 1 || machineState == -1
        {
            output = ""
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString("8")
        primeView.text = output
        machineState = 2
    }
    
    func click9(sender:UIButton!) {
        if machineState == 0 || machineState == 1 || machineState == -1
        {
            output = ""
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString("9")
        primeView.text = output
        machineState = 2
    }
    
    func click0(sender:UIButton!){
        if machineState == 0 || machineState == 1 || machineState == -1
        {
            output = ""
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString("0")
        primeView.text = output
        machineState = 2
    }
    
    func clickDot(sender:UIButton!){
        if machineState == 0 || machineState == 1
        {
            output = "0"
            if machineState == 0
            {
                numHolder1 = 0
            }
        }
        output = output.stringByAppendingString(".")
        primeView.text = output
        machineState = 2
    }
    
    func clickC(sender:UIButton!){
        numHolder1 = 0
        numHolder2 = 0
        output = "0"
        subOutput = ""
        primeView.text = output
        secondView.text = subOutput
        machineState = -1
    }
    
    func clickPlus(sender:UIButton!) {
        if machineState == 1 || machineState == -1
        {
            return
        }
        if machineState == 2 && numHolder1 != 0
        {
            preCalcOperator = 1
            clickOperatorEquals()
            calcOperator = 1
            
            return
        }
        calcOperator = 1
        numHolder1 = (output as NSString).floatValue
        subOutput = subOutput.stringByAppendingString("\(numHolder1) + ")
        primeView.text = "\(numHolder1)"
        secondView.text = subOutput
        machineState = 1
    }
    
    func clickMinus(sender:UIButton!) {
        if machineState == 1 || machineState == -1
        {
            return
        }
        if machineState == 2 && numHolder1 != 0
        {
            preCalcOperator = 2
            clickOperatorEquals()
            calcOperator = 2
            return
        }
        calcOperator = 2
        numHolder1 = (output as NSString).floatValue
        subOutput = subOutput.stringByAppendingString("\(numHolder1) - ")
        primeView.text = "\(numHolder1)"
        secondView.text = subOutput
        machineState = 1
    }
    
    func clickMulti(sender:UIButton!) {
        if machineState == 1 || machineState == -1
        {
            return
        }
        if machineState == 2 && numHolder1 != 0
        {
            preCalcOperator = 3
            clickOperatorEquals()
            calcOperator = 3
            return
        }
        calcOperator = 3
        numHolder1 = (output as NSString).floatValue
        subOutput = subOutput.stringByAppendingString("\(numHolder1) * ")
        primeView.text = "\(numHolder1)"
        secondView.text = subOutput
        machineState = 1
    }
    
    func clickDivi(sender:UIButton!) {
        if machineState == 1 || machineState == -1
        {
            return
        }
        if machineState == 2 && numHolder1 != 0
        {
            preCalcOperator = 4
            clickOperatorEquals()
            calcOperator = 4
            return
        }
        calcOperator = 4
        numHolder1 = (output as NSString).floatValue
        subOutput = subOutput.stringByAppendingString("\(numHolder1) / ")
        primeView.text = "\(numHolder1)"
        secondView.text = subOutput
        machineState = 1
    }
    
    func clickEquals(sender:UIButton!){
        if machineState == 1
        {
            return
        }
        numHolder2 = (output as NSString).floatValue
        subOutput = ""
        machineState = 0
        secondView.text = subOutput
        switch calcOperator{
        case 1:
            numHolder1 = numHolder1 + numHolder2
        case 2:
            numHolder1 = numHolder1 - numHolder2
        case 3:
            numHolder1 = numHolder1 * numHolder2
        case 4:
            numHolder1 = numHolder1 / numHolder2
        default:
            break;
        }
        output = numHolder1.description
        primeView.text = "\(output)"
        numHolder2 = 0
    }
    
    func clickOperatorEquals(){
        numHolder2 = (output as NSString).floatValue
        machineState = 1
        switch calcOperator{
        case 1:
            numHolder1 = numHolder1 + numHolder2
        case 2:
            numHolder1 = numHolder1 - numHolder2
        case 3:
            numHolder1 = numHolder1 * numHolder2
        case 4:
            numHolder1 = numHolder1 / numHolder2
        default:
            break;
        }
        switch preCalcOperator{
        case 1:
            subOutput = subOutput.stringByAppendingString("\(output) + ")
        case 2:
            subOutput = subOutput.stringByAppendingString("\(output) - ")
        case 3:
            subOutput = subOutput.stringByAppendingString("\(output) * ")
        case 4:
            subOutput = subOutput.stringByAppendingString("\(output) / ")
        default:
            break;
        }
        output = numHolder1.description
        primeView.text = "\(output)"
        secondView.text = "\(subOutput)"
        numHolder2 = 0
    }


}

