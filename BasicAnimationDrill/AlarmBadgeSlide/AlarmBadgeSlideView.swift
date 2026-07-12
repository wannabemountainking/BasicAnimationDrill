//
//  AlarmBadgeSlideView.swift
//  BasicAnimationDrill
//
//  Created by yoonie on 7/12/26.
//

import SwiftUI

struct AlarmBadgeSlideView: View {
    
    @State private var showAlarm: Bool = false
    
    var body: some View {
        VStack(spacing: 50) {
            Image(systemName: "bell")
        }
    }
    
    private func badgeView(badgeNumber: Int) -> some View {
        ZStack {
            Circle()
                .fill(.red)
                .frame(width: 24, height: 24)
                .overlay {
                    Text("\(badgeNumber)")
                        .foregroundStyle(.white)
                }
        }
    }
}



#Preview {
    AlarmBadgeSlideView()
}
