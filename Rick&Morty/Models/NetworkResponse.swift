//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import Foundation
import UIKit

struct NetworkResponse {
    var info: Info
    var characters: [Character]
}

extension NetworkResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case info
        case characters = "results"
    }
}


