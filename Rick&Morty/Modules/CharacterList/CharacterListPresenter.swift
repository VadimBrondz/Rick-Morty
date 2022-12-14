//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import Foundation

final class CharacterListPresenter {
    
    weak var view: CharacterListViewControllerProtocol?
    var interactor: CharacterListInteractorInputProtocol!
    var wireframe: CharacterListWireframeProtocol!
    
    private var characters = [Character]()
    private var isFavoriteOnly: Bool = false
    
    var preparedCharacters: [Character] {
        isFavoriteOnly ? characters.filter{ $0.isFavorite == true } : characters
    }
    
}

extension CharacterListPresenter: CharacterListPresenterProtocol {
    
    func getData() {
        interactor.getCharacters()
    }
    
    func didTapShowFavorite() {
        isFavoriteOnly.toggle()
        view?.updateTableView()
        view?.configureNavigationView(isFavoriteOnly)
    }
    
    func didTapCharacter(_ row: Int) {
        let character = characters[row]
        wireframe.pushCharacter(from: view, character: character)
    }
    
    func didTapFavorite(_ character: Character) {
        let index = characters.firstIndex(where: { $0.name == character.name})!
        characters[index].toggleIsFavorite()
        view?.updateTableView()
    }
    
}

extension CharacterListPresenter: CharacterListInteractorOutputProtocol {
    
    func handleSuccessResponse(_ characters: [Character]) {
        self.characters = characters
        view?.updateTableView()
    }
    
    func handleFailureResponse() {
        print("Fail")
    }
    
    
}
