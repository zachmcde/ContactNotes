//
//  AddNewContactTableViewController.swift
//  ContactNotes
//
//  Created by Zach McDermott on 6/2/17.
//  Copyright © 2017 Zach McDermott. All rights reserved.
//

import UIKit

class AddNewContactTableViewController: UITableViewController {

    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    @IBOutlet weak var textEmailAddress: UITextField!
    
    var contact : ContactPerson!  // use ! when not going to initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "saveSegue") {
            contact = ContactPerson(withFirstName: textFirstName.text!, lastName: textLastName.text!, emailAddress: textEmailAddress.text!)
        }
    }

}
