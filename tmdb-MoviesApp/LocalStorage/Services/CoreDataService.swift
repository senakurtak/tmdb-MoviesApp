
//
//  CoreDataHandler.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 28.12.2022.
//
import Foundation
import UIKit
import CoreData

final class CoreDataHandler : DataService{
    
    var savedArr = [Movie]()
    
    
    static let shared = CoreDataHandler()
    
    var fetchResults: [Movie] = []
    
    
    // MARK: Set Movie as favorite
    func saveLocalData(movie: Movie) {
        let container = NSPersistentContainer(name: "Movies")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        
        let entity = NSEntityDescription.entity(forEntityName: "Movies", in: container.viewContext)!
        let item = NSManagedObject(entity: entity, insertInto: container.viewContext)
        
        item.setValuesForKeys([
            "backdropPath" : movie.backdropPath as Any,
            "id" : movie.id,
            "overview": movie.overview ,
            "popularity" : movie.popularity,
            "posterPath" : movie.posterPath as Any,
            "releaseDate" : movie.releaseDate as Any,
            "title" : movie.title,
            "voteAverage": movie.voteAverage
        ])
        do {
            try container.viewContext.save()
        } catch {
            print(error)
        }
    }
    
    // MARK: Remove Movie from favorites
    func deleteLocaleData(movie: Movie) {
        let container = NSPersistentContainer(name: "Movies")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        let fetchRequest = NSFetchRequest<Movies>(entityName: "Movies")
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let objects = try! container.viewContext.fetch(fetchRequest)
        for obj in objects{
            if obj.id == movie.id{
                container.viewContext.delete(obj)
                if let index = savedArr.firstIndex(where: {$0.id == obj.id}){
                    savedArr.remove(at: index)
                }
            }
        }
        do {
            try container.viewContext.save()
        } catch {
            print(error)
        }
    }
    
    // MARK: Fetch Favorite Movie from saved RealmServices
    func fetchLocalData() -> [Movie] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        let container = NSPersistentContainer(name: "Movies")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        do{
            self.fetchResults = try container.viewContext.fetch(fetchRequest).map({ item in
                Movie(backdropPath: item.value(forKey: "backdropPath") as? String,
                      id: item.value(forKey: "id") as! Int,
                      overview: item.value(forKey: "overview") as! String,
                      popularity: item.value(forKey: "popularity") as! Double,
                      posterPath: item.value(forKey: "posterPath") as? String,
                      releaseDate: item.value(forKey: "releaseDate") as? String,
                      title: item.value(forKey: "title") as! String,
                      voteAverage: item.value(forKey: "voteAverage") as! Double)
            })
                
        } catch {
            print(error)
        }
        return fetchResults
    }
}

