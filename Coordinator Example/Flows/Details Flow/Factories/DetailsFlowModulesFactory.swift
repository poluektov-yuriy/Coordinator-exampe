//
//  DetailsFlowFactory.swift
//  Coordinator Example
//
//  Created by yuriy.p on 16.12.2020.
//

import Foundation

protocol DetailsFlowModulesFactory {
    
    typealias DetailsModuleOutput = (ItemDetailsViewController.Output) -> ()
    
    func makeItemDetailsModule(with value: String, and output: DetailsModuleOutput?) -> Presentable
}

class DetailsFlowFactoryImpl: DetailsFlowModulesFactory {
    
    func makeItemDetailsModule(with value: String, and output: DetailsModuleOutput?) -> Presentable {
        
        let vc = ItemDetailsViewController.instantiate()
        vc.moduleOutputHandler = output
        return vc
    }

}
