//
//  AppViewController.swift
//  AppReddit
//
//  Created by Mobile App on 24/09/17.
//  Copyright © 2017 nvjuanddl. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {



    @IBOutlet weak var descripcionAppLabel: UITextView!

    @IBOutlet weak var imgHeaderImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = app.nombreApp
        let url = NSURL(string: app.imagenHeader)
        let data = NSData(contentsOf: url! as URL)
        if data != nil {
            imgHeaderImage.image = UIImage(data:data! as Data)
        }
        descripcionAppLabel.text! = app.detalleApp

        // Do any additional setup after loading the view.
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
