//
//  RegisterVC.swift
//  Habit
//
//  Created by user1 on 29/04/22.
//

import UIKit
import TransitionButton

class RegisterVC: UIViewController {

    @IBOutlet weak var authorization: UILabel!
    
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var usernameTf: UITextField!
    @IBOutlet weak var flagImage: UIImageView!
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var langBtn: UIButton!
    override func viewDidLoad() {
            super.viewDidLoad()


            }


    @IBAction func registrTapped(_ sender: Any) {
        registerUsername(name: usernameTf.text!, password: passwordTf.text!)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func langTapped(_ sender: Any) {
    }
    @IBAction func skipTapped(_ sender: Any) {
       
    }
    
    func registerUsername(name: String , password: String) {
        Network.shared.apollo.perform(mutation: RegistrationMutation(userName: name, password: password, deviceID: <#String#>) ) { result in
            
            switch result {
            case .success(let resultGraphQL):
                if let info = resultGraphQL.data?.signUp {
                    print("signed up wit user id", info.id , "   and name", info.name)
                } else {
                    print { resultGraphQL.errors}
                }
            case .failure(let errors):
                print(errors)
            }
        }
    }
}
