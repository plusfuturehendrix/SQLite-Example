//
//  ContentView.swift
//  SQLite SwiftUI
//
//  Created by Danil Bochkarev on 07.03.2023.
//

import SwiftUI

struct ContentView: View {
    // array of user models
    @State var userModels: [UserModel] = []
    // check if user is selected for edit
    @State var userSelected: Bool = false
    // id of selected user to edit or delete
    @State var selectedUserId: Int64 = 0
    
    var body: some View {
        NavigationView {
            VStack {
                // create link to add user
                HStack {
                    Spacer()
                    NavigationLink (destination: AddUserView(), label: {
                        Text("Add user")
                    })
                }
                
                NavigationLink (destination: EditUserView(id: self.$selectedUserId), isActive: self.$userSelected) {
                    EmptyView()
                }
                
                List (self.userModels) { (model) in

                    // show name, email and age horizontally
                    HStack {
                        Text(model.name)
                        Spacer()
                        Text(model.email)
                        Spacer()
                        Text("\(model.age)")
                        Spacer()

                        Button(action: {
                            self.selectedUserId = model.id
                            self.userSelected = true
                        }, label: {
                            Text("Edit")
                                .foregroundColor(Color.blue)
                            })
                            // by default, buttons are full width.
                            // to prevent this, use the following
                            .buttonStyle(PlainButtonStyle())
                    }
                }
                
            }.padding()
            .navigationBarTitle("SQLite")
            .onAppear(perform: {
                self.userModels = DB_Manager().getUsers()
            })
            .navigationTitle("Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
