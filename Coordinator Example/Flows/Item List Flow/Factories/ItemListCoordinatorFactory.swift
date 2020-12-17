//
//  ItemListCoordinatorFactory.swift
//  Coordinator Example
//
//  Created by yuriy.p on 17.12.2020.
//

import Foundation

protocol ItemListCoordinatorFactory {
    
    func makeItemListCoordinator(router: NavigationRouter) -> Coordinator
}

class ItemListCoordinatorFactoryImpl: ItemListCoordinatorFactory {
    
    func makeItemListCoordinator(router: NavigationRouter) -> Coordinator {
        ItemListCoordinator(router: router)
    }
}
