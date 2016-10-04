//
//  Circle.swift
//  Drawing Pad
//
//  Created by ShiShu on 9/28/16.
//  Copyright © 2016 hungrygeek. All rights reserved.
//

import Foundation
import UIKit

struct Circle {
    
    var center: CGPoint
    var radius: CGFloat
    
    init(center: CGPoint, radius: CGFloat) {
        self.center = center
        self.radius = radius
    }
}
