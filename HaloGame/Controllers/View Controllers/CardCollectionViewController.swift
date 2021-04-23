//
//  CardCollectionViewController.swift
//  HaloGame
//
//  Created by James Hill on 4/22/21.
//

import UIKit

class CardCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    var displayCharacters: [Character] = []
    var targetedCharacter: Character?
    var selectedFaction = "unsc"
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        shuffleCharacters(faction: selectedFaction)
    }
    
    //MARK: - Helper Methods
    func shuffleCharacters(faction: String) {
        if faction == "unsc" {
            let shuffledUNSCGroup = CharacterController.unsc.shuffled()
            let UNSCGroup = shuffledUNSCGroup.prefix(3)
            displayCharacters = Array(UNSCGroup)
            targetedCharacter = CharacterController.covenant.randomElement()
        } else {
            let shuffledCovenantGroup = CharacterController.covenant.shuffled()
            let covenantGroup = shuffledCovenantGroup.prefix(3)
            displayCharacters = Array(covenantGroup)
            targetedCharacter = CharacterController.unsc.randomElement()
            
        }
        updateViews()
        
    }
    
    func updateViews() {
        guard let character = targetedCharacter else {return}
        displayCharacters.append(character)
        displayCharacters.shuffle()
        self.title = "Find \(character.name)"
        collectionView.reloadData()
    }
    
    func presentAlert(character: Character) {
        let success = character == targetedCharacter
        
        let alertController = UIAlertController(title: success ? "Good job!" : "Nah", message: nil, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { (_) in
            self.shuffleCharacters(faction: self.selectedFaction)
        }
        
        alertController.addAction(doneAction)
        if success {
            alertController.addAction(shuffleAction)
        }
        present(alertController, animated: true)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destination = segue.destination as? FilterViewController else {return}
            destination.delegate = self
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayCharacters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell else { return UICollectionViewCell()}
        
        let character = displayCharacters[indexPath.row]
        cell.character = character
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = displayCharacters[indexPath.row]
        presentAlert(character: character)
    }
}//End of class

extension CardCollectionViewController: FilterSelectionDelegate {
    func factionWasSelected(faction: String) {
        selectedFaction = faction
        shuffleCharacters(faction: faction)
    }
}//End of extension


extension CardCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width-20, height: width+30)
    }
    
}
