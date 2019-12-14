//
//  GradientView.swift
//  FactAttack
//
//  Created by Ramesh Shrestha on 4/24/19.
//  Copyright © 2019 Ramesh Shrestha. All rights reserved.
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
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
    }
}

