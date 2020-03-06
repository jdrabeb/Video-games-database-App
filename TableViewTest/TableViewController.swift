//
//  TableViewController.swift
//  TableViewTest
//
//  Created by Rabeb Jaouadi on 05/03/2020.
//  Copyright © 2020 __epita__. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let apiService = APIService()
    var array: [Game]?
    var selectedGame: Game?
    var selectedGameDetail: GameDetail?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        apiService.fetchGames(completionHandler: reloadTable(games:))
    }
    
    func reloadTable(games: [Game]) {
        array = games
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        detailViewController.game = selectedGame
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        
        guard let game = array?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = game.name
        cell.emailLabel.text = game.released
        
        cell.posterImageView.sd_setImage(with: URL(string: game.background_image), placeholderImage: UIImage(named: "placeholder.png"))

        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let array = array else {
            return indexPath
        }
        selectedGame = array[indexPath.row]
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
