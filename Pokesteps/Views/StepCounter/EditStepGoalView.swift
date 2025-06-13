//
//  EditStepGoalView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/12/25.
//

import SwiftUI

struct EditStepGoalView: View {
	@Binding var stepGoal: Int
	@Binding var isPresented: Bool
	@State private var input: String = ""

	var body: some View {
		VStack(spacing: 20) {
			Text("Edit Step Goal")
				.font(.system(size: 30))
				.fontWeight(.semibold)

			Text("Your current step goal is \(stepGoal).")

			TextField("Enter new step goal", text: $input)
				.keyboardType(.numberPad)
				.padding()
				.background(Color(.secondarySystemBackground))
				.cornerRadius(10)

			HStack {
				Button {
					isPresented = false
				} label: {
					Text("Cancel")
						.background(
							RoundedRectangle(cornerRadius: 10)
								.stroke()
								.frame(width: 100, height: 40)
						)
				}
				.buttonStyle(PlainButtonStyle())
				.padding(.trailing, 30)

				Button {
					if let newGoal = Int(input) {
						stepGoal = newGoal
					}
					isPresented = false
				} label: {
					Text("Save")
						.fontWeight(.medium)
						.foregroundStyle(.black)
						.background(
							RoundedRectangle(cornerRadius: 10)
								.foregroundStyle(AppColor.yellow)
								.frame(width: 100, height: 40)
						)
				}
				.padding(.leading, 30)
			}
			.padding(.vertical, 20)
		}
		.padding()
		.background(Color.white)
		.cornerRadius(16)
		.shadow(radius: 10)
		.padding(40)
	}
}

#Preview {
	@Previewable @State var stepGoal = 1234
	@Previewable @State var isPresenting = false
	EditStepGoalView(stepGoal: $stepGoal, isPresented: $isPresenting)
}
