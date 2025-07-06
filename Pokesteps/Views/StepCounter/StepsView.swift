//
//  StepsView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct StepsView: View {
	@EnvironmentObject var hkManager: HealthKitManager
	@EnvironmentObject var userVM: UserViewModel

	@State var isPresenting = false

	var progress: CGFloat {
		let steps = CGFloat(hkManager.todayStepCount)
		let goal = CGFloat(userVM.user.stepGoal)
		return min(steps / goal, 1.0)
	}

	var body: some View {
		NavigationView {
			ZStack {
				AppColor.background.ignoresSafeArea()

				VStack {
					Spacer()
					ProgressRingView(progress: progress)
					Spacer()
					Text("\(hkManager.todayStepCount)").font(.system(size: 64))
					Text("steps")
					Spacer()
					Text("\(hkManager.yesterdayStepCount)").font(.largeTitle)
					Text("yesterday")
					Spacer()
					Spacer()
				}
			}
			.toolbar {
				ToolbarItem(placement: .confirmationAction) {
					Button {
						isPresenting = true
					} label: {
						Image(systemName: "square.and.pencil")
							.resizable()
							.frame(width: 30, height: 30)
							.padding()
					}
					.buttonStyle(PlainButtonStyle())
				}
			}
			.overlay {
				if isPresenting {
					Color.black.opacity(0.4).ignoresSafeArea()

					EditStepGoalView(
						isPresented: $isPresenting
					)

				}
			}
			.animation(.easeInOut, value: isPresenting)
		}
	}
}

#Preview {
	StepsView()
		.environmentObject(HealthKitManager())
		.environmentObject(UserViewModel())
}
