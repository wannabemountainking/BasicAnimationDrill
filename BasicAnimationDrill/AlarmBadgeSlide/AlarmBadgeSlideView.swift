//
//  AlarmBadgeSlideView.swift
//  BasicAnimationDrill
//
//  Created by yoonie on 7/12/26.
//

import SwiftUI

struct AlarmBadgeSlideView: View {
    
    @State private var showAlarm: Bool = false
	let startOffset: CGFloat = 200
	let endOffset: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 50) {
            Image(systemName: "bell")
				.resizable()
				.scaledToFit()
				.frame(height: 50)
				.overlay(alignment: .topTrailing) {
					badgeView(badgeNumber: 1)
						.offset(x: showAlarm ? endOffset : startOffset, y: 0)
						.opacity(showAlarm ? 1 : 0)
				}
				.animation(.easeOut(duration: 2), value: showAlarm)
			
			Button {
				//action
				showAlarm.toggle()
			} label: {
				Text("알람 확인")
					.font(.title2)
					.fontWeight(.semibold)
					.foregroundStyle(.white)
					.frame(maxWidth: .infinity)
					.frame(height: 50)
					.background(Color.blue)
					.clipShape(RoundedRectangle(cornerRadius: 10))
			}

        }
		.padding()
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
