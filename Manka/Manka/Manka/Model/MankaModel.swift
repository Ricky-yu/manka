//
//  MankaModel.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/12.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import HandyJSON


struct MnakaTabModel: HandyJSON {
    var argName: String?
    var argValue: Int = 0
    var argCon: Int = 0
    var tabTitle: String?
}

struct MnakaTopExtra: HandyJSON {
    var title: String?
    var tabList: [MnakaTabModel]?
}

struct MankaTopModel: HandyJSON {
    var sortId: Int = 0
    var sortNamne: String?
    var cover: String?
    var extra: MnakaTopExtra?
    var uiWeight: Int = 0
}

struct MankaRankingModel: HandyJSON {
    var argCon: Int = 0
    var argName: String?
    var argValue: Int = 0
    var canEdit: Bool = false
    var cover: String?
    var isLike: Bool = false
    var sortId: Int = 0
    var sortName: String?
    var title: String?
    var subTitle: String?
    var rankingType: Int = 0
}

struct MankaCateListModel: HandyJSON {
    var recommendSearch: String?
    var rankingList:[MankaRankingModel]?
    var topList:[MankaTopModel]?
}

struct MankaReturnData<T: HandyJSON>: HandyJSON {
    var message:String?
    var returnData: T?
    var stateCode: Int = 0
}

struct MankaResponseData<T: HandyJSON>: HandyJSON {
    var code: Int = 0
    var data: MankaReturnData<T>?
}
