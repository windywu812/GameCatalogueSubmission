//
//  EditProfileView.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 14/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct EditProfileView: View {
    
    @Binding var isEdit: Bool
    
    var body: some View {
        Form {
                HStack {
                    Spacer()
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 150)
                        .padding()
                    Spacer()
                }
                HStack {
                    Text("Name")
                    Spacer()
                    Text("Windy")
                }
                HStack {
                    Text("Email")
                    Spacer()
                    Text("windywu812@gmail.com")
                }
                HStack {
                    Text("Phone Number")
                    Spacer()
                    Text("089647527757")
                }
                HStack {
                    Text("College")
                    Spacer()
                    Text("University Universal")
                }
                HStack {
                    Text("Location")
                    Spacer()
                    Text("Batam")
                }
            }
            .navigationBarItems(leading:
                Button(action: {
                    self.isEdit.toggle()
                }, label: {
                    Text("Cancel")
                }), trailing:
                Button(action: {
//                    self.saveData(self.username)
                    
                }, label: {
                    Text("Done")
                }))
        }
}
