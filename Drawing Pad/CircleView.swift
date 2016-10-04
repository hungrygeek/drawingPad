//
//  CircleView.swift
//  Drawing Pad
//
//  Created by ShiShu on 9/28/16.
//  Copyright © 2016 hungrygeek. All rights reserved.
//

import Foundation
import UIKit

class CircleView: UIView {
    
    //    var arcCenter = CGPointZero
    //    var arcRadius = CGFloat()
    
    var theCircle:Circle? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    //
    //    func updateCircle(center: CGPoint, radius: CGFloat) {
    //        arcCenter = center
    //        arcRadius = radius
    //        setNeedsDisplay()
    //    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        UIColor.greenColor().setFill()
        
        //let circleRadius:CGFloat = self.bounds.height/2
        
        let path = UIBezierPath()
        print("in drawRect with \(theCircle)")
        
        //  let centerPoint = CGPoint(x: circleRadius, y: circleRadius)
        path.addArcWithCenter((theCircle?.center)!, radius: (theCircle?.radius)!, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        UIColor.blackColor().setStroke()
        path.stroke()
        path.fill()
        
    }
    
    
}
