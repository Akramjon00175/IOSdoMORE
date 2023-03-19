//
//  HomeViewController.swift
//  IOSdoMORE
//
//  Created by Akramjon on 18/03/23.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var numberOfColumns: CGFloat = 2
    var items: Array<Item> = Array()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    // MARK: Method
    
    func initView(){
        
        addNavigationBar()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        items.append(Item(title: "Best Coding", image: "ic_image1"))
        items.append(Item(title: "Amazon Coding", image: "ic_image2"))
        items.append(Item(title: "Best Coding", image: "ic_image1"))
        items.append(Item(title: "Amazon Coding", image: "ic_image2"))
        items.append(Item(title: "Best Coding", image: "ic_image1"))
        items.append(Item(title: "Amazon Coding", image: "ic_image2"))
        items.append(Item(title: "Best Coding", image: "ic_image1"))
        items.append(Item(title: "Amazon Coding", image: "ic_image2"))
    }
    
    func addNavigationBar(){
        
        let scroll = UIImage(systemName: "scroll.fill")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain,
                                                            target: self,
                                                            action: #selector(scrollTapped))
        
        title = "Collection View"
    }
    
    func callScrollController() {
        
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: Action
    
    @objc func scrollTapped(){
        callScrollController()
    }
    
    //  MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = items[indexPath.row]
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.imageView.image = UIImage(named: item.image!)
        cell.textView.text = item.title
        
        
        return cell
        
    }
    
}
