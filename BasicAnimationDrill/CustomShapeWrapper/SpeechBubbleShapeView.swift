//
//  SpeechBubbleShapeView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/14/26.
//

import SwiftUI

struct SpeechBubbleShapeView: View {
	
	@State private var isTailInTrailing: Bool = false
	@State private var isCornerRadiusLarge: Bool = false
	
    var body: some View {
        
		VStack(spacing: 50) {
			SpeechBubbleShape(
				cornerRadius: isCornerRadiusLarge ? 30 : 7,
				tailPosition: isTailInTrailing ? 0.8 : 0.2
			)
			.fill(Color.orange.opacity(0.2))
			.frame(width: 150, height: 100, alignment: .center)
			.overlay(alignment: .center) {
				Text("안녕하세요!")
			}
			.animation(.easeInOut(duration: 1), value: isTailInTrailing)
			.animation(.easeInOut(duration: 1), value: isCornerRadiusLarge)
			
			Button("Move Tail") {
				isTailInTrailing.toggle()
			}
			
			Button("Change CornerRadius") {
				isCornerRadiusLarge.toggle()
			}
		}
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
//		let startPoint: CGPoint = CGPoint(
//			x: rect.minX + cornerRadius,
//			y: rect.minY
//		)
		
		var rectPath = RoundedRectangle(cornerRadius: cornerRadius).path(in: rect)
//
//		let leadingX = rect.minX
//		let trailingX = rect.maxX
//		let topY = rect.minY
//		let bottomY = rect.maxY
//		
//		let topLeadingArcCenter = CGPoint(x: leadingX + cornerRadius, y: topY + cornerRadius)
//		let topTrailingArcCenter = CGPoint(x: trailingX - cornerRadius, y: topY + cornerRadius)
//		let bottomTrailingArcCenter = CGPoint(x: trailingX - cornerRadius, y: bottomY - cornerRadius)
//		let bottomLeadingArcCenter = CGPoint(x: leadingX + cornerRadius, y: bottomY - cornerRadius)
//		
//		var rectPath = Path()
//		rectPath.move(to: startPoint)
//		rectPath.addLine(to: CGPoint(x: trailingX - cornerRadius, y: topY))
//		rectPath.addArc(
//			center: topTrailingArcCenter,
//			radius: cornerRadius,
//			startAngle: Angle(degrees: -90),
//			endAngle: Angle(degrees: 0),
//			clockwise: false
//		)
//		rectPath.addLine(to: CGPoint(x: trailingX, y: bottomY - cornerRadius))
//		rectPath.addArc(
//			center: bottomTrailingArcCenter,
//			radius: cornerRadius,
//			startAngle: Angle(degrees: 0),
//			endAngle: Angle(degrees: 90),
//			clockwise: false
//		)
//		rectPath.addLine(to: CGPoint(x: leadingX + cornerRadius, y: bottomY))
//		rectPath.addArc(
//			center: bottomLeadingArcCenter,
//			radius: cornerRadius,
//			startAngle: Angle(degrees: 90),
//			endAngle: Angle(degrees: 180),
//			clockwise: false
//		)
//		rectPath.addLine(to: CGPoint(x: leadingX, y: topY + cornerRadius))
//		rectPath.addArc(
//			center: topLeadingArcCenter,
//			radius: cornerRadius,
//			startAngle: Angle(degrees: 180),
//			endAngle: Angle(degrees: 270),
//			clockwise: false
//		)
//		rectPath.closeSubpath()
		
		var trianglePath = Path()
		let tailX = rect.minX + (tailPosition * rect.width)
		let triStartingPoint = CGPoint(x: tailX - 10 , y: rect.maxY)
		let triSecondPoint = CGPoint(x: tailX + 10, y: rect.maxY)
		let triPointedPoint = CGPoint(x: tailX, y: rect.maxY + 20)
		
		trianglePath.move(to: triStartingPoint)
		trianglePath.addLine(to: triSecondPoint)
		trianglePath.addLine(to: triPointedPoint)
		trianglePath.closeSubpath()
		
		rectPath.addPath(trianglePath)
		
		return rectPath
	}
}

#Preview {
    SpeechBubbleShapeView()
}
