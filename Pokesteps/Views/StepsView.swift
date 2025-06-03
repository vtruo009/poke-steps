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
            AppColor.background.ignoresSafeArea()
            
            Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
                .navigationTitle("Steps")
        }
    }
}

#Preview {
    StepsView()
}
