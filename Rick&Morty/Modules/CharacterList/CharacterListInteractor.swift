//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import Foundation

final class CharacterListInteractor {
    
    weak var presenter: CharacterListInteractorOutputProtocol?
    
    private let networkService = NetworkService()
    private let urlString = "https://rickandmortyapi.com/api/character"
    
}

extension CharacterListInteractor: CharacterListInteractorInputProtocol {
    
    func getCharacters() {
        networkService.request(urlString: urlString) { [weak self] (networkResponse, error) in
            guard
                error == nil,
                let characters = networkResponse?.characters
            else {
                self?.presenter?.handleFailureResponse()
                return
            }
            self?.presenter?.handleSuccessResponse(characters)
        }
    }
    
}
