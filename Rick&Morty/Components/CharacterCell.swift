//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import UIKit
import SnapKit

protocol CharacterCellDelegate: AnyObject {
    func favoriteTapped(_ character: Character)
}

final class CharacterCell: UITableViewCell {
    
    weak var delegate: CharacterCellDelegate?
    
    private var character: Character!
    private var row: Int!
    
    private let containerView = UIView()
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let speciesLabel = UILabel()
    private let statusLabel = UILabel()
    private let genderLabel = UILabel()
    private let favoriteImageView = UIImageView()
    
    func configureCell(character: Character, row: Int) {
        self.character = character
        self.row = row
        backgroundColor = .background
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        configureContainerView()
        configureAvatarImageView()
        configureNameLabel()
        configureSpeciesLabel()
        configureStatusLabel()
        configureGenderLabel()
        configureFavoriteButton()
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        containerView.clipsToBounds = true
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(16)
        }
    }
    
    private func configureAvatarImageView() {
        
        avatarImageView.setImage(character.imageUrl)
        //        imageView.layer.cornerRadius = 6
        avatarImageView.layer.masksToBounds = true
        containerView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { maker in
            maker.size.equalTo(CGSize(width: 146  , height: 146))
            maker.left.equalTo(containerView)
            maker.top.equalTo(containerView)
        }
    }
    
    private func configureNameLabel() {
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        nameLabel.text = "Name: \(character.name)"
        containerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { maker in
            maker.left.equalTo(avatarImageView.snp.right).offset(16)
            maker.top.equalTo(containerView.snp.top).inset(16)
            maker.right.equalTo(containerView).inset(42)
            
        }
    }
    
    private func configureSpeciesLabel() {
        speciesLabel.font = .systemFont(ofSize: 16, weight: .regular)
        speciesLabel.textColor = .black
        speciesLabel.text = "Species: \(character.species)"
        speciesLabel.numberOfLines = 0
        containerView.addSubview(speciesLabel)
        speciesLabel.snp.makeConstraints { maker in
            maker.top.equalTo(nameLabel.snp.bottom).offset(8)
            maker.left.equalTo(avatarImageView.snp.right).offset(16)
            maker.right.equalTo(containerView).inset(24)
        }
    }
    
    private func configureStatusLabel() {
        statusLabel.font = .systemFont(ofSize: 16, weight: .regular)
        statusLabel.textColor = .black
        statusLabel.text = "Status: \(character.status)"
        statusLabel.numberOfLines = 0
        containerView.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { maker in
            maker.top.equalTo(speciesLabel.snp.bottom).offset(8)
            maker.left.equalTo(avatarImageView.snp.right).offset(16)
            maker.right.equalTo(containerView).inset(24)
        }
    }
    
    private func configureGenderLabel() {
        genderLabel.font = .systemFont(ofSize: 16, weight: .regular)
        genderLabel.textColor = .black
        genderLabel.text = "Gender: \(character.gender)"
        statusLabel.numberOfLines = 0
        containerView.addSubview(genderLabel)
        genderLabel.snp.makeConstraints { maker in
            maker.top.equalTo(statusLabel.snp.bottom).offset(8)
            maker.left.equalTo(avatarImageView.snp.right).offset(16)
            maker.right.equalTo(containerView).inset(24)
        }
    }
    
    private func configureFavoriteButton() {
        favoriteImageView.image = UIImage(named: character.isFavorite ? "FavoriteTrue" : "FavoriteFalse")
        containerView.addSubview(favoriteImageView)
        favoriteImageView.snp.makeConstraints { maker in
            maker.top.equalTo(containerView).inset(16)
            maker.right.equalTo(containerView).inset(16)
            maker.size.equalTo(CGSize(width: 24, height: 24))
        }
        favoriteImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        favoriteImageView.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(_ sender: UIButton) {
        delegate?.favoriteTapped(character)
    }
    
}




