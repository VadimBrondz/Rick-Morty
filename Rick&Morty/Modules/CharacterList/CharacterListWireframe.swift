//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import Foundation

final class CharacterListWireframe: CharacterListWireframeProtocol {
    
    func pushCharacter(
        from view: CharacterListViewControllerProtocol?,
        character: Character
    ) {
        let vc = CharacterViewController(character)
        view?.controller.navigationController?.pushViewController(vc, animated: true) 
    }
    
}
