//
//  ContentView.swift
//  SocialNetwork
//
//  Created by Samuel Santos on 14/04/24.
//

import SwiftUI



struct PetListView: View {
    @ObservedObject var viewModel = PetListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.white.ignoresSafeArea()
                List(viewModel.pets?.pets ?? [] , id: \.id){ pet in
                    VStack{
                        AsyncImage(url: URL(string: pet.images[0] ?? "")){ image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                //.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        } placeholder: {
                            Rectangle()
                                .foregroundColor(.teal)
                        }
                        //.frame(width: 150, height: 150)
                        
                        VStack(alignment: .leading) {
                            Text(pet.name.capitalized ?? "")
                                .font(.headline)
                            
                        }
                        
                    }}
                .navigationTitle("Pets")
                
                if viewModel.isLoading{
                    ProgressView()
                    .scaleEffect(2.0, anchor: .center)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
            }
        }
        .task{
            await viewModel.fetchUsers()
        }
        .alert(isPresented: $viewModel.shouldShowError, content: {
            return Alert(title: Text("Error!"), message: Text(viewModel.errorMessage ?? "")
            )
        })
    }
}


#Preview {
    PetListView()
}
