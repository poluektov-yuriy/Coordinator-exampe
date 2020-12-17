//
//  ItemListCoordinator.swift
//  Coordinator Example
//
//  Created by yuriy.p on 16.12.2020.
//

import UIKit

class ItemListCoordinator: Coordinator {
    
    private let router: NavigationRouter
    private var childCoordinator: Coordinator?
    private let itemListFlowFactory = ItemListFlowModulesFactoryImpl()
    private var detailsCoordinatorFactory = DetailsCoordinatorFactoryImpl()
    
    var flowCompletionHandler: FlowCompletionHandler?
    
    init(router: NavigationRouter) {
        self.router = router
    }
    
    func start() {
        openList()
    }
    
    private func openList() {
        let module = itemListFlowFactory.makeItemListModule() { [weak self] value in
            self?.runDetailsCoordinator(for: value)
        }
        
        router.push(module)
    }
    private func runDetailsCoordinator(for value: ItemListTableViewController.Output) {
        
        childCoordinator = detailsCoordinatorFactory.makeDetailsCoordinator(router: router, with: value)
        
        childCoordinator?.start()
        
        childCoordinator?.flowCompletionHandler = { [weak self] in
            self?.childCoordinator = nil
        }
    }
}
