//
//  CardView.swift
//  CardView
//
//  Created by Sagar Dhake on 17/04/19.
//  Copyright © 2019 Sagar Dhake. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class CardView: UIView {
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor:UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable var shadowOpacity:Float = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOfset:CGSize = CGSize.zero {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var backgroundImage:UIImage? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOffsetWidth: Int = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOffsetHeight: Int = 3 {
        didSet {
            setNeedsLayout()
        }
    }
    
    private var gradientLayer: CAGradientLayer!
    
    @IBInspectable var topColor: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var centerColor: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor1: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowY: CGFloat = -3 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowBlur: CGFloat = 3 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointX: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }

    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override public func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        
        if backgroundImage != nil
        {
            self.setBackgroundImage(image: backgroundImage!)
        }
        
        //For gradient Color
        self.gradientLayer = self.layer as? CAGradientLayer
        self.gradientLayer.colors = [topColor.cgColor, centerColor.cgColor, bottomColor.cgColor]
        self.gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        self.gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
    }
    
    private func setBackgroundImage(image:UIImage)
    {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        imageView.image = image
        self.addSubview(imageView)
        self.sendSubviewToBack(imageView)
    }
  
    func animate(duration: TimeInterval, newTopColor: UIColor, newBottomColor: UIColor) {
        let fromColors = self.gradientLayer?.colors
        let toColors: [AnyObject] = [ newTopColor.cgColor, newBottomColor.cgColor]
        self.gradientLayer?.colors = toColors
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = duration
        animation.isRemovedOnCompletion = true
        animation.fillMode = .forwards
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.gradientLayer?.add(animation, forKey:"animateGradient")
    }
}


