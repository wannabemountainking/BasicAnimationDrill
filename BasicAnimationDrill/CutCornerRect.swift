//
//  CutCornerRect.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/8/26.
//

import SwiftUI


extension CutCornerRect {
	var animatableData: CGFloat {
		get { cutAmount }
		set { cutAmount = newValue }
	}
}

struct CutCornerRect: Shape {
	
	var cutAmount: CGFloat
	
	func path(in rect: CGRect) -> Path {
		let w = rect.width
		let h = rect.height
		let c = cutAmount

		var path = Path()
		path.move(to: CGPoint(x: rect.minX, y: rect.minY + h * c))           // 1. 왼쪽 변, 위쪽 잘림 끝
		path.addLine(to: CGPoint(x: rect.minX + w * c, y: rect.minY))        // 2. 위쪽 변, 왼쪽 잘림 끝
		path.addLine(to: CGPoint(x: rect.maxX - w * c, y: rect.minY))        // 3. 위쪽 변, 오른쪽 잘림 시작
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + h * c))        // 4. 오른쪽 변, 위쪽 잘림 끝
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - h * c))        // 5. 오른쪽 변, 아래쪽 잘림 시작
		path.addLine(to: CGPoint(x: rect.maxX - w * c, y: rect.maxY))        // 6. 아래쪽 변, 오른쪽 잘림 끝
		path.addLine(to: CGPoint(x: rect.minX + w * c, y: rect.maxY))        // 7. 아래쪽 변, 왼쪽 잘림 시작
		path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - h * c))        // 8. 왼쪽 변, 아래쪽 잘림 끝
		path.closeSubpath()
		return path
	}
}

struct CutCornerRectDemo: View {
	@State private var cutAmount: CGFloat = 0.0

	var body: some View {
		VStack(spacing: 30) {
			CutCornerRect(cutAmount: cutAmount)
				.fill(.blue)
				.frame(width: 150, height: 100)

			HStack(spacing: 20) {
				Button("0.0으로") {
					withAnimation(.easeInOut(duration: 1)) {
						cutAmount = 0.0
					}
				}
				Button("0.5로") {
					withAnimation(.easeInOut(duration: 1)) {
						cutAmount = 0.5
					}
				}
			}
		}
	}
}

#Preview {
	VStack(spacing: 20) {
		CutCornerRect(cutAmount: 0.0)
			.fill(.blue)
			.frame(width: 150, height: 150)
		CutCornerRect(cutAmount: 0.3)
			.fill(.red)
			.frame(width: 150, height: 150)
		CutCornerRect(cutAmount: 0.5)
			.fill(.green)
			.frame(width: 150, height: 150)
	}
}

#Preview {
	CutCornerRectDemo()
}
