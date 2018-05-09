//
//  GradientView.swift
//  foundApp
//
//  Created by Abubakari Kitwala on 5/9/18.
//  Copyright © 2018 Abubakari Kitwala. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer;()
        layer.colors = [ firstColor.cgColor, secondColor.cgColor ]
    }
    
}

