//
//  FavoritesList.swift
//  Fonts
//
//  Created by student on 3/17/19.
//  Copyright © 2019 Sean Klechak. All rights reserved.
//

import Foundation
import UIKit

class FavoritesList {
    static let sharedFavoritesList = FavoritesList()
    private(set) var favorites:[String]
    
    init() {
        let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    
        }
    
    func addFavorite(fontName: String) {
        if !favorites.contains(fontName) {
            favorites.append(fontName)
                saveFavorites()
            }
        }
        
        func removeFavorite(fontName: String){
            if let index = favorites.index(of: fontName) {
                favorites.remove(at: index)
                saveFavorites()
            }
        }
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = favorites[from]
        favorites.remove(at:from)
        favorites.insert(item, at: to)
        saveFavorites()
    }
    
        private func saveFavorites() {
            let defaults = UserDefaults.standard
            defaults.set(favorites, forKey: "favorites")
            defaults.synchronize()
        }
    

    }
