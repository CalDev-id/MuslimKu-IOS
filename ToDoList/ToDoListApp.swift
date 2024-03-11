//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Heical Chandra on 11/03/24.
//

import SwiftUI

/*
    MVVM Architecture
 
    Model - DataPoint
    View - UI
    ViewModel - Manage Model for view
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
