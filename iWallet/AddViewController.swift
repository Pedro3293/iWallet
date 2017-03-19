//
//  AñadirViewController.swift
//  iWallet
//
//  Created by Pedro3293 on 17/3/17.
//  Copyright © 2017 Pedro3293. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var nameLabel: UITextField!
    
    @IBOutlet var quantityLabel: UITextField!
    
    @IBOutlet var addButton: UIButton!
    
    
    var tableView : UITableView!
    
    var wallet : Wallet!
    
    var cont : Int!
    
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func addAction(_ sender: UIButton) {
        
        self.wallet.name = nameLabel.text!
        if let money = Double(quantityLabel.text!){
            self.wallet.money = money
            if self.cont == 1 {
                self.wallet.image = #imageLiteral(resourceName: "card")
            }
            else {
                self.wallet.image = #imageLiteral(resourceName: "notes")
                
            }
            tableView.reloadData()
            dismiss(animated: true, completion: nil)
            
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
