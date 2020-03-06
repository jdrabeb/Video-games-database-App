//
//  APIService.swift
//  TableViewTest
//
//  Created by Rabeb Jaouadi on 05/03/2020.
//  Copyright © 2020 __epita__. All rights reserved.
//

import Foundation

class APIService {
    
    func fetchGames(completionHandler: @escaping ([Game]) -> Void) {
        let urlString: String = "https://api.rawg.io/api/games?page=1&page_size=15"
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let gameResults = try? JSONDecoder().decode(GameResult.self, from: data) {
                        let array = gameResults.results
                        completionHandler(array)
                }
            }
        })
        task.resume()
    }
    
    func fetchGameById(gameId: Int, completionHandler: @escaping (GameDetail?) -> Void) {
        let urlString: String = "https://api.rawg.io/api/games/" + String(gameId)
            guard let url = URL(string: urlString) else {
                return
            }
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                else if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    if let gameDetailResult = try? JSONDecoder().decode(GameDetail.self, from: data) {                        completionHandler(gameDetailResult)
                    }
                }
            })
            task.resume()
        }
}
