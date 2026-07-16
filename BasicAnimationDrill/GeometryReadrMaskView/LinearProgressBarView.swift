//
//  LinearProgressBarView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/15/26.
//

import SwiftUI

struct WidthKey: PreferenceKey {
	typealias Value = CGFloat
	static var defaultValue: Value = 0
	static func reduce(value: inout Value, nextValue: () -> Value) {
		value = nextValue()
	}
}

struct LinearProgressBarView: View {
	
	@State private var barWidth: CGFloat = 0
	@State private var progress: CGFloat = 0
	
    var body: some View {
		VStack(alignment: .center, spacing: 40) {
				RoundedRectangle(cornerRadius: 8)
					.fill(Color.gray.opacity(0.2))
					.frame(height: 20)
					.frame(maxWidth: .infinity)
					.overlay(alignment: .leading) {
						RoundedRectangle(cornerRadius: 8)
							.fill(Color.accentColor)
							.frame(width: barWidth * progress)
							.animation(.easeInOut(duration: 0.6), value: progress)
					}
					.background(
						GeometryReader(content: { geo in
							Color.clear.preference(key: WidthKey.self, value: geo.size.width)
						}) //:GEOMETRY
					)
					.onPreferenceChange(WidthKey.self) { newWidth in
						barWidth = newWidth
					}
					.padding()
			
			Text("\(Int((progress * 100).rounded()))%")
			
			Button("+10%") {
				progress = progress >= 0.99 ? 0 : progress + 0.1
//				switch progress {
//					case 0 ... 0.99: progress += 0.1
//					default: progress = 0
//				}
			}
		}
    }
}

#Preview {
    LinearProgressBarView()
}
