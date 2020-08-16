//
//  MankaContentDetailController.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/16.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class MankaContentDetailController: MankaBaseController {
    // 代理
    weak var delegate: MankaComicViewWillEndDraggingDelegate?
    
    // 模型
    var detailStatic: MankaDetailStaticModel?
    var detailRealtime: MankaDetailRealtimeModel?
    var guessLike: MankaGuessLikeModel?
    
    private  lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.backgroundColor = UIColor.background
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(cellType: MankaDescriptionTCell.self)
        tableView.register(cellType: MankaOtherWorksTCell.self)
        tableView.register(cellType: MankaTicketTVCell.self)
        tableView.register(cellType: MankaGuessLikeTVCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    override func setupLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.usnp.edges)
        }
    }
}

extension MankaContentDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        delegate?.comicWillEndDragging(scrollView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return detailStatic != nil ? 4 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 1 && detailStatic?.otherWorks?.count == 0) ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return MankaDescriptionTCell.height(for: detailStatic)
        } else if indexPath.section == 3{
            return 200
        } else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MankaDescriptionTCell.self)
            cell.model = detailStatic
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MankaOtherWorksTCell.self)
            cell.model = detailStatic
            return cell
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MankaTicketTVCell.self)
            cell.model = detailRealtime
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MankaGuessLikeTVCell.self)
            cell.model = guessLike
            cell.didSelectClosure { [weak self] (comic) in
                let vc = MankaDetailViewController(comicid: comic.comic_id)
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return (section == 1 && detailStatic?.otherWorks?.count == 0) ? CGFloat.leastNormalMagnitude : 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

