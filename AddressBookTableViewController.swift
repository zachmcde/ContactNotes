//
//  AddressBookTableViewController.swift
//  ContactNotes
//
//  Created by Zach McDermott on 6/1/17.
//  Copyright © 2017 Zach McDermott. All rights reserved.
//

import UIKit

class AddressBookTableViewController: UITableViewController {

    let dataSource = ContactPersonDataSource()  // calls loadContacts() from ContactPerson Model
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.countOfContacts()
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)

        let cellContact = dataSource.contactAtIndex(index: indexPath.row)
        cell.textLabel?.text = cellContact.lastName
        cell.detailTextLabel?.text = cellContact.firstName

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "contactDetailsSegue") {
            let selectedIndex = tableView.indexPathForSelectedRow?.row
            let selectedContact = dataSource.contactAtIndex(index: selectedIndex!)
            let destination = segue.destination as! ContactDetailsTableViewController
            destination.contact = selectedContact
        }
    
    }
    
    @IBAction func cancel(NewContact segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
 
    @IBAction func save(SaveSegue segue: UIStoryboardSegue) {
        // 1. retrieve the new contact from the add new contact controller
        let source = segue.source as! AddNewContactTableViewController
        // 2. add the new contact to the data source
        let newContact = source.contact
        // 3. refresh the table vkew to update the list
        dataSource.addContact(contact: newContact!)
        tableView.reloadData()
        // 4. dismiss the view
        dismiss(animated: true, completion: nil)
    }

}
