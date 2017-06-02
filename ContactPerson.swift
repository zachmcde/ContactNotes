//
//  ContactPerson.swift
//  ContactNotes
//
//  Created by Zach McDermott on 6/1/17.
//  Copyright © 2017 Zach McDermott. All rights reserved.
//

import UIKit

class ContactPerson: NSObject {

    var firstName : String
    var lastName : String
    var emailAddress : String
    
    override init() {
        firstName = "Zach"
        lastName = "McDermott"
        emailAddress = "zachmcde@gmail.com"
        
        super.init()
    }
    
    init(withFirstName first: String, lastName last: String, emailAddress email: String) {
        firstName = first
        lastName = last
        emailAddress = email
        super.init()
        
    }
    
}
