//
//  ProfileView.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 03/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isEdit: Bool = false
    @ObservedObject private var profileViewModel = ProfileViewModel()
    
    var body: some View {
        Form {
            HStack {
                Spacer()
                Image(uiImage: ((profileViewModel.getPic(forKey: UserDefaultService.photoProfileKey))))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 200)
                    .padding()
                Spacer()
            }
            HStack {
                Text("Name")
                Spacer()
                Text(UserDefaultService.name)
            }
            HStack {
                Text("Email")
                Spacer()
                Text(UserDefaultService.email)
            }
            HStack {
                Text("Phone Number")
                Spacer()
                Text(UserDefaultService.phoneNumber)
            }
            HStack {
                Text("Education")
                Spacer()
                Text(UserDefaultService.education)
            }
            HStack {
                Text("Location")
                Spacer()
                Text(UserDefaultService.location)
            }
        }
        .navigationBarItems(trailing:
            Button(action: {
                self.isEdit.toggle()
            }, label: {
                Text("Edit")
            })
        )
            .sheet(isPresented: self.$isEdit) { 
                EditProfileView(isEdit: self.$isEdit)
        }
    }
}
