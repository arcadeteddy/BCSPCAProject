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
                            RoundedRectangle(cornerRadius: 5)
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
    
    let dogs = [Dog(name:"dog",breed:"Foobar"), Dog(name:"shit",breed:"poop")]

    var body: some View {
       ScrollView {
            HStack {
                ProfileImage()
                VStack {
                    Text("Jason Kim")
                        .font(.title)
                    Text("Daddy: 3 Pets")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Button (action: { self.isPresented = true }, label: {
                        HStack {
                            Image(systemName: "slider.horizontal.3")
                                .imageScale(.large)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            Text("Edit Profile")
                                .foregroundColor(Color.white)
                                .accessibility(label: Text("Edit Profile"))
                        }
                        .padding()
                        .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                    })
                }.padding()
                
            }
        
            List(dogs) { dog in
                TrailRow(dog: dog)
            }
        }.sheet(isPresented: $isPresented, content: {
            self.SliderModalPresentation
        })
    }
}

struct TrailRow: View {
    var dog: Dog
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(dog.name)
            Text(dog.breed).font(.subheadline).foregroundColor(.gray)
            Spacer()
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
