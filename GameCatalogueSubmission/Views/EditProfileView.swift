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
    
    @ObservedObject var profileViewModel = ProfileViewModel()
    
    @State private var pickedPhoto = UIImage()
    
    @State private var isPickingSource = false
    @State private var isGallery = false
    @State private var isCamera = false
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Spacer()
                    VStack(spacing: 0) {
                    Image(uiImage: profileViewModel.getPic(forKey: UserDefaultService.photoProfileKey))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 200)
                        .padding()
                        .overlay(
                            Image(uiImage: pickedPhoto)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 200)
                                .padding()
                    )
                        .onTapGesture {
                            self.isPickingSource.toggle()
                    }
                        Text("Change your picture")
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
                
                TextField("Enter your name", text: $profileViewModel.name)
                TextField("Enter your email", text: $profileViewModel.email)
                    .autocapitalization(.none)
                TextField("Enter your phoneNumber", text: $profileViewModel.phoneNumber)
                TextField("Enter your education", text: $profileViewModel.education)
                TextField("Enter your location", text: $profileViewModel.location)
                
            }
            .onTapGesture(perform: {
                UIApplication.shared.endEditing()
            })
                .navigationBarTitle("Edit Profile", displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: {
                        self.isEdit.toggle()
                    }, label: {
                        Text("Cancel")
                    }), trailing:
                    Button(action: {
                        self.profileViewModel.updateProfile()
                        self.profileViewModel.savePic(image: self.pickedPhoto, key: UserDefaultService.photoProfileKey)
                        self.isEdit.toggle()
                    }, label: {
                        Text("Done")
                    }))
        }
        .sheet(isPresented: self.$isCamera) {
            ImagePicker(selectedImage: self.$pickedPhoto, sourceType: .camera)
        }
        .sheet(isPresented: self.$isGallery) {
            ImagePicker(selectedImage: self.$pickedPhoto, sourceType: .photoLibrary)
        }
        .actionSheet(isPresented: self.$isPickingSource) {
            ActionSheet(title: Text(""), message: Text("Choose your photo source"), buttons: [
                .default(Text("Take photo from gallery"), action: {
                    self.isGallery.toggle()
                }),
                .default(Text("Take from camera"), action: {
                    self.isCamera.toggle()
                }),
                .cancel(Text("Cancel"))
            ])
        }
    }
}
