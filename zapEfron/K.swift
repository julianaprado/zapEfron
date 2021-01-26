//
//  K.swift
//  zapEfron
//
//  Created by Juliana Prado on 25/01/21.
//

struct K {
    static let appName = "ZapEfron"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "TableViewCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let gray = "BrandGray"
        static let lightGray = "BrandLightGray"
        static let pink = "BrandPink"
        static let lightPink = "BrandWhite"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
