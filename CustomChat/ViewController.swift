//
//  ViewController.swift
//  CustomChat
//
//  Created by Umair Afzal on 2/13/18.
//  Copyright © 2018 Umair Afzal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openChatTaped(_ sender: Any) {
        let chatViewController = CustomChatViewController()
        self.navigationController?.pushViewController(chatViewController, animated: true)
    }
    
}
