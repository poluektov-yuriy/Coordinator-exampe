//
//  ItemDetailsViewController.swift
//  Coordinator Example
//
//  Created by yuriy.p on 16.12.2020.
//

import UIKit

enum DetailsOutput {
    case close
}

class ItemDetailsViewController: UIViewController, Storyboarded, ModuleOutput {
    
    typealias Output = DetailsOutput
    var moduleOutputHandler: ModuleOutputHandler?
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var value: String? {
        didSet {
            if infoLabel != nil {
                infoLabel.text = value
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backAction))
        navigationItem.setLeftBarButton(barButtonItem, animated: false)
    }
    
    @objc func backAction() {
        moduleOutputHandler?(.close)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        infoLabel.text = value
    }
}
