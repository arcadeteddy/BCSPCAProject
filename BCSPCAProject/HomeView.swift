//
//  HomeView.swift
//  BCSPCAProject
//
//  Created by Theodore Lau on 2020-09-26.
//  Copyright © 2020 Theodore Lau. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image("logo").resizable()
                .frame(width: 250.0, height: 50)
            
            Button(action: {
               //
            }) {
                Text("Login")
            }
            
            Button(action: {
                //
            }) {
                Text("Report Lost Pet")
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .padding()
    }
}
