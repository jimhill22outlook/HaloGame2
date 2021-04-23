//
//  FilterViewController.swift
//  HaloGame
//
//  Created by James Hill on 4/22/21.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    func factionWasSelected(faction: String)
    
}

class FilterViewController: UIViewController {
    
    //MARK: Preoperties
    weak var delegate: FilterSelectionDelegate?
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func covenantButtonTapped(_ sender: Any) {
        delegate?.factionWasSelected(faction: "Covenant")
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func unscButtonTapped(_ sender: Any) {
        delegate?.factionWasSelected(faction: "UNSC")
        self.dismiss(animated: true, completion: nil)
    }
    
}//End of Class


