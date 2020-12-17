//
//  NavigationRouterImpl.swift
//  Coordinator Example
//
//  Created by yuriy.p on 17.12.2020.
//

import Foundation
import UIKit

final class NavigationRouterImpl: NSObject, NavigationRouter {
    
    private var rootController: UINavigationController
    private var completions: [UIViewController : () -> Void] = [:]
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        super.init()
        self.rootController.delegate = self
    }
    
    // MARK: - Router

    func present(_ module: Presentable?, animated: Bool = true,
                 overContext: Bool = false,
                 presentCompletion: (() -> Void)? = nil) {
        
        guard let controller = module?.toPresent() else { return }
        if overContext == true {
            controller.providesPresentationContextTransitionStyle = true
            controller.definesPresentationContext = true
            controller.modalPresentationStyle = .overCurrentContext
        }
        rootController.present(controller, animated: animated, completion: presentCompletion)
    }
    
    func dismissModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootController.dismiss(animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        guard let controller = module?.toPresent(), (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController.")
            return
        }
        
        if let completion = completion {
            completions[controller] = completion
        }
        rootController.pushViewController(controller, animated: animated)
    }

    func popModule(animated: Bool) {
        if let controller = rootController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else {
            return
        }
        rootController.setViewControllers([controller], animated: false)
        rootController.isNavigationBarHidden = hideBar
        
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = rootController.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }
    
    // MARK: - Presentable
    
    func toPresent() -> UIViewController? {
        return rootController
    }
    
    // MARK: - Private
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}

extension NavigationRouterImpl: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        guard let coordinator = navigationController.topViewController?.transitionCoordinator else { return }
        let viewControllers = navigationController.viewControllers
        if let fromVC = coordinator.viewController(forKey: .from) {
            if viewControllers.contains(fromVC) == false {
                if coordinator.isInteractive == false {
                    runCompletion(for: fromVC)
                    return
                } else {
                    coordinator.notifyWhenInteractionChanges { [weak self] context in
                        if !context.isCancelled {
                            self?.runCompletion(for: fromVC)
                        }
                    }
                }
            }
        }
    }
}
