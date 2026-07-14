//
//  PieSliceShape.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/13/26.
//

import SwiftUI

struct PieSliceShapeView: View {
	
	@State private var hasActivated: Bool = false
	
    var body: some View {
		VStack(spacing: 50) {
			PieSliceShape(progress: hasActivated ? 1 : 0)
				.fill(Color.blue)
				.frame(width: 200, height: 200)
				.animation(.easeInOut(duration: 1), value: hasActivated)
			
			
			Button(hasActivated ? "원을 지워라" : "원을 만들어라!") {
				hasActivated.toggle()
			}
			.font(.title)
		}
    }
}

struct PieSliceShape: Shape {
	
	var progress: CGFloat
	
	var animatableData: CGFloat {
		get { progress }
		set { progress = newValue }
	}
	
	func path(in rect: CGRect) -> Path {
		let centerX: CGFloat = rect.width / 2
		let centerY: CGFloat = rect.height / 2
		let center: CGPoint = CGPoint(x: centerX, y: centerY)
		let radius: CGFloat = min(rect.width / 2, rect.height / 2)
		let startRadian: CGFloat = -90 * .pi / 180
		let radian: CGFloat = (progress * 360 - 90) * .pi / CGFloat(180)
		var path = Path()
		path.move(to: center)
		path.addArc(
			center: center,
			radius: radius,
			startAngle: Angle(radians: startRadian),
			endAngle: Angle(radians: radian),
			clockwise: false
		)
		path.closeSubpath()
		return path
	}
}


#Preview {
    PieSliceShapeView()
}
