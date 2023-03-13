//
//  RMLocationViewController.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import UIKit

final class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Location"
        
        RMService.shared.execute(.listLocationsRequests, expecting: RMGetAllLocationsResponse.self, completion: { result in
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
