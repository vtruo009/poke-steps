//
//  HealthManager.swift
//  Pokesteps
//
//  Created by Van Truong on 6/11/25.
//

import Foundation
import HealthKit

enum HealthKitError: Error {
    case noQuantityResult
    case authorizationFailed
}

struct HealthDateRange {
    let start: Date
    let end: Date

    static var today: HealthDateRange {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: Date())
        let end = calendar.date(byAdding: .day, value: 1, to: start)!
        return HealthDateRange(start: start, end: end)
    }

    static var yesterday: HealthDateRange {
        let calendar = Calendar.current
        let start = calendar.date(
            byAdding: .day,
            value: -1,
            to: calendar.startOfDay(for: Date())
        )!
        let end = calendar.date(byAdding: .day, value: 1, to: start)!
        return HealthDateRange(start: start, end: end)
    }
}

class HealthKitManager {
    let healthStore = HKHealthStore()

    func requestAuthorization() async throws {
        let steps = HKQuantityType(.stepCount)
        let healthTypes: Set = [steps]

        let success = await withCheckedContinuation { continuation in
            healthStore
                .requestAuthorization(toShare: [], read: healthTypes) {
                    success, _ in
                    continuation.resume(returning: success)
                }
        }

        if !success {
            throw HealthKitError.authorizationFailed
        }
    }

    func fetchStepCount(for range: HealthDateRange) async throws -> Int {
        let steps = HKQuantityType(.stepCount)

        return try await withCheckedThrowingContinuation { continuation in
            let predicate = HKQuery.predicateForSamples(
                withStart: range.start,
                end: range.end,
                options: .strictStartDate
            )

            let query = HKStatisticsQuery(
                quantityType: steps,
                quantitySamplePredicate: predicate,
                options: .cumulativeSum
            ) { _, result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }

                let steps = Int(
                    result?.sumQuantity()?.doubleValue(for: .count()) ?? 0.0)
                continuation.resume(returning: steps)
            }

            healthStore.execute(query)
        }
    }
}
