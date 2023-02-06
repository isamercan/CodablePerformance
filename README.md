# CodablePerformance
Swift Codable can automatically synthesize initializers that decode models from JSON.
It may be necessary to benchmark the performance of JSONDecoder against equivalent hand-written code that uses JSONSerialization instead.

I have used Xcode’s built-in testing framework, XCTest to measure the performance of each implementation.
In the setup for both tests (not shown here), a count is specified and the corresponding data set is loaded. Each test then decodes that data within a closure passed to the measure(_:)
<br>**JsonDecoderPKMeasurementOptimizedModel**<br>
<img width="340" alt="JsonDecoderPKMeasurementOptimizedModel" src="https://user-images.githubusercontent.com/299584/216969169-47c3a41d-9d86-4a0b-a7cb-8c7b069e6a86.png">

<br>**JsonDecoderPerformanceCodableNotOptimized**<br>
<img width="336" alt="JsonDecoderPerformanceCodableNotOptimized" src="https://user-images.githubusercontent.com/299584/216969368-5c4e437b-703b-4808-9adb-3c7742630d81.png">

<br>**JSONSerializationPKMeasurementOptimizedModel**<br>
<img width="340" alt="JSONSerializationPKMeasurementOptimizedModel" src="https://user-images.githubusercontent.com/299584/216969458-060f1c27-add7-4d82-9474-98ff98fc914a.png">
