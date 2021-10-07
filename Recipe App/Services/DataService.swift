//
//  DataService.swift
//  Recipe App
//
//  Created by Jason Hoyt on 10/7/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathstring is not nil, otherwise
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        // Create a data object
        
        
        do {
            let data = try Data(contentsOf: url)
            
            // Decode the dat with a json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the Recipes
                return recipeData
                
            }
            catch {
                // error with parsing json
                print(error)
                
            }
           
            
           
            
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Recipe]()
        
    }
    
}
