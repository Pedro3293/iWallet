//
//  showDetailViewController.swift
//  iWallet
//
//  Created by Pedro3293 on 17/3/17.
//  Copyright © 2017 Pedro3293. All rights reserved.
//

import UIKit

class showDetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var moneyLabel: UILabel!
    
    @IBOutlet var addButton: UIButton!
    
    @IBOutlet var minButton: UIButton!
    
    var wallet : Wallet!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = self.wallet.name
        self.moneyLabel.text = "\(self.wallet.money) €"
        

        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension showDetailViewController : UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addquantity" {
            let sendQuantity = self.wallet.money
            let sendText = "Introduzca la cantidad a añadir"
            let destinationViewController = segue.destination as! changequantityViewController
            destinationViewController.quantity = sendQuantity
            destinationViewController.text = sendText
            destinationViewController.id = 0
            
        }
        
        if segue.identifier == "minquantity" {
            let sendquantity = self.wallet.money
            let sendText = "Introduzca la cantidad a sustraer"
            let destinationViewController = segue.destination as! changequantityViewController
            destinationViewController.quantity = sendquantity
            destinationViewController.text = sendText
            destinationViewController.id = 1
            
        }
        
    }
}



