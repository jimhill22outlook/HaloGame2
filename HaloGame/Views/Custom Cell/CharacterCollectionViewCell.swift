//
//  CharacterCollectionViewCell.swift
//  HaloGame
//
//  Created by James Hill on 4/22/21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    
    
    //MARK: Properties
    ///landing pad
    var character: Character? {
    didSet {
        updateViews()
    }
}
    
    //MARK: Helper Methods
    func updateViews() {
    guard let character = character else {return}
    ///helps your image look great
    characterImageView.contentMode = .scaleAspectFit
    characterImageView.image = character.photo
    
    }
}//End of class
