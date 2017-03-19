//
//  ViewController.swift
//  iWallet
//
//  Created by Pedro3293 on 17/3/17.
//  Copyright © 2017 Pedro3293. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var añadirButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    
    //Máximo de 2 cuentas
    var cont : Int = 0
    
    //Creamos un array de wallet para ir almacenando
    var Wallets : [Wallet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Cambia el color de fondo de la tabla
        self.tableView.backgroundColor = #colorLiteral(red: 1, green: 0.7960784314, blue: 0.6431372549, alpha: 1)
        
        //Cambia el color de la linea separadora
        self.tableView.separatorColor = UIColor(colorLiteralRed: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.0)
        
        
        //Rellenar el array con datos estandar
        var wallet = Wallet(name: "", money: 0, id: 0)
        Wallets.append(wallet)
        
        wallet = Wallet(name: "", money: 0, id: 1)
        Wallets.append(wallet)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Accion del botón añadir para comprobar si esta permitido o no
    @IBAction func addAction(_ sender: UIButton) {
        
    }
    
    


}

extension ViewController : UITableViewDataSource {
    
    //PARA DECIDIR CUANTAS SECCIONES TIENE LA TABLA
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //PARA DECIDIR CUANTAS FILAS TIENE CADA SECCIÓN
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Wallets.count
    }
    
    //PARA ASIGNAR LOS DATOS AL CELL PARA QUE SE MUESTREN EN LA TABLA
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wallet = Wallets[indexPath.row]
        let cellID = "WalletCell"
        
        //DEQUEUEREUSABLE -> Para que reasignar cada celda de forma que cuando una se deje de ver se vea otra reutilizandola
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! WalletCell
        
        ///Aqui cambiamos el color de las celdas usadas
        cell.backgroundColor = #colorLiteral(red: 1, green: 0.7960784314, blue: 0.6431372549, alpha: 1)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if self.Wallets[indexPath.row].name != "" {
            cell.thumbnailImage.image = wallet.image
            cell.nameLabel.text = wallet.name
            cell.moneyLabel.text = "\(wallet.money) €"
            
        }
        else{
            cell.isHidden = true
        }
        return cell
        
    }

    
}

extension ViewController : UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addaccount" {
            
            //Mando al AddViewController los datos para que cree una nueva cuenta y controlo hasta que llegue a 2
            let walletx = self.Wallets[cont]
            let walletTable = self.tableView
            let walletCont = self.cont
            let destinationViewController = segue.destination as! AddViewController
            destinationViewController.wallet = walletx
            destinationViewController.tableView = walletTable
            destinationViewController.cont = walletCont
            self.cont += 1
            if cont == 2{
                self.añadirButton.isHidden = true
            }
            
        }
        if segue.identifier == "showwalletdetail" {
            
            //Mando al showDetailViewController los datos para ver los detalles de dicha cuenta
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedWallet = self.Wallets[indexPath.row]
                let destinationViewController = segue.destination as! showDetailViewController
                destinationViewController.wallet = selectedWallet
            }
                
            
        }
        
    }
    
}

