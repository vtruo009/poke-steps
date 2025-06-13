//
//  StepsView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct StepsView: View {
	@StateObject var healthVM = HealthViewModel()
	@State var isPresenting = false
	// TODO: Replace with user's step goal
	@State var stepGoal = 9000

	var body: some View {
		NavigationView {
			ZStack {
				AppColor.background.ignoresSafeArea()

				VStack {
					Spacer()
					// TODO: replace with calculated progress
					ProgressRingView(progress: 0.71)
					Spacer()
					Text("\(healthVM.todaySteps)").font(.system(size: 64))
					Text("steps")
					Spacer()
					Text("\(healthVM.yesterdaySteps)").font(.largeTitle)
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
					}
					.buttonStyle(PlainButtonStyle())
					.padding()
				}
			}
			.overlay {
				if isPresenting {
					Color.black.opacity(0.4).ignoresSafeArea()

					EditStepGoalView(
						stepGoal: $stepGoal,
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
}
