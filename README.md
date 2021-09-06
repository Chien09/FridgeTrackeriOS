# FridgeTrackeriOS

Fridge tracking iOS application for monitoring ingredients and fresh produce. 
Main APIs used in this project included Navigation Controller API, User Notifications API, and Core Graphics/Quartz API.

-----**API Implemented**-----

The main APIs that were implemented into the “Keep Fresh” app were navigation controller, as well as, notification, and core graphics/quartz. Below are the details of the uses of the APIs towards particular features of the app.

• Navigation Controller API along with the Dynamic UITableView was primarily used to
display the details of each item in the inventory list and the list itself. The API allowed the user to navigate through the main inventory list and then select each individual item in the list to view the specific details including item ID/Lot, expiration date, and so on. Through the details view of a particular item, the user is also able to update the quantity or delete that particular item.

• User Notifications API was used to setup the local notification date and time selected by the user through the UIDatePicker. Essentially, when the user finishes inputing the details of an item and selecting the dates through the UIDatePicker, the user clicks on the add button it will trigger a function “ScheduleNotification(...)” to setup and trigger the local notification based on the user selected date and time. This API is the meat of the “Keep Fresh” app, because the app’s main focus is to allow users to track inventory expiration dates. Therefore, implementing local notifications is the main feature of this app.

• Core Graphics/Quartz API was primarily used for drawing a pie chart on to the view to display the category inventory list as the data inputs into the pie segments. Essentially, there is a pie chart view (“PieChartViewController”) allowing the user to see the information regarding to their inventory list. This portion of implementing the class API was extremely difficult and confusing which will be discussed further below.

-----**Features Implemented**-----

✴ Enable user to create an inventory list (Only one inventory list)
  • Features include add item to the inventory list and input the details of that
particular item including name of item, item identifier, number of item(s), item
price, item category, and expiration date

✴ Enable user edit or update a particular item within the inventory list
  • Feature include access of items within inventory individually through the navigation controller and table view controller, allowing user to edit each item on the quantity.

✴ Enable user to delete item
  • Feature include delete button to remove the item from inventory list, which is
accessed through navigation controller and table view controller

✴ Enable user to check or view the status of inventory
  • Features include browsing items in the inventory list, as well as, a view of pie chart displaying the percentage or amount of inventory stock of each item relative to other items

  ✴ Enable user to setup notification on each item in the inventory list • Feature include setting notification of item expiration date notice
