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
    
    func editMatch(delegate : AppDelegate, match : Match){
        let managedContext = delegate.persistentContainer.viewContext
        let matchesFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MatchCD")
        matchesFetchRequest.predicate = NSPredicate(format: "id == %@", "\(match.id)")
        var matches : [NSManagedObject] = []
        
        do {
            try matches = managedContext.fetch(matchesFetchRequest)
            matches.forEach({
                $0.setValue(match.firstPlayer, forKey: "firstPlayer")
                $0.setValue(match.secondPlayer, forKey: "secondPlayer")
                $0.setValue(match.firstPlayerName, forKey: "firstPlayerName")
                $0.setValue(match.secondPlayerName, forKey: "secondPlayerName")
                $0.setValue(match.firstPlayerScore, forKey: "firstPlayerScore")
                $0.setValue(match.secondPlayerScore, forKey: "secondPlayerScore")
                $0.setValue(match.firstThreePoint, forKey: "firstThreePoint")
                $0.setValue(match.secondThreePoint, forKey: "secondThreePoint")
                $0.setValue(match.firstTwoPoint, forKey: "firstTwoPoint")
                $0.setValue(match.secondTwoPoint, forKey: "secondTwoPoint")
                $0.setValue(match.firstBlockPoint, forKey: "firstBlock")
                $0.setValue(match.secondBlockPoint, forKey: "secondBlock")
                $0.setValue(match.firstFoulPoint, forKey: "firstFoul")
                $0.setValue(match.secondFoulPoint, forKey: "secondFoul")
                $0.setValue(match.seeded, forKey: "seeded")
                $0.setValue(match.ended, forKey: "ended")
                $0.setValue(match.seedPosition, forKey: "seedPosition")
                $0.setValue(match.stage.rawValue, forKey: "stage")
            })
            try managedContext.save()
        } catch let error as NSError {
            print("Couldn't edit shit \(error), \(error.userInfo)")
        }
    }
    
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
        call.setValue(match.firstTwoPoint, forKey: "firstTwoPoint")
        call.setValue(match.secondTwoPoint, forKey: "secondTwoPoint")
        call.setValue(match.firstBlockPoint, forKey: "firstBlock")
        call.setValue(match.secondBlockPoint, forKey: "secondBlock")
        call.setValue(match.firstFoulPoint, forKey: "firstFoul")
        call.setValue(match.secondFoulPoint, forKey: "secondFoul")
        call.setValue(match.seeded, forKey: "seeded")
        call.setValue(match.ended, forKey: "ended")
        call.setValue(match.seedPosition, forKey: "seedPosition")
        call.setValue(match.stage.rawValue, forKey: "stage")
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
    
    
    func getMatches(delegate : AppDelegate, stage: MATCH_TYPE) -> [Match] {
        var temp : [NSManagedObject] = []
        var matches : [Match] = []
        
        let managedContext = delegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MatchCD")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date_added", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "stage == %i", stage.rawValue)
        
        do {
            try temp = managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Couldn't retrieve shit \(error), \(error.userInfo)")
        }
        
        temp.forEach({
            matches.append(
                Match(firstPlayer: $0.value(forKey: "firstPlayer") as! UUID,
                      secondPlayer: $0.value(forKey: "secondPlayer") as! UUID,
                      firstPlayerName: $0.value(forKey: "firstPlayerName") as! String,
                      secondPlayerName: $0.value(forKey: "secondPlayerName") as! String,
                      firstPlayerScore: $0.value(forKey: "firstPlayerScore") as! Int,
                      secondPlayerScore: $0.value(forKey: "secondPlayerScore") as! Int,
                      firstThreePoint: $0.value(forKey: "firstThreePoint") as! Int,
                      secondThreePoint: $0.value(forKey: "secondThreePoint") as! Int,
                      firstTwoPoint: $0.value(forKey: "firstTwoPoint") as! Int,
                      secondTwoPoint: $0.value(forKey: "secondTwoPoint") as! Int,
                      firstFoulPoint: $0.value(forKey: "firstFoul") as! Int,
                      secondFoulPoint: $0.value(forKey: "secondFoul") as! Int,
                      firstBlockPoint: $0.value(forKey: "firstBlock") as! Int,
                      secondBlockPoint: $0.value(forKey: "secondBlock") as! Int,
                      stage: MATCH_TYPE(rawValue: $0.value(forKey: "stage") as! Int) ?? .FIRSTROUND,
                      seeded: $0.value(forKey: "seeded") as! Bool, 
                      seedPosition: $0.value(forKey: "seedPosition") as! Int,
                      ended: $0.value(forKey: "ended") as? Bool ?? false,
                      id: $0.value(forKey: "id") as! UUID)
            )
        })
        
        return matches
    }
    
    
    func getUnSeededMatches(delegate : AppDelegate, stage: MATCH_TYPE, seeded : Bool) -> [Match] {
        var temp : [NSManagedObject] = []
        var matches : [Match] = []
        
        let managedContext = delegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MatchCD")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date_added", ascending: true)]
        //fetchRequest.predicate = NSPredicate(format: "stage == %i", stage.rawValue)
        
        let stagePredicate = NSPredicate(format: "stage == %i", stage.rawValue)
        let seededPredicate = NSPredicate(format: "seeded = %d", seeded)
        let andPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [stagePredicate, seededPredicate])
        fetchRequest.predicate = andPredicate
        
        do {
            try temp = managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Couldn't retrieve shit \(error), \(error.userInfo)")
        }
        
        temp.forEach({
            matches.append(
                Match(firstPlayer: $0.value(forKey: "firstPlayer") as! UUID,
                      secondPlayer: $0.value(forKey: "secondPlayer") as! UUID,
                      firstPlayerName: $0.value(forKey: "firstPlayerName") as! String,
                      secondPlayerName: $0.value(forKey: "secondPlayerName") as! String,
                      firstPlayerScore: $0.value(forKey: "firstPlayerScore") as! Int,
                      secondPlayerScore: $0.value(forKey: "secondPlayerScore") as! Int,
                      firstThreePoint: $0.value(forKey: "firstThreePoint") as! Int,
                      secondThreePoint: $0.value(forKey: "secondThreePoint") as! Int,
                      firstTwoPoint: $0.value(forKey: "firstTwoPoint") as! Int,
                      secondTwoPoint: $0.value(forKey: "secondTwoPoint") as! Int,
                      firstFoulPoint: $0.value(forKey: "firstFoul") as! Int,
                      secondFoulPoint: $0.value(forKey: "secondFoul") as! Int,
                      firstBlockPoint: $0.value(forKey: "firstBlock") as! Int,
                      secondBlockPoint: $0.value(forKey: "secondBlock") as! Int,
                      stage: MATCH_TYPE(rawValue: $0.value(forKey: "stage") as! Int) ?? .FIRSTROUND,
                      seeded: $0.value(forKey: "seeded") as! Bool,
                      seedPosition: $0.value(forKey: "seedPosition") as! Int,
                      ended: $0.value(forKey: "ended") as? Bool ?? false,
                      id: $0.value(forKey: "id") as! UUID)
            )
        })
        
        return matches
    }
    
}
