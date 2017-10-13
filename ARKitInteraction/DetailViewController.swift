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
    var companyType: String { get }
    var address: String { get }
    var contactName: String { get }
    var phone: String { get }
    var jobDescription: String { get }
    var jobCompletionDate: String { get }
    var history: String { get }
}

class DetailViewController: UITableViewController {
    
    var viewModel: DetailViewModel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var jobDescriptionLabel: UILabel!
    @IBOutlet weak var jobCompletionDateLabel: UILabel!
    @IBOutlet weak var jobHistoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupData()
    }
    
    func setupNavBar() {
        let leftBarButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func setupData() {
        nameLabel.text = viewModel.companyName
        typeLabel.text = viewModel.companyType
        addressLabel.text = viewModel.address
        contactNameLabel.text = viewModel.contactName
        phoneNumberLabel.text = viewModel.phone
        jobDescriptionLabel.text = viewModel.jobDescription
        jobCompletionDateLabel.text = viewModel.jobCompletionDate
        jobHistoryLabel.text = viewModel.history
    }
    
    @objc private func doneTapped() {
        dismiss(animated: true, completion: nil)
    }
}
