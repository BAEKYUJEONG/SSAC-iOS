//
//  RealmModel.swift
//  ShoppingList
//
//  Created by 백유정 on 2021/11/04.
//

import Foundation
import RealmSwift

// UserList : 테이블 이름
// @Persisted : 컬럼
class UserList: Object {
    @Persisted var check: Bool // 체크 기능(필수)
    @Persisted var list: String // 구매 목록(필수)
    @Persisted var star: Bool // 즐겨찾기 기능(필수)
    
    // PK (필수) : Int, String, UUID, ObjectID -> AutoIncrement
    @Persisted(primaryKey: true) var _id: ObjectId
    
    convenience init(check: Bool, list: String, star: Bool) {
        self.init()
        
        self.check = false
        self.list = list
        self.star = false
    }
}
