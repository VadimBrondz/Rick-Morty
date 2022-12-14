//
//  CharacterListViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    var presenter: CharacterListPresenterProtocol!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame)
        tableView.translatesAutoresizingMaskIntoConstraints = true
        tableView.backgroundColor = .background
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter.getData()
    }
    
    private func configureView() {
        configureNavigationView()
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    @objc private func didTapShowFavorite() {
        presenter.didTapShowFavorite()
    }
    

}

extension CharacterListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapCharacter(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.preparedCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if presenter.preparedCharacters.isEmpty {
            return UITableViewCell()
        } else {
            let cell = CharacterCell()
            let character = presenter.preparedCharacters[indexPath.row]
            cell.configureCell(character: character, row: indexPath.row)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }

}

extension CharacterListViewController: CharacterListViewControllerProtocol {
    
    func updateTableView() {
        tableView.reloadData()
    }
    
    func configureNavigationView(_ isFavoriteOnly: Bool = false) {
        let favoriteButton = UIBarButtonItem(
            image: UIImage(named: isFavoriteOnly ? "FavoriteTrue" : "FavoriteFalse"),
            style: .plain,
            target: self,
            action: #selector(didTapShowFavorite)
        )
        navigationItem.rightBarButtonItems = [favoriteButton]
    }
    
}

extension CharacterListViewController: CharacterCellDelegate {
    
    func favoriteTapped(_ character: Character) {
        presenter.didTapFavorite(character)
    }
    
}
