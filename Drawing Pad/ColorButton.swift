//
//  ColorButton.swift
//  Drawing Pad
//
//  Created by ShiShu on 9/28/16.
//  Copyright © 2016 hungrygeek. All rights reserved.
//

import Foundation
import UIKit

class ColorButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtonStyle()
    }
    
    func setupButtonStyle() {
        // self.layer.backgroundColor = UIColor.clearColor().CGColor
        self.layer.cornerRadius = 25
        self.alpha = 0.5
    }
}