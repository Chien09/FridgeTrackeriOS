//
//  Item.swift
//  LiuCLProject
//
//  Created by Chien-Liang Liu on 3/7/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import Foundation


class Item{

    //OTHER Way to store Reuse Cell Identifier
//    enum Category : String {
//        case Meat = "Meat";
//        case Vegetable = "Vegetable";
//        case Beverage = "Beverage";
//        case Fruit = "Fruit";
//        case Dairy = "Dairy";
//        case Bean = "Bean";
//        case Sauce = "Sauce";
//        case Spice = "Spice";
//        case Flour = "Flour";
//        case Other = "Other";
//    }
    
    var itemName: String;
    var itemIDLot: String;
    var itemCategory: String;
    var itemQuantity: Int;
    var itemPrice: Float;
    var itemExpirationDate: String;
    var itemNotifyDate: String;
    

    //Specialized Constructor
    init(itemName: String, itemIDLot: String, itemCategory: String, itemQuantity: Int, itemPrice: Float, itemExpirationDate: String, itemNotifyDate: String){
        
        self.itemName = itemName;
        self.itemIDLot = itemIDLot;
        self.itemCategory = itemCategory;
        self.itemQuantity = itemQuantity;
        self.itemPrice = itemPrice;
        self.itemExpirationDate = itemExpirationDate;
        self.itemNotifyDate = itemNotifyDate;
    }
}

let CategoryNames : [String] = ["Meat", "Vegetable", "Beverage", "Fruit", "Dairy", "Bean", "Sauce", "Spice", "Flour", "Other"];

//Inventory List of item Objects
var InventoryList : [Item] = [
    
    Item(itemName: "Milk", itemIDLot: "MK123", itemCategory: "Beverage", itemQuantity: 2, itemPrice: 2.35, itemExpirationDate: "05/15/2020", itemNotifyDate: "05/12/2020 05:30PM"),
    
    Item(itemName: "Apple", itemIDLot: "AP930", itemCategory: "Fruit", itemQuantity: 5, itemPrice: 0.95, itemExpirationDate: "06/10/2020", itemNotifyDate: "06/05/2020 012:30PM"),
    
    Item(itemName: "Pork Belly", itemIDLot: "PK9124", itemCategory: "Meat", itemQuantity: 10, itemPrice: 8.95, itemExpirationDate: "04/05/2020", itemNotifyDate: "04/02/2020 04:30PM")

];


