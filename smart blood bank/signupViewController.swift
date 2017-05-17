//
//  signupViewController.swift
//  smart blood bank
//
//  Created by Syed Shahrukh Haider on 04/05/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class signupViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var bType: UISegmentedControl!
  
    var ref: FIRDatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()

        // Do any additional setup after loading the view.
    }


    @IBAction func submitButton(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: userText.text!, password: passText.text!, completion: { (user, error) in
            
            if user != nil{
                
            self.detail()
                self.performSegue(withIdentifier: "enteringSegue", sender: self)
                

            }
                
            else{
                
                print("\(error)")
            }
        })
        
       
    }
    
    func detail(){
        var name = userText.text!.components(separatedBy: "@")
        var categoryVal: String
        var bloodType: String
        
        // Determine Category:
        switch categorySegment.selectedSegmentIndex {
        case 0:
            categoryVal = "Donor"
        default:
            categoryVal = "Recipient"
        }
        
        switch bType.selectedSegmentIndex {
        case 0:
            bloodType = "O+"
        case 1:
            bloodType = "O-"
        case 2:
            bloodType = "A+"
        case 3:
            bloodType = "A-"
        case 4:
            bloodType = "B+"
        case 5:
            bloodType = "B-"
        case 6:
            bloodType = "AB+"
        default:
            bloodType = "AB-"
        }
        
        print(bloodType)
        
        ref?.child("Record").child(name[0]).child("name").setValue(name[0])
        ref?.child("Record").child(name[0]).child("age").setValue(ageText.text!)
        ref?.child("Record").child(name[0]).child("category").setValue(categoryVal)
         ref?.child("Record").child(name[0]).child("blood").setValue(bloodType)

    }



}
