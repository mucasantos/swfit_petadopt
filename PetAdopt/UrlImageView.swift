//
//  UrlImageView.swift
//  SocialNetwork
//
//  Created by Samuel Santos on 14/04/24.
//

import Foundation
import SwiftUI

struct UrlImageView: View {
    let urlString:String
    
    @State var data: Data?
    
    var body: some View {
            if let data = data, let uiimage = UIImage(data: data){
                Image(uiImage: uiimage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 130)
                    .background(Color.gray)
            }
            else{
                Image(systemName: "video")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 130)
                    .background(Color.gray)
                    .onAppear{
                        fetcthData()
                    }
        }
            
    }
    
    private func fetcthData(){
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                self.data = data
        }
        task.resume()
        
    }
}
