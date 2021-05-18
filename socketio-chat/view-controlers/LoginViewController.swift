//
//  ViewController.swift
//  socketio-chat
//
//  Created by Leonardo da Silva Menezes on 13/05/21.
//  Copyright © 2021 Leonardo da Silva Menezes. All rights reserved.
//

import UIKit
import SocketIO


class ViewController: UIViewController {
    

@IBOutlet weak var passwordField: UITextField!
@IBOutlet weak var loginButton: UIButton!
@IBOutlet weak var registerButton: UIButton!
@IBOutlet weak var usernameField: UITextField!
    
let manager = SocketManager(socketURL: URL(string: "http://localhost:5000")!, config: [.log(true), .compress])
    
    
override func viewDidLoad() {
    super.viewDidLoad()
    let socket = manager.defaultSocket
    socket.on(clientEvent: .connect) {data, ack in
        print(data)
    }
    
    
    socket.on("welcome") { data , ack in
        print(data)
    }
    
    socket.connect()
    
}
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "rooms", sender: nil)
    }

}
