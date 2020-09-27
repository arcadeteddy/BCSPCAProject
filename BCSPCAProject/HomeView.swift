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
        NavigationView {
            VStack(spacing: 15) {
                Image("logo").resizable()
                    .padding(.bottom, 50)
                    .frame(width: 280.0, height: 110)

                NavigationLink(destination: LoginView()) {
                    Text("Login")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(Color.white)
                    .frame(width: 260, height: 40)
                    .background(Color.blue)
                    .cornerRadius(4)
                }

                NavigationLink(destination: ReportView()) {
                    Text("Report Lost Pet")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(Color.blue)
                    .frame(width: 260, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.blue, lineWidth: 1))
                }
                
                NavigationLink(destination: RegisterView()) {
                    Text("Don't have an account? Register Now")
                        .font(.system(size: 12, weight: .regular, design: .rounded))
                }
            }
        }
        .padding(0.0)
    }
}

struct LoginView: View {
    @State private var email = "boblee@gmail.com"
    @State private var password = "*********"

    var body: some View {
          VStack() {
            Image("logo").resizable()
            .padding(.bottom, 50)
            .frame(width: 280.0, height: 110)
            VStack(alignment:.leading) {
                Text("Email").font(.system(size: 12, weight: .regular, design: .rounded))
                VStack() {
                    TextField("Email", text: $email).padding(.horizontal, 10)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                }
                .frame(width: 260, height: 40)
                .overlay(RoundedRectangle(cornerRadius: 4)
                .stroke(Color.blue, lineWidth: 1))
            }
            
            VStack(alignment:.leading) {
                Text("Password").font(.system(size: 12, weight: .regular, design: .rounded))
                VStack() {
                    TextField("********", text: $password).padding(.horizontal, 10)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                }
                .frame(width: 260, height: 40)
                .overlay(RoundedRectangle(cornerRadius: 4)
                .stroke(Color.blue, lineWidth: 1))
            }.padding(.bottom, 40)
            NavigationLink(destination: Tabs()) {
                Text("Login")
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .foregroundColor(Color.white)
                .frame(width: 260, height: 40)
                .background(Color.blue)
                .cornerRadius(4)
            }
            Spacer()
        }
    }
}

struct ReportView: View {
    @State var location = "Current Location"
    @State var type = "Dog"
    @State var size = "Small"
    @State var status = "Kept"
    @State var lat = ""
    @State var lng = ""
    var body: some View {
        ScrollView() {
                    
                VStack() {
                    VStack(alignment: .center) {
                        Spacer()
                        VStack() {
                            Image("camera")
                            .resizable()
                            .renderingMode(.original)
                                .scaledToFit()
                                .foregroundColor(Color("Primary"))
                            .frame(width: 24, height: 22)
                        }
                        .frame(width: 75, height: 75)
                        .background(Color("PhotoBackground"))
                        .mask(Circle())
                        
                        Text("Add Photo").font(.system(size: 12, weight: .regular, design: .rounded)).foregroundColor(Color("Primary"))

                    }.padding(.vertical, 20).padding(.top, 40)
                    VStack(alignment: .leading) {
                        Text("Location").font(.system(size: 12, weight: .regular, design: .rounded))
                        HStack() {
                            TextField("Sesame", text: $location )
                            Image("cursor")
                            .resizable()
                            .renderingMode(.original)
                                .scaledToFit()
                                .foregroundColor(Color("Primary"))
                            .frame(width: 16, height: 16)
                        }
                        Divider().background(Color("DarkGray")).padding(.top, 14)
                    }.padding(.bottom, 18)
                    VStack(alignment: .leading) {
                        Text("Type").font(.system(size: 12, weight: .regular, design: .rounded))
                        TextField("Dog", text: $type )
                        Divider().background(Color("DarkGray")).padding(.top, 14)
                    }.padding(.bottom, 18)
                    VStack(alignment: .leading) {
                        Text("Size").font(.system(size: 12, weight: .regular, design: .rounded))
                        TextField("Golden Retriever", text: $size )
                        Divider().background(Color("DarkGray")).padding(.top, 14)
                    }.padding(.bottom, 18)
                    VStack(alignment: .leading) {
                        Text("Status").font(.system(size: 12, weight: .regular, design: .rounded))
                        TextField("Medium", text: $status )
                        Divider().background(Color("DarkGray")).padding(.top, 14)
                    }.padding(.bottom, 18)
//                    Spacer()
                    EmptyView() 
                }.padding(22)
                    .navigationBarTitle(Text("Report Found Pet"), displayMode: .inline)
                    .navigationBarItems(trailing:
                        NavigationLink(destination: Tabs()) {
                            Text("Post")
                        })
            }
        }
}
    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .padding()
    }
}
