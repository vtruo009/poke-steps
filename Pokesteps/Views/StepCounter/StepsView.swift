//
//  StepsView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/1/25.
//

import SwiftUI

struct StepsView: View {
    @StateObject var healthVM = HealthViewModel()
    
    var body: some View {
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
    }
}

#Preview {
    StepsView()
}
