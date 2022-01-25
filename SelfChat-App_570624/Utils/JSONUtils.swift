//
//  JSONUtils.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 25.01.22.
//

import Foundation

let exampleChatPartnersJSON = "{ \"partners\": [{ \"name\": \"LA\" }, { \"name\": \"NF\" }] }"

func getDocumentsPath() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

func writeJSON(source: URL, jsonString: String) throws {
    try jsonString.write(to: source, atomically: true, encoding: .utf8)
}

func readJSON(source: URL) -> String {
    do {
        let data = try String(contentsOf: source, encoding: .utf8)
        return data
    } catch {
        return ""
    }
}
