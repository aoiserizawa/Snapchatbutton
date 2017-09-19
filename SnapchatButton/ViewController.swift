//
//  ViewController.swift
//  SnapchatButton
//
//  Created by Alvin Joseph Valdez on 19/09/2017.
//  Copyright © 2017 Alvin Joseph Valdez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIView!
    
    var circleView: CircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let longpressed = UILongPressGestureRecognizer(target: self, action: #selector(longpressedAction))
        self.button.addGestureRecognizer(longpressed)
        self.buttonAppearance()
    }

    func longpressedAction(sender: UILongPressGestureRecognizer){
        if sender.state == .began {
            self.addCircleView()
        }else if sender.state == .ended{
            circleView.endCircleAnimation()
            circleView.removeFromSuperview()
        }
    }

    func buttonAppearance(){
        self.button.layer.cornerRadius = self.button.frame.size.width / 2
        self.button.clipsToBounds = true
    }
    
    func addCircleView() {
        print("Addd")
        circleView = CircleView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.button.addSubview(circleView)
        // Animate the drawing of the circle over the course of 1 second
        circleView.animateCircle(duration: 45.0)
    }
}

