//
//  ContentView.swift
//  SwiftData_Example
//
//  Created by Erdem on 3.07.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var allPersons: [Person]
    
    @Query(filter: #Predicate { $0.personIsHired == true }) private var hiredPersons: [Person]
    
    @Query(filter: #Predicate { $0.personIsHired == false }) private var firedPersons: [Person]
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Hired")) {
                    ForEach(hiredPersons) { person in
                        
                        HStack {
                            Text("Name: \(person.personName)")
                            Text("Age: \(person.personAge)")
                            
                            Button {
                                withAnimation {
                                    person.personIsHired.toggle()
                                 
                                }
                                
                            } label: {
                                Image(systemName: person.personIsHired ? "heart.fill" : "heart")
                                    .tint(.red)
                            }
                        }
                        .swipeActions{
                            Button {
                                modelContext.delete(person)
                                
                            } label: {
                                Image(systemName: "trash")
                            }
                            
                        }
                        
                    }
                    
                }
                
                Section(header: Text("Fired")) {
                    ForEach(firedPersons) { person in
                        
                        HStack {
                            Text("Name: \(person.personName)")
                            Text("Age: \(person.personAge)")
                            
                            Button {
                                withAnimation {
                                    person.personIsHired.toggle()
                                    
                                }
                                
                            } label: {
                                Image(systemName: person.personIsHired ? "heart.fill" : "heart")
                                    .tint(.gray)
                            }
                        }
                        .swipeActions{
                            Button {
                                modelContext.delete(person)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    }
                }
            }
            
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        
    }
    
    private func addItem() {
        withAnimation {
            
            let newPerson = Person(personName: " \(UUID().uuidString.prefix(10))", personAge: Int.random(in: 18...70), timeStamp: Date())
            
            modelContext.insert(object: newPerson)
            
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Person.self, inMemory: true)
}
