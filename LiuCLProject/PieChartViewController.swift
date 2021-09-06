//
//  PieChartViewController.swift
//  LiuCLProject
//
//  Created by Chien-Liang Liu on 3/11/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit



class PieChartViewController: UIViewController {
    
    //create the PieChart Object
    let PieChart = PieChartView();

    override func viewWillAppear(_ animated: Bool) {
        
        //Setup PieChart
        let padding: CGFloat = 20;
        let height = (view.frame.height);
            
        PieChart.frame = CGRect( x: 0, y: padding, width: view.frame.size.width, height: height);
        
        //Remove Previously Drawn PieChart from View
        PieChart.removeFromSuperview();
        
        //Remove all Reviously segments within the array
        PieChart.segments.removeAll();

        
        //Check
         if(InventoryList.isEmpty == false)
         {
            
            //Storing counts of Categories in the InventoryList
            var CategoryMeatCount : Int = 0;
            var CategoryVegetableCount : Int = 0;
            var CategoryBeverageCount : Int = 0;
            var CategoryFruitCount : Int = 0;
            var CategoryDairyCount : Int = 0;
            var CategoryBeanCount : Int = 0;
            var CategorySauceCount : Int = 0;
            var CategorySpiceCount : Int = 0;
            var CategoryFlourCount : Int = 0;
            var CategoryOtherCount : Int = 0;
                
            for item in InventoryList{
                if(item.itemCategory == "Meat")
                {
                    CategoryMeatCount += 1;
                }
                else if(item.itemCategory == "Vegetable")
                {
                    CategoryVegetableCount += 1;
                }
                else if(item.itemCategory == "Beverage")
                {
                    CategoryBeverageCount += 1;
                }
                else if(item.itemCategory == "Fruit")
                {
                    CategoryFruitCount += 1;
                }
                else if(item.itemCategory == "Dairy")
                {
                    CategoryDairyCount += 1;
                }
                else if(item.itemCategory == "Bean")
                {
                    CategoryBeanCount += 1;
                }
                else if(item.itemCategory == "Sauce")
                {
                    CategorySauceCount += 1;
                }
                else if(item.itemCategory == "Spice")
                {
                    CategorySpiceCount += 1;
                }
                else if(item.itemCategory == "Flour")
                {
                    CategoryFlourCount += 1;
                }
                else  //item.itemCategory  == "Other"
                {
                    CategoryOtherCount += 1;
                }
            }
                
 
            //Append Category Segments to PieChart Object if not 0
            //The colors are using color literal
            if(CategoryMeatCount != 0)
            {
                let MeatSegment : PieSegment = PieSegment(color: #colorLiteral(red: 1.0, green: 0.121568627, blue: 0.28627451, alpha: 1.0), name: "Meat", value: CGFloat(CategoryMeatCount));
                    
                PieChart.segments.append(MeatSegment);
                    
                //Reset the Count
                CategoryMeatCount = 0;
            }
        
            if(CategoryVegetableCount != 0)
            {
                let VegetableSegment : PieSegment = PieSegment(color: #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1), name: "Vegetable", value: CGFloat(CategoryVegetableCount));
                    
                PieChart.segments.append(VegetableSegment);
                    
                //Reset the Counts
                CategoryVegetableCount = 0;
            }

            if(CategoryBeverageCount != 0)
            {
                let BeverageSegment : PieSegment = PieSegment(color: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), name: "Beverage", value: CGFloat(CategoryBeverageCount));
                    
                PieChart.segments.append(BeverageSegment);
                    
                //Reset the Counts
                CategoryBeverageCount = 0;

            }
        
            if(CategoryFruitCount != 0)
            {
                let FruitSegment : PieSegment = PieSegment(color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), name: "Fruit", value: CGFloat(CategoryFruitCount));
                    
                PieChart.segments.append(FruitSegment);
                    
                //Reset the Counts
                CategoryFruitCount = 0;
            }
        
            if(CategoryDairyCount != 0)
            {
                let DairySegment : PieSegment = PieSegment(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), name: "Dairy", value: CGFloat(CategoryDairyCount));
                    
                PieChart.segments.append(DairySegment);
                    
                //Reset the Counts
                CategoryDairyCount = 0;
            }
        
            if(CategoryBeanCount != 0)
            {
                let BeanSegment : PieSegment = PieSegment(color: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1), name: "Bean", value: CGFloat(CategoryBeanCount));
                    
                PieChart.segments.append(BeanSegment);
                    
                //Reset the Counts
                CategoryBeanCount = 0;
            }
        
            if(CategorySauceCount != 0)
            {
                let SauceSegment : PieSegment = PieSegment(color: #colorLiteral(red: 0.3959460258, green: 0.4039524794, blue: 0.39978984, alpha: 1), name: "Sauce", value: CGFloat(CategorySauceCount));
                        
                PieChart.segments.append(SauceSegment);
                    
                //Reset the Counts
                CategorySauceCount = 0;
            }
        
            if(CategorySpiceCount != 0)
            {
                let SpiceSegment : PieSegment = PieSegment(color: #colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1), name: "Spice", value: CGFloat(CategorySpiceCount));
                    
                PieChart.segments.append(SpiceSegment);
                    
                //Reset the Counts
                CategorySpiceCount = 0;
            }
        
            if(CategoryFlourCount != 0)
            {
                let FlourSegment : PieSegment = PieSegment(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), name: "Flour", value: CGFloat(CategoryFlourCount));
                    
                PieChart.segments.append(FlourSegment);
                    
                //Reset the Counts
                CategoryFlourCount = 0;
            }
        
            if(CategoryOtherCount != 0)
            {
                let OtherSegment : PieSegment = PieSegment(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), name: "Other", value: CGFloat(CategoryOtherCount));
                    
                PieChart.segments.append(OtherSegment);
                    
                //Reset the Counts
                CategoryOtherCount = 0;
            }
                
        
            //Set size of label
            PieChart.segmentLabelFont = .systemFont(ofSize: 15);
            
            //Display/Draw PieChart
            view.addSubview(PieChart);
            
         }
         else //InventoryList.isEmpty == True
         {
            //Append an Empty Segment for list empty
            PieChart.segments.append(PieSegment(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), name: "Empty", value: 0))
            
            view.addSubview(PieChart);
        }
         
      
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
