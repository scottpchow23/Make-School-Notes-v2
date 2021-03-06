//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Scott P. Chow on 6/7/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

class DisplayNoteViewController: UIViewController {
    var note : Note?
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        noteTitleTextField.text = note?.title ?? ""
        noteContentTextView.text = note?.content ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Save" {
            
            let note = self.note ?? CoreDataHelper.newNote()
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.modificationTime = Date() as NSDate
            CoreDataHelper.saveNote()
        }
        
    }
    @IBAction func tappedCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
