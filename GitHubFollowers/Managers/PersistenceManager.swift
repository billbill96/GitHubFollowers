//
//  PersistenceManager.swift
//  GitHubFollowers
//
//  Created by Supannee Mutitanon on 28/7/2564 BE.
//

import Foundation

enum PersistenceActionType {
    case add
    case remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Key {
        static let favorites = "favorit"
    }
    
    static func updateWith(favorite: Followers,
                           actionType: PersistenceActionType,
                           completed: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorite)
                        return
                    }
                    retrievedFavorites.append(favorite)
                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }
                completed(save(favorites: retrievedFavorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Followers], GFError>) -> Void) {
        guard let favoriteData = defaults.object(forKey: Key.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder() //JSON -> OBJECT
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let favorites = try decoder.decode([Followers].self, from: favoriteData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Followers]) -> GFError? {
        do {
            let encoder = JSONEncoder() //OBJECT -> JSON
            let encodedFavorite = try encoder.encode(favorites)
            defaults.setValue(encodedFavorite, forKey: Key.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
