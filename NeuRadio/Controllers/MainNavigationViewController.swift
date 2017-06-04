//
//  MainNavigationViewController.swift
//  Neu Radio
//
//  Created by Minh Vo on 6/4/17.
//  Copyright © 2017 minhvo. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configUI() {
        self.navigationBar.isTranslucent = false
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.barTintColor = UIColor.red_Youtube
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName: UIFont.RobotoMediumFont(ofSize: 15)]
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    func hideNaviBarAndStatusBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        UIApplication.shared.setStatusBarHidden(true, with: .slide)
        self.setNeedsStatusBarAppearanceUpdate()
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
