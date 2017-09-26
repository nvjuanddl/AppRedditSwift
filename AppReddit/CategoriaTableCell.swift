//
//  CategoriaTableCell.swift
//  AppReddit
//
//  Created by Mobile App on 24/09/17.
//  Copyright © 2017 nvjuanddl. All rights reserved.
//

import Foundation
import UIKit

class CategoriaTableCell: UITableViewCell {
    
    @IBOutlet weak var nombreCategoriaLabel: UILabel!
    
    func configurateTheCell(_ categoria: Categoria) {
        self.nombreCategoriaLabel?.text = categoria.nombreCategoria
        animations()
    }
    
    func animations(){
        self.nombreCategoriaLabel.center.x  -= bounds.width
        UIView.animate(withDuration:0.9,delay:0.1,options:[],animations:{self.nombreCategoriaLabel.center.x+=self.bounds.width},completion:nil)
    }
    
}
