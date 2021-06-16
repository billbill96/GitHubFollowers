//
//  User.swift
//  GitHubFollowers
//
//  Created by Supannee Mutitanon on 13/6/2564 BE.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var follower: Int
    var createdAt: String
}
