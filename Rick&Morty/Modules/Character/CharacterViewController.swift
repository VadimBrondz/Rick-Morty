//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import UIKit

final class CharacterViewController: UIViewController {
    
    var character: Character!
    
    init(_ character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private var imageView = UIImageView()
    private var speciesLabel = UILabel()
    private var statusLabel = UILabel()
    private var genderLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        title = character.name
        view.backgroundColor = .white
        configureImageView()
        configureSpeciesLabel()
        configureStatusLabel()
        configureGenderLabel()
    }
    
    private func configureImageView() {
        imageView.setImage(character.imageUrl)
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        view.addSubview(imageView)
        imageView.snp.makeConstraints { maker in
            maker.size.equalTo(CGSize(width: 300    , height: 300))
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(16)
            maker.top.equalToSuperview().inset(150)
        }
    }
    
  private func configureSpeciesLabel() {
        speciesLabel.font = .systemFont(ofSize: 32, weight: .heavy)
        speciesLabel.text = "Species: \(character.species)"
        speciesLabel.textColor = .black
        speciesLabel.numberOfLines = 0
        view.addSubview(speciesLabel)
        speciesLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.top.equalTo(imageView.snp.bottom).offset(32)
        }
    }
    
    private func configureStatusLabel() {
        statusLabel.font = .systemFont(ofSize: 32, weight: .heavy)
        statusLabel.text = "Status: \(character.status)"
        statusLabel.textColor = .black
        statusLabel.numberOfLines = 0
        view.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.top.equalTo(speciesLabel.snp.bottom).offset(16)
        }
    }
    
    private func configureGenderLabel() {
        genderLabel.font = .systemFont(ofSize: 32, weight: .heavy)
        genderLabel.text = "Gender: \(character.gender)"
        genderLabel.textColor = .black
        genderLabel.numberOfLines = 0
        view.addSubview(genderLabel)
        genderLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.top.equalTo(statusLabel.snp.bottom).offset(16)
        }
    }
}

