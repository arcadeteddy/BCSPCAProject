//
//  Tabs.swift
//  BCSPCAProject
//
//  Created by Theodore Lau on 2020-09-26.
//  Copyright © 2020 Theodore Lau. All rights reserved.
//

import SwiftUI
import MapKit

struct Tabs: View {
    var body: some View {
        TabView {
            NavigationView {
                MainView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Search")
                }
            .edgesIgnoringSafeArea([])
            .navigationBarHidden(false)
                .navigationBarTitle("Reports", displayMode: .inline)
            }
            ReportView()
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Report")
            }
        }
    .navigationBarBackButtonHidden(true)
    .edgesIgnoringSafeArea([.top, .bottom])
    .navigationBarHidden(true)

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
    @ObservedObject var fetch = FetchOwnerPets()
    var body: some View {
            ScrollView {
                VStack {
                    HStack {
                        ProfileImage().padding(.leading)
                        
                        VStack(alignment: .leading) {
                            Text("Jason Kim")
                                .font(.system(size: 20))
                            Text("Pets: " + String(fetch.pet.data.count))
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
                    
                    ForEach(0 ..< fetch.pet.data.count) { value in
                        NavigationLink(destination: DogView(dog: self.fetch.pet.data[value])) {
                            DogItem(dog: self.fetch.pet.data[value]).padding(.top)
                        }.accentColor(Color.clear)
                    }
                }

        }
    }
}

struct MainView: View {
    @State var location:String = "Vancouver"

    @ObservedObject var fetch = FetchPostings()
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(){
                    Print(fetch.postings.posts)
                    VStack(alignment: .leading) {
                        Text("Location").font(.system(size: 12, weight: .regular, design: .rounded))
                        TextField("Location", text: $location)
                    }
                    
                    MapView()
                        .padding(.horizontal, -20.0)
                        .padding(.bottom, 20)
                        .frame(height: 300)
                    
                    HStack(spacing: 25.0) {
                        VStack {
                            Image("dog-1")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(4)
                                .padding(0)
                            Text("3")
                                .font(.system(size: 15))
                            Text("Dogs")
                                .font(.system(size: 15))
                        }
                        VStack {
                            Image("cat")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(4)
                                .padding(0)
                            Text("2")
                                .font(.system(size: 15))
                            Text("Cats")
                                .font(.system(size: 15))
                        }
                        VStack {
                            Image("hamster")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(4)
                                .padding(0)
                            Text("0")
                                .font(.system(size: 15))
                            Text("Hamsters")
                                .font(.system(size: 15))
                        }
                        VStack {
                            Image("parrot")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(4)
                                .padding(0)
                            Text("0")
                                .font(.system(size: 15))
                            Text("Birds")
                                .font(.system(size: 15))
                        }
                    }
                    
                    ForEach(0 ..< fetch.postings.posts.count) { value in
                        NavigationLink(destination: LostDogView(dog: self.fetch.postings.posts[value])) {
                            LostDogItems(dog: self.fetch.postings.posts[value]).padding(.top)
                        }
                    }
                }
                .padding()
                Spacer()
            }
        }.onAppear(perform: fetchPostings )
    }
    
    
    private func fetchPostings() {
//        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "get_owner"), object: nil, queue: nil, using: self.onGetOwner(notification:))
//        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "get_all_postings"), object: nil, queue: nil, using: self.onGetAllPostings(notification:))
//        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "get_owner_pet"), object: nil, queue: nil, using: self.onGetOwnerPet  (notification:))
//        HTTPRequest.shared.getAllPostings()
//        HTTPRequest.shared.getOwner()
//        HTTPRequest.shared.getOwnerPet()
    }
    
    
    func onGetOwner(notification:Notification) {
        if let userinfo = notification.userInfo, let data = userinfo["json"] as? Owner {
            print(data.data)
            print(data.data.firstName)
        }
        
    }
    
    func onGetAllPostings(notification:Notification) {
        if let userinfo = notification.userInfo, let data = userinfo["json"] as? Postings {
            print(data)
            print(data.posts)
        }
        
    }
    
    func onGetOwnerPet(notification:Notification) {
        if let userinfo = notification.userInfo, let data = userinfo["json"] as? Pets {
            print(data)
        }
    }
}

