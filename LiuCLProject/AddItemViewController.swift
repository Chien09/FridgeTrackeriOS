//
//  AddItemViewController.swift
//  LiuCLProject
//
//  Created by Chien-Liang Liu on 3/6/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit
import UserNotifications  //Used for Notfiy Date (Local Notification) setup by user

//For picker formating to String
var date = Date();
var datetime = Date();

class AddItemViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    
    //UITextFields
    @IBOutlet weak var ItemNameInput: UITextField!
    @IBOutlet weak var ItemIDLotInput: UITextField!
    @IBOutlet weak var ItemPriceInput: UITextField!
    
    //Label
    @IBOutlet weak var ItemQuantityLabel: UILabel!
    
    //Pickers
    @IBOutlet weak var CategoryPicker: UIPickerView!
    @IBOutlet weak var ExpirationDatePicker: UIDatePicker!
    @IBOutlet weak var NotifyDatePicker: UIDatePicker!
    
    //Stepper
    @IBOutlet weak var StepperControl: UIStepper!
    
    
    //Action "Return" button on Soft Keyboard to DISABLE the keyboard
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder();
    }
    
    //Action touchbackground to DISABLE soft Keyboard
    @IBAction func backgroundTouched(_ sender: UIControl) {
        ItemPriceInput.resignFirstResponder();
    }
    
    
    @IBAction func QuantityStepper(_ sender: UIStepper) {
        ItemQuantityLabel.text = String(Int(sender.value)); //convert to Int cause of Double decimals
    }
    
    //---------------------------------------------------
    //Methods for One Component Category Picker
    
    //UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    //UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CategoryNames.count;
    }
    
    //UIPickerViewDelegate (To Display the list on Picker)
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CategoryNames[row]; 
    }
    
    
    //---------------------------------------------------
    
    
    @IBAction func AddItem(_ sender: UIButton) {
        if(ItemNameInput.text!.isEmpty || ItemIDLotInput.text!.isEmpty || ItemPriceInput.text!.isEmpty)
        {
            //Setup Alert UIAlertController
            let titleAlert = "Empty Inputs!";
            let messageAlert = "Inputs cannot be Empty!";
            let alertController = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert);
            
            //Create Action Button for Alert Controller
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil);
            
            //Add Action Button to Alert Controller
            alertController.addAction(cancelAction);
            present(alertController, animated: true, completion: nil);
        }
        else
        {
            //Category Picker Selected
            let CategoryPicked : String = CategoryNames[CategoryPicker.selectedRow(inComponent: 0)];
            
            //Expiration Date Selected format it to String
            date = ExpirationDatePicker.date;
            let dateFormat1 = DateFormatter();
            dateFormat1.dateFormat = "MM/dd/yyyy";
            let dateString1 : String = dateFormat1.string(from: date);
            
            //Notfiy Date Selected format it to String
            datetime = NotifyDatePicker.date;
            let dateFormat2 = DateFormatter();
            dateFormat2.dateFormat = "MM/dd/yyyy hh:mma";
            let dateString2 : String = dateFormat2.string(from: datetime);
            
            //Create the Item Object & add to user inputs to it
            let ItemObject : Item = Item(itemName: ItemNameInput.text!, itemIDLot: ItemIDLotInput.text!, itemCategory: CategoryPicked, itemQuantity: Int(ItemQuantityLabel.text!)!, itemPrice: Float(ItemPriceInput.text!)!, itemExpirationDate: dateString1, itemNotifyDate: dateString2);
            
            //Save the item Object to Inventory List
            InventoryList.append(ItemObject);
            
            
            //Setup Alert UIAlertController for Item Added
            let titleAlert = "Added";
            let messageAlert = "Item Added to Invenotry List and Notify Date for item(s) will be on \(dateString2)";
            let alertController = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert);
            
            //Create Action Button for Alert Controller
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil);
            
            //Add Action Button to Alert Controller
            alertController.addAction(cancelAction);
            present(alertController, animated: true, completion: nil);
            
            
            //----------------------------------------------------------

            //Call Local Notification Method
            ScheduleNotification(DateString: dateString1, Object: ItemObject);
            
            
        }
    }
    
    @IBAction func ClearButton(_ sender: UIButton) {
        ItemNameInput.text = "";
        ItemIDLotInput.text = "";
        ItemPriceInput.text = "";
        StepperControl.value = 1;
        ItemQuantityLabel.text = String(Int(StepperControl.value));
        CategoryPicker.selectRow(0, inComponent: 0, animated: true);
    }
    
    
    //FUNCTION for Local Notification
    //Implement Local Notification from the UIDatePicker time for "Notify Date"
    func ScheduleNotification(DateString: String, Object: Item){
        //Contents of Notification
        let LocalNotificationContent = UNMutableNotificationContent();
        //LocalNotificationContent.title = "Item(s) Expiration Date";
        LocalNotificationContent.title = "Item(s) \(Object.itemName) Expiration Date"
        
        //LocalNotificationContent.subtitle = "Expiration Date is on";
        LocalNotificationContent.subtitle = "Expiration Date is on \(DateString)";
        LocalNotificationContent.sound = UNNotificationSound.default;
        
        //Setup the Notification
        let triggerDateTime = NotifyDatePicker.calendar.dateComponents([.month, .day, .hour, .minute], from: NotifyDatePicker.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateTime, repeats: false)
        let NotificationRequest = UNNotificationRequest(identifier: "identifier", content: LocalNotificationContent, trigger: trigger);
        
        UNUserNotificationCenter.current().add(NotificationRequest, withCompletionHandler: nil);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Will load a Popup that Asks User to allow Local Notifications for Notify Date
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
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
