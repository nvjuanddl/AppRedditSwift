//
//  SegueFromRight.swift
//  appMultired_1
//
//  Created by Diseño Grafico on 18/02/17.
//  Copyright © 2017 TaylorJohnson. All rights reserved.
//

import UIKit

class SegueFromRight: UIStoryboardSegue {
    
    override func perform() {
        let src: UIViewController = self.source
        let dst: UIViewController = self.destination
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.duration = 0.7
        transition.timingFunction = timeFunc
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        src.navigationController?.view.layer.add(transition, forKey: kCATransition)
        src.navigationController?.pushViewController(dst, animated: true)
    }

}
