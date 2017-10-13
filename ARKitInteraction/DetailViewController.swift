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

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var phoneTextView: UITextView!
    @IBOutlet weak var webTextView: UITextView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name: \(viewModel.companyName)"
        serviceLabel.text = "Service provided: \(viewModel.service)"
        phoneTextView.text = viewModel.phone
        webTextView.text = viewModel.web
    }
    
    @IBAction func returnTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
