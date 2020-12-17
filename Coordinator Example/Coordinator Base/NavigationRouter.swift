//
//  NavigationRouter.swift
//  Coordinator Example
//
//  Created by yuriy.p on 17.12.2020.
//

import Foundation

protocol NavigationRouter: Router {
    
    func present(_ module: Presentable?,
                 animated: Bool, overContext: Bool, presentCompletion:(() -> Void)?)
    
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    
    func popModule(animated: Bool)
    
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
}

extension NavigationRouter {
    
    func present(_ module: Presentable?) {
        present(module, animated: true, overContext: false, presentCompletion: nil)
    }
    
    func present(_ module: Presentable?, animated: Bool, overContext: Bool) {
        present(module, animated: animated, overContext: overContext, presentCompletion: nil)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        present(module, animated: animated, overContext: false, presentCompletion: nil)
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func push(_ module: Presentable?) {
        push(module, animated: true, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }
    
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }
}
