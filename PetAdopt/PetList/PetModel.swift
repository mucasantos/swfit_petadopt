//
//  PetModel.swift
//  SocialNetwork
//
//  Created by Samuel Santos on 14/04/24.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pets = try? JSONDecoder().decode(Pets.self, from: jsonData)

import Foundation

// MARK: - Pets
struct Pets: Codable {
    let pets: [Pet]
}

// MARK: - Pet
struct Pet: Codable {
    let id, name: String
    let age, weight: Int
    let color: String
    let images: [String]
    let user: UserPet
    let isVerified, available: Bool
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, age, weight, color, images, user, isVerified, available, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - User
struct UserPet: Codable {
    let id, name, email, phone: String
    let isAdmin: Bool
    let createdAt, updatedAt: String
    let v: Int
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, email, phone, isAdmin, createdAt, updatedAt
        case v = "__v"
        case image
    }
}
