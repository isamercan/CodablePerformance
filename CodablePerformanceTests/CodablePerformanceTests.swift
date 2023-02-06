//
//  CodablePerformanceTests.swift
//  CodablePerformanceTests
//
//  Created by isa on 6.02.2023.
//

import XCTest
import Foundation
@testable import CodablePerformance

let count = 100000 //100, 1000, 100000
let data = loadJson(count: count)

final class CodablePerformanceTests: XCTestCase {
    override class var defaultPerformanceMetrics: [XCTPerformanceMetric] {
        return [
            XCTPerformanceMetric(rawValue: "com.apple.XCTPerformanceMetric_WallClockTime"),
            XCTPerformanceMetric(rawValue: "com.apple.XCTPerformanceMetric_TransientHeapAllocationsKilobytes")
        ]
    }
    
    func testPerformanceCodable() {
        self.measure {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let airports = try! decoder.decode([PKMeasurementOptimizedModel].self, from: data)
            XCTAssertEqual(airports.count, count)
        }
    }
    
    func testPerformanceCodableNotOptimized() {
        self.measure {
            let decoder = JSONDecoder()
            let airports = try! decoder.decode([PKMeasurementNotOptimizedModel].self, from: data)
            XCTAssertEqual(airports.count, count)
        }
    }
    
    func testPerformanceJSONSerialization() {
        self.measure {
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
            let airports = json.map{ PKMeasurementOptimizedModel(json: $0) }
            XCTAssertEqual(airports.count, count)
        }
    }
}
