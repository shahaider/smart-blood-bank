//
//  signinViewController.swift
//  smart blood bank
//
//  Created by Syed Shahrukh Haider on 05/05/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class signinViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

 
    @IBOutlet weak var dataTable: UITableView!
    
    
    var ref : FIRDatabaseReference?
    var dbHandler : FIRDatabaseHandle?
    
    var signinName : String!
    var actAs : String!
    var finalList = [User]()
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        dbHandler = ref?.child("Record").observe(.childAdded, with: { (snapshoot) in
            let post = snapshoot.value as? [String:String]
//            
//            print("check")
//            print(post!)
            
            if let actualPost = post {
              
                
            // create related list
                
                let name = actualPost["name"]! as String
                let age = actualPost["age"]! as String
                let category = actualPost["category"]! as String
                let blood = actualPost["blood"]! as String
                
                let info: User = User(name: name, age: age, category: category, blood: blood)
                
//                
//                if info.category != User.loginUser.category{
                
                    User.filteredUsers.append(info)
//                }
               
            // filter by suited blood type
            
        
                
            }
             print(User.filteredUsers)
//            self.matchBlood()
              self.dataTable.reloadData()
        
        })
        
       
        dataTable.delegate = self
        dataTable.dataSource = self
        
    
    }
    

    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
    return User.filteredUsers.count
    }
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        cell.nameCell.text = User.filteredUsers[indexPath.row].name
        cell.ageCell.text = User.filteredUsers[indexPath.row].age
        cell.categoryCell.text = User.filteredUsers[indexPath.row].category
        cell.bloodCell.text = User.filteredUsers[indexPath.row].blood

//        cell.nameCell.text = finalList[indexPath.row].name
//        cell.ageCell.text = finalList[indexPath.row].age
//        cell.categoryCell.text = finalList[indexPath.row].category
//        cell.bloodCell.text = finalList[indexPath.row].blood
        
        
    return cell
    
    }
    
    @IBAction func signout(_ sender: Any) {
     dismiss(animated: true, completion: nil)
    }
   
    
    // match detail function
    func matchBlood(){
    let uBlood = User.loginUser.blood
    let list = User.filteredUsers
//        print(list)
        
        /* 
DONOTE TO:

        */
 
 
        switch uBlood {
        
//  O+ == AB+,A+, B+, O+
        case  "O+":
            for loop in list{
//               print(loop)
                if (loop.blood == "AB+") || (loop.blood == "A+") || (loop.blood == "B+") || (loop.blood == "O+") {
                        self.finalList.append(loop)
                    
                }
            }
            
//  B- == AB+,AB-, B+,B-
        case  "B-":
            for loop in list{
                
                if (loop.blood == "AB+") || (loop.blood == "AB-") || (loop.blood == "B+") || (loop.blood == "B-") {
                    self.finalList.append(loop)
                }
            
            }
   
//  B+ == AB+, B+
        case  "B+":
            for loop in list{
                
                if (loop.blood == "AB+") || (loop.blood == "B+") {
                    self.finalList.append(loop)
                }
            }
        
// A- == AB+,AB-, A+,A-
        case  "A-":
            for loop in list{
                
                if (loop.blood == "AB+") || (loop.blood == "AB-") || (loop.blood == "A+") || (loop.blood == "A-") {
                    self.finalList.append(loop)
                }
            }
            
//  A+ == AB+, A+
        case  "A+":
            for loop in list{
                
                if (loop.blood == "AB+") || (loop.blood == "A+")  {
                    self.finalList.append(loop)
                }
            }
            
//  AB- == AB+, AB-
        case  "AB-":
            for loop in list{
                
                if (loop.blood == "AB+") || (loop.blood == "AB-")  {
                    self.finalList.append(loop)
                }
            }
            
//  AB+ == AB+
        case  "AB+":
            
            print(list)
            for loop in list{
                
                if loop.blood == "AB+"  {
                    self.finalList.append(loop)
                }
               
            }
        
 //  O- == ALL
        default:
            finalList = list
        }
    
    }
}
