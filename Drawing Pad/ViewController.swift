//
//  ViewController.swift
//  Drawing Pad
//
//  Created by ShiShu on 9/28/16.
//  Copyright © 2016 hungrygeek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currCircleCenter = CGPointZero
    var currCircle: CircleView? = nil
    
    @IBOutlet weak var drawingView: DrawView!
    
    @IBAction func clearScreen(sender: AnyObject) {
        drawingView.drawingMemory = []
        drawingView.setNeedsDisplay()
        
    }
    @IBAction func undoAction(sender: AnyObject) {
        if (drawingView.drawingMemory.count > 0) {
            drawingView.drawingMemory.removeLast()
            drawingView.setNeedsDisplay()
        }

        
    }
    
    @IBAction func changeWidth(sender: AnyObject) {
        drawingView.penWidth = sender.value
    }

    
    @IBAction func randomBackground(sender:AnyObject){
        let newBGColor:UIColor = getRandomColor()
        drawingView.backgroundColor = newBGColor
        drawingView.setNeedsDisplay()
        
    }
    
    @IBAction func opacitySlider (sender:AnyObject) {
        drawingView.opacityLevel = sender.value
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseBlack (sender: AnyObject) {
        drawingView.penColor = UIColor.blackColor().CGColor
    }
    
    @IBAction func chooseRed (sender: AnyObject) {
        drawingView.penColor = UIColor.redColor().CGColor
    }
    
    @IBAction func chooseYellow (sender: AnyObject) {
        drawingView.penColor = UIColor.yellowColor().CGColor
    }
    
    @IBAction func chooseOrange (sender: AnyObject) {
        drawingView.penColor = UIColor.orangeColor().CGColor
    }
    
    @IBAction func chooseBlue (sender: AnyObject) {
        drawingView.penColor = UIColor.blueColor().CGColor
    }
    
    @IBAction func chooseGreen (sender: AnyObject) {
        drawingView.penColor = UIColor.greenColor().CGColor
    }
    
    @IBAction func choosePurple (sender: AnyObject) {
        drawingView.penColor = UIColor.purpleColor().CGColor
    }
    
    
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    
}

