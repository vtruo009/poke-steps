//
//  StepsView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct StepsView: View {
    var body: some View {
        ZStack {
            AppSetting.background.ignoresSafeArea()
            
            VStack {
                Spacer()
                // TODO: replace with calculated progress
                ProgressRingView(progress: 0.79)
                    .frame(width: 350, height: 350)
                Spacer()
                // TODO: replace with HealthManager data
                Text("3000").font(.system(size: 64))
                Text("steps")
                Spacer()
                // TODO: replace with HealthManager data
                Text("10,000").font(.largeTitle)
                Text("yesterday")
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    StepsView()
}
