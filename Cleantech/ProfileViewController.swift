//
//  ProfileViewController.swift
//  Cleantech
//
//  Created by Joseph Fedota on 4/24/20.
//  Copyright © 2020 23O2 Automatic. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.borderWidth = 5.0
        image.layer.masksToBounds = false
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOpacity = 1
        image.layer.shadowOffset = CGSize.zero
        image.layer.shadowRadius = 10
        image.layer.shadowPath = UIBezierPath(rect: image.bounds).cgPath
        image.layer.borderColor = UIColor.green.cgColor
        image.layer.cornerRadius = image.frame.size.width/2
        image.layer.shouldRasterize = false
        image.clipsToBounds = true
        // Do any additional setup after loading the view.
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
