//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import Foundation

protocol CharacterListViewControllerProtocol: ControllerBackedProtocol {
    func updateTableView()
    func configureNavigationView(_ isFavoriteOnly: Bool)
}

protocol CharacterListPresenterProtocol {
    var preparedCharacters: [Character] { get }
    
    func getData()
    func didTapShowFavorite()
    func didTapCharacter(_ row: Int)
    func didTapFavorite(_ character: Character)
}

protocol CharacterListInteractorInputProtocol: AnyObject {
    func getCharacters()
}

protocol CharacterListInteractorOutputProtocol: AnyObject {
    func handleSuccessResponse(_ characters: [Character])
    func handleFailureResponse()
}

protocol CharacterListWireframeProtocol {
    func pushCharacter(
        from view: CharacterListViewControllerProtocol?,
        character: Character
    )
}
