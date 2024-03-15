//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Heical Chandra on 12/03/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack (spacing: 10) {
                Text("You haven't done anything good today!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                Text("Eiyo bro, this is ramadhan kareem, lets being productive and improve yourself")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.yellow.opacity(0.7))
                        .cornerRadius(10)
                })
                .padding(.horizontal, 30)
                .shadow(color: Color.yellow.opacity(0.7), radius: 30, x: 0, y: 20)
                .offset(y: -7)
            }
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView{
        NoItemsView()
            .navigationTitle("title")
    }
}
