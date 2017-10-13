//
//  DetailViewController.swift
//  ARKitInteraction
//
//  Created by James Pang on 13/10/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewModel {
    var companyName: String { get }
    var service: String { get }
    var phone: String { get }
    var web: String { get }
    var logo: UIImage { get }
}

class DetailViewController: UITableViewController {
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    func setupNavBar() {
        let leftBarButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc private func doneTapped() {
        dismiss(animated: true, completion: nil)
    }
}
