//
//  SpeechBubbleShapeView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/14/26.
//

import SwiftUI

struct SpeechBubbleShapeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SpeechBubbleShape: Shape {
	
	var cornerRadius: CGFloat
	var tailPosition: CGFloat
	
	var animatableData: AnimatablePair<CGFloat, CGFloat> {
		get {
			AnimatablePair(cornerRadius, tailPosition)
		}
		set {
			cornerRadius = newValue.first
			tailPosition = newValue.second
		}
	}
	
	func path(in rect: CGRect) -> Path {
		
		var path = Path()
		
		return path
	}
	
	private func roundedRectanglePath(in rect: CGRect) -> Path {
		
		let startPoint: CGPoint = CGPoint(
			x: rect.minX + cornerRadius,
			y: rect.minY
		)
		let leadingX = rect.minX
		let trailingX = rect.maxX
		let topY = rect.minY
		let bottomY = rect.maxY
		
		let topLeadingArcCenter = CGPoint(x: leadingX + cornerRadius, y: topY + cornerRadius)
		let topTrailingArcCenter = CGPoint(x: trailingX - cornerRadius, y: topY + cornerRadius)
		let bottomTrailingArcCenter = CGPoint(x: trailingX - cornerRadius, y: bottomY - cornerRadius)
		let bottomLeadingArcCenter = CGPoint(x: leadingX + cornerRadius, y: bottomY - cornerRadius)
		
		var path = Path()
		path.move(to: startPoint)
		path.addLine(to: CGPoint(x: trailingX - cornerRadius, y: topY))
		path.addArc(
			center: topTrailingArcCenter,
			radius: cornerRadius,
			startAngle: Angle(degrees: -90),
			endAngle: Angle(degrees: 0),
			clockwise: false
		)
		path.addLine(to: CGPoint(x: trailingX, y: bottomY - cornerRadius))
		path.addArc(
			center: bottomTrailingArcCenter,
			radius: cornerRadius,
			startAngle: Angle(degrees: 0),
			endAngle: Angle(degrees: 90),
			clockwise: false
		)
		path.addLine(to: CGPoint(x: leadingX + cornerRadius, y: bottomY))
		path.addArc(
			center: bottomLeadingArcCenter,
			radius: cornerRadius,
			startAngle: Angle(degrees: 90),
			endAngle: Angle(degrees: 180),
			clockwise: false
		)
		path.addLine(to: CGPoint(x: leadingX, y: topY + cornerRadius))
		path.addArc(
			center: topLeadingArcCenter,
			radius: cornerRadius,
			startAngle: Angle(degrees: 180),
			endAngle: Angle(degrees: 270),
			clockwise: false
		)
		path.closeSubpath()
		return path
	}
	
	private func reverseTriangle(in rect: CGRect) -> Path {
		let tailX = rect.midX + (tailPosition * rect.width)
		let startingPoint = CGPoint(x: tailX - 10 , y: rect.minY)
		let secondPoint = CGPoint(x: rect.maxX, y: rect.minY)
		let pointedPoint = CGPoint(x: tailX, y: rect.maxY)
		
		var path = Path()
		path.move(to: startingPoint)
		path.addLine(to: secondPoint)
		path.addLine(to: pointedPoint)
		path.addLine(to: startingPoint)
		path.closeSubpath()
		
		return path
	}
	
}

#Preview {
    SpeechBubbleShapeView()
}
