//
//  RMEpisodeListViewViewModel.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/24.
//

import UIKit

class RMEpisodeListViewViewModel: NSObject {
    
    private var episodes: [RMEpisode] = []
    
    func getAllEpisode() {
        RMService.shared.execute(.listEpisodeRequests, expecting: RMGetAllEpisodesResponse.self, completion: { result in
            switch result {
            case .success(let response):
                self.episodes = response.results
                break
            case .failure(let error):
                print(String(describing: error))
            }
        })}
    
}


extension RMEpisodeListViewViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RMEpisodeTableViewCell.identifier, for: indexPath) as? RMEpisodeTableViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(episodeLabel: episodes[indexPath.row].episode, episodeName: episodes[indexPath.row].name, aironLabel: episodes[indexPath.row].air_date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
