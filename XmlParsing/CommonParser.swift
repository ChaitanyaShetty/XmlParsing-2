//
//  CommonParser.swift
//  XmlParsing
//
//  Created by KrishnaSunkara on 13/02/18.
//  Copyright © 2018 Sms country. All rights reserved.
//

import UIKit

extension String {
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
        }
    }
}


typealias successParserResponse = (_ responseDict : NSMutableArray) -> Void
typealias failiureParserResponse = (_ errorIs : Error) -> Void

class CommonParser: NSObject {
    
    
    
    
    
}
