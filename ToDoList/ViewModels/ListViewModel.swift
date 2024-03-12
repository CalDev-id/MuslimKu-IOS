//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Heical Chandra on 11/03/24.
//

import Foundation

/*
 CRUD Function
 */

//objek khusus yang diakses secara global (ItemModel)
class ListViewModel: ObservableObject {
//  parameter
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    let itemsKey: String = "items_list"
//init dummy item agar dipanggil ketika initiation
    init(){
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "First Title", isCompleted: false),
//            ItemModel(title: "second Title", isCompleted: true),
//            ItemModel(title: "third", isCompleted: true),
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
//        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        
        self.items = savedItems
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
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
