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
    func didLoadMoreCharacters(with index:[IndexPath])
}


class RMCharacterListViewViewModel: NSObject {
    
    public weak var delegate: RMCharacterListViewViewModelDelegate?
    
    private var isLoadingMoreCharaters = false
    
    private var cellViewModel: [RMCharacterCollectionViewCellViewModel] = []
    
    private var apiInfo: RMGetAllCharactersResponse.Info? = nil
    
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    private var characters: [RMCharacter] = []{
        didSet {
            for item in characters where !cellViewModel.contains(where: { $0.characterId == item.id}){
                let viewModel = RMCharacterCollectionViewCellViewModel(characterId:item.id, characterName: item.name, characterStatus: item.status, characterImageurl: URL(string: item.image))
                cellViewModel.append(viewModel)
            }
            
        }
    }
    
    
    func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self, completion: { [weak self] result in
            switch result {
            case .success(let response):
                let result = response.results
                let info = response.info
                self?.characters = result
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInintialCharacters()
                }
                break
            case .failure(let error):
                print(String(describing: error))
            }
        })}
    
    
    
    public func fetchAddtionalCharacters() {
        guard let nextUrl = URL(string: apiInfo?.next ?? "") else {
            return
        }
        RMService.shared.execute(nextUrl, expecting: RMGetAllCharactersResponse.self, completion: {[weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let response):
                self.apiInfo = response.info
                let moreResult = response.results
                let originalCount = self.characters.count
                let newCount = moreResult.count
                let total = originalCount + newCount
                let statrIndex = total - newCount
                let indexPathtoAdd = Array(statrIndex..<(statrIndex + newCount)).compactMap({return IndexPath(row: $0, section: 0)})
                self.characters.append(contentsOf: moreResult)
                DispatchQueue.main.async {
                    self.delegate?.didLoadMoreCharacters(with: indexPathtoAdd )
                    self.isLoadingMoreCharaters = false
                }
            case .failure(let error):
                print(String(describing: error))
            }
        })
    }
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
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter,
              let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: RMFooterLoadingCollectionReusableView.identifier,
                                                                           for: indexPath) as? RMFooterLoadingCollectionReusableView else {
            fatalError()
        }
        footer.startAnimating()
        return footer
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard shouldShowLoadMoreIndicator else {
            return .zero
        }
        return CGSize(width: collectionView.frame.width, height: 100)
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


extension RMCharacterListViewViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreIndicator,!isLoadingMoreCharaters else {
            return
        }
        let offset = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let totalScrollViewFixedHeight = scrollView.frame.size.height
        if offset > (totalContentHeight - totalScrollViewFixedHeight - 120) {
            isLoadingMoreCharaters = true
            fetchAddtionalCharacters()
        }
    }
}
