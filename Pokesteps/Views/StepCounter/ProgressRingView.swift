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
                .stroke(.gray.opacity(0.3), lineWidth: 35)
            Circle()
                .trim(from: 0, to: targetValue)
                .stroke(
                    progress >= 1 ? AppColor.yellow : AppColor.blue,
                    style: StrokeStyle(lineWidth: 35, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeIn(duration: 2), value: targetValue)
        }
        .frame(width: 330, height: 330)
        .padding(20)
        .drawingGroup()
        .onAppear {
            targetValue = progress
        }
        .overlay {
            if progress >= 1 {
                Button {
                    print("unlock pokemon")
                } label: {
                    Image("pokeball")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260, height: 260)
                }
            }
        }
    }
}

#Preview {
    ProgressRingView(progress: 1)
}
