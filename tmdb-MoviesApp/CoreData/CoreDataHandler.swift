//
//  CoreDataHandler.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 28.12.2022.
//

import Foundation
import UIKit
import CoreData

final class CoreDataHandler{
    
    static let shared = CoreDataHandler()
    
    var savedArr = [Movie]()
    
    func saveToCoreData(movie: Movie){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Movies", in: context)!
        let item = NSManagedObject(entity: entity, insertInto: context)
        
        item.setValuesForKeys([
            "backdropPath" : movie.backdropPath ?? "",
            "id" : movie.id,
            "overview": movie.overview,
            "popularity" : movie.popularity,
            "posterPath" : movie.posterPath ?? "",
            "releaseDate" : movie.releaseDate,
            "title" : movie.title,
            "voteAverage": movie.voteAverage
        ])
        do {
            try context.save()
        } catch {
            print(error)
        }
        fetchData()
    }
    
    func deleteData(movie: Movie){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Movies>(entityName: "Movies")
        let sortDescriptor = NSSortDescriptor(key: "is", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let objects = try! context.fetch(fetchRequest)
        for obj in objects{
            if obj.id == movie.id{
                context.delete(obj)
                if let index = savedArr.firstIndex(where: {$0.id == obj.id}){
                    savedArr.remove(at: index)
                }
            }
        }
        do {
            try context.save()
        } catch {
            print(error)
        }
        fetchData()
    }
    
    func fetchData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        do{
            
            let fetchResults = try! context.fetch(fetchRequest)
            
            for item in fetchResults {
                
                if !savedArr.contains(where: {$0.id == item.value(forKey: "id") as! Int}){
                    
                    let savedObj = Movie(backdropPath: item.value(forKey: "backdropPath") as! String,
                                         id: item.value(forKey: "id") as! Int,
                                         overview: item.value(forKey: "overview") as! String,
                                         popularity: item.value(forKey: "popularity") as! Double,
                                         posterPath: item.value(forKey: "posterPath") as! String,
                                         releaseDate: item.value(forKey: "releaseDate") as! String,
                                         title: item.value(forKey: "title") as! String,
                                         voteAverage: item.value(forKey: "voteAverage") as! Double)
                    savedArr.append(savedObj)
                } else {
                    print("already added")
                }
                
                
            }
            
            
        } catch{
            
            print(error)
        }
        
        CoreDataHandler.shared.savedArr = savedArr
    }

}
