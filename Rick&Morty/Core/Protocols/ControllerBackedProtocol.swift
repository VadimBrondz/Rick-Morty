//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import UIKit

protocol ControllerBackedProtocol: AnyObject {
    var controller: UIViewController { get }
}

extension ControllerBackedProtocol where Self: UIViewController {
    var controller: UIViewController { self }
}
