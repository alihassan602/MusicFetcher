//
//  File.swift
//  Fetcher
//
//  Created by Ali Hassan on 28/06/2020.
//  Copyright © 2020 Ali Hassan. All rights reserved.
//

import Foundation

protocol IMusicWebService {
    func getMediaForSearchTerm(_ searchTerm: String, success: @escaping (_ musicItems: [MusicItem]) -> Void, failure: @escaping () -> Void)
}

class MusicWebService: IMusicWebService {
    
    func getMediaForSearchTerm(_ searchTerm: String, success: @escaping (_ musicItems: [MusicItem]) -> Void, failure: @escaping () -> Void) {
        
        guard let escapedSearch = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=\(escapedSearch)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode),
                let data = data else {
                    failure()
                    return
            }
            
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(MediaResponse.self, from: data) else {
                failure()
                return
            }
            success(response.results)
        }.resume()
    }
    
}
