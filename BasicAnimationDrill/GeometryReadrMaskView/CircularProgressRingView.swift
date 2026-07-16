//
//  CircleProgressRingView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/16/26.
//

import SwiftUI

struct CircularProgressRingView: View {
	
	@State private var progress: CGFloat = 0
	
    var body: some View {
		VStack(spacing: 10) {
			CircularProgressRing(progress: progress)
				.frame(width: 200, height: 300)
			Button("+10%") {
				progress = progress >= 0.99 ? 0 : progress + 0.1
			}
		} //:VSTACK
	}
}

struct CircularProgressRing: View {
	
	var progress: CGFloat
	
	var body: some View {
		GeometryReader { geo in
			let diameter = min(geo.size.width, geo.size.height)
			ZStack {
				Circle()
					.stroke(Color.gray.opacity(0.2), lineWidth: 15)
				Circle()
					.trim(from: 0, to: progress)
					.stroke(Color.accentColor, style: StrokeStyle(lineWidth: 15, lineCap: .round))
					.rotationEffect(Angle(degrees: -90))
					.animation(.easeInOut(duration: 0.6), value: progress)
				Text("\(Int((progress * 100).rounded()))%")
			}
			.frame(width: diameter, height: diameter, alignment: .center)
		}
//		.scaledToFit()
		.aspectRatio(1, contentMode: ContentMode.fit)
	}
}


#Preview {
    CircularProgressRingView()
}
