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
            MainView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Search")
            }
            ProfileView(rValue: 0.5, gValue: 0.5, bValue: 0.5)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
            }
            ReportView()
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Report")
            }
        }.navigationBarHidden(true)

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
                    }.accentColor(Color.clear)
                    
                }
            }

        }
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MainView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @ObservedObject var fetch = FetchPostings()
    @State var location:String = ""
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(){
                    Print(fetch.postings.posts)
                    VStack(alignment: .leading) {
                        Text("Location").font(.system(size: 12, weight: .regular, design: .rounded))
                        TextField("Location", text: $location )
                    }.padding(.bottom, 18)
                    
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
                            Text("0")
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
                            Text("0")
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
                    
                    NavigationLink(destination: DogView()) {
                        DogItem().padding(.top)
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
    var body: some View {
        ZStack {
            Color.white
                .frame(width: 340, height: 100)
                .cornerRadius(4)
                .shadow(radius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
            
            HStack(alignment: .top, spacing: 0.0) {
                Image("doggy")
                    .resizable()
                    .renderingMode(.original)
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
                Spacer()
                
            }
            .padding(.all, 10.0)
            .frame(width: 340, height: 100)
        }
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
                    Text("Sesame").padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Status").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text("Home").padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Type").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text("Dog").padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Breed").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text("Golden Retriever").padding(.top, 8)
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Size").font(.system(size: 12, weight: .regular, design: .rounded))
                    Text("Medium").padding(.top, 8)
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
                    Text("Sep/20/2020").padding(.top, 8)
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


extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
