//
//  PieSliceShape.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/13/26.
//

import SwiftUI

struct PieSliceShapeView: View {
    var body: some View {
		PieSliceShape(progress: 0.6)
    }
}

struct PieSliceShape: Shape {
	
	let progress: CGFloat
	
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
			startAngle: Angle(degrees: startRadian),
			endAngle: Angle(radians: radian),
			clockwise: true
		)
		path.closeSubpath()
		return path
	}
	
	
}

#Preview {
    PieSliceShapeView()
}
