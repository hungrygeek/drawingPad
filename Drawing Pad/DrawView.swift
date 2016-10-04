//
//  DrawView.swift
//  Drawing Pad
//
//  Created by ShiShu on 9/28/16.
//  Copyright © 2016 hungrygeek. All rights reserved.
//

import Foundation
import UIKit

class DrawView: UIView {
    
    var drawingMemory:[Line] = []
    var singleLine:[CGPoint] = []
    var lastPoint: CGPoint!
    var penColor: CGColor = UIColor.blackColor().CGColor
    var penWidth: Float = 5
    var opacityLevel: Float = 1
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        // self.backgroundColor = UIColor.blackColor()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        singleLine = []
        lastPoint = touches.first?.locationInView(self)
        let dotPoint:CGPoint = CGPoint(x: Double(lastPoint.x) + 0.00001, y: Double(lastPoint.y)+0.00001)
        singleLine.append(lastPoint)
        singleLine.append(dotPoint)
        drawingMemory.append(Line(points: singleLine, lineColor: penColor, brushWidth:penWidth , alphaValue: opacityLevel))
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        drawingMemory.removeLast()
        let nextPoint = touches.first?.locationInView(self)
        singleLine.append(nextPoint!)
        drawingMemory.append(Line(points: singleLine, lineColor: penColor, brushWidth:penWidth , alphaValue: opacityLevel))
        lastPoint = nextPoint!
        self.setNeedsDisplay()
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let nextPoint = touches.first?.locationInView(self)
        singleLine.append(nextPoint!)
        drawingMemory.append(Line(points: singleLine, lineColor: penColor, brushWidth:penWidth , alphaValue: opacityLevel))
        self.setNeedsDisplay()
        
    }
    
    
    private func findMidpoint(firstPoint: CGPoint, secondPoint: CGPoint) -> CGPoint {
        // implement this function here
        let midPoint = CGPoint(x: (firstPoint.x + secondPoint.x)/2 , y: (firstPoint.y + secondPoint.y)/2)
        return midPoint
    }
    
    func createQuadPath(arrayOfPoints: [CGPoint]) -> UIBezierPath {
        let newPath = UIBezierPath()
        let firstLocation = arrayOfPoints[0]
        newPath.moveToPoint(firstLocation)
        let secondLocation = arrayOfPoints[1]
        let firstMidpoint = findMidpoint(firstLocation, secondPoint: secondLocation)
        newPath.addLineToPoint(firstMidpoint)
        for index in 1 ..< arrayOfPoints.count-1 {
            let currentLocation = arrayOfPoints[index]
            let nextLocation = arrayOfPoints[index + 1]
            let midpoint = findMidpoint(currentLocation, secondPoint: nextLocation)
            newPath.addQuadCurveToPoint(midpoint, controlPoint: currentLocation)
        }
        let lastLocation = arrayOfPoints.last
        newPath.addLineToPoint(lastLocation!)
        return newPath
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineCap(context, CGLineCap.Round)
        for action in drawingMemory {
            let bpath: UIBezierPath = createQuadPath(action.points)
            CGContextBeginPath(context)
            CGContextAddPath(context, bpath.CGPath)
            CGContextSetStrokeColorWithColor(context, action.lineColor)
            CGContextSetLineWidth(context, CGFloat(action.brushWidth))
            CGContextSetAlpha(context, CGFloat(action.alphaValue))
            CGContextStrokePath(context)
            
        }
    }
    
    
}
