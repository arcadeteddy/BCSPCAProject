//
//  Tabs.swift
//  BCSPCAProject
//
//  Created by Theodore Lau on 2020-09-26.
//  Copyright © 2020 Theodore Lau. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            ProfileView(rValue: 0.5, gValue: 0.5, bValue: 0.5)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
            }
            MainView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
            }
            ReportView()
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Report")
            }
        }
    }
}

struct Header: View {
    var body: some View {
        Rectangle()
            .frame(width: 500)
    }
}

struct colorSlider: View {
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text(verbatim: "0")
                .foregroundColor(textColor)
            Slider(value: $value, in: 0.0...1.0)
            Text(verbatim: "255")
                .foregroundColor(textColor)
            
        }
    }
}

struct ProfileImage: View {
    var body: some View {
        VStack {
            Image("profile")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 5)
            
        }
    }
}

struct ProfileView: View {
    @State var rValue: Double
    @State var gValue: Double
    @State var bValue: Double
    @State var isPresented = false
    
    var SliderModalPresentation: some View {
        NavigationView {
            Form {
                Section(header: Text("Header Background Color")) {
                    colorSlider(value: $rValue, textColor: .red)
                    colorSlider(value: $gValue, textColor: .green)
                    colorSlider(value: $bValue, textColor: .blue)
                    HStack {
                        VStack {
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 100)
                                .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                        }
                        VStack {
                            Text("R: \(Int(rValue * 255.0))")
                            Text("G: \(Int(gValue * 255.0))")
                            Text("B: \(Int(bValue * 255.0))")
                        }
                    }
                }
            }
                
            .navigationBarTitle(Text("Edit Profile"))
            .navigationBarItems(
                trailing: Button (action: { self.isPresented = false } ) { Text("Done")
                    .foregroundColor(.green)
                }
            )
        }
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(){
                    HStack {
                        ProfileImage().padding(.leading)
                        
                        VStack(alignment: .leading) {
                            Text("Jason Kim")
                                .font(.system(size: 20))
                            Text("Pets: 3")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.bottom)
                            HStack {
                                NavigationLink(destination: EditProfileView()) {
                                    Text("Edit Profile")
                                        .font(.system(size: 13))
                                        .foregroundColor(Color.white)
                                        .frame(width: 100, height: 30)
                                        .accessibility(label: Text("Edit Profile"))
                                        .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(4)
                                }
                                NavigationLink(destination: AddPetView()) {
                                    Text("Add Pet")
                                        .font(.system(size: 13))
                                        .foregroundColor(Color.white)
                                        .frame(width: 100, height: 30)
                                        .accessibility(label: Text("Add Pet"))
                                        .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(4)
                                }
                            }
                        }.padding(.horizontal)
                    }
                    
                    NavigationLink(destination: DogView()) {
                        DogItem().padding(.top)
                    }
                }
                Spacer()
            }
        }
    }
}

struct DogItem: View {
    var body: some View {
        ZStack {
            Color.white
                .frame(width: 340, height: 100)
                .cornerRadius(4)
                .shadow(radius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
            
            HStack(alignment: .top, spacing: 0.0) {
                Image("doggy")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(4)
                    .padding(0)
                VStack(alignment: .leading) {
                    Text("Cubby")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    Text("Square Head Dog")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    Circle()
                    .fill(Color.black)
                    .frame(width: 20, height: 20)
                }
                .padding(.trailing, 60.0)
                .frame(maxWidth: .infinity)
                Text("Safe")
                    .font(.system(size: 13))
                    .foregroundColor(Color.green)
                    .padding(.all, 5.0)
                    .border(Color.green, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
            }
            .padding(.all, 10.0)
            .frame(width: 340, height: 100)
        }
    }
}

struct MainView: View {
    var body: some View {
        Color.blue
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}


struct Dog: Codable, Identifiable {
    var id = UUID()
    var name: String
    var breed: String
}


struct EditProfileView: View {
    var body: some View {
        Text("Edit Profile View")
    }
}

struct AddPetView: View {
    var body: some View {
        Text("Add Pet View")
    }
}

struct DogView: View {
    var body: some View {
        Text("Add Pet View")
    }
}
