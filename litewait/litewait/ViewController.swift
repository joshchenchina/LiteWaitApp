//
//  ViewController.swift
//  litewait
//
//  Created by Yizhong Chen on 10/3/18.
//  Copyright © 2018 dumplingNinjas. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var data: [String] = []
    var ref:DatabaseReference?
    
    var postData = [String]()
    var databaseHandle:DatabaseHandle?

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseIdentifier") as! NewTableViewCell
        let text = data[indexPath.row]
        cell.imageContainer.image = UIImage(named: "sushi")
        cell.RestaurantLabel.text = "Joy Sushi"
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        /*
        ref?.child("Restaurant").observe(.childAdded, with: { (<#DataSnapshot#>) in
            //When a child is added under Restaurant
            //Take the value and put it in postData array
            //let post = DataSnapshot.value as? String
            let post = DataSnapshot.value(forKey: <#T##String#>)
            if let actualPost = post {
                //Append the data to our post String Array
                self.postData.append(actualPost as! String)
                
                //Reload the Tableview
                self.tableView.reloadData()
    
            }
        })*/
        
        for i in 0...1000 {
            data.append("\(i)")
        }
        
        tableView.dataSource = self
        
        let newcellNib = UINib(nibName: "NewTableViewCell", bundle: nil)
        tableView.register(newcellNib, forCellReuseIdentifier: "ReuseIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


}

