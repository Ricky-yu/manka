//
//  MankaDetailViewController.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/16.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit


protocol MankaComicViewWillEndDraggingDelegate: class {
    func comicWillEndDragging(_ scrollView: UIScrollView)
}

class MankaDetailViewController: MankaBaseController {
    
    private var comicid: Int = 0
    
    private lazy var mainScrollView: UIScrollView = {
        let mainScrollView = UIScrollView()
        mainScrollView.delegate = self
        return mainScrollView
    }()
    
    private lazy var detailVC: MankaContentDetailController = {
        let detailVC = MankaContentDetailController()
        detailVC.delegate = self
        return detailVC
    }()
    
    
    private lazy var navigationBarY: CGFloat = {
        return navigationController?.navigationBar.frame.maxY ?? 0
    }()
    
    
    
    private lazy var pageVC: MankaPageController = {
        return MankaPageController(titles: ["详情"],
                                   vcs: [detailVC],
                                   pageStyle: .topTabBar)
    }()
    
    private lazy var headView: MankaDetailHeadView = {
        return MankaDetailHeadView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: navigationBarY + 150))
    }()
    private var detailStatic: MankaDetailStaticModel?
    private var detailRealtime: MankaDetailRealtimeModel?
    
    convenience init(comicid: Int) {
        self.init()
        self.comicid = comicid
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        loadData()
    }
    
    private func loadData() {
        let grpup = DispatchGroup()
        
        grpup.enter()
        ApiLoadingProvider.request(MankaApi.detailStatic(comicid: comicid),
                                   model: MankaDetailStaticModel.self) { [weak self] (detailStatic) in
                                    self?.detailStatic = detailStatic
                                    self?.headView.detailStatic = detailStatic?.comic
                                    
                                    self?.detailVC.detailStatic = detailStatic
                                    
                                    
                                    ApiProvider.request(MankaApi.commentList(object_id: detailStatic?.comic?.comic_id ?? 0,
                                                                             thread_id: detailStatic?.comic?.thread_id ?? 0,
                                                                             page: -1),
                                                        model: MankaCommentListModel.self,
                                                        completion: { [weak self] (commentList) in
                                                            
                                                            grpup.leave()
                                    })
        }
        
        grpup.enter()
        ApiProvider.request(MankaApi.detailRealtime(comicid: comicid),
                            model: MankaDetailRealtimeModel.self) { [weak self] (returnData) in
                                self?.detailRealtime = returnData
                                self?.headView.detailRealtime = returnData?.comic
                                
                                self?.detailVC.detailRealtime = returnData
                                
                                
                                grpup.leave()
        }
        
        grpup.enter()
        ApiProvider.request(MankaApi.guessLike, model: MankaGuessLikeModel.self) { (returnData) in
            self.detailVC.guessLike = returnData
            grpup.leave()
        }
        
        grpup.notify(queue: DispatchQueue.main) {
            self.detailVC.reloadData()
            
        }
    }
    
    override func setupLayout() {
        view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.usnp.edges).priority(.low)
            make.top.equalToSuperview()
        }
        
        let contentView = UIView()
        mainScrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().offset(-navigationBarY)
        }
        
        addChild(pageVC)
        contentView.addSubview(pageVC.view)
        pageVC.view.snp.makeConstraints { make in make.edges.equalToSuperview() }
        
        mainScrollView.parallaxHeader.view = headView
        mainScrollView.parallaxHeader.height = navigationBarY + 150
        mainScrollView.parallaxHeader.minimumHeight = navigationBarY
        mainScrollView.parallaxHeader.mode = .fill
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationController?.barStyle(.clear)
        mainScrollView.contentOffset = CGPoint(x: 0, y: -mainScrollView.parallaxHeader.height)
    }
    
}

extension MankaDetailViewController: UIScrollViewDelegate, MankaComicViewWillEndDraggingDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= -scrollView.parallaxHeader.minimumHeight {
            navigationController?.barStyle(.theme)
            navigationItem.title = detailStatic?.comic?.name
        } else {
            navigationController?.barStyle(.clear)
            navigationItem.title = ""
        }
    }
    
    func comicWillEndDragging(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            mainScrollView.setContentOffset(CGPoint(x: 0,
                                                    y: -self.mainScrollView.parallaxHeader.minimumHeight),
                                            animated: true)
        } else if scrollView.contentOffset.y < 0 {
            mainScrollView.setContentOffset(CGPoint(x: 0,
                                                    y: -self.mainScrollView.parallaxHeader.height),
                                            animated: true)
        }
    }
}
