//
//  CreateRideVC.swift
//  A3
//
//  Created by L20-US-KBuerlein23-MBA on 4/28/24.
//

import Foundation
import UIKit

class CreateRideVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private var collectionView: UICollectionView!
    
    // MARK: - Properties (data)
    private let refreshControl = UIRefreshControl()
    
    private var rides: [Ride] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create a ride"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.hc.white
    }
}
