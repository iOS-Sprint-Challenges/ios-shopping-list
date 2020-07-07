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
    private let notificationCenter = UNUserNotificationCenter.current()
    //MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestPermission()
        updateViews()
    }

    //MARK: - Private methods
    private func updateViews(){
        
        titleLabel.text = "You currently have \(numberOfItems) item(s) in your shopping list."
    }
    
    private func scheduleNotification(){
        let content = UNMutableNotificationContent()
        let userActions = "User Actions"
        
        content.title = "Delivery for \(nameTextField.text!)"
        content.body = "Your shopping items will be deliver to \(addressTextField.text!) in 15 minutes"
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = userActions
        
        let trigger = UNTimeIntervalNotificationTrigger (timeInterval: 1, repeats: false)
        let identifier = "Local Notification"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error{
                print(error)
            }
        }
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options:[] )
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        
        let category = UNNotificationCategory(identifier: userActions, actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
        
        notificationCenter.setNotificationCategories([category])
    }
    
    func requestPermission() {
            notificationCenter.requestAuthorization(options: [.alert,.badge,.sound]) { (didAllow, error) in
                
                if !didAllow{
                    print("User declined")
                }
                
            }
    }
    

    //MARK: - Actions
    
    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
        if let title = titleLabel.text, !title.isEmpty, let address = addressTextField.text, !address.isEmpty{
            scheduleNotification()
            navigationController?.popViewController(animated: true)
        }else{
            print("Please fill out the requested info.")
        }
    }
    
}

