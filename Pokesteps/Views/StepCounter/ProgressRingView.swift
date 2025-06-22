//
//  ProgressRingView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/2/25.
//

import SwiftUI

struct ProgressRingView: View {
	@EnvironmentObject var pokemonVM: PokemonViewModel
	@EnvironmentObject var userVM: UserViewModel
	@EnvironmentObject var unlockManager: UnlockManager

	var progress: CGFloat
	@State var targetValue: CGFloat = 0.0

	var body: some View {
		ZStack {
			Circle()
				.stroke(.gray.opacity(0.3), lineWidth: 35)
			Circle()
				.trim(from: 0, to: targetValue)
				.stroke(
					progress >= 1 ? AppColor.yellow : AppColor.blue,
					style: StrokeStyle(lineWidth: 35, lineCap: .round)
				)
				.rotationEffect(.degrees(-90))
				.onChange(of: progress, initial: false) { _, newProgress in
					withAnimation(.easeInOut(duration: 2)) {
						targetValue = newProgress
					}
				}
		}
		.frame(width: 300, height: 300)
		.padding(20)
		.drawingGroup()
		.onAppear {
			targetValue = progress
		}
		.overlay {
			if progress >= 1 {
				Button {
					let randomId = pokemonVM.unlockRandomPokemon()
					unlockManager.showPokemonUnlocked = true
					userVM.unlockPokemon(randomId)
				} label: {
					Image("pokeball")
						.resizable()
						.scaledToFit()
						.frame(width: 250, height: 250)
						.brightness(userVM.user.unlockedToday ? -0.3 : 0)
				}
				.disabled(pokemonVM.isLoading || userVM.user.unlockedToday)
			}
		}
	}
}

#Preview {
	@Previewable @State var unlockButtonPressed = false
	@Previewable @State var userVM: UserViewModel = UserViewModel()

	ProgressRingView(
		progress: 1
	)
		.environmentObject(userVM)
		.environmentObject(PokemonViewModel(user: userVM.user))
}
