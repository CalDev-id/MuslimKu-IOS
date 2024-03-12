//
//  ListView.swift
//  ToDoList
//
//  Created by Heical Chandra on 11/03/24.
//

import SwiftUI

struct ListView: View {
    
    //memanggil environtmentobj dari listviewmodel(items)
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
                if !listViewModel.items.isEmpty {
                    List {

                ForEach(listViewModel.items) { item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear){
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(
               leading: EditButton(),
               trailing:
                   NavigationLink("Add", destination: AddView())//direct ke add view
           )
            .navigationTitle("To Do List 📝")
        }
         else {
             HStack{
                 Spacer()
                 Text("You don't have any to do list")
                 Spacer()
             }
             
             .navigationTitle("To Do List 📝")
             .navigationBarItems(
                 leading:
                     listViewModel.items.isEmpty ?
                                 nil :
                                 AnyView(EditButton()),
             trailing:
                    NavigationLink("Add", destination: AddView()))//direct ke add view)
        }
        
        
        
    }
}

#Preview {
    NavigationView{
        ListView()
    }.environmentObject(ListViewModel())
}


