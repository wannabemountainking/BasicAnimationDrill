//
//  DonutShape.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/9/26.
//

import SwiftUI


extension DonutShape {
	var animatableData: CGFloat {
		get { lineWidth }
		set { lineWidth = newValue }
	}
}

struct DonutShape: Shape {
	var lineWidth: CGFloat
	
	init(lineWidth: CGFloat) {
		self.lineWidth = lineWidth
	}
	
	func path(in rect: CGRect) -> Path {
		let w = rect.width
		let h = rect.height
		
		let radius = min(w, h) / 2
		let center = CGPoint(x: w / 2, y: h / 2)
		var path = Path()
		path.addArc(
			center: center,
			radius: radius + lineWidth / 2,
			startAngle: Angle(degrees: -90),
			endAngle: Angle(degrees: 270.0),
			clockwise: true
		)
		path.addArc(
			center: center,
			radius: radius - lineWidth / 2,
			startAngle: Angle(degrees: -90),
			endAngle: Angle(degrees: 270.0),
			clockwise: true
		)
		return path
	}
}



#Preview {
	
	VStack {
		DonutShape(lineWidth: 50)
			.fill(Color.green, style: FillStyle(eoFill: true))
			.frame(width: 100, height: 100)
	}
}
