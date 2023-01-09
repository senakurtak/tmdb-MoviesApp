//
//  RealmManager.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 9.01.2023.
//

import Foundation
import RealmSwift




final class RealmManager{
    
    func realm() -> Realm {
        do {
            return try Realm()
        } catch {
            fatalError("Failed to instantiate an Realm object with error: \(error.localizedDescription)")
        }
    }
    
    func collections() -> FavoriteMovie {
        let realm = self.realm()
        let collectionsResult = realm.objects(FavoriteMovie.self)
        if let anCollection = collectionsResult.first {
            return anCollection
        }
        
        do {
            try realm.write{
                
                realm.create(FavoriteMovie.self)
            }
        } catch {
            fatalError("Failed to create an instance of \(FavoriteMovie.self) class with error: \(error.localizedDescription)")
        }
        return realm.objects(FavoriteMovie.self).first!
    }
}
