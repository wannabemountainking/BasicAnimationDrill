//
//  StarShapeView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/13/26.
//

import SwiftUI


struct StarShapeView: View {
    var body: some View {
		StarShape()
			.fill(Color.yellow)
			.stroke(Color.orange, lineWidth: 3)
			.frame(width: 200, height: 200)
    }
}

struct StarShape: Shape {
	
	func path(in rect: CGRect) -> Path {
		
		let centerX: CGFloat = rect.size.width / 2
		let centerY: CGFloat = rect.size.height / 2
		let largerRadius: CGFloat = min(rect.width / 2, rect.height / 2)
		let smallerRadius: CGFloat = min(rect.width / 5, rect.height / 5)
		
		var path = Path()
		path.move(to: CGPoint(x: centerX, y: centerY - largerRadius))
		for i in 1...9 {
			let radius = i.isMultiple(of: 2) ? largerRadius : smallerRadius
			let radian: CGFloat = (CGFloat(-90) + CGFloat(i) * CGFloat(36)) * (.pi / CGFloat(180))
			let point = CGPoint(
				x: centerX + (radius * cos(radian)),
				y: centerY + (radius * sin(radian))
			)
			path.addLine(to: point)
		}
		path.closeSubpath()
		
		return path
	}
}

#Preview {
    StarShapeView()
}
