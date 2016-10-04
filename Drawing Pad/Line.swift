//
//  Line.swift
//  Drawing Pad
//
//  Created by ShiShu on 9/28/16.
//  Copyright © 2016 hungrygeek. All rights reserved.
//

import Foundation
import UIKit

class Line {
    var points: [CGPoint]
    var lineColor: CGColor
    var brushWidth: Float
    var alphaValue: Float
    
    init(points p:[CGPoint],lineColor c:CGColor, brushWidth b:Float, alphaValue a:Float){
        points = p
        lineColor = c
        brushWidth = b
        alphaValue = a
    }
    
    
    
    
}
