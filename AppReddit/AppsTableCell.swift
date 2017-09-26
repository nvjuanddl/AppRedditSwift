//
//  AppsTableCell.swift
//  AppReddit
//
//  Created by Mobile App on 24/09/17.
//  Copyright © 2017 nvjuanddl. All rights reserved.
//

import Foundation
import UIKit

class AppsTableCell: UITableViewCell {
    
    
    @IBOutlet weak var imgAppImage: UIImageView!
    @IBOutlet weak var nombreAppLabel: UILabel!
    
    func configurateTheCell(_ detalleApp: DetalleApp) {
        self.nombreAppLabel?.text = detalleApp.nombreApp
        
        let url = NSURL(string:detalleApp.imagenApp)
        let data = NSData(contentsOf: url! as URL)
        if data != nil {
            imgAppImage.image = UIImage(data:data! as Data)
        }
        animations()
        
    }
    
    func animations(){
        self.nombreAppLabel.center.x  -= bounds.width
        UIView.animate(withDuration:0.9,delay:0.3,options:[],animations:{self.nombreAppLabel.center.x+=self.bounds.width},completion:nil)
    }
    
}
