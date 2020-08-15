//
//  MankaModel.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/12.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import HandyJSON


enum MankaComicType: Int, HandyJSONEnum {
    case none = 0
    case update = 3
    case thematic = 5
    case animation = 9
    case billboard = 11
}

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

struct MankaSpinnerModel: HandyJSON {
    var argCon: Int = 0
    var name: String?
    var conTag: String?
    
}

struct MankaDefaultParametersModel: HandyJSON {
    var defaultSelection: Int = 0
    var defaultArgCon: Int = 0
    var defaultConTagType: String?
}

struct MankaComicListModel: HandyJSON {
    var comicType: MankaComicType = .none
    var canedit: Bool = false
    var sortId: Int = 0
    var titleIconUrl: String?
    var newTitleIconUrl: String?
    var description: String?
    var itemTitle: String?
    var argCon: Int = 0
    var argName: String?
    var argValue: Int = 0
    var argType: Int = 0
    var comics:[MankaComicModel]?
    var maxSize: Int = 0
    var canMore: Bool = false
    var hasMore: Bool = false
    var spinnerList: [MankaSpinnerModel]?
    var defaultParameters: MankaDefaultParametersModel?
    var page: Int = 0
}

struct MankaComicModel: HandyJSON {
    var comicId: Int = 0
    var comic_id: Int = 0
    var cate_id: Int = 0
    var name: String?
    var title: String?
    var itemTitle: String?
    var subTitle: String?
    var author_name: String?
    var author: String?
    var cover: String?
    var wideCover: String?
    var content: String?
    var description: String?
    var short_description: String?
    var affiche: String?
    var tag: String?
    var tags: [String]?
    var group_ids: String?
    var theme_ids: String?
    var url: String?
    var read_order: Int = 0
    var create_time: TimeInterval = 0
    var last_update_time: TimeInterval = 0
    var deadLine: TimeInterval = 0
    var new_comic: Bool = false
    var chapter_count: Int = 0
    var cornerInfo: Int = 0
    var linkType: Int = 0
    var specialId: Int = 0
    var specialType: Int = 0
    var argName: String?
    var argValue: Int = 0
    var argCon: Int = 0
    var flag: Int = 0
    var conTag: Int = 0
    var isComment: Bool = false
    var is_vip: Bool = false
    var isExpired: Bool = false
    var canToolBarShare: Bool = false
    var ext: [MankaExtModel]?
}

struct MankaExtModel: HandyJSON {
    var key: String?
    var val: String?
}
