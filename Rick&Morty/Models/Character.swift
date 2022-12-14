//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import UIKit
import Foundation

struct Character {
    let name: String
    let status: String
    let species: String
    let gender: String
    let imageUrl: URL
    var isFavorite: Bool = false
    
    mutating func toggleIsFavorite() {
        isFavorite.toggle()
    }
}

extension Character: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case status
        case species
        case gender
        case imageUrl = "image"
    }
}
