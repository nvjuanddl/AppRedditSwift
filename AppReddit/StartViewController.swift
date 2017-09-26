//
//  StartViewController.swift
//  AppReddit
//
//  Created by Mobile App on 26/09/17.
//  Copyright © 2017 nvjuanddl. All rights reserved.
//

import UIKit

public var repeatTime : Bool = true

class StartViewController: UIViewController {

    
    @IBOutlet weak var spinnerIdle: UIImageView!
    
    var timer = Timer()
    var seconds : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 237.0/255.0, green: 72.0/255.0, blue: 83.0/255.0, alpha: 1.0)
        //view.backgroundColor?.cgColor = UIColor(red: 237.0/255.0, green: 72.0/255.0, blue: 83.0/255.0, alpha: 1.0).cgColor
        animationImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationImage(){
        
        spinnerIdle.animationImages = [
            UIImage(named: "frame_000_delay-0.04s")!,
            UIImage(named: "frame_004_delay-0.04s")!,
            UIImage(named: "frame_007_delay-0.04s")!,
            UIImage(named: "frame_011_delay-0.04s")!,
            UIImage(named: "frame_014_delay-0.04s")!,
            UIImage(named: "frame_018_delay-0.04s")!,
            UIImage(named: "frame_021_delay-0.04s")!,
            UIImage(named: "frame_025_delay-0.04s")!,
            UIImage(named: "frame_028_delay-0.04s")!,
            UIImage(named: "frame_032_delay-0.04s")!,
            UIImage(named: "frame_035_delay-0.04s")!,
            UIImage(named: "frame_039_delay-0.04s")!,
            UIImage(named: "frame_042_delay-0.04s")!,
            UIImage(named: "frame_046_delay-0.04s")!,
            UIImage(named: "frame_049_delay-0.04s")!,
            UIImage(named: "frame_053_delay-0.04s")!,
            UIImage(named: "frame_056_delay-0.04s")!,
            UIImage(named: "frame_060_delay-0.04s")!,
            UIImage(named: "frame_063_delay-0.04s")!,
            UIImage(named: "frame_067_delay-0.04s")!,
            UIImage(named: "frame_070_delay-0.04s")!,
            UIImage(named: "frame_074_delay-0.04s")!,
            UIImage(named: "frame_077_delay-0.04s")!,
            UIImage(named: "frame_081_delay-0.04s")!,
            UIImage(named: "frame_084_delay-0.04s")!,
            UIImage(named: "frame_088_delay-0.04s")!,
            UIImage(named: "frame_091_delay-0.04s")!,
            UIImage(named: "frame_095_delay-0.04s")!,
            UIImage(named: "frame_098_delay-0.04s")!,
            UIImage(named: "frame_102_delay-0.04s")!,
            UIImage(named: "frame_105_delay-0.04s")!,
            UIImage(named: "frame_109_delay-0.04s")!,
            UIImage(named: "frame_112_delay-0.04s")!,
            UIImage(named: "frame_116_delay-0.04s")!,
            UIImage(named: "frame_119_delay-0.04s")!,
            UIImage(named: "frame_123_delay-0.04s")!,
            UIImage(named: "frame_126_delay-0.04s")!,
            UIImage(named: "frame_130_delay-0.04s")!,
            UIImage(named: "frame_133_delay-0.04s")!,
            UIImage(named: "frame_140_delay-0.04s")!,
            UIImage(named: "frame_144_delay-0.04s")!,
            UIImage(named: "frame_147_delay-0.04s")!,
            UIImage(named: "frame_151_delay-0.04s")!,
            UIImage(named: "frame_154_delay-0.04s")!,
            UIImage(named: "frame_158_delay-0.04s")!,
            UIImage(named: "frame_161_delay-0.04s")!,
            UIImage(named: "frame_165_delay-0.04s")!,
            UIImage(named: "frame_168_delay-0.04s")!,
            UIImage(named: "frame_172_delay-0.04s")!,
            UIImage(named: "frame_175_delay-0.04s")!,
            UIImage(named: "frame_179_delay-0.04s")!,
            UIImage(named: "frame_182_delay-0.04s")!,
            UIImage(named: "frame_186_delay-0.04s")!,
            UIImage(named: "frame_189_delay-0.04s")!,
            UIImage(named: "frame_193_delay-0.04s")!,
            UIImage(named: "frame_196_delay-0.04s")!,
            UIImage(named: "frame_203_delay-0.04s")!,
            UIImage(named: "frame_207_delay-0.04s")!,
            UIImage(named: "frame_210_delay-0.04s")!,
            UIImage(named: "frame_214_delay-0.04s")!,
            UIImage(named: "frame_217_delay-0.04s")!,
            UIImage(named: "frame_221_delay-0.04s")!,
            UIImage(named: "frame_224_delay-0.04s")!,
            UIImage(named: "frame_228_delay-0.04s")!,
            UIImage(named: "frame_231_delay-0.04s")!,
            UIImage(named: "frame_235_delay-0.04s")!,
            UIImage(named: "frame_238_delay-0.04s")!,
            UIImage(named: "frame_242_delay-0.04s")!,
            UIImage(named: "frame_245_delay-0.04s")!,
            UIImage(named: "frame_249_delay-0.04s")!,
            UIImage(named: "frame_252_delay-0.04s")!,
            UIImage(named: "frame_256_delay-0.04s")!,
            UIImage(named: "frame_259_delay-0.04s")!,
            UIImage(named: "frame_263_delay-0.04s")!,
            UIImage(named: "frame_266_delay-0.04s")!,
            UIImage(named: "frame_270_delay-0.04s")!,
            UIImage(named: "frame_273_delay-0.04s")!,
            UIImage(named: "frame_277_delay-0.04s")!,
            UIImage(named: "frame_280_delay-0.04s")!,
            UIImage(named: "frame_284_delay-0.04s")!,
            UIImage(named: "frame_287_delay-0.04s")!,
            UIImage(named: "frame_291_delay-0.04s")!,
            UIImage(named: "frame_294_delay-0.04s")!,
            UIImage(named: "frame_298_delay-0.04s")!,
            UIImage(named: "frame_301_delay-0.04s")!,
            UIImage(named: "frame_305_delay-0.04s")!,
            UIImage(named: "frame_308_delay-0.04s")!,
            UIImage(named: "frame_312_delay-0.04s")!,
            UIImage(named: "frame_315_delay-0.04s")!,
            UIImage(named: "frame_319_delay-0.04s")!,
            UIImage(named: "frame_322_delay-0.04s")!,
            UIImage(named: "frame_326_delay-0.04s")!,
            UIImage(named: "frame_329_delay-0.04s")!,
            UIImage(named: "frame_333_delay-0.04s")!,
            UIImage(named: "frame_336_delay-0.04s")!,
            UIImage(named: "frame_340_delay-0.04s")!,
            UIImage(named: "frame_343_delay-0.04s")!,
            UIImage(named: "frame_347_delay-0.04s")!,
            UIImage(named: "frame_350_delay-0.04s")!,
            UIImage(named: "frame_354_delay-0.04s")!,
            UIImage(named: "frame_357_delay-0.04s")!,
            UIImage(named: "frame_361_delay-0.04s")!,
            UIImage(named: "frame_364_delay-0.04s")!,
            UIImage(named: "frame_368_delay-0.04s")!,
            UIImage(named: "frame_371_delay-0.04s")!,
            UIImage(named: "frame_375_delay-0.04s")!,
            UIImage(named: "frame_378_delay-0.04s")!,
            UIImage(named: "frame_382_delay-0.04s")!,
            UIImage(named: "frame_385_delay-0.04s")!,
            UIImage(named: "frame_389_delay-0.04s")!,
            UIImage(named: "frame_392_delay-0.04s")!,
            UIImage(named: "frame_396_delay-0.04s")!,
            UIImage(named: "frame_399_delay-0.04s")!,
            UIImage(named: "frame_403_delay-0.04s")!,
            UIImage(named: "frame_417_delay-0.04s")!,
            UIImage(named: "frame_420_delay-0.04s")!,
            UIImage(named: "frame_424_delay-0.04s")!,
            UIImage(named: "frame_427_delay-0.04s")!,
            UIImage(named: "frame_431_delay-0.04s")!,
            UIImage(named: "frame_434_delay-0.04s")!
            
        ]
        spinnerIdle.animationDuration = 8
        spinnerIdle.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerAction), userInfo: nil, repeats: repeatTime)
    }
    
    func timerAction() {
        if seconds == 2 {
            repeatTime = false
            let myVC = storyboard?.instantiateViewController(withIdentifier: "LoginMultiRed")
            self.present(myVC!, animated: true)
        }
        seconds = seconds + 1
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
