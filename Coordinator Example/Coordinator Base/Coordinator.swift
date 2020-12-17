//
//  Coordinator.swift
//  Coordinator Example
//
//  Created by yuriy.p on 15.12.2020.
//

import Foundation

typealias FlowCompletionHandler = () -> ()

protocol Coordinator {
    
    func start()
    
    var flowCompletionHandler: FlowCompletionHandler? { get set }
    
}



protocol ModuleOutput {
    
    typealias ModuleOutputHandler = (Output) -> ()
    
    associatedtype Output
    
    var moduleOutputHandler: ModuleOutputHandler? { get set }
    
}


