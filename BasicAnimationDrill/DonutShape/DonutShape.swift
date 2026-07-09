//
//  DonutShape.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/9/26.
//

import SwiftUI


extension DonutShape {
	var animatableData: CGFloat {
		get { innerRadiusRatio }
		set { innerRadiusRatio = newValue }
	}
}

struct DonutShape: Shape {
	var innerRadiusRatio: CGFloat
	
	init(innerRadiusRatio: CGFloat) {
		self.innerRadiusRatio = innerRadiusRatio
	}
	
	func path(in rect: CGRect) -> Path {
		guard innerRadiusRatio >= 0.0 && innerRadiusRatio <= 1.0 else { return Path() }
		let w = rect.width
		let h = rect.height
		
		let radius = min(w, h) / 2
		let center = CGPoint(x: w / 2, y: h / 2)
		var path = Path()
		path.addArc(
			center: center,
			radius: radius,
			startAngle: Angle(degrees: 0),
			endAngle: Angle(degrees: 360.0),
			clockwise: true
		)
		path.addArc(
			center: center,
			radius: radius * innerRadiusRatio,
			startAngle: Angle(degrees: 0),
			endAngle: Angle(degrees: 360.0),
			clockwise: true
		)
		return path
	}
}



#Preview {
	
	VStack {
		DonutShape(innerRadiusRatio: 0.2)
			.fill(Color.green, style: FillStyle(eoFill: true))
			.frame(width: 100, height: 100)
	}
}
