//
//  ViewController.swift
//  smart blood bank
//
//  Created by Syed Shahrukh Haider on 04/05/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class ViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passText: UITextField!
   
    var ref : FIRDatabaseReference?
    var dbHandler : FIRDatabaseHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    @IBAction func signIn(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: userText.text!, password: passText.text!, completion: { (user, error) in
            
            if user != nil{
                
                self.getDetail()
                
                self.performSegue(withIdentifier: "signinSegue", sender: self)
              
                }
                
            else{
                
                print("\(error)")
            }
        })
    }

    func getDetail(){
    
        var userName = userText.text!.components(separatedBy: "@")

        ref = FIRDatabase.database().reference()
        dbHandler = ref?.child("Record").child(userName[0]).observe(.value, with: { (snapshot) in
            
            let post = snapshot.value as? [String:String]
            
            
            if let actualPost = post {
                
                
                // create entire database list
                
                let name = actualPost["name"]! as String
                let age = actualPost["age"]! as String
                let category = actualPost["category"]! as String
                let blood = actualPost["blood"]! as String
                
                let info: User = User(name: name, age: age, category: category, blood: blood)
                
                User.loginUser = info
                

                print("login VC\(User.loginUser)")

            }
            
            
        })
    
    
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var userName = userText.text!.components(separatedBy: "@")
//        print("view: \(userName)")
//        
//        let dest = segue.destination as! UINavigationController
//        let signinVC = dest.topViewController as! signinViewController
//        signinVC.signinName = userName[0]
//        
//        
//    }
  

}

