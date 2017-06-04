//
//  FacebookViewController.swift
//  Neu Radio
//
//  Created by Minh Vo on 6/4/17.
//  Copyright © 2017 minhvo. All rights reserved.
//

import UIKit
import FacebookCore
import SDWebImage

class FacebookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var facebookTableView: UITableView!
    
    var coverFacebookString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.facebookTableView.delegate = self
        self.facebookTableView.dataSource = self
        
        let connection = GraphRequestConnection()
        connection.add(GraphRequest(graphPath: "/639859329374968/",parameters : ["fields":"cover"],accessToken: AccessToken.init(authenticationToken: "1953135294956542|39faa55d4044414ffed0ffb3d2901e67"))){         (urlResponse, requestResult) in
            
            switch requestResult {
            case .failed(let error):
                print("error in graph request:", error)
                break
            case .success(let graphResponse):
                print(graphResponse)
                if let graphDictionary = graphResponse.dictionaryValue {
                    print(graphDictionary)
                    if (graphDictionary["cover"] != nil) {
                    let coverFacebookDictionary = graphDictionary["cover"] as! NSDictionary
                        if ((coverFacebookDictionary["source"]) != nil) {
                            let coverFacebook = coverFacebookDictionary["source"] as! String
                            self.coverFacebookString = coverFacebook
                            print("self.coverFacebookString : " + self.coverFacebookString)
                            print("self.facebookTableView.reloadData()")
                            self.facebookTableView.reloadData()
                        }
                    }
                }
                break
            }
        }
        connection.start()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    // cell height
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.width * 9 / 16
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CoverCell")!
        if indexPath.row == 0 {
            let coverCell = tableView.dequeueReusableCell(withIdentifier: "CoverCell", for: indexPath ) as! CoverFacebookTableViewCell
            if self.coverFacebookString != "" {
                print("cellForRowAt")
                print("self.coverFacebookString : " + self.coverFacebookString)
                coverCell.coverImageView?.sd_setImage(with: URL(string:self.coverFacebookString), placeholderImage: nil, options: .progressiveDownload, completed: nil)
            }
            return coverCell
        }
        return cell
    }

}
