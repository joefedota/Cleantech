//
//  RoutingViewController.swift
//  Cleantech
//
//  Created by Joseph Fedota on 4/21/20.
//  Copyright © 2020 23O2 Automatic. All rights reserved.
//

import UIKit

class RoutingViewController: UIViewController {

    @IBOutlet weak var routeField: UITextField!
    var stateController : StateController?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stateController = appDelegate.stateController
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcRoute(_ sender: Any) {
       stateController!.setRoute(route: routeField.text!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
