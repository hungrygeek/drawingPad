//
//  Functions.swift
//  Drawing Pad
//
//  Created by ShiShu on 9/28/16.
//  Copyright © 2016 hungrygeek. All rights reserved.
//

import Foundation
import UIKit

class Functions {
    static func distance(a: CGPoint, b: CGPoint) -> CGFloat {
        return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y,2))
    }
}
