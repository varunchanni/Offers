//
//  FindDealsViewController.swift
//  DealsApp
//
//  Created by Varun Channi on 20/06/17.
//  Copyright © 2017 Nagarro. All rights reserved.
//

import UIKit

class FindDealsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getAllUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAllUsers() {
        APIManager.shared.requestWithURL(ServiceAPI.getUsers, ofType: .get, withParameters: nil) { (success, data, error) in
            print(data)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
