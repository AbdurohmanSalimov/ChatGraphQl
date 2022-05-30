//
//  HomeVC.swift
//  ChatGraphQl
//
//  Created by Azizbek Salimov on 30.05.2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTableView()
     
    }
    func sendMessage(message: String, id: Int){
        Network.shared.apollo.perform(mutation: WriteMessageMutation(message: message, userID: id)) { result in
            switch result {
            case .success(let res):
                print("ketti sms")
            case.failure(let error):
                print(error)
            }
        
            
        }
    }

    

}


extension HomeVC: UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate {
    func delegateTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        txtField.delegate = self
        tableView.register(UINib(nibName: "TVC", bundle: nil), forCellReuseIdentifier: "TVC")
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVC", for: indexPath) as? TVC else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //sendMessage(message: txtField.text, id: )
        return true
    }
}
