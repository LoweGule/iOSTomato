//
//  RegisterViewController.swift
//  FinProLabMMS
//
//  Created by prk on 10/01/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var Usrnametxt: UITextField!
    @IBOutlet weak var Namatxt: UITextField!
    @IBOutlet weak var Passwordtxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func RegisterButton(_ sender: UIButton) {
        if Namatxt.text == "" || Usrnametxt.text == "" || Passwordtxt.text == ""
            {
                let alert = UIAlertController(title: "Information", message: "Its Mandatort to enter all the fields", preferredStyle: .alert)

                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

                alert.addAction(ok)
                alert.addAction(cancel)

                self.present(alert, animated: true, completion: nil)

            }

            else
            {
                let app = UIApplication.shared.delegate as! AppDelegate

                let context = app.persistentContainer.viewContext

                let new_user = NSEntityDescription.insertNewObject(forEntityName: "DataPembeli", into: context)

                new_user.setValue(Namatxt.text, forKey: "nama")
                new_user.setValue(Usrnametxt.text, forKey: "username")
                new_user.setValue(Passwordtxt.text, forKey: "password")

                do
                {
                    try context.save()
                    print("Registered  Sucessfully")
                }
                catch
                {
                    let Fetcherror = error as NSError
                    print("error", Fetcherror.localizedDescription)
                }
            }

            self.navigationController?.popViewController(animated: true)
    }
    
}
