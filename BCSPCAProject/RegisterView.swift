//
//  RegisterView.swift
//  BCSPCAProject
//
//  Created by work on 2020-09-26.
//  Copyright © 2020 Theodore Lau. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Image("logo").resizable()
                    .padding(.bottom, 50)
                    .frame(width: 280.0, height: 110)

                NavigationLink(destination: VerifySPCAView()) {
                    Text("Verify with SPCA")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(Color.white)
                    .frame(width: 260, height: 40)
                    .background(Color.blue)
                    .cornerRadius(4)
                }

                NavigationLink(destination: RegistrationView()) {
                    Text("Not Registered with SPCA")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(Color.blue)
                    .frame(width: 260, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.blue, lineWidth: 1))
                }
            }
        }
        .padding(0.0)
    }

}

struct RegistrationView:View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var email:String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    
    var body: some View {

            VStack() {
                VStack(alignment: .leading) {
                    Text("First Name").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("Jason", text: $firstName )
                }.padding(.bottom, 18)
                Divider().background(Color("DarkGray")).padding(.bottom, 14)
                VStack(alignment: .leading) {
                    Text("Last Name").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("Kim", text: $lastName )
                }.padding(.bottom, 18)
                Divider().background(Color("DarkGray")).padding(.bottom, 14)
                VStack(alignment: .leading) {
                    Text("Email").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("test@gmail.com", text: $email )
                }.padding(.bottom, 18)
                Divider().background(Color("DarkGray")).padding(.bottom, 14)
                VStack(alignment: .leading) {
                    Text("Password").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("*******", text: $password )
                        .textContentType(.password)
                }.padding(.bottom, 18)
                Divider().background(Color("DarkGray")).padding(.bottom, 14)
                VStack(alignment: .leading) {
                    Text("Confirm Password").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("*******", text: $passwordConfirm)
                    .textContentType(.password)
                }.padding(.bottom, 18)
                Spacer()
            }.padding(22)
                .navigationBarTitle(Text("Owner Registration"), displayMode: .inline)
                .navigationBarItems(trailing:
                    NavigationLink(destination: RegistrationSecondView()) {
                        Text("Next")
                    })
    }
}

struct RegistrationSecondView:View {
    @State var phone:String = ""
    @State var addressOne:String = ""
    @State var addressTwo:String = ""
    @State var city: String = ""
    @State var province: String = ""
    
    var body: some View {

            VStack() {
                VStack(alignment: .leading) {
                    Text("Phone Number").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("(778) 123-1234", text: $phone )
                }.padding(.bottom, 18)
                Divider().background(Color("DarkGray")).padding(.bottom, 14)
                VStack(alignment: .leading) {
                    Text("Address 1").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("1234 Puppy St.", text: $addressOne )
                }.padding(.bottom, 18)
                Divider().background(Color("DarkGray")).padding(.bottom, 14)
                VStack(alignment: .leading) {
                    Text("Address 2").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("", text: $addressTwo )
                }.padding(.bottom, 18)
                Divider().background(Color("DarkGray")).padding(.bottom, 14)
                VStack(alignment: .leading) {
                    Text("City").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("Vancouver", text: $city )
                        .textContentType(.password)
                }.padding(.bottom, 18)
                Divider().background(Color("DarkGray")).padding(.bottom, 14)
                VStack(alignment: .leading) {
                    Text("Province").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("BC", text: $province)
                    .textContentType(.password)
                }.padding(.bottom, 18)
                Spacer()
            }.padding(22)
                .navigationBarTitle(Text("Owner Registration"), displayMode: .inline)
                .navigationBarItems(trailing:
                    NavigationLink(destination: EmergencyContactView()) {
                        Text("Next")
                    })
    }
}


struct VerifySPCAView: View {
    var body: some View {
        Text("Something")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct EmergencyContactView: View {
    @State var emergency_firstName = ""
    @State var emergency_lastName = ""
    @State var emergency_relationship = ""
    @State var emergency_phone = ""
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                Text("First Name").font(.system(size: 12, weight: .regular, design: .rounded))
                TextField("Brian", text: $emergency_firstName )
            }.padding(.bottom, 18)
            Divider().background(Color("DarkGray")).padding(.bottom, 14)
            VStack(alignment: .leading) {
                Text("Last Name").font(.system(size: 12, weight: .regular, design: .rounded))
                TextField("Lee", text: $emergency_lastName )
            }.padding(.bottom, 18)
            Divider().background(Color("DarkGray")).padding(.bottom, 14)
            VStack(alignment: .leading) {
                Text("Relationship").font(.system(size: 12, weight: .regular, design: .rounded))
                TextField("Family", text: $emergency_relationship )
            }.padding(.bottom, 18)
            Divider().background(Color("DarkGray")).padding(.bottom, 14)
            VStack(alignment: .leading) {
                Text("Phone Number").font(.system(size: 12, weight: .regular, design: .rounded))
                TextField("(604) 123-1234", text: $emergency_phone )
                    .textContentType(.password)
            }.padding(.bottom, 18)
            Divider().background(Color("DarkGray")).padding(.bottom, 14)
            Spacer()
        }.padding(22)
            .navigationBarTitle(Text("Emergency Contact"), displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: PetRegistrationView()) {
                    Text("Next")
                })
    }
}


struct PetRegistrationView: View {
    @State var pet_name = ""
    @State var pet_type = ""
    @State var pet_breed = ""
    @State var pet_size = ""
    @State var pet_gender = ""
    @State var pet_colour = ""
    @State var pet_birthday = ""
    
    var body: some View {
        ScrollView() {
                
            VStack() {
                VStack(alignment: .center) {
                    Text("test")
                        .frame(width: 35, height: 35, alignment: .center)
                        .overlay(Circle().size(width: 75, height: 75).background(Color("PhotoBackground")))
                    Text("Add Photo")
                }
                VStack(alignment: .leading) {
                    Text("Name").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("Sesame", text: $pet_name )
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Type").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("Dog", text: $pet_type )
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Breed").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("Golden Retriever", text: $pet_breed )
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Size").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("Medium", text: $pet_size )
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Gender").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("Male", text: $pet_gender )
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Primary Colour").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("Test", text: $pet_colour )
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                VStack(alignment: .leading) {
                    Text("Birthday").font(.system(size: 12, weight: .regular, design: .rounded))
                    TextField("Sep/20/2020", text: $pet_birthday )
                    Divider().background(Color("DarkGray")).padding(.top, 14)
                }.padding(.bottom, 18)
                Spacer()
            }.padding(22)
                .navigationBarTitle(Text("Pet Registration"), displayMode: .inline)
                .navigationBarItems(trailing:
                    NavigationLink(destination: EmergencyContactView()) {
                        Text("Finish")
                    })
        }
    }
}



