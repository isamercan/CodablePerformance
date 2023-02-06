//
//  PKMeasurementOptimizedModel.swift
//  CodablePerformance
//
//  Created by isa on 6.02.2023.
//

import Foundation

public struct PKMeasurementOptimizedModel: Codable {
    public let id: String
    public let type: String?
    public let startsAt: Date
    public let endsAt: Date
    public let results: String
}

//Json Serilization
extension PKMeasurementOptimizedModel {
    public init(json: [String: Any]) {
        guard let id = json["id"] as? String,
            let type = json["type"] as? String,
            let startsAt = json["startsAt"] as? String,
            let endsAt = json["endsAt"] as? String,
            let results = json["results"] as? String
        else {
            fatalError("Cannot initialize Airport from JSON")
        }
        
        self.id = id
        self.type = type
        self.startsAt = startsAt.toDate()
        self.endsAt = endsAt.toDate()
        self.results = results
    }
}
