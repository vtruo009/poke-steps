//
//  ProgressRingView.swift
//  Pokesteps
//
//  Created by Van Truong on 6/2/25.
//

import SwiftUI

struct ProgressRingView: View {
    var progress: CGFloat
    @State var targetValue: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.gray.opacity(0.3), lineWidth: 30)
            Circle()
                .trim(from: 0, to: targetValue)
                .stroke(
                    AppSetting.blue,
                    style: StrokeStyle(lineWidth: 30, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeIn(duration: 2), value: targetValue)
        }
        .padding()
        .drawingGroup()
        .onAppear {
            targetValue = progress
        }
    }
}

#Preview {
    ProgressRingView(progress: 0.65)
}
