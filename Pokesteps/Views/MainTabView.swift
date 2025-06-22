//
//  MainTabView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct MainTabView: View {
	@EnvironmentObject var pokemonVM: PokemonViewModel
	@EnvironmentObject var unlockManager: UnlockManager

	var body: some View {
		NavigationView {
			ZStack(alignment: .bottom) {
				switch unlockManager.selectedTab {
				case 0:
					StepsView()
				case 1:
					PokedexView()
				default:
					StepsView()
				}

				HStack {
					tabButton(title: "Steps", icon: "shoe", tag: 0)
					Spacer()
					tabButton(title: "Pokedex", icon: "trophy", tag: 1)
				}
				.transaction { $0.disablesAnimations = true }
				.frame(width: 150, height: 30)
				.padding()
				.background(AppColor.yellow)
				.clipShape(RoundedRectangle(cornerRadius: .infinity))
				.shadow(radius: 5)

				if unlockManager.showPokemonUnlocked {
					PokemonUnlockedView(pokemon: pokemonVM.unlockedPokemon ?? Pokemon())
					.zIndex(10)
				}
			}
		}
		.background(.orange)
	}

	func tabButton(title: String, icon: String, tag: Int) -> some View {
		Button {
			unlockManager.selectedTab = tag
		} label: {
			Image(systemName: icon)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 30, height: 30)
				.scaleEffect(icon == "shoe" ? 1.4 : 1)
				.padding(.vertical, 10)
				.padding(.horizontal, 24)
				.background(
					RoundedRectangle(cornerRadius: .infinity)
						.foregroundStyle(unlockManager.selectedTab == tag ? .white : .clear)
						.frame(width: 75, height: 45)
				)
				.foregroundStyle(.black)
		}
	}
}

#Preview {
	@Previewable @State var userVM: UserViewModel = UserViewModel()
	MainTabView()
		.environmentObject(HealthViewModel())
		.environmentObject(PokemonViewModel(user: userVM.user))
		.environmentObject(userVM)
		.environmentObject(UnlockManager())
}
