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

                NavigationLink(destination: LoginView(choice: "Login")) {
                    Text("Login / Signup")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.white)
                        .frame(width: 260, height: 40)
                        .background(Color.blue)

                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
                }

                NavigationLink(destination: ReportView()) {
                    Text("Report Lost Pet")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.white)
                        .frame(width: 260, height: 40)
                        .background(Color.blue)

                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
                }
            }
        }
        .padding(0.0)
    }
}

struct LoginView: View {
    var choice: String
    
    @State private var email = ""
    @State private var password = ""

    var body: some View {
          VStack() {
            TextField("Email", text: self.$email)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .padding(.leading, 10.0)
                .foregroundColor(Color.white)
                .frame(width: 260, height: 40)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            TextField("Password", text: self.$password)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .padding(.leading, 10.0)
                .foregroundColor(Color.white)
                .frame(width: 260, height: 40)
                .background(Color.white)

                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            Button("Login") {}
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(Color.white)
                .frame(width: 260, height: 40)
                .background(Color.blue)

                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
        }
    }
}

struct ReportView: View {
    var body: some View {
        Text("Report View")
    }
}
    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .padding()
    }
}
