//
//  ItemDetailViewController.swift
//  LiuCLProject
//
//  Created by Chien-Liang Liu on 3/6/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    
    //From Segue receive current object
    var ItemObject: Item?;
    
    //From Segue receive index of the current object
    var IndexOfObject: Int = 0;
    
    //Labels
    @IBOutlet weak var ItemNameLabel: UILabel!
    @IBOutlet weak var ItemIDLotLabel: UILabel!
    @IBOutlet weak var ItemPriceLabel: UILabel!
    @IBOutlet weak var ItemQuantityLabel: UILabel!
    @IBOutlet weak var ItemExpirationLabel: UILabel!
    @IBOutlet weak var ItemNotifyLabel: UILabel!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let Item = ItemObject {
            ItemNameLabel.text = Item.itemName;
            ItemIDLotLabel.text = Item.itemIDLot;
            ItemPriceLabel.text = "$" + String(Item.itemPrice);
            ItemQuantityLabel.text = String(Item.itemQuantity);
            ItemExpirationLabel.text = Item.itemExpirationDate;
            ItemNotifyLabel.text = Item.itemNotifyDate;
        }
    }
    

    //Update Item Button Action to perform Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let UpdateItemViewController = segue.destination as? UpdateItemViewController{
            
            //Pass this current item Object to updateItemViewConroller
            UpdateItemViewController.ItemObjectUpdate = ItemObject;
        }
    }
    
    
    @IBAction func DeleteItem(_ sender: UIButton) {
        
        //Delete Current Object from the Inventory List
        InventoryList.remove(at: IndexOfObject);
        
        
        //Setup Alert UIAlertController
        let titleAlert = "Delete";
        let messageAlert = ItemObject!.itemName + " item has been deleted from inventory list";
        let alertController = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert);
        
        //Create Action Button for Alert Controller
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: {action in self.performSegue(withIdentifier: "BackToList", sender: self)}); //After user presses OK Action it will switch back to Inventory List TableViewController
        
        //Add Action Button to Alert Controller
        alertController.addAction(cancelAction);
        present(alertController, animated: true, completion: nil);
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
