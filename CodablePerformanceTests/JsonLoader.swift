//
//  JsonLoader.swift
//  CodablePerformanceTests
//
//  Created by isa on 6.02.2023.
//

import Foundation

func loadJson(count: Int) -> Data {
    let bundle = Bundle(for: CodablePerformanceTests.self)
    let resource = "Measurement\(count)"
    guard let url = bundle.url(forResource: resource, withExtension: "json"),
        let data = try? Data(contentsOf: url) else {
        fatalError()
    }
    return data
}
