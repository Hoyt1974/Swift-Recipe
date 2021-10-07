//
//  RecipeDetailView.swift
//  Recipe App
//
//  Created by Jason Hoyt on 10/7/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
            
                
                // Mark: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                
                // Mark: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text("-" + item)
                    }
                }
                .padding(.horizontal)
                
                
                //Mark: Divider
                Divider()
                
                //Mark: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ", " + recipe.directions[index])
                            .padding([.bottom, .top], 5)
                    }
                }
            }
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
