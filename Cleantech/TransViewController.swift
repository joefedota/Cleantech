//
//  TransViewController.swift
//  Cleantech
//
//  Created by Joseph Fedota on 4/24/20.
//  Copyright © 2020 23O2 Automatic. All rights reserved.
//

import UIKit

class TransViewController: UIViewController {
    
    var stateController : StateController?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stateController = appDelegate.stateController
        // Do any additional setup after loading the view.
    }
    
    @IBAction func transactio(_ sender: Any) {
        self.stateController?.trans = true
        performSegue(withIdentifier: "backsegue", sender: self)
    }
    
    /*@IBAction func transaction(_ sender: Any) {
        self.stateController?.trans = true
        performSegue(withIdentifier: "backsegue", sender: self)
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
