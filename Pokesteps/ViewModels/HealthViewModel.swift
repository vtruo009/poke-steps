//
//  HealthViewModel.swift
//  Pokesteps
//
//  Created by Van Truong on 6/11/25.
//

import Foundation

@MainActor
class HealthViewModel: ObservableObject {
    @Published var todaySteps: Int = 0
    @Published var yesterdaySteps: Int = 0

    let healthManager = HealthKitManager()

    init() {
        Task {
            do {
                try await healthManager.requestAuthorization()
                
                self.todaySteps = try await healthManager.fetchStepCount(for: HealthDateRange.today)
                self.yesterdaySteps = try await healthManager.fetchStepCount(for: HealthDateRange.yesterday)
            } catch {
                print("FAILED: \(error.localizedDescription)")
            }
        }
    }

}
