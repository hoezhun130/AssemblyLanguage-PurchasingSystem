# AssemblyLanguage-PurchasingSystem
User Part
---------
Users will need to enter their ID(ID:M1234) and password(Password:MP1234) in order to login. If a user enters the wrong ID and password more than three times, the user cannot continue.

If successfully logged in, the user will be able to see the Main Menu page which includes five selections for users.(1.Product List, 2.Modify Cart, 3.Check Out Order, 4.Payment, 5.Exit) 

1. Product List : 
After entering the product list, the user can view the product list. Then, the program will ask the user to select a number  to add an item to the cart. Then the program will need the user to confirm to add to cart. If user input Y then user adds the item to cart successfully, if input X the program will return to Main Menu.

2. Modify Cart : 
The product which the member added into the cart will be displayed with their information such as product name, price. After that, the users will be able to make a selection. If the user enters the yes it will in order to delete  the order else  N will back to the menu.

3. Checkout Order : 
After a user adds the product to their cart, the product name, price and total payment will be displayed.The system will ask the user for any problem with the checkout list. If the user enters Y will go back to the modify cart, if no will ask users whether enter 1 to proceed to payment or 2 back to the menu.

4. Payment : 
After entering the payment page, you will be asked if there is a discount code. If the user has the discount code (AB123), it will discount 11.111% for the payment (Promotion). The Final Payment will be calculated after minus the discount.If there is no discount code, the Final Payment is then displayed and the user is asked to enter the amount to be paid. If it is not enough, it will ask for new input, if it is enough, it will return the remaining amount. Finally, the user will be asked if they want a receipt. If yes, it will show the receipt then back to the Main Menu Page. If no, it will directly show to main Menu Page

5. Exit :
 Exit the program



Admin Part
----------
Admin Login : 
Admin will need to enter their ID(ID:A1234) and password(Password:AP1234) in order to login. If successfully logged in, the user will be able to see the Main Menu page which includes two selections for admin.(1.Edit Stock, 2.Exit) 

Edit Stock : 
The admin is able to edit the stock by adding the stock details by entering the name and the price of the stock details .After finish adding the stock , it will be showing the product list with the new  editing .the program also will ask the requests for the user  (Please enter 1 to exit, 2 back to the menu )

Exit : 
Exit the program
