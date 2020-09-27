//
//  HTTPRequest.swift
//  BCSPCAProject
//
//  Created by work on 2020-09-27.
//  Copyright © 2020 Theodore Lau. All rights reserved.
//

import Foundation


class HTTPRequest {
    public static var shared = HTTPRequest()
    
    private let getAllPostingsRoute = URL(string: "http://69.172.162.104:3000/posting")
    private let getOwnerRoute = URL(string: "http://69.172.162.104:3000/owner/BobLee")
    private let getOwnerPetsRoute = URL(string: "http://69.172.162.104:3000/owner/BobLee/pet")
    
    
    func getAllPostings() {
        var req = URLRequest(url: getAllPostingsRoute!)
        req.httpMethod = "GET"
        URLSession.shared.dataTask(with: req) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8))
                let jsonDecoder = JSONDecoder()
                do {
                    let parsedJSON = try jsonDecoder.decode(Postings.self, from: data)
                    print(parsedJSON.posts[0])
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func getOwner() {
        var req = URLRequest(url: getOwnerRoute!)
        req.httpMethod = "GET"
        URLSession.shared.dataTask(with: req) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8))
                let jsonDecoder = JSONDecoder()
                do {
                    let parsedJSON = try jsonDecoder.decode(Owner.self, from: data)
                    print(parsedJSON)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func getOwnerPet() {
        var req = URLRequest(url: getOwnerPetsRoute!)
        req.httpMethod = "GET"
        URLSession.shared.dataTask(with: req) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8))
                let jsonDecoder = JSONDecoder()
                do {
                    let parsedJSON = try jsonDecoder.decode(Pets.self, from: data)
                    print(parsedJSON)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

struct Pets: Codable {
    var data: [Pet]
}

struct Owner: Codable {
    var data: OwnerData
}

struct OwnerData: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var phone: Int
    var address1: String
    var address2: String
    var city: String
    var province: String
    var e_firstName: String
    var e_lastName: String
    var e_relationship: String
    var e_phone: Int
    var ids: String
    var pets:[Pet]
}

struct Pet: Codable {
    var color: [String]
    var status: String
    var name: String
    var type: String
    var breed: String
    var size: String
    var birthday: String
    
}


struct Postings: Codable {
    var posts: [Posting]
}


struct Posting: Codable {
    var color: [String]
    var status: String
    var type: String
    var size: String
    var lat: Float
    var lng: Float
}
