//
//  RMCharacterListViewViewModel.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/13.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInintialCharacters()
    func didSelectCharacter(_ character: RMCharacter)
}


class RMCharacterListViewViewModel: NSObject {
    
    public weak var delegate: RMCharacterListViewViewModelDelegate?
    
    private var characters: [RMCharacter] = []{
        didSet {
            for item in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(characterName: item.name, characterStatus: item.status, characterImageurl: URL(string: item.image))
                cellViewModel.append(viewModel)
            }
            
        }
    }
    
    private var cellViewModel: [RMCharacterCollectionViewCellViewModel] = []
    
    func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self, completion: { [weak self]result in
        switch result {
        case .success(let response):
            let result = response.results
            self?.characters = result
            DispatchQueue.main.async {
                self?.delegate?.didLoadInintialCharacters()
            }
            break
        case .failure(let error):
            print(String(describing: error))
        }
    })}
}


extension RMCharacterListViewViewModel:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.identifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(with: cellViewModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let selectedCharacter = characters[indexPath.row]
        delegate?.didSelectCharacter(selectedCharacter)
    }
}


