//
//  GFError.swift
//  GitHubFollowers
//
//  Created by Supannee Mutitanon on 17/7/2564 BE.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request, Please try again. 🤯"
    case unableToComplete = "Unable to complete your request, Please check your internet connection. 🤯"
    case invalidResponse = "Invalid response from the server. Please try again. 🤯"
    case invalidData = "The data recieved from the server was invalid. Please try again. 🤯"
    case unableToFavorite = "There was an erorr favroiting this user. Please tye again. 🤯"
    case alreadyInFavorite = "You've already favorited this user. You must Really LIKT IT😎"
}
