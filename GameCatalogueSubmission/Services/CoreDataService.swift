//
//  CoreDataService.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 13/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import CoreData
import SwiftUI

class CoreDataService {
    
    static var instance = CoreDataService()
    
    func fetchData(completion: @escaping ([FavoriteModel]) -> ()) {
        
        var favorites = [FavoriteModel]()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: K.entityName)
            
            do {
                let result = try managedContext.fetch(fetchRequest) as? [NSManagedObject]
                
                result?.forEach { (favorite) in
                    favorites.append(
                        FavoriteModel(id: favorite.value(forKey: K.idFavorite) as! Int,
                                      name: favorite.value(forKey: K.nameFavorite) as! String
                        )
                    )
                }
                
                completion(favorites)
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    func saveData(id: Int, name: String) {
                       
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            guard let userEntity = NSEntityDescription.entity(forEntityName: K.entityName, in: managedContext) else { return }
            
            let insert = NSManagedObject(entity: userEntity, insertInto: managedContext)
            insert.setValue(id, forKey: K.idFavorite)
            insert.setValue(name, forKey: K.nameFavorite)
                        
            do {
                try managedContext.save()
            } catch let error {
                print(error)
            }
        }
        
    }
    
    func deleteData(id: Int) {
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: K.entityName)
            fetchRequest.predicate = NSPredicate(format: "id = %@", id)
            
            do {
                let dataToDelete = try managedContext.fetch(fetchRequest)[0] as! NSManagedObject
                managedContext.delete(dataToDelete)
                
                try managedContext.save()
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}
