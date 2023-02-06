# CodablePerformance
Swift Codable can automatically synthesize initializers that decode models from JSON.
It may be necessary to benchmark the performance of JSONDecoder against equivalent hand-written code that uses JSONSerialization instead.

I have used Xcode’s built-in testing framework, XCTest to measure the performance of each implementation.
In the setup for both tests (not shown here), a count is specified and the corresponding data set is loaded. Each test then decodes that data within a closure passed to the measure(_:)
