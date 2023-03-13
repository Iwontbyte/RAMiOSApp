//
//  RMEpisodeViewController.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import UIKit

final class RMEpisodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Episode"
        
        
        RMService.shared.execute(.listEpisodeRequests, expecting: RMGetAllEpisodesResponse.self, completion: { result in
            switch result {
            case .success(let model):
                print(String(describing: model.results))
                break
            case .failure(let error):
                print(String(describing: error))
            }
        })
    }
    

   

}
