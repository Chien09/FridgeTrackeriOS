//
//  FirstViewController.swift
//  LiuCLProject
//
//  Created by Chien-Liang Liu on 3/2/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    
    @IBOutlet weak var TotalItems: UILabel!
    
    @IBOutlet weak var TotalCost: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(InventoryList.isEmpty == false) //Not empty
        {
            var totalItemsCount : Int = 0;
            var totalItemsCost : Float = 0;
            
            for Item in InventoryList{
                totalItemsCount += Item.itemQuantity;
                
                //NOTE: Price is in terms of price of an item
                let tmpCost : Float = Item.itemPrice * Float(Item.itemQuantity)
                
                totalItemsCost += tmpCost;
            }
            
            TotalItems.text = String(totalItemsCount);
            TotalCost.text = "$" + String(totalItemsCost);
        }
        else
        {
            TotalItems.text = "0";
            TotalCost.text = "$0.0"; 
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

