//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Supannee Mutitanon on 16/6/2564 BE.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL: String = "https://api.github.com/users/"
    
    private init() { }
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Followers]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request, Please try again. 🤯")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete your request, Please check your internet connection. 🤯")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again. 🤯")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data recieved from the server was invalid. Please try again. 🤯")
                return
            }
            
            do {
                let decoder = JSONDecoder() //JSON -> OBJECT
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Followers].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "The data recieved from the server was invalid. Please try again. 🤯")
            }
        }
        
        task.resume()
        
    }
    
    
}
