//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Levi Linchenko on 03/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import Foundation

class RepresentativeController{
    
    static let shared = RepresentativeController()
    
    //    https://whoismyrepresentative.com/getall_reps_bystate.php?state=CA&output=json
    private let baseURL = "https://whoismyrepresentative.com/getall_reps_bystate.php"
    
    func searchRepresentatives(forState state: String, completion: @escaping ([Representative]?) -> Void){
       
      
        
        guard let baseURL = URL(string: baseURL) else {
            fatalError("Bad base URL")
        }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let queryItems = URLQueryItem(name: "state", value: "\(state)")
        let quertyItem2 = URLQueryItem(name: "output", value: "json")
        
        components?.queryItems = [queryItems, quertyItem2]
        
        print("💩 \(Thread.isMainThread)")
        
        guard let url = components?.url else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            defer {completion(nil)}
            if let error = error {
                print("There was an error in \(#function) \(error) \(error.localizedDescription)")
            }
            guard let data = data else {print("No data returned"); return}
            
            let asciiStringFromData = String(data: data, encoding: .ascii)
            let dataAsUTF8 = Data(asciiStringFromData!.utf8)
            
            do {
                let representative = try JSONDecoder().decode(Results.self, from: dataAsUTF8).results
                completion(representative)
            } catch let error {
                print("👀👀👀Error fetching \(error)")
            }
            
        }.resume()
        
    }
}

