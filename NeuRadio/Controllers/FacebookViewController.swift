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
    var avatarFacebookString = ""
    var numberOfFacebookLikesString = ""
    var numberOfFacebookTalkingString = ""
    var nameFacebookString = ""
    var aboutFacebookString = ""
    var feedArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.facebookTableView.delegate = self
        self.facebookTableView.dataSource = self
        self.navigationController?.hidesBarsOnSwipe = true
        feedArray = NSMutableArray.init()
        self.getInformationOfFacebookPage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if(velocity.y>0) {
            //Code will work without the animation block.I am using animation block incase if you want to set any delay to it.
            UIView.animate(withDuration: 2.5, delay: 0, options: UIViewAnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                print("Hide")
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 2.5, delay: 0, options: UIViewAnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                print("Unhide")
            }, completion: nil)    
        }
    }
    
    func getInformationOfFacebookPage() {
        let connection = GraphRequestConnection()
        connection.add(GraphRequest(graphPath: "/639859329374968/",parameters : ["fields":"name,cover,picture.type(large),display_subtext,general_info,fan_count,about,were_here_count,talking_about_count,posts"],accessToken: AccessToken.init(authenticationToken: "1953135294956542|39faa55d4044414ffed0ffb3d2901e67"))){         (urlResponse, requestResult) in
            
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
                        }
                    }
                    if (graphDictionary["picture"] != nil) {
                        let pictureFacebookDictionary = graphDictionary["picture"] as! NSDictionary
                        if ((pictureFacebookDictionary["data"]) != nil) {
                            let dataFacebookDictionary = pictureFacebookDictionary["data"] as! NSDictionary
                            if ((dataFacebookDictionary["url"]) != nil) {
                                let avatarFacebook = dataFacebookDictionary["url"] as! String
                                self.avatarFacebookString = avatarFacebook
                            }
                        }
                    }
                    if (graphDictionary["posts"] != nil) {
                        let feedFacebookDictionary = graphDictionary["posts"] as! NSDictionary
                        if ((feedFacebookDictionary["data"]) != nil) {
                            let dataFacebookArray = feedFacebookDictionary["data"] as! NSArray
                            self.feedArray = NSMutableArray.init(array: dataFacebookArray)
                        }
                    }
                    if (graphDictionary["name"] != nil) {
                        let nameFacebook = graphDictionary["name"] as! String
                        self.nameFacebookString = nameFacebook
                    }
                    if (graphDictionary["about"] != nil) {
                        let aboutFacebook = graphDictionary["about"] as! String
                        self.aboutFacebookString = aboutFacebook
                    }
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal
                    if (graphDictionary["fan_count"] != nil) {
                        let numberOfLikes = graphDictionary["fan_count"] as! NSInteger
                        let price = NSNumber(value: numberOfLikes)
                        self.numberOfFacebookLikesString = formatter.string(from: price)!
                    }
                    if (graphDictionary["talking_about_count"] != nil) {
                        let numberOfTalking = graphDictionary["talking_about_count"] as! NSInteger
                        let price2 = NSNumber(value: numberOfTalking)
                        self.numberOfFacebookTalkingString = formatter.string(from: price2)!
                    }
                    self.facebookTableView.reloadData()
                }
                break
            }
        }
        connection.start()
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
        return self.feedArray.count + 1
    }
    
//    // cell height
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return (self.view.frame.width * 9 / 16) + 30
        } else {
            return self.view.frame.width + 50
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let coverCell = tableView.dequeueReusableCell(withIdentifier: "CoverCell", for: indexPath ) as! CoverFacebookTableViewCell
            if self.coverFacebookString != "" {
                coverCell.coverImageView?.sd_setImage(with: URL(string:self.coverFacebookString), placeholderImage: nil, options: .progressiveDownload, completed: nil)
            }
            if self.avatarFacebookString != "" {
                coverCell.avatarImageView?.sd_setImage(with: URL(string:self.avatarFacebookString), placeholderImage: nil, options: .progressiveDownload, completed: nil)
                coverCell.avatarImageView.layer.cornerRadius = 5
                coverCell.avatarImageView.clipsToBounds = true
                coverCell.avatarImageView.layer.borderWidth = 2
                coverCell.avatarImageView.layer.borderColor = UIColor.white.cgColor
            }
            coverCell.nameLabel.text = self.nameFacebookString
            coverCell.aboutLabel.text = self.aboutFacebookString
            coverCell.numberOfLikesLabel.text = self.numberOfFacebookLikesString
            coverCell.numberOfTalkingAboutThis.text = self.numberOfFacebookTalkingString

            return coverCell
        } else {
            let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath ) as! PostFacebookTableViewCell
            postCell.avatarImageView.layer.cornerRadius = postCell.avatarImageView.bounds.width / 2
            postCell.avatarImageView.clipsToBounds = true
            return postCell
        }
    }

}
