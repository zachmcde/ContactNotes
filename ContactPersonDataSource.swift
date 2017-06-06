//
//  ContactPersonDataSource.swift
//  ContactNotes
//
//  Created by Zach McDermott on 6/1/17.
//  Copyright © 2017 Zach McDermott. All rights reserved.
//

import UIKit

class ContactPersonDataSource: NSObject {
    
    let contacts = NSMutableArray()
    
    override init() {
        super.init()
        loadContacts()
    }
    
    func loadContacts () {
        
        //get fileURL
        let fileURL = getFileURL()
        // check to see if file exists or not
        if (FileManager.default.fileExists(atPath: fileURL.path)) {
            //load contents of the file
            let contents = NSKeyedUnarchiver.unarchiveObject(withFile: fileURL.path) as! NSArray
            contacts.addObjects(from: contents as! [Any])
        } else {
            let sample1 = ContactPerson()
            contacts.add(sample1)
            let sample2 = ContactPerson(withFirstName: "John", lastName: "Doe", emailAddress: "johndoe@gmail.com")
            addContact(contact: sample2)
            saveContacts()
        }
    }
    
    func getFileURL() -> URL {
        // 1. FileManager - differend functions to help manage file. Get reference to default filemanager
        let fileManager = FileManager.default
        // 2. get a reference to home directory (documents directory with read and write permissions)
        let homeDir = try! fileManager.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: true)
        // get reference ot a url for the file that we will see
        let fileURL = homeDir.appendingPathComponent("addressBook.data")
        // return fileURL
        return fileURL
    }
    
    func saveContacts() {
        // 1. get reference to file pat to save contacts to
        let fileURL = getFileURL()
        // 2. save the contacts array to the file
        NSKeyedArchiver.archiveRootObject(contacts, toFile: fileURL.path)
    }

    func addContact(contact c: ContactPerson) { 
        contacts.add(c)
        saveContacts()
    }
    
    func countOfContacts () -> Int {
        return contacts.count
    }
    
    func contactAtIndex(index i: Int) -> ContactPerson {
        return contacts.object(at: i) as! ContactPerson
    }
}
