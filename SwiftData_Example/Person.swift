//
//  Person.swift
//  SwiftData_Example
//
//  Created by Erdem on 3.07.2023.
//

import Foundation
import SwiftData

@Model
final class Person {
  
    var personName: String
    var personAge: Int
    var personIsHired: Bool
    var timeStamp: Date
    
    init(personName: String, personAge: Int, personIsHired: Bool = false, timeStamp: Date) {
        self.personName = personName
        self.personAge = personAge
        self.personIsHired = personIsHired
        self.timeStamp = timeStamp
    }
}



