//
//  ViewController.swift
//  YouTubeCopy
//
//  Created by Sean on 10/8/17.
//  Copyright © 2017 Sean Ippolito. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var videos: [Video] = {
        var kendrickChannel = Channel()
        kendrickChannel.name = "KendrickIsTheBestChannel"
        kendrickChannel.profileImageName = "kl"
        
        var stephenColbert = Channel()
        stephenColbert.name = "StephensChannel"
        stephenColbert.profileImageName = "LateShowProfileImage"
        
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Stephen Colbert - Blank Space"
        blankSpaceVideo.thumbnailImageName = "ColbertFullImage"
        blankSpaceVideo.channel = stephenColbert
        
        var badBloodVideo = Video()
        badBloodVideo.title = "Kendrick Lamar & T Swift - Bad Blood"
        badBloodVideo.thumbnailImageName = "badBlood"
        badBloodVideo.channel = kendrickChannel
        
        return [blankSpaceVideo, badBloodVideo]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setupMenuBar()
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target:self,
                                              action: #selector(handleSearch))
        
        let menuImage = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
        let moreButton = UIBarButtonItem(image: menuImage, style: .plain, target:self,
                                         action: #selector(handleMore))
        moreButton.tintColor = UIColor.white
        
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
    }
    
    @objc func handleMore(){
        print(321)
    }
    
    @objc func handleSearch() {
        print(123)
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize.init(width: view.frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

