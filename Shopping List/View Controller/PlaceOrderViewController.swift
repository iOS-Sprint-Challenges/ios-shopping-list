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
    private var notificationManager = NotificationManager()
    //MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationManager.requestPermission()
        updateViews()
    }

    //MARK: - Private methods
    private func updateViews(){
        
        titleLabel.text = "You currently have \(numberOfItems) item(s) in your shopping list."
    }

    //MARK: - Actions
    
    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text, let address = addressTextField.text else { return }
        
        notificationManager.scheduleNotification(title: name, body: address)
        
            navigationController?.popViewController(animated: true)

    }
    
}

