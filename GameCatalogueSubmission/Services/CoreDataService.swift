//
//  CoreDataService.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 13/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import CoreData
import SwiftUI

extension Favorite: Identifiable {}

class CoreDataService {
    
    func saveData(id: Int, name: String, rating: Double, backgroundImage: String, releasedDate: String) {
        
        if let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            guard let userEntity = NSEntityDescription.entity(forEntityName: K.entityName, in: managedContext) else { return }
            
            let insert = NSManagedObject(entity: userEntity, insertInto: managedContext)
            insert.setValue(id, forKey: K.idFavorite)
            insert.setValue(name, forKey: K.nameFavorite)
            insert.setValue(rating, forKey: K.ratingFavorite)
            insert.setValue(backgroundImage, forKey: K.bgImageFavorite)
            insert.setValue(releasedDate, forKey: K.releasedDateFavorite)
            
            do {
                try managedContext.save()
            } catch let error {
                print(error)
            }
        }
    }
    
}
