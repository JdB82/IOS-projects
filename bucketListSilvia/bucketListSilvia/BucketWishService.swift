//
//  ShoppingItemService.swift
//  MyFirstTableViewProject
//
//  Created by Ben Smith on 09/02/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import Foundation

class BucketWishService {

    
//{
//    "BucketWishes": [
//        {
//        "Wish": "Parachute Springen",
//        "Place": "Texel"
//        "When": 2019
//        },
//        {
//        "Wish": "Trouwen",
//        "Place": "Leusden"
//        "When": 2019
//        },
//        {
//        "Wish": "kamperen",
//        "Place": "Italie"
//        "When": 2018
//        },
//        {
//        "Wish": "Strandjutten",
//        "Place": "Teschelling"
//        "When": 2017
//        },
//        {
//        "Wish": "Een kinderboek schrijven",
//        "Place": "Leusden"
//        "When": 2017
//        },
//        {
//        "Wish": "Het noorder ligt zien",
//        "Place": "IJsland"
//        "When": 2021
//        },
//        {
//        "Wish": "Verrassings reis schiphol",
//        "Place": "Amsterdam"
//        "When": 2018
//        },
//    ]
//}

    class func getData() -> NSDictionary {
        //Here is the escaped string...just imagine this is our data retrieved from a server! Like for real!!!
        let itemsJSONString = {
            "\"BucketWishes\":": {},
            "{": {},
            "\"Wish\":\"Parachute Springen\",": {},
            "\"Place\":\"Texel\"": {},
            "\"When\":2019": {},
            "},": {},
            "\"Wish\":\"Trouwen\",": {},
            "\"Place\":\"Leusden\"": {},
            "\"Wish\":\"kamperen\",": {},
            "\"Place\":\"Italie\"": {},
            "\"When\":2018": {},
            "},//       {": {},
            "\"Wish\":\"Strandjutten\",": {},
            "\"Place\":\"Teschelling\"": {},
            "\"When\":2017": {},
            "\"Wish\":\"Een kinderboek schrijven\",": {},
            "\"Wish\":\"Het noorder ligt zien\",": {},
            "\"Place\":\"IJsland\"": {},
            "\"When\":2021": {},
            "\"Wish\":\"Verrassings reis schiphol\",": {},
            "\"Place\":\"Amsterdam\"": {},
            "": {}
        }
        
        
        return itemsJSONString.parseJSONString as! NSDictionary
    }
}

//The clever parsed, it deserialises the JSON, don't worry about it too much lot of complicated things here
extension String {
    
    var parseJSONString: AnyObject? {
        
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        if let jsonData = data {
            do {
                let message = try JSONSerialization.jsonObject(with: jsonData, options:.mutableContainers)
                return message as AnyObject?
            }
            catch let error as NSError
            {
                print("An error occurred: \(error)")
                return nil
            }
            
            // Will return an object or nil if JSON decoding fails
        } else {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
}
