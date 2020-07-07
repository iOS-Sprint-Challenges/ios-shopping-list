//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by FGT MAC on 7/7/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    
    //MARK: - Properties
    private var cartCount: Int = 0
    private var data = ShoppingDataController()
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func updateViews() {
        self.collectionView.reloadData()
    }
    
    private func updateCart(isAdded: Bool){
        if isAdded {
            cartCount += 1
        }else{
            cartCount -= 1
        }
        self.navigationItem.rightBarButtonItem?.title = "Cart\(cartCount != 0 ? ": \(cartCount)" : "")"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.itemList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
            
        }
        
        let item = data.itemList[indexPath.row]
    
        cell.addToCartLabel.text = item.added ? "Added" : "Not added"
        cell.imageLabel.image = UIImage(named: item.image)
        cell.itemNameLabel.text = item.name
        cell.backgroundColor = item.added ? UIColor.green : UIColor.clear
        
        return cell
    }

    // MARK: - UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        data.itemList[indexPath.row].added.toggle()
        
        updateCart(isAdded: data.itemList[indexPath.row].added)
        
        updateViews()
    }

}
