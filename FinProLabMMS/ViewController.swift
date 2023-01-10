//
//  ViewController.swift
//  FinProLabMMS
//
//  Created by prk on 10/01/23.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var UsrNmLogintxt: UITextField!
    @IBOutlet weak var PwLogintxt: UITextField!
    
    var result = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func Login(_ sender: UIButton) {
        if UsrNmLogintxt.text == "" && PwLogintxt.text == ""
        {
            let alert = UIAlertController(title: "Information", message: "Please enter all the fields", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            
            self.CheckForUserNameAndPasswordMatch(username : UsrNmLogintxt.text! as String, password : PwLogintxt.text! as String)
            
        }
    }
    
    func CheckForUserNameAndPasswordMatch( username: String, password : String)
    {
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DataPembeli")
        
        let predicate = NSPredicate(format: "username = %@", username)
        
        fetchrequest.predicate = predicate
        do
        {
            result = try context.fetch(fetchrequest) as NSArray
            print (result.count)
            
            if result.count>0
            {
                let objectentity = result.firstObject as! PembeliData
                print("Username: \(objectentity.username)")
                print("Password: \(objectentity.password)")
                print("username: \(username)")
                print("username: \(password)")
                
                if objectentity.username == username && objectentity.password == password
                {
                    print("Login Succesfully")
                }
                else
                {
                    print("Wrong username or password !!!")
                }
            }
        }
        
        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
    }
}
