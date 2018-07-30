//
//  CustomButton.swift
//  Meru Demo
//
//  Created by Steve on 30/07/18.
//  Copyright © 2018 VJ. All rights reserved.
//

import Foundation
class CustomButton: UIButton {
    
    
    override func layoutSubviews() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.init(red: 0, green: 188/255, blue: 212/255, alpha: 1.0).cgColor
    }
}
