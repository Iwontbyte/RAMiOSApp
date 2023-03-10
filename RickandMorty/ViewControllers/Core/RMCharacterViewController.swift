//
//  RMCharacterViewController.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Character"
        
        
        
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self, completion: { result in
            switch result {
            case .success(let model):
                print(String(describing: model.info.count))
                break
            case .failure(let error):
                print(String(describing: error))
            }
        })
    }
    

 

}
