//
//  DetailsCoordinator.swift
//  Coordinator Example
//
//  Created by yuriy.p on 16.12.2020.
//

import UIKit

class DetailsCoordinator: Coordinator {
    
    var flowCompletionHandler: FlowCompletionHandler?
    
    private let router: NavigationRouter
    
    private let detailsValue: String
    
    private var flowFactory: DetailsFlowModulesFactory = DetailsFlowFactoryImpl()
    
    init(router: NavigationRouter,
         detailsValue: String) {
        
        self.router = router
        self.detailsValue = detailsValue
    }
    
    func start() {
        openDetails(with: detailsValue)
    }
    
    private func openDetails(with value: String) {
        let module = flowFactory.makeItemDetailsModule(with: value) { [weak self] output in
            
            if case ItemDetailsViewController.Output.close = output {
                self?.router.popModule()
                self?.flowCompletionHandler?()
            }
        }
        
        router.push(module)
    }
}






