//
//  ViewModel.swift
//  SocialNetwork
//
//  Created by Samuel Santos on 14/04/24.
//

import Foundation


@MainActor
final class PetListViewModel: ObservableObject {
    
    @Published var pets: Pets?
    @Published var isLoading = false
    @Published var shouldShowError = false
    @Published var errorMessage: String?
    
    func fetchUsers()async{
        isLoading = true
            do {
                let pets = try await WebService.getPostData()
               DispatchQueue.main.async{
                    self.pets = pets
                self.isLoading = false
            }
            }
            catch {
                self.isLoading = false
                self.shouldShowError = true
                self.errorMessage = error.localizedDescription
            }
        }
    }

