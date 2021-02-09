//
//  ChatViewController.swift
//  zapEfron
//
//  Created by Juliana Prado on 25/01/21.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages(){
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
            
            self.messages = []
            
            if let err = error{
                print(err)
            } else{
                if let snapshotDocumnts = querySnapshot?.documents{
                    for doc in snapshotDocumnts{
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let err = error {
                    print(err)
                } else {
                    print("Saved Successfully.")
                    self.messageTextfield.text = ""
                }
            }
        }
        
    }
    
    @IBAction func logOutPressed(_sender: UIBarButtonItem){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
}

//MARK: - EXTENSION: UITableViewDataSource
extension ChatViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let name = message.sender.prefix(1)
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! TableViewCell
        cell.label.text = message.body
        //Message from the user
        if message.sender == Auth.auth().currentUser?.email{
            cell.leftView.isHidden = true
            cell.rightView.isHidden = false
            cell.rightNameLabel.text = String(name)
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.pink)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPink)
            cell.messageBubble.layer.cornerRadius = 20
            cell.messageBubble.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMinXMaxYCorner]
        } else { //Message from someone else
            cell.leftView.isHidden = false
            cell.rightView.isHidden = true
            cell.leftNameLabel.text = String(name)
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightGray)
            cell.label.textColor = UIColor(named: K.BrandColors.gray)
            cell.messageBubble.layer.cornerRadius = 20
            cell.messageBubble.layer.maskedCorners = [ .layerMaxXMinYCorner,  .layerMinXMinYCorner, .layerMaxXMaxYCorner]
            
        }
        
     
        return cell
        
    }
}