struct DogItem: View {
    var dog: Pet
    
    var body: some View {
        ZStack {
            Color.white
                .frame(width: 340, height: 100)
                .cornerRadius(4)
                .shadow(radius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
            
            HStack(alignment: .top, spacing: 0.0) {
                Image(dog.name)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 80, height: 80)
                    .cornerRadius(4)
                    .padding(0)
                VStack(alignment: .leading) {
                    Text(dog.name)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    Text(dog.breed)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    HStack {
                        ForEach(0 ..< dog.color.count) { index in
                             Circle()
                                .fill(Color(hex: self.dog.color[index]))
                               .frame(width: 20, height: 20)
                            .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.trailing, 60.0)
                .frame(maxWidth: .infinity)
                Text(dog.status.capitalizingFirstLetter())
                    .font(.system(size: 13))
                    .foregroundColor(Color.green)
                    .padding(.all, 5.0)
                    .border(Color.green, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Spacer()
                
            }
            .padding(.all, 10.0)
            .frame(width: 340, height: 100)
        }
    }
}

extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}

struct LostDogs: Identifiable {
  var id = UUID()
  let breed: String
  let latitude: Double
  let longitude: Double
  
  var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
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
    var dog: Pet
    
    var body: some View {
        ScrollView() {
            VStack() {
                VStack(alignment: .center) {
                    Image("doggy")
                        .resizable()
                        .renderingMode(.original)
                    .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 200)
//                        .frame(width: .infinity, height: 200)
                        .cornerRadius(4)
                        .padding(0)
                }.padding(.top, 50)
                VStack(alignment: .leading) {
                    Text("Name").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text(dog.name).padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Status").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text(dog.status).padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Type").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text(dog.type).padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Breed").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text(dog.breed).padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Size").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text(dog.size).padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Gender").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text("Male").padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Primary Colour").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text("Test").padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Birthday").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text(dog.birthday).padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
//                Spacer()
            }.padding(22)
                .navigationBarTitle(Text("Pet Registration"), displayMode: .inline)
                .navigationBarItems(trailing:
                    NavigationLink(destination: EmergencyContactView()) {
                        Text("Edit")
                    })

        }
    }
}

struct LostDogView: View {
    var dog: Posting
    
    var body: some View {
        ScrollView() {
            VStack() {
                VStack(alignment: .center) {
                    Image(dog.type)
                        .resizable()
                        .renderingMode(.original)
                    .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 200)
//                        .frame(width: .infinity, height: 200)
                        .cornerRadius(4)
                        .padding(0)
                }.padding(.top, 50)
                VStack(alignment: .leading) {
                    Text("Type").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text(dog.type).padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Status").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text(dog.status).padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Type").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text(dog.type).padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Size").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text(dog.size).padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Location").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text("Vancouver, BC").padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
//                Spacer()
            }.padding(22)
                .navigationBarTitle(Text("Pet Registration"), displayMode: .inline)
                .navigationBarItems(trailing:
                    NavigationLink(destination: EmergencyContactView()) {
                        Text("Edit")
                    })

        }
    }
}


struct LostDogItems: View {
    var dog: Posting
    
    var body: some View {
        ZStack {
            Color.white
                .frame(width: 340, height: 100)
                .cornerRadius(4)
                .shadow(radius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
            
            HStack(alignment: .top, spacing: 0.0) {
                Image(dog._id)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 80, height: 80)
                    .cornerRadius(4)
                    .padding(0)
                VStack(alignment: .leading) {
                    Text(dog.type)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    Text("3KM Away")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    HStack {
                        ForEach(0 ..< dog.color.count) { index in
                             Circle()
                                .fill(Color(hex: self.dog.color[index]))
                               .frame(width: 20, height: 20)
                            .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.trailing, 60.0)
                .frame(maxWidth: .infinity)
                Text(dog.status.capitalizingFirstLetter())
                    .font(.system(size: 13))
                    .foregroundColor(Color.red)
                    .padding(.all, 5.0)
                    .border(Color.red, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Spacer()
                
            }
            .padding(.all, 10.0)
            .frame(width: 340, height: 100)
        }
    }
}


extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
