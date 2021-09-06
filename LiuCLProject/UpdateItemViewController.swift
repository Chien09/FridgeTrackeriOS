//
//  UpdateItemViewController.swift
//  LiuCLProject
//
//  Created by Chien-Liang Liu on 3/10/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class UpdateItemViewController: UIViewController {

    //Object from Segue
    var ItemObjectUpdate : Item?;
    
    //Label
    @IBOutlet weak var ItemQuantityLabel: UILabel!
    
    //Stepper
    @IBOutlet weak var StepperControl: UIStepper!
    

    @IBAction func QuantityStepper(_ sender: UIStepper) {
        ItemQuantityLabel.text = String(Int(sender.value));
    }
    
    @IBAction func UpdateItem(_ sender: UIButton) {
        
        //Update Item's Quantity
        ItemObjectUpdate?.itemQuantity = Int(ItemQuantityLabel.text!)!
        
        //Setup Alert UIAlertController
        let titleAlert = "Update";
        let messageAlert = "Item has been Updated";
        let alertController = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert);
        
        //Create Action Button for Alert Controller
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil);
        
        //Add Action Button to Alert Controller
        alertController.addAction(cancelAction);
        present(alertController, animated: true, completion: nil);
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //Set Stepper Value same as Item Object's Qantity
        StepperControl.value = Double(ItemObjectUpdate!.itemQuantity);
        
        ItemQuantityLabel.text = String(Int(StepperControl.value));
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
