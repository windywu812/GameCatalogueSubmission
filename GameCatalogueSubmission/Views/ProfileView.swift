//
//  ProfileView.swift
//  GameCatalogueSubmission
//
//  Created by Windy on 03/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
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
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
