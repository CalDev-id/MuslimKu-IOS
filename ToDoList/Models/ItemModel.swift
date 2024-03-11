//
//  ItemModel.swift
//  ToDoList
//
//  Created by Heical Chandra on 11/03/24.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
