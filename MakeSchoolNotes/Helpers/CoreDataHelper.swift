//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Scott P. Chow on 6/7/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    static func newNote() -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
        return note
    }
    
    static func saveNote() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save: " + error.localizedDescription)
        }
    }
    
    static func deleteNote(note:Note) {
        managedContext.delete(note)
        saveNote()
    }
    
    static func retrieveNotes() -> [Note] {
        var results = [Note]()
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        do {
            results = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch: " + error.localizedDescription)
        }
        return results
    }
    
}
