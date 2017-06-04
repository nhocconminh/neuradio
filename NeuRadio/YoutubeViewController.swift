//
//  ViewController.swift
//  NeuRadio
//
//  Created by Minh Vo on 6/3/17.
//  Copyright © 2017 minhvo. All rights reserved.
//

import UIKit
import WebKit

class YoutubeViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var youtubeWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.hideNaviBarAndStatusBar()
        youtubeWebView.loadRequest(URLRequest(url: URL(string: YOUTUBE_URL)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

