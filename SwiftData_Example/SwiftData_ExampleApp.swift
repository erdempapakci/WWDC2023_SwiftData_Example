//
//  SwiftData_ExampleApp.swift
//  SwiftData_Example
//
//  Created by Erdem on 3.07.2023.
//

import SwiftUI
import SwiftData

@main
struct SwiftData_ExampleApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}


