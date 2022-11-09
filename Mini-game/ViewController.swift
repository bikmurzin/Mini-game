//
//  ViewController.swift
//  Mini-game
//
//  Created by User on 11.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circle1: UIView!
    @IBOutlet weak var circle2: UIView!
    @IBOutlet weak var circle3: UIView!
    @IBOutlet weak var circle4: UIView!
    @IBOutlet weak var circle5: UIView!
    @IBOutlet weak var circle6: UIView!
    @IBOutlet weak var circle7: UIView!
    
    enum sizeLevel: Double {
        case level1 = 50
        case level2 = 70
        case level3 = 90
        case level4 = 110
        case level5 = 130
        case level6 = 150
        case level7 = 170
        case addingValue = 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func assignmentValues (circle: UIView, sizeValue: Double) {
        circle.superview?.frame.size.width += sizeValue
        circle.superview?.frame.size.height += sizeValue
//        circle.frame.size.width += sizeValue
//        circle.frame.size.height += sizeValue
        circle.layer.cornerRadius = circle.frame.size.width / 2
        
    }
    
    func changeColorAndSizeOfCircle(circle: UIView){
        let circleWidth = Double(circle.frame.size.width)
        if circleWidth == sizeLevel.level1.rawValue {
            circle.backgroundColor = .level2color
            assignmentValues(circle: circle, sizeValue: sizeLevel.addingValue.rawValue)
        } else if circleWidth == sizeLevel.level2.rawValue {
            circle.backgroundColor = .level3color
            assignmentValues(circle: circle, sizeValue: sizeLevel.addingValue.rawValue)
            
        } else if circleWidth == sizeLevel.level3.rawValue {
            circle.backgroundColor = .level4color
            assignmentValues(circle: circle, sizeValue: sizeLevel.addingValue.rawValue)
        } else if circleWidth == sizeLevel.level4.rawValue {
            circle.backgroundColor = .level5color
            assignmentValues(circle: circle, sizeValue: sizeLevel.addingValue.rawValue)
        } else if circleWidth == sizeLevel.level5.rawValue {
            circle.backgroundColor = .level6color
            assignmentValues(circle: circle, sizeValue: sizeLevel.addingValue.rawValue)
        } else if circleWidth == sizeLevel.level6.rawValue {
            circle.backgroundColor = .level7color
            assignmentValues(circle: circle, sizeValue: sizeLevel.addingValue.rawValue)
        }
    }
    
    func gestTrans (gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else {
            return
        }
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
            )
        gesture.setTranslation(.zero, in: view)
    }
    
    func isThereAnIntersection(circleA: CGRect, circleB: CGRect) -> Bool {
//        let circleA_y = circleA.origin.y
        
        let circleA_minY = circleA.origin.y
        let circleA_maxY = circleA.origin.y + circleA.size.height

        let circleB_minY = circleB.origin.y
        let circleB_maxY = circleB.origin.y + circleB.size.height
        
//        let circleA_x = circleA.origin.x
        let circleA_minX = circleA.origin.x
        let circleA_maxX = circleA.origin.x + circleA.size.width

        let circleB_minX = circleB.origin.x
        let circleB_maxX = circleB.origin.x + circleB.size.width
        
        if ((circleA_minX >= circleB_minX && circleA_minX < circleB_maxX) || (circleA_minX > circleB_minX && circleA_minX <= circleB_maxX) || (circleB_minX >= circleA_minX && circleB_minX < circleA_maxX) || (circleB_maxX > circleA_minX && circleB_maxX <= circleA_maxX)) &&  ((circleA_minY >= circleB_minY && circleA_minY < circleB_maxY) || (circleA_minY > circleB_minY && circleA_minY <= circleB_maxY) || (circleB_minY >= circleA_minY && circleB_minY < circleA_maxY) || (circleB_maxY > circleA_minY && circleB_maxY <= circleA_maxY)){
            return true
        } else {
            return false
        }
    }
    
    func compareCircles(circle1: UIView, circle2: UIView) {
        if circle1.frame.size.width > circle2.frame.size.width {
            circle2.isHidden = true
            changeColorAndSizeOfCircle(circle: circle1.subviews.first!)
        } else {
            circle1.isHidden = true
            changeColorAndSizeOfCircle(circle: circle2.subviews.first!)
        }
    }
    
    func checkIntersection(number: Int, currentCircle: UIView){
        if (number != 1 && !circle1.isHidden) {
            if isThereAnIntersection(circleA: currentCircle.frame, circleB: circle1.frame) {
                compareCircles(circle1: currentCircle, circle2: circle1)
                return
            }
        }
        if (number != 2 && !circle2.isHidden) {
            if isThereAnIntersection(circleA: currentCircle.frame, circleB: circle2.frame) {
                compareCircles(circle1: currentCircle, circle2: circle2)
                return
            }
        }
        if (number != 3 && !circle3.isHidden) {
            
            if isThereAnIntersection(circleA: currentCircle.frame, circleB: circle3.frame) {
                compareCircles(circle1: currentCircle, circle2: circle3)
                return
            }
        }
        if (number != 4 && !circle4.isHidden) {
            if isThereAnIntersection(circleA: currentCircle.frame, circleB: circle4.frame) {
                compareCircles(circle1: currentCircle, circle2: circle4)
                return
            }
        }
        if (number != 5 && !circle5.isHidden) {
            if isThereAnIntersection(circleA: currentCircle.frame, circleB: circle5.frame) {
                compareCircles(circle1: currentCircle, circle2: circle5)
                return
            }
        }
        if (number != 6 && !circle6.isHidden) {
            if isThereAnIntersection(circleA: currentCircle.frame, circleB: circle6.frame) {
                compareCircles(circle1: currentCircle, circle2: circle6)
                return
            }
        }
        if (number != 7 && !circle7.isHidden) {
            if isThereAnIntersection(circleA: currentCircle.frame, circleB: circle7.frame) {
                compareCircles(circle1: currentCircle, circle2: circle7)
                return
            }
        }
    }
    
    @IBAction func panCircle1(_ gesture: UIPanGestureRecognizer) {
//        let circle1Frame = circle1.frame
        gestTrans(gesture: gesture)
        guard gesture.state == .ended else {
            return
        }
        checkIntersection(number: 1, currentCircle: circle1)
    }
    
    @IBAction func panCircle2(_ gesture: UIPanGestureRecognizer) {
        gestTrans(gesture: gesture)
        guard gesture.state == .ended else {
            return
        }
        checkIntersection(number: 2, currentCircle: circle2)
    }
    
    @IBAction func panCircle3(_ gesture: UIPanGestureRecognizer) {
        gestTrans(gesture: gesture)
        guard gesture.state == .ended else {
            return
        }
        checkIntersection(number: 3, currentCircle: circle3)
    }
    
    @IBAction func panCircle4(_ gesture: UIPanGestureRecognizer) {
        gestTrans(gesture: gesture)
        guard gesture.state == .ended else {
            return
        }
        checkIntersection(number: 4, currentCircle: circle4)
    }
    
    @IBAction func panCircle5(_ gesture: UIPanGestureRecognizer) {
        gestTrans(gesture: gesture)
        guard gesture.state == .ended else {
            return
        }
        checkIntersection(number: 5, currentCircle: circle5)
    }
    
    @IBAction func panCircle6(_ gesture: UIPanGestureRecognizer) {
        gestTrans(gesture: gesture)
        guard gesture.state == .ended else {
            return
        }
        checkIntersection(number: 6, currentCircle: circle6)
    }
    
    @IBAction func panCircle7(_ gesture: UIPanGestureRecognizer) {
        gestTrans(gesture: gesture)
        guard gesture.state == .ended else {
            return
        }
        checkIntersection(number: 7, currentCircle: circle7)
    }
}

extension UIColor
{
    static let level1color = UIColor(red: 0.0, green: 0.4, blue: 1.0, alpha: 0.7)
    static let level2color = UIColor(red: 0.0, green: 0.2, blue: 1.0, alpha: 0.7)
    static let level3color = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.7)
    static let level4color = UIColor(red: 0.0, green: 0.2, blue: 1.0, alpha: 0.85)
    static let level5color = UIColor(red: 0.0, green: 0.0, blue: 0.9, alpha: 1.0)
    static let level6color = UIColor(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
    static let level7color = UIColor(red: 0.0, green: 0.0, blue: 0.6, alpha: 1.0)
}
