//
//  Colors.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/17.
//  Copyright © 2020 test. All rights reserved.
//

extension UIColor {
    class var defaultLabelColor: UIColor { return UIColor(named: "DefaultLabelColor")! }
    
    class var background: UIColor {
        if #available(iOS 13.0, *) {
            return .systemBackground
        }
        return .white
    }
}
