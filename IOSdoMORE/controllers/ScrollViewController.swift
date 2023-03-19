//
//  ScrollViewController.swift
//  IOSdoMORE
//
//  Created by Akramjon on 18/03/23.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

    // MARK: Method
    
    func initView() {
        addNavigationBar()
    }
    
    func addNavigationBar(){
        
        let back = UIImage(systemName: "chevron.backward")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backTapped))
        
        title = "Scroll View"
    }
    
    // MARK: Ation
    
    @objc func backTapped(){
        navigationController?.popViewController(animated: true)
    }
    
}
