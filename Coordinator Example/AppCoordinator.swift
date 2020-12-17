//
//  AppCoordinator.swift
//  Coordinator Example
//
//  Created by yuriy.p on 16.12.2020.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var flowCompletionHandler: FlowCompletionHandler?
    
    private let router: NavigationRouter
    private var childCoordinator: Coordinator?
    private let itemListCoordinatorFactory = ItemListCoordinatorFactoryImpl()
    
    init(router: NavigationRouter) {
        self.router = router
    }
    
    func start() {
        runInitialFlow()
    }
    
    private func runInitialFlow() {
        childCoordinator = itemListCoordinatorFactory.makeItemListCoordinator(router: router)
        childCoordinator?.start()
    }
}
