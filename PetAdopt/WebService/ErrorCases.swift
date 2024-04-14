//
//  ErrorCases.swift
//  SocialNetwork
//
//  Created by Samuel Santos on 14/04/24.
//

import Foundation


enum ErrorCases: LocalizedError{
    case invalidUrl
    case invalidResponse
    case invalidData

    
    var errorDescription: String?{
        switch self {
        case .invalidUrl: return "Invalid URL found"
            
        case .invalidResponse: return "Invalid Response found"
        case .invalidData: return "Invalid Data from Response found"

        }
    }
}
