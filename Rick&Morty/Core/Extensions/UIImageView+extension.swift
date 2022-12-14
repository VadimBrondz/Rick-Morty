//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Vadim Brondz on 12.12.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(
        _ url       : URL?,
        options     : KingfisherOptionsInfo? = nil,
        success     : (() -> Void)? = nil,
        failure     : (() -> Void)? = nil
    ) {

        kf.setImage(
            with              : url,
            options           : options,
            completionHandler : { result in
                switch result {
                case .success: success?()
                case .failure: failure?()
                }
            }
        )
    }
    
}
