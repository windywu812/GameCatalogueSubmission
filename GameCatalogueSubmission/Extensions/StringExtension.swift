//
//  StringExtension.swift
//  iOSFundamentalSubmission
//
//  Created by Windy on 13/07/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import Foundation

extension String {
    
    func clearTheString() -> String {
        
        var str = self.replacingOccurrences(of: "<p>", with: "")
        str = str.replacingOccurrences(of: "</p>", with: "")
        str = str.replacingOccurrences(of: "&#39;s", with: "")
        str = str.replacingOccurrences(of: "&#39;em", with: "")
        str = str.replacingOccurrences(of: "<br>", with: "")
        str = str.replacingOccurrences(of: "<br />", with: "")
        str = str.replacingOccurrences(of: "<h3>", with: "")
        str = str.replacingOccurrences(of: "</h3>", with: "")
        str = str.replacingOccurrences(of: "<br/>", with: "")
        str = str.replacingOccurrences(of: "<br/>*", with: "")
        str = str.replacingOccurrences(of: "<strong>", with: "")
        str = str.replacingOccurrences(of: "</strong>", with: "")
        str = str.replacingOccurrences(of: "<ul>", with: "")
        str = str.replacingOccurrences(of: "</ul>", with: "")
        str = str.replacingOccurrences(of: "<li>", with: "")
        str = str.replacingOccurrences(of: "</li>", with: "")
        str = str.replacingOccurrences(of: "&quot;", with: "")
        str = str.replacingOccurrences(of: "&#39;t", with: "")
        str = str.replacingOccurrences(of: ";", with: ",")
        str = str.replacingOccurrences(of: "-", with: "")
        
        return str
    }
    
    func changeDateFormat() -> String? {
        
        let formatterFromJSON = DateFormatter()
        formatterFromJSON.dateFormat = "yyyy-mm-dd"
        
        let date = formatterFromJSON.date(from: self)
        
        let formatterToDate = DateFormatter()
        formatterToDate.dateFormat = "MMM dd, yyyy"
        
        if let date = date {
            return formatterToDate.string(from: date)
        }
        
        return nil
    }
    
}
