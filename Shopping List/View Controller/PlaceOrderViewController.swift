//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    //MARK: - Properties
    var cart = [ShoppingItem]()
    var numberOfItems: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    private func updateViews(){
        
        titleLabel.text = "You currently have \(numberOfItems) item(s) in your shopping list."
    }

    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
        print("Sent order!")
    }
    
}

