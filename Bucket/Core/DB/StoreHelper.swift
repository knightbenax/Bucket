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
    
    func clearPlayers(delegate : AppDelegate){
        let context:NSManagedObjectContext = delegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "PlayerCD")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
        } catch let error as NSError {
            // TODO: handle the error
            print("Couldn't delete shit \(error), \(error.userInfo)")
        }
    }
    
    func clearMatches(delegate : AppDelegate){
        let context:NSManagedObjectContext = delegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "MatchCD")
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
    
    
//    var firstPlayer : UUID
//    var secondPlayer : UUID
//    var firstPlayerName : String
//    var secondPlayerName : String
//    var firstPlayerScore : Int
//    var secondPlayerScore : Int
//    var firstThreePoint : Int
//    var secondThreePoint : Int
//    var firstTwoPoint : Int
//    var secondTwoPoint : Int
//    var firstFoulPoint : Int
//    var secondFoulPoint : Int
//    var firstBlockPoint : Int
//    var secondBlockPoint : Int
//    var stage : MATCH_TYPE
//    var seeded : Bool
//    var id = UUID()
    
    func saveMatch(delegate : AppDelegate, match : Match){
        let managedContext = delegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MatchCD", in: managedContext)
        let call = NSManagedObject(entity: entity!, insertInto: managedContext)
        call.setValue(match.id, forKey: "id")
        call.setValue(match.firstPlayer, forKey: "firstPlayer")
        call.setValue(match.secondPlayer, forKey: "secondPlayer")
        call.setValue(match.firstPlayerName, forKey: "firstPlayerName")
        call.setValue(match.secondPlayerName, forKey: "secondPlayerName")
        call.setValue(match.firstPlayerScore, forKey: "firstPlayerScore")
        call.setValue(match.secondPlayerScore, forKey: "secondPlayerScore")
        call.setValue(match.firstThreePoint, forKey: "firstThreePoint")
        call.setValue(match.secondThreePoint, forKey: "secondThreePoint")
        call.setValue(Date(), forKey: "date_added")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Couldn't save shit \(error), \(error.userInfo)")
        }
    }
    
    func saveStat(delegate : AppDelegate, stat : Stat){
        let managedContext = delegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "StatsCD", in: managedContext)
        let call = NSManagedObject(entity: entity!, insertInto: managedContext)
        call.setValue(stat.value, forKey: "value")
        call.setValue(stat.id, forKey: "id")
        call.setValue(stat.owner, forKey: "owner")
        call.setValue(stat.matchID, forKey: "matchID")
        call.setValue(stat.type.rawValue, forKey: "type")
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
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date_added", ascending: true)]
        
        do {
            try temp = managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Couldn't retrieve shit \(error), \(error.userInfo)")
        }
        
        temp.forEach({
            players.append(
                Player(
                    name: $0.value(forKey: "name") as! String,
                    dob: $0.value(forKey: "dob") as! String,
                    address: $0.value(forKey: "address") as! String,
                    phone: $0.value(forKey: "phone") as! Double,
                    email: $0.value(forKey: "email") as! String,
                    id: $0.value(forKey: "id") as? UUID))
            
        })
        
        return players
    }
    
}
