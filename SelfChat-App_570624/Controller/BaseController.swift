//
//  BaseController.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 25.01.22.
//

import Foundation

class BaseController<T: Codable>: ObservableObject {
    
    var documentPath: URL?
    var defaultModel: T?
    
    func encodeToJSON(model: T) -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let data = try encoder.encode(model)
            return String(data: data, encoding: .utf8)!
        } catch {
            // Return soemthing
            return ""
        }
    }

    func decodeJSON(jsonString: String) -> T {
        let json = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        do {
            let model = try decoder.decode(T.self, from: json)
            return model
        } catch {
            return defaultModel!
        }
    }
    
    init() {
        // TODO
    }
    
    func saveValues() {
       // TODO
    }
    
}
