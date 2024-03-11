//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Heical Chandra on 11/03/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "First Title", isCompleted: false),
            ItemModel(title: "second Title", isCompleted: true),
            ItemModel(title: "third", isCompleted: true),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
}
