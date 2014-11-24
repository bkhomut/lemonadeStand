//
//  Lemonade.swift
//  LemonadeStand
//
//  Created by Boris Khomut on 10/16/14.
//  Copyright (c) 2014 Boris. All rights reserved.
//

import Foundation
import UIKit

var visits: [Visit] = []
var numberVisits = 0
var cold = true
//var weather = UIImageView!

struct Visit{
    var ratio = 1.0
    var paid = 0
}

func createVisits(mix: Double){
    if Int(arc4random_uniform(UInt32(9))) >= 5 {
        cold = false
        numberVisits = Int(arc4random_uniform(UInt32(10))) + 4
//        
//        self.weather = UIImage(named: "Cold")
//        self.weather.image =
//        self.weather.center = CGPoint(x: containerView.frame.width * 0.5, y: containerView.frame.height * 0.5)
//        self.weather.sizeToFit()
//        containerView.addSubview(self.weather)
    }
    else{
        cold = true
        numberVisits = Int(arc4random_uniform(UInt32(10))) - 3
        
//        self.weather = UIImage(named: "Warm")
//        self.weather.image =
//        self.weather.center = CGPoint(x: containerView.frame.width * 0.5, y: containerView.frame.height * 0.5)
//        self.weather.sizeToFit()
//        containerView.addSubview(self.weather)
    }
    
    for var x=0; x < numberVisits; ++x {
        var randomNumber = Double(arc4random_uniform(UInt32(10)))/10.0
        
        var visitor = Visit()
        visitor.ratio = randomNumber
    
        if mix > 1.0 {
            if randomNumber < 0.4{
                visitor.paid = 1
            }
            else{
                visitor.paid = 0
            }
        }
        else if mix == 1.0 {
            if randomNumber >= 0.4 && randomNumber <= 0.6{
                visitor.paid = 1
            }
            else{
                visitor.paid = 0
            }
        }
        else{
            if randomNumber > 0.6{
                visitor.paid = 1
            }
            else{
                visitor.paid = 0
            }
        }
        
        visits.append(visitor)
    }
}