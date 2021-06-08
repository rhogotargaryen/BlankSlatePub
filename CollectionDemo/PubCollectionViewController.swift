//
//  CollectionViewController.swift
//  CollectionDemo
//
//  Copyright © 2019 Nativo. All rights reserved.
//

import UIKit
import NativoSDK

class PubCollectionViewController: UICollectionViewController {
    
    var feedImgCache = Dictionary<URL, UIImage>()
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.itemSize = CGSize(width: 342.0, height: 300.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NativoSDK.enableTestAdvertisements(with: .native)
        NativoSDK.setSectionDelegate(self, forSection: "nativo.net/mobiletest")
        NativoSDK.registerReuseId("Cell", for: .native)
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        // Dequeue the cell
        let cell = NativoSDK.dequeueCellWithAd(from: collectionView, usingReuseIdentifierIfNoAd: "Cell", forSection: "nativo.net/mobiletest", atPlacementIndex: indexPath, options: nil)
        
        // Setup Cell
        if let articleCell: PubCollectionViewCell = cell as? PubCollectionViewCell{
            articleCell.titleLabel.text = "Lorum Ipsom"
            articleCell.authorNameLabel.text = "Derek"
            articleCell.previewTextLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
            let imgUrl = URL.init(string: "https://images.unsplash.com/photo-1527664557558-a2b352fcf203?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=4341976025ae49162643ccdb47a72a4d&w=1000&q=80")
            let authorUrl = URL.init(string: "https://www.logolynx.com/images/logolynx/6a/6aa959dca0e6c62f593e94e02332a67f.jpeg")
            getAsyncImage(forUrl: imgUrl!) { (img) in
                articleCell.adImageView.image = img
            }
            getAsyncImage(forUrl: authorUrl!) { (authorimg) in
                articleCell.authorImageView.image = authorimg
            }
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let articleViewController = ArticleViewController()
        self.navigationController?.pushViewController(articleViewController, animated: true)
    }
    
    func getAsyncImage(forUrl url: URL, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global(qos: .default).sync {
            if let image = self.feedImgCache[url]  {
                DispatchQueue.main.async {
                    completion(image)
                }
                return
            }
            if let imgData = try? Data.init(contentsOf: url) {
                let image = UIImage.init(data: imgData)
                if (image != nil) {
                    self.feedImgCache[url] = image
                }
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
    }
}

extension PubCollectionViewController: NtvSectionDelegate {
    
    func section(_ sectionUrl: String, needsReloadDatasourceAtLocationIdentifier identifier: Any, forReason reason: String) {
        self.collectionView?.reloadData()
    }
    func section(_ sectionUrl: String, shouldPlaceAdAtIndex index: IndexPath) -> Bool {
        let adStartRow = 1
        let adInterval = 3
        if index.row % adInterval == adStartRow {
            return true
        }
        return false
    }
    func section(_ sectionUrl: String, needsDisplayLandingPage sponsoredLandingPageViewController: (UIViewController & NtvLandingPageInterface)?) {
        
    }
    func section(_ sectionUrl: String, needsDisplayClickoutURL url: URL) {
        
    }
}
