//
//  ItemListModulesFactory.swift
//  Coordinator Example
//
//  Created by yuriy.p on 17.12.2020.
//

import Foundation

protocol ItemListFlowModulesFactory {
    
    typealias ItemListModuleOutput = (ItemListTableViewController.Output) -> ()
    
    func makeItemListModule(with output: ItemListModuleOutput?) -> Presentable
}

class ItemListFlowModulesFactoryImpl: ItemListFlowModulesFactory {
     
    func makeItemListModule(with output: ItemListModuleOutput?) -> Presentable {
        
        let vc = ItemListTableViewController.instantiate()
        vc.moduleOutputHandler = output
        
        return vc
    }

}
