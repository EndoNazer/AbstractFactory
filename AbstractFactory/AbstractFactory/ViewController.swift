//
//  ViewController.swift
//  AbstractFactory
//
//  Created by Даниил on 22/03/2019.
//  Copyright © 2019 Даниил. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let factory = VictorianFactory()
        Client.clientCode(factory: factory)
    }


}

