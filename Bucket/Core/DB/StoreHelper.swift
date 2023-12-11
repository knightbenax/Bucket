//
//  StoreHelper.swift
//  Bucket
//
//  Created by Bezaleel Ashefor on 07/12/2023.
//

import Foundation
import CoreData
import UIKit

class StoreHelper{
    
    func clearAuthCD(delegate : AppDelegate){
        let context:NSManagedObjectContext = delegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Auth")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
        } catch let error as NSError {
            // TODO: handle the error
            print("Couldn't delete shit \(error), \(error.userInfo)")
        }
    }
    
    func clearUserCD(delegate : AppDelegate){
        let context:NSManagedObjectContext = delegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
        } catch let error as NSError {
            // TODO: handle the error
            print("Couldn't delete shit \(error), \(error.userInfo)")
        }
    }
    
    
    func savePlayer(delegate : AppDelegate, player : Player){
        let managedContext = delegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "PlayerCD", in: managedContext)
        let call = NSManagedObject(entity: entity!, insertInto: managedContext)
        call.setValue(player.name, forKey: "name")
        call.setValue(player.address, forKey: "address")
        call.setValue(player.dob, forKey: "dob")
        call.setValue(player.email, forKey: "email")
        call.setValue(player.id, forKey: "id")
        call.setValue(player.phone, forKey: "phone")
        call.setValue(Date(), forKey: "date_added")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Couldn't save shit \(error), \(error.userInfo)")
        }
    }
    
    
    func getPlayers(delegate : AppDelegate) -> [Player] {
        var temp : [NSManagedObject] = []
        var players : [Player] = []
        
        let managedContext = delegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PlayerCD")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date_added", ascending: false)]
        
        do {
            try temp = managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Couldn't retrieve shit \(error), \(error.userInfo)")
        }
        
        temp.forEach({
            players.append(
                Player(
                    name: $0.value(forKey: "name") as! String,
                    dob: $0.value(forKey: "date") as! String,
                    address: $0.value(forKey: "name") as! String,
                    phone: $0.value(forKey: "name") as! Double,
                    email: $0.value(forKey: "name") as! String,
                    id: $0.value(forKey: "name") as! UUID))
            
        })
        
        return players
    }
    
}
