//
//  FloatingButtons.swift
//  ReduxFirstTestProj
//
//  Created by Matheus on 13.01.19.
//  Copyright © 2019 matheusOrth. All rights reserved.
//

import UIKit

class FloatingButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
    }
    
}
