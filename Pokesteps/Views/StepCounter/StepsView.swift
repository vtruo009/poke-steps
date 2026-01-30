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

	@Binding var isPresenting: Bool

	var progress: CGFloat {
		let steps = CGFloat(hkManager.todayStepCount)
		let goal = CGFloat(userVM.user.stepGoal)
		return min(steps / goal, 1.0)
	}

	var body: some View {
		NavigationStack {
			ZStack {
				AppColor.background.ignoresSafeArea()

				VStack {
					Spacer()
					ProgressRingView(progress: progress)
					Spacer()
					Text("\(hkManager.todayStepCount)").font(.custom("JetBrainsMono-Medium", size: 64))
					Text("steps")
					Spacer()
					Text("\(hkManager.yesterdayStepCount)")
						.font(.custom("JetBrainsMono-Medium", size: 32))
					Text("yesterday")
					Spacer()
					Spacer()
				}
				.ignoresSafeArea(.keyboard)
			}
//			.ignoresSafeArea(.keyboard)
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
			.animation(.easeInOut, value: isPresenting)
		}
	}
}

#Preview {
	@Previewable @State var isPresenting: Bool = false
	StepsView(isPresenting: $isPresenting)
		.environmentObject(HealthKitManager())
		.environmentObject(UserViewModel())
}
