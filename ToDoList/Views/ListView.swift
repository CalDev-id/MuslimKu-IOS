//
//  ListView.swift
//  ToDoList
//
//  Created by Heical Chandra on 11/03/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
//    @State var items: [ItemModel] = [
//        ItemModel(title: "First Title", isCompleted: false),
//        ItemModel(title: "second Title", isCompleted: true),
//        ItemModel(title: "third", isCompleted: true),
//    ]
    
    var body: some View {
        List{
            ForEach(listViewModel.items){ item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
        .navigationTitle("To Do List 📝")
    }
}

#Preview {
    NavigationView{
        ListView()
    }.environmentObject(ListViewModel())
//    ListView()
}


