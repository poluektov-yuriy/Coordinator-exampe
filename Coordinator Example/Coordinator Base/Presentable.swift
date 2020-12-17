//
//  Presentable.swift
//  Coordinator Example
//
//  Created by yuriy.p on 16.12.2020.
//

import UIKit

protocol Presentable {
    
    func toPresent() -> UIViewController?
}


extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}




