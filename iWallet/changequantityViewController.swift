//
//  changequantityViewController.swift
//  iWallet
//
//  Created by Pedro3293 on 17/3/17.
//  Copyright © 2017 Pedro3293. All rights reserved.
//

import UIKit

class changequantityViewController: UIViewController {
    
    @IBOutlet var quantityLabel: UILabel!
    
    @IBOutlet var quantityTextField: UITextField!
    
    @IBOutlet var updateButton: UIButton!
    
    @IBOutlet var addTag: UITextField!
    
    @IBOutlet var addLabel: UILabel!
    
    var wallet : Wallet!
    
    var quantity : Double!
    
    var text : String!
    
    var id : Int!
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.quantityLabel.text = "\(quantity!) €"
        self.addLabel.text = text
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateAction(_ sender: UIButton) {
        
        if id == 0{
            if let sum = Double(quantityTextField.text!){
                quantity = quantity + sum
                
            }
        }
        
        dismiss(animated: true, completion: nil)
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
