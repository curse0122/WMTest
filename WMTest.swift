import Foundation

// Q1: 請定義一個 WMInterviewee Class，其屬性有求職者編號、中文姓名、英文姓名、性別、面 試時間、應徵職位名稱、iOS 開發年資。
class WMInterviewee {
    
    let id: String
    let name: String
    let engName: String
    let sexual: Sexual
    let interviewDate: Date
    let jobName: String
    let seniority: Double
    
    init(name: String, engName: String, sexual: Sexual = .sensitive, interviewDate: Date = Date(), jobName: String, seniority: Double = 0) {
        self.id = "\(Int.random(in: 0...1000))"
        self.name = name
        self.engName = engName
        self.sexual = sexual
        self.interviewDate = interviewDate
        self.jobName = jobName
        self.seniority = seniority >= 0 ? seniority : 0
    }
    
    enum Sexual: Int {
        case sensitive = 0
        case man = 1
        case woman = 2
    }
}

// Q2: 請使用上一題您定義的 WMInterviewee，產生一個 instance，並設定好您的資料。
let date = Date(timeIntervalSince1970: 1701750600)
let me = WMInterviewee(name: "劉良誠", engName: "NieR", interviewDate: date, jobName: "iOS 工程師 ( Senior )", seniority: 4.5)

print(me)

// Q3: ObjC 中的 NSString 與 NSMutableString 有什麼不同?後者在 Swift 中並沒有對應型態， 為何?
// NString 代表不可改變的字串, NSMutableString 代表可改變的字串, 在objc中某些字串可用的api, 兩個給出的結果可能不同
// NSMutableString 在 Swift 就是 NSMutableString, 但其用法與在objc中有些不同

// Q4: NULL、nil、NSNull、NSNotFound 在 ObjC 中皆可表達空值，他們有何區別?這些成員在 Swift 中的表現也一樣嗎?

// Q5: 何謂 MVC?他在 Cocoa Touch 架構下的實現有何優劣，請簡述之。
// Modle, View, Controller, 在App中使用此設計模式將程式做整理, 提高程式的可維護性與可讀性
// 優點: 結構清晰, 可維護性, 重用性, 擴展性
// 缺點: 複雜性, 過度使用, View與Controller耦合

// Q6: 請試著說明在 iOS 開發上有哪些物件溝通的方式(例如 delegate)?各自的優缺點是什 麼?
// Delegate: 必須實作Delegate定義的功能, 並且要指定delegator, 在資源回收時需要注意是否有被系統正常回收
// Notification: 必須定義並監聽指定 notification name, 需要在必要的時間監聽/取消監聽
// KVO: 觀察指定變數變化, 需要時做 observer

// Q7: 請列舉至少三個您最常使用的第三方套件，說明為什麼要使用它?
// Alamofire: 網路請求
// Google iOS SDK: 實作 Google 登入
// Facebook iOS SDK: 實作 Facebook 登入

// Q8: Content Hugging Priority 與 Content Compression Resistance Priority 在 Autolayout 中如 何運作?預設值為何?
// Content Hugging Priority: 決定哪個UI越不容易拉伸, 數值愈高, 愈不容易拉伸
// Content Compression Resistance Priority: 決定哪個UI越不容易壓縮, 數值愈高, 愈不容易壓縮
// 預設直接為250

// Q9: 已完成的 Xcode 專案可以通過 Apple Developer Center 發布的憑證安裝到實機上，請列舉 不同種類的憑證並說明使用情境及限制。
// Development Certificate: 用於開發和測試應用程式
// Distribution Certificate: 用於將應用程式上傳到 App Store
// Push Notification Certificate: 用於應用程式推播功能

// Q10: Git 中在合併分支時使用 merge 、merge --no-ff 與 rebase 有何不同?試比較之間的優 劣。
// merge: 合併到另一個branch, 會產生merge的commit
// merge --no-ff: 合併到另一個branch, 不會產生merge的commit
// rebase: 將branch接到另一個branch上

// 加分題
// P1: 如果推播後台(例如 Firebase)無法發送推播給 App，有哪些可能性?試列舉並分析之。
// 1. APS token 或 FCM token 過期
// 2. APS 憑證過期
// 3. 裝置問題, 例如: User為開啟推波權限, 手機沒有網路能力
// 4. APS 或 FCM 推播系統異常

// P2: 專案中同時使用 ObjC 與 Swift 時，彼此如何互相引用合作?需要對既有程式碼多做修改 嗎?
// ObjC 必須在 .h 檔案定義好要暴露的API
// Swift 必須在要暴露的 class, property, method 前加上 public, 並在 objc 環境中 import

// P3: 試解釋以下名詞與 iOS 開發之關係並簡述其功用。
// i. Cocoapods: Xcode常見的套件管理工具, 提供第三方套件引入, 需要定義 podfile 並安裝
// ii. Carthage: Xcode早期套件管理工具
// iii. Swift Package Manager: Xcode最新的套件管理工具, 需定義 Package.swift
// iv. Fastlane: CICD管理工具
// v. Bundler: cocoapods, fastlane 版本管理工具

// P4: [Flutter] 使用 Flutter 建構 iOS 專案時，如何與 Swift / Obj-C 互動?

// P5: 5. [Flutter] 給定下列各組相關的名詞，試解釋並比較差異。(15%) 
// i. StatelessWidget 、 StatefulWidget
// ii. mixin 、 extends 、 implement
// iii. Future 、 Stream
// iv. var 、 dynamic 、 Object
// v. throw 、 rethrow