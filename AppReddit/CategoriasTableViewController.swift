//
//  CategoriasTableViewController.swift
//  AppReddit
//
//  Created by Mobile App on 24/09/17.
//  Copyright © 2017 nvjuanddl. All rights reserved.
//

import UIKit

public var listaApps = [DetalleApp]()

@available(iOS 10.0, *)
class CategoriasTableViewController: UITableViewController {
    let identifier: String = "categoriaTableCell"
    var rAPI = redditAPI()
    
    let color1 = UIColor(red: 246.0/255.0, green: 107.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
    let color2 = UIColor(red: 252.0/255.0, green: 131.0/255.0, blue: 100.0/255.0, alpha: 1.0).cgColor
    let color3 = UIColor(red: 255.0/255.0, green: 160.0/255.0, blue: 120.0/255.0, alpha: 1.0).cgColor
    let color4 = UIColor(red: 254.0/255.0, green: 204.0/255.0, blue: 53.0/255.0, alpha: 1.0).cgColor
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Juan", style: .done, target: self, action: nil)
        
        
        let gradientLayer = CAGradientLayer()
        let bounds = self.navigationController?.navigationBar.bounds
        gradientLayer.colors = [color1, color2, color3, color4, color4, color3, color2, color1]
        gradientLayer.frame = (self.navigationController?.navigationBar.bounds)!
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x:1, y:1)
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 16, width: (bounds?.width)!, height: (bounds?.height)!)
        self.navigationController?.navigationBar.layer.addSublayer(gradientLayer)
        self.title = "Categories"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        if #available(iOS 10.0, *) {
            initializeTheRecipes()
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    func initializeTheRecipes() {
            rAPI.DataReddit()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CategoriaTableCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? CategoriaTableCell
        cell.configurateTheCell(rAPI.categoria[indexPath.row])
        return cell!
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rAPI.categoria.count
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            rAPI.categoria.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        listaApps = rAPI.categoria[indexPath.row].App
        //rAPI.dApp.append(contentsOf: rAPI.categoria[indexPath.row].App)
    }

}
