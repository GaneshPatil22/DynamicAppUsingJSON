//
//  JsonReader.swift
//  DynamicAppUsingJSON
//
//  Created by Patil, Ganesh on 09/02/22.
//

import Foundation

class JSONReader {
    private init() {}
    
    static let shared = JSONReader()
    var configDict: [String: Any] = [:]
    
    func fetchConfig(completionHandler: (() -> Void)) {
        do {
               if let bundlePath = Bundle.main.path(forResource: "MainConfig",
                                                    ofType: "json"),
                   let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                   if let dict = try JSONSerialization.jsonObject(with: jsonData, options: .fragmentsAllowed) as? [String: Any] {
                       self.configDict = dict
                   }
               }
           } catch {
               print(error)
           }
        completionHandler()
    }
}
