//
//  DetailsCoordinatorFactory.swift
//  Coordinator Example
//
//  Created by yuriy.p on 16.12.2020.
//

import UIKit

protocol DetailsCoordinatorFactory {
    
    func makeDetailsCoordinator(router: NavigationRouter, with value: String) -> Coordinator
}

class DetailsCoordinatorFactoryImpl: DetailsCoordinatorFactory {
    func makeDetailsCoordinator(router: NavigationRouter, with value: String) -> Coordinator {
        DetailsCoordinator(router: router, detailsValue: value)
    }
}
