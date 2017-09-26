//
//  AppsTableViewController.swift
//  AppReddit
//
//  Created by Mobile App on 24/09/17.
//  Copyright © 2017 nvjuanddl. All rights reserved.
//

import UIKit

public var app = DetalleApp(nombreCategoria: "", nombreApp: "", imagenApp: "", detalleApp: "", imagenHeader: "")

class AppsTableViewController: UITableViewController {
    
    let color1 = UIColor(red: 246.0/255.0, green: 107.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
    let color2 = UIColor(red: 252.0/255.0, green: 131.0/255.0, blue: 100.0/255.0, alpha: 1.0).cgColor
    let color3 = UIColor(red: 255.0/255.0, green: 160.0/255.0, blue: 120.0/255.0, alpha: 1.0).cgColor
    let color4 = UIColor(red: 254.0/255.0, green: 204.0/255.0, blue: 53.0/255.0, alpha: 1.0).cgColor
    
    let identifier: String = "appsTableCell"
    //var rAPI = redditAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        self.navigationController?.navigationBar.tintColor  = UIColor.white
        
        self.title = listaApps[0].nombreCategoria+" apps"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        //navigationItem.title = listaApps[0].nombreCategoria+" apps"
        //initializeTheRecipes()
    }
    
    func initializeTheRecipes() {
        //rAPI.DataReddit()
        
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AppsTableCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? AppsTableCell
        cell.configurateTheCell(listaApps[indexPath.row])
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaApps.count
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            listaApps.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        app = listaApps[indexPath.row]
    }
    
}
