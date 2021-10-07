//
//  RecipeModel.swift
//  Recipe App
//
//  Created by Jason Hoyt on 10/7/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        
        self.recipes = DataService.getLocalData()
        
        
        
        // Set the recipes property
        
    }
    
}
