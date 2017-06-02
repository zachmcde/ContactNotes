//
//  ContactDetailsTableViewController.swift
//  ContactNotes
//
//  Created by Zach McDermott on 6/2/17.
//  Copyright © 2017 Zach McDermott. All rights reserved.
//

import UIKit

class ContactDetailsTableViewController: UITableViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    
    var contact : ContactPerson!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameLabel.text = contact.firstName
        lastNameLabel.text = contact.lastName
        emailAddressLabel.text = contact.emailAddress
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
