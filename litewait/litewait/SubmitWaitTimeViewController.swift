//
//  SubmitWaitTimeViewController.swift
//  litewait
//
//  Created by Joseph Ho on 10/18/18.
//  Copyright © 2018 dumplingNinjas. All rights reserved.
//

import UIKit

class SubmitWaitTimeViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    var waittime:Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.keyboardType = UIKeyboardType.numberPad
        textField.layer.masksToBounds = false
        textField.layer.shadowRadius = 3.0
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 1.0
        
        setupNavigationBarItems()

    }
    
    private func setupNavigationBarItems(){
        let image = UIImage(named: "NavBar")
        let titleImageView = UIImageView(image: image)
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    @IBAction func submitWaitTime(_ sender: Any) {
        waittime = Float(textField.text!)!
        performSegue(withIdentifier: "unwinds1", sender: self)
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
