//
//  DetailViewController.swift
//  TableViewTest
//
//  Created by Rabeb Jaouadi on 05/03/2020.
//  Copyright © 2020 __epita__. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var game: Game?
    var gameDetail : GameDetail?
    var gameWebsite: String?
    let apiService = APIService()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
    @IBOutlet weak var redditLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let game = game else {
            return
        }
        apiService.fetchGameById(gameId: game.id, completionHandler:
            {gameDetail in guard let gameDetail = gameDetail else {
                return
            }
            DispatchQueue.main.async {
                self.nameLabel.text = (self.nameLabel.text ?? "") + gameDetail.name
                self.releasedLabel.text = (self.releasedLabel.text ?? "") + gameDetail.released
                self.metacriticLabel.text = (self.metacriticLabel.text ?? "") + String(gameDetail.metacritic)
                self.ratingsLabel.text = (self.ratingsLabel.text ?? "") + String(gameDetail.playtime)
                self.redditLabel.text = (self.redditLabel.text ?? "") + gameDetail.reddit_url

                let descriptionData = gameDetail.description.data(using: String.Encoding.unicode)!
                let attrStr = try? NSAttributedString(
                    data: descriptionData,
                    options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
                    documentAttributes: nil)

                self.descriptionLabel.text = attrStr?.string
                let url = URL(string: gameDetail.background_image)
                let data = try? Data(contentsOf: url!)
                self.imageView.image = UIImage(data: data!)
                self.gameWebsite = gameDetail.website
            }
        })
       // populateInfo()
    }

    @IBAction func WebLink(sender: AnyObject) {
        print("click")
        guard let gameWebsite = gameWebsite else {
            return
        }
        let url = NSURL(string: gameWebsite)! as URL
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    
    func populateInfo() {
        
    }
    
    
}
