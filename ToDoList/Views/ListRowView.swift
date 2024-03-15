//
//  ListRowView.swift
//  ToDoList
//
//  Created by Heical Chandra on 11/03/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
        .background(Color.red.opacity(0.0))
        .listRowBackground(Color.green.opacity(0.0))
    }
}

#Preview {
  ListRowView(item: ItemModel(title: "ayam", isCompleted: false))
}
