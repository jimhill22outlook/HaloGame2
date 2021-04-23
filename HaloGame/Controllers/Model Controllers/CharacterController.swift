//
//  CharacterController.swift
//  HaloGame
//
//  Created by James Hill on 4/22/21.
//

import UIKit

class CharacterController {
    
    
    static let unsc = [Character(name: "Master Chief", photo: UIImage(named: "chief"), faction: "unsc"),
                       Character(name: "ODST", photo: UIImage(named: "odst"), faction: "unsc"),
                       Character(name: "Cortana", photo: UIImage(named: "cortana"), faction: "unsc"),
                       Character(name: "Sgt Johnson", photo: UIImage(named: "johnson"), faction: "unsc"),
                       Character(name: "Warthog", photo: UIImage(named: "warthog"), faction: "unsc"),
                       Character(name: "Marine", photo: UIImage(named: "marine"), faction: "unsc")] 

    static let covenant = [Character(name: "Arbiter", photo: UIImage(named: "arbiter"), faction: "covenant"),
                           Character(name: "Jackal", photo: UIImage(named: "jackal"), faction: "covenant"),
                           Character(name: "Prophet", photo: UIImage(named: "prophet"), faction: "covenant"),
                           Character(name: "Hunter", photo: UIImage(named: "mgalekgolo"), faction: "covenant"),
                           Character(name: "Elite", photo: UIImage(named: "sanghelili"), faction: "covenant"),
                           Character(name: "Grunt", photo: UIImage(named: "unggoy"), faction: "covenant")]
}
