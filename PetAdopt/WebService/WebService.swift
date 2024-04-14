//
//  WebService.swift
//  SocialNetwork
//
//  Created by Samuel Santos on 14/04/24.
//

import Foundation

class WebService {
    
    static func getPostData()async throws -> Pets {
        //let urlString = "https://api.github.com/users"
        let urlString = "https://petadopt.onrender.com/pet/pets"
        guard let url = URL(string:urlString) else {
            throw ErrorCases.invalidUrl
        }
        
        let(data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Pets.self, from: data)
        }catch {
            print("Error")
            print(data)
            print(error)
            throw ErrorCases.invalidData
        }
        
    }
    
}
