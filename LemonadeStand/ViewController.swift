//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Boris Khomut on 10/15/14.
//  Copyright (c) 2014 Boris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // Views
    var firstContainer: UIView!
    
    
    // Labels
    var titleLabel: UILabel!
    var stepOneLabel: UILabel!
    var stepTwoLabel: UILabel!
    var stepThreeLabel: UILabel!
    
    var moneyLabel: UILabel!
    var lemonsLabel: UILabel!
    var iceLabel: UILabel!
    
    var lemonPriceLabel: UILabel!
    var icePriceLabel: UILabel!
    var lemonsStep1Label: UILabel!
    var iceStep1Label: UILabel!
    
    var lemonMixLabel: UILabel!
    var iceMixLabel: UILabel!
    var lemonsStep2Label: UILabel!
    var iceStep2Label: UILabel!
    
    
    //Buttons
    var startButton: UIButton!
    
    var lemonStep1PlusButton: UIButton!
    var iceStep1PlusButton: UIButton!
    var lemonStep2PlusButton: UIButton!
    var iceStep2PlusButton: UIButton!
    
    var lemonStep1MinusButton: UIButton!
    var iceStep1MinusButton: UIButton!
    var lemonStep2MinusButton: UIButton!
    var iceStep2MinusButton: UIButton!
    
    //Images
    
    
    // Stats
    var money = 10
    var lemons = 1
    var ice = 1
    
    var lemonsStep1 = 0
    var iceStep1 = 0
    
    var lemonsStep2 = 0
    var iceStep2 = 0
    
    var mixRatio = 1.0
    
    var sum = 0
    
    
    // Constaints
    let kMarginForView:CGFloat = 10.0
    let kMarginTwo:CGFloat = 2.0
    let kSixth:CGFloat = 1.0/6.0
    let kQuarter:CGFloat = 1.0/4.0
    let kThird:CGFloat = 1.0/3.0
    let kHalf:CGFloat = 1.0/2.0
    let kEighth:CGFloat = 1.0/8.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupConatainerViews()
        setupFirstContainer(self.firstContainer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//IBActions
    
// STEP 1
    func lemonStep1PlusButtonPressed (button: UIButton) {
        if money >= 2{
            lemonsStep1 += 1
            money -= 2
            lemons += 1
        }
        else{
            showAlertWithText(message: "You don't have enough money!")
        }
        updateMainView()

    }
    
    func iceStep1PlusButtonPressed (button: UIButton) {
        if money >= 1{
            iceStep1 += 1
            money -= 1
            ice += 1
        }
        else{
            showAlertWithText(message: "You don't have enough money!")
        }
        updateMainView()
    }

    func lemonStep1MinusButtonPressed (button: UIButton) {
        if lemons > 1{
            lemonsStep1 -= 1
            money += 2
            lemons -= 1
        }
        else{
            showAlertWithText(message: "You don't have enough lemons!")
        }
        updateMainView()
    }
    
    func iceStep1MinusButtonPressed (button: UIButton) {
        if ice > 1{
            iceStep1 -= 1
            money += 1
            ice -= 1
        }
        else{
            showAlertWithText(message: "You don't have enough ice!")
        }
        updateMainView()
    }
    

// STEP 2
    func lemonStep2PlusButtonPressed (button: UIButton) {
        if lemons >= 1{
            lemonsStep2 += 1
            lemons -= 1
        }
        else{
            showAlertWithText(message: "You don't have enough lemons!")
        }
        updateMainView()
    }
    
    func iceStep2PlusButtonPressed (button: UIButton) {
        if ice >= 1{
            iceStep2 += 1
            ice -= 1
        }
        else{
            showAlertWithText(message: "You don't have enough ice cubes!")
        }
        updateMainView()
    }
    
    func lemonStep2MinusButtonPressed (button: UIButton) {
        if lemonsStep2 >= 1{
            lemonsStep2 -= 1
            lemons += 1
        }
        else{
            showAlertWithText(message: "You can't have less lemons!")
        }
        updateMainView()
    }
    
    func iceStep2MinusButtonPressed (button: UIButton) {
        if iceStep2 >= 1{
            iceStep2 -= 1
            ice += 1
        }
        else{
            showAlertWithText(message: "You can't have less ice cubes!")
        }
        updateMainView()
    }
    

//STEP 3
    func startButtonPressed (button: UIButton) {
        mixRatio = Double(lemonsStep2) / Double(iceStep2)
        createVisits(mixRatio)
        
        for var x=0; x < visits.count; ++x {
            if visits[x].paid == 1{
                println("Paid!")
            }
            else{
                println("No match, No Revenue")
            }
            sum = sum + visits[x].paid
        }
        
        money = money + sum
        
        //UPDATE
        sum = 0
        lemonsStep1 = 0
        iceStep1 = 0
        lemonsStep2 = 0
        iceStep2 = 0
        mixRatio = 1.0
        updateMainView()
    }


    func setupConatainerViews(){
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height ))
        self.firstContainer.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.firstContainer)
    }
   
    
    func setupFirstContainer(containerView: UIView){

    // TOP
        
        self.titleLabel = UILabel()
        self.titleLabel.text = "You Have:"
        self.titleLabel.textColor = UIColor.redColor()
        self.titleLabel.font = UIFont(name: "Arial", size:17)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kEighth)
        self.titleLabel.textAlignment = .Left
        containerView.addSubview(self.titleLabel)

        self.moneyLabel = UILabel()
        self.moneyLabel.text = "$\(money)"
        self.moneyLabel.textColor = UIColor.greenColor()
        self.moneyLabel.font = UIFont(name: "Arial", size:17)
        self.moneyLabel.sizeToFit()
        self.moneyLabel.center = CGPoint(x: containerView.frame.width * kHalf, y: containerView.frame.height * kEighth)
        containerView.addSubview(self.moneyLabel)

        self.lemonsLabel = UILabel()
        self.lemonsLabel.text = "\(lemons) Lemons"
        self.lemonsLabel.textColor = UIColor.blackColor()
        self.lemonsLabel.font = UIFont(name: "Arial", size:17)
        self.lemonsLabel.sizeToFit()
        self.lemonsLabel.center = CGPoint(x: containerView.frame.width * kHalf, y: containerView.frame.height * kEighth + 30)
        self.lemonsLabel.textAlignment = .Left
        containerView.addSubview(self.lemonsLabel)
        
        self.iceLabel = UILabel()
        self.iceLabel.text = "\(ice) Ice Cubes"
        self.iceLabel.textColor = UIColor.blackColor()
        self.iceLabel.font = UIFont(name: "Arial", size:17)
        self.iceLabel.sizeToFit()
        self.iceLabel.center = CGPoint(x: containerView.frame.width * kHalf, y: containerView.frame.height * kEighth + 60)
        containerView.addSubview(self.iceLabel)
        
    // STEP 1
        
        self.stepOneLabel = UILabel()
        self.stepOneLabel.text = "Step 1: Purchase Supplies"
        self.stepOneLabel.textColor = UIColor.blueColor()
        self.stepOneLabel.font = UIFont(name: "Arial", size:17)
        self.stepOneLabel.sizeToFit()
        self.stepOneLabel.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kQuarter)
        self.stepOneLabel.textAlignment = .Left
        containerView.addSubview(self.stepOneLabel)
  
        self.lemonPriceLabel = UILabel()
        self.lemonPriceLabel.text = "Lemons for $2:"
        self.lemonPriceLabel.textColor = UIColor.blackColor()
        self.lemonPriceLabel.font = UIFont(name: "Arial", size:17)
        self.lemonPriceLabel.sizeToFit()
        self.lemonPriceLabel.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kQuarter + 30)
        self.lemonPriceLabel.textAlignment = .Right
        containerView.addSubview(self.lemonPriceLabel)
        
        self.icePriceLabel = UILabel()
        self.icePriceLabel.text = "Ice Cubesfor $1:"
        self.icePriceLabel.textColor = UIColor.blackColor()
        self.icePriceLabel.font = UIFont(name: "Arial", size:17)
        self.icePriceLabel.sizeToFit()
        self.icePriceLabel.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kQuarter + 60)
        self.icePriceLabel.textAlignment = .Right
        containerView.addSubview(self.icePriceLabel)
        
        self.lemonsStep1Label = UILabel()
        self.lemonsStep1Label.text = "\(lemonsStep1)"
        self.lemonsStep1Label.textColor = UIColor.blackColor()
        self.lemonsStep1Label.font = UIFont(name: "Arial", size:17)
        self.lemonsStep1Label.sizeToFit()
        self.lemonsStep1Label.center = CGPoint(x: containerView.frame.width * kHalf + 40, y: containerView.frame.height * kQuarter + 30)
        self.lemonsStep1Label.textAlignment = .Center
        containerView.addSubview(self.lemonsStep1Label)
        
        self.iceStep1Label = UILabel()
        self.iceStep1Label.text = "\(iceStep1)"
        self.iceStep1Label.textColor = UIColor.blackColor()
        self.iceStep1Label.font = UIFont(name: "Arial", size:17)
        self.iceStep1Label.sizeToFit()
        self.iceStep1Label.center = CGPoint(x: containerView.frame.width * kHalf + 40, y: containerView.frame.height * kQuarter + 60)
        self.iceStep1Label.textAlignment = .Center
        containerView.addSubview(self.iceStep1Label)
        
        self.lemonStep1PlusButton = UIButton()
        self.lemonStep1PlusButton.setTitle("+", forState: UIControlState.Normal)
        self.lemonStep1PlusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.lemonStep1PlusButton.titleLabel?.font = UIFont(name: "Arial", size:17)
        self.lemonStep1PlusButton.sizeToFit()
        self.lemonStep1PlusButton.center = CGPoint(x: containerView.frame.width * kHalf + 20, y: containerView.frame.height * kQuarter + 30)
        self.lemonStep1PlusButton.addTarget(self, action: "lemonStep1PlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.lemonStep1PlusButton)
        
        self.lemonStep1MinusButton = UIButton()
        self.lemonStep1MinusButton.setTitle("-", forState: UIControlState.Normal)
        self.lemonStep1MinusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.lemonStep1MinusButton.titleLabel?.font = UIFont(name: "Arial", size:17)
        self.lemonStep1MinusButton.sizeToFit()
        self.lemonStep1MinusButton.center = CGPoint(x: containerView.frame.width * kHalf + 60, y: containerView.frame.height * kQuarter + 30)
        self.lemonStep1MinusButton.addTarget(self, action: "lemonStep1MinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.lemonStep1MinusButton)
        
        self.iceStep1PlusButton = UIButton()
        self.iceStep1PlusButton.setTitle("+", forState: UIControlState.Normal)
        self.iceStep1PlusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.iceStep1PlusButton.titleLabel?.font = UIFont(name: "Arial", size:17)
        self.iceStep1PlusButton.sizeToFit()
        self.iceStep1PlusButton.center = CGPoint(x: containerView.frame.width * kHalf + 20, y: containerView.frame.height * kQuarter + 60)
        self.iceStep1PlusButton.addTarget(self, action: "iceStep1PlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.iceStep1PlusButton)
        
        self.iceStep1MinusButton = UIButton()
        self.iceStep1MinusButton.setTitle("-", forState: UIControlState.Normal)
        self.iceStep1MinusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.iceStep1MinusButton.titleLabel?.font = UIFont(name: "Arial", size:17)
        self.iceStep1MinusButton.sizeToFit()
        self.iceStep1MinusButton.center = CGPoint(x: containerView.frame.width * kHalf + 60, y: containerView.frame.height * kQuarter + 60)
        self.iceStep1MinusButton.addTarget(self, action: "iceStep1MinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.iceStep1MinusButton)
        
        
    // STEP 2
        
        self.stepTwoLabel = UILabel()
        self.stepTwoLabel.text = "Step 2: Mix your lemonade"
        self.stepTwoLabel.textColor = UIColor.blueColor()
        self.stepTwoLabel.font = UIFont(name: "Arial", size:17)
        self.stepTwoLabel.sizeToFit()
        self.stepTwoLabel.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kHalf)
        self.stepTwoLabel.textAlignment = .Left
        containerView.addSubview(self.stepTwoLabel)

        self.lemonMixLabel = UILabel()
        self.lemonMixLabel.text = "Lemons for $2:"
        self.lemonMixLabel.textColor = UIColor.blackColor()
        self.lemonMixLabel.font = UIFont(name: "Arial", size:17)
        self.lemonMixLabel.sizeToFit()
        self.lemonMixLabel.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kHalf + 30)
        self.lemonMixLabel.textAlignment = .Right
        containerView.addSubview(self.lemonMixLabel)
        
        self.iceMixLabel = UILabel()
        self.iceMixLabel.text = "Ice Cubesfor $1:"
        self.iceMixLabel.textColor = UIColor.blackColor()
        self.iceMixLabel.font = UIFont(name: "Arial", size:17)
        self.iceMixLabel.sizeToFit()
        self.iceMixLabel.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kHalf + 60)
        self.iceMixLabel.textAlignment = .Right
        containerView.addSubview(self.iceMixLabel)
        
        self.lemonsStep2Label = UILabel()
        self.lemonsStep2Label.text = "\(lemonsStep2)"
        self.lemonsStep2Label.textColor = UIColor.blackColor()
        self.lemonsStep2Label.font = UIFont(name: "Arial", size:17)
        self.lemonsStep2Label.sizeToFit()
        self.lemonsStep2Label.center = CGPoint(x: containerView.frame.width * kHalf + 40, y: containerView.frame.height * kHalf + 30)
        self.lemonsStep2Label.textAlignment = .Center
        containerView.addSubview(self.lemonsStep2Label)
        
        self.iceStep2Label = UILabel()
        self.iceStep2Label.text = "\(iceStep2)"
        self.iceStep2Label.textColor = UIColor.blackColor()
        self.iceStep2Label.font = UIFont(name: "Arial", size:17)
        self.iceStep2Label.sizeToFit()
        self.iceStep2Label.center = CGPoint(x: containerView.frame.width * kHalf + 40, y: containerView.frame.height * kHalf + 60)
        self.iceStep2Label.textAlignment = .Center
        containerView.addSubview(self.iceStep2Label)
        
        self.lemonStep2PlusButton = UIButton()
        self.lemonStep2PlusButton.setTitle("+", forState: UIControlState.Normal)
        self.lemonStep2PlusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.lemonStep2PlusButton.titleLabel?.font = UIFont(name: "Arial", size:17)
        self.lemonStep2PlusButton.sizeToFit()
        self.lemonStep2PlusButton.center = CGPoint(x: containerView.frame.width * kHalf + 20, y: containerView.frame.height * kHalf + 30)
        self.lemonStep2PlusButton.addTarget(self, action: "lemonStep2PlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.lemonStep2PlusButton)
        
        self.lemonStep2MinusButton = UIButton()
        self.lemonStep2MinusButton.setTitle("-", forState: UIControlState.Normal)
        self.lemonStep2MinusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.lemonStep2MinusButton.titleLabel?.font = UIFont(name: "Arial", size:17)
        self.lemonStep2MinusButton.sizeToFit()
        self.lemonStep2MinusButton.center = CGPoint(x: containerView.frame.width * kHalf + 60, y: containerView.frame.height * kHalf + 30)
        self.lemonStep2MinusButton.addTarget(self, action: "lemonStep2MinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.lemonStep2MinusButton)
        
        self.iceStep2PlusButton = UIButton()
        self.iceStep2PlusButton.setTitle("+", forState: UIControlState.Normal)
        self.iceStep2PlusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.iceStep2PlusButton.titleLabel?.font = UIFont(name: "Arial", size:17)
        self.iceStep2PlusButton.sizeToFit()
        self.iceStep2PlusButton.center = CGPoint(x: containerView.frame.width * kHalf + 20, y: containerView.frame.height * kHalf + 60)
        self.iceStep2PlusButton.addTarget(self, action: "iceStep2PlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.iceStep2PlusButton)
        
        self.iceStep2MinusButton = UIButton()
        self.iceStep2MinusButton.setTitle("-", forState: UIControlState.Normal)
        self.iceStep2MinusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.iceStep2MinusButton.titleLabel?.font = UIFont(name: "Arial", size:17)
        self.iceStep2MinusButton.sizeToFit()
        self.iceStep2MinusButton.center = CGPoint(x: containerView.frame.width * kHalf + 60, y: containerView.frame.height * kHalf + 60)
        self.iceStep2MinusButton.addTarget(self, action: "iceStep2MinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.iceStep2MinusButton)
        
        
    // STEP 3
        
        self.stepThreeLabel = UILabel()
        self.stepThreeLabel.text = "Step 3: Start selling your brew"
        self.stepThreeLabel.textColor = UIColor.blueColor()
        self.stepThreeLabel.font = UIFont(name: "Arial", size:17)
        self.stepThreeLabel.sizeToFit()
        self.stepThreeLabel.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * (kHalf + kQuarter))
        self.stepThreeLabel.textAlignment = .Left
        containerView.addSubview(self.stepThreeLabel)
        
        self.startButton = UIButton()
        self.startButton.setTitle("Start Day", forState: UIControlState.Normal)
        self.startButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.startButton.titleLabel?.font = UIFont(name: "Arial", size:15)
        self.startButton.backgroundColor = UIColor.yellowColor()
        self.startButton.sizeToFit()
        self.startButton.center = CGPoint(x: containerView.frame.width * kHalf, y: containerView.frame.height * (kHalf + kThird + kEighth))
        self.startButton.addTarget(self, action: "startButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.startButton)
    }
    
    func showAlertWithText(header: String = "Warning", message: String){
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    func updateMainView(){
        self.moneyLabel.text = "$\(money)"
        self.lemonsLabel.text = "\(lemons) Lemons"
        self.iceLabel.text = "\(ice) Ice Cubes"
        
        self.lemonsStep1Label.text = "\(lemonsStep1)"
        self.iceStep1Label.text = "\(iceStep1)"
        
        self.lemonsStep2Label.text = "\(lemonsStep2)"
        self.iceStep2Label.text = "\(iceStep2)"
    }

}

