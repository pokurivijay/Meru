//
//  UIButtonExtension.swift
//  Meru Demo
//
//  Created by Steve on 01/08/18.
//  Copyright © 2018 VJ. All rights reserved.
//

import Foundation

extension UIButton {
    
    func button(withBorder border:CGFloat, andRadious radious: CGFloat){
        
            backgroundColor = .clear
            layer.cornerRadius = radious
            layer.borderWidth = border
//            layer.cornerRadius = 5
//            layer.borderWidth = 1.5

            layer.borderColor = UIColor.init(red: 0, green: 188/255, blue: 212/255, alpha: 1.0).cgColor
        }
    
    
    
}
