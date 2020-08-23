//
//  MankaCateController.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/11.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import MJRefresh

class MankaCateController: MankaBaseController {
    
    private var searchString = ""
    private var topList = [MankaTopModel]()
    private var rankList = [MankaRankingModel]()
    
    private lazy var searchButton: UIButton = {
        let searchBtn = UIButton(type: .system)
        searchBtn.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-20, height: 30)
        searchBtn.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        searchBtn.layer.cornerRadius = 15
        searchBtn.setTitleColor(.white, for: .normal)
        searchBtn.setImage(UIImage(named: "nav_search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        searchBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        searchBtn.addTarget(self, action:#selector(searchButtonClick), for: .touchUpInside)
        return searchBtn
    }()
    
    private lazy var collectionView: UICollectionView = {
        let lt = UICollectionViewFlowLayout()
        lt.minimumLineSpacing = 10
        lt.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: lt)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(cellType: MankaRankCollectionViewCell.self)
        collectionView.register(cellType: MankaTopCollectionViewCell.self)
        collectionView.uHead = URefreshHeader { [weak self] in self?.setupLoadData() }
        collectionView.uempty = UEmptyView { [weak self] in self?.setupLoadData() }
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadData()
    }
    
    private func setupLoadData() {
        ApiLoadingProvider.request(MankaApi.cateList, model: MankaCateListModel.self) { (returnData) in
            self.collectionView.uempty!.allowShow = true
            self.topList = returnData?.topList ?? []
            self.rankList = returnData?.rankingList ?? []
            self.searchButton.setTitle(self.searchString, for: .normal)
            self.collectionView.reloadData()
            self.collectionView.uHead.endRefreshing()
        }
    }
    
    @objc private func searchButtonClick() {
        navigationController?.pushViewController(MankaSearchController(), animated: true)
    }
    
    override func setupLayout(){
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{make in
            make.edges.equalTo(self.view.usnp.edges)
        }
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationItem.titleView = searchButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil,
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil,
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
    }
    
}

extension MankaCateController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return topList.prefix(3).count
        } else {
            return rankList.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: MankaTopCollectionViewCell.self)
            cell.model = topList[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: MankaRankCollectionViewCell.self)
            cell.model = rankList[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: section == 0 ? 0 : 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(screenWidth - 40.0) / 3.0)
        return CGSize(width: width, height: (indexPath.section == 0 ? 55 : (width * 0.75 + 30)))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let model = rankList[indexPath.row]
        let vc = MankaComicListController(argCon: model.argCon,
                                          argName: model.argName,
                                          argValue: model.argValue)
        vc.title = model.sortName
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
