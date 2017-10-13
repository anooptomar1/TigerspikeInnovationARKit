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
    var website: String { get }
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
    @IBOutlet weak var websiteLabel: UILabel!
    
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
        websiteLabel.text = viewModel.website
        jobDescriptionLabel.text = viewModel.jobDescription
        jobCompletionDateLabel.text = viewModel.jobCompletionDate
        jobHistoryLabel.text = viewModel.history
    }
    
    @objc private func doneTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 && indexPath.row == 4 {
            if let url = URL(string: "telprompt:\(viewModel.phone)") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
        
        if indexPath.section == 0 && indexPath.row == 5 {
            guard let url = URL(string: viewModel.website) else {
                return //be safe
            }
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 && indexPath.row == 4 ||
            indexPath.section == 0 && indexPath.row == 5 {
            return true
        } else {
            return false
        }
    }
}
