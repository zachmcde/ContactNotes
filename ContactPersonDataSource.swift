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
        let sample1 = ContactPerson()
        contacts.add(sample1)
        let sample2 = ContactPerson(withFirstName: "John", lastName: "Doe", emailAddress: "johndoe@gmail.com")
        addContact(contact: sample2)
    }

    func addContact(contact c: ContactPerson) {
        contacts.add(c)
    }
    
    func countOfContacts () -> Int {
        return contacts.count
    }
    
    func contactAtIndex(index i: Int) -> ContactPerson {
        return contacts.object(at: i) as! ContactPerson
    }
}
