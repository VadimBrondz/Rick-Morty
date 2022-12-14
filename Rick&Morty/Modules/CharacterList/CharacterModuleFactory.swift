//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import Foundation

final class CharacterModuleFactory {
    
    static func createView() -> CharacterListViewController {
        let view = CharacterListViewController()
        let presenter = CharacterListPresenter()
        let interactor = CharacterListInteractor()
        let wireframe = CharacterListWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        
        return view
    }
    
}
