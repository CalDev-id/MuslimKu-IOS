//
//  AddView.swift
//  ToDoList
//
//  Created by Heical Chandra on 11/03/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    //alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .foregroundColor(.white)
                    .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.yellow.opacity(0.7))
                        .cornerRadius(10)
                        .shadow(color: Color.yellow.opacity(0.7), radius: 30, x: 0, y: 20)
                        
                })
            }
            .padding(14)
        }
        .navigationTitle("Add Activity✏️")
        .foregroundColor(.white)
        .alert(isPresented: $showAlert, content: getAlert)
        .background(
            Image("bgramadhan2")
                .resizable()
//                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
    
        )
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new ToDo item must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
