//
//  TheTableViewController.swift
//  MyFirstTableViewProject
//
//  Created by Jeroen de Bie on 09/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import UIKit


class TheTableViewController: UITableViewController {
    
    var shoppingItemArray: [ShoppingItem] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var textFieldPlace: UITextField!
    
    @IBOutlet weak var priceOutlet: UITextField!
    
    @IBAction func Tap(_ sender: UITapGestureRecognizer) {
        textFieldPlace.resignFirstResponder()

    }
    
    @IBAction func addItem(_ sender: AnyObject) {
        //check if textfield and price field are empty
        if (textFieldPlace.text?.isEmpty == false || priceOutlet.text?.isEmpty == false) {
    

            //create instance of Shopping Item with values from the text and price fields
            let name = textFieldPlace.text!
            let price = (priceOutlet.text == "") ? 0.0 : Float(priceOutlet.text!)!
            
            let addNewItem = ShoppingItem.init(nameShoppingItem: name, priceShoppingItem: price)
            //insert shopping item instance addNewItem at beginning of list
            shoppingItemArray.insert(addNewItem, at: 0)
            

        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTheDataFromShoppingService()
        
        let nib = UINib(nibName: "ShoppingListTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ShoppingListTableViewCell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingItemArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ShoppingListTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as! ShoppingListTableViewCell
        
        let currentShoppingItem = shoppingItemArray [indexPath.row]
        
        cell.setDataForTableViewCell(shoppingListItem: currentShoppingItem)
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingItemArray.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func getTheDataFromShoppingService() {
        //(1)This line gets the Json Dictionary using our service data class function returning an NSDictionary
        let JSONDictionary = ShoppingItemService.getData() as NSDictionary
        
        //(2)Create an variable arrayOfDictionaries and assign it JSONDictionary
        //   Use the Key "ShoppingItems" in JSONDictionary
        //   cast it to an array:    as! NSArray
        let arrayOfDictionaries = JSONDictionary ["ShoppingItems"] as! NSArray
        
        //(3)Iterate the arrayOfDictionaries
        for shoppingItemDictionary in arrayOfDictionaries {
        
            //(4)Create a variable, assign it the value of shoppingItemDictionary
            //   Cast this using: shoppingItemDictionary as! NSDictionary
            
            let shoppingDick = shoppingItemDictionary as! NSDictionary
            
            //(5)Create a variable for name of item
            //   Assign the variable the value of the key: shoppingItem[“name”] as! String
            
            let nameItem = shoppingDick ["name"] as! String
            
            //(6)Create a variable for price of item
            //   Assign it the value of the key “price”: shoppingItem[“price”] as! Int
            
            let priceOfItem = shoppingDick ["price"] as! Float
            
            //(7)Create a variable shopItem, assign it the instance of ShoppingItem
            //   var shopItem = ShoppingItem.init… let it autocomplete
            
            let compleetItem = ShoppingItem.init(nameShoppingItem: nameItem, priceShoppingItem: priceOfItem)
            
            //(8)Append shoppingItemArray with the variable shopItem
            
            shoppingItemArray.append(compleetItem)
            
        }
    }

    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
