//
//  DonutView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/9/26.
//

import SwiftUI

struct DonutView: View {
	
	@State private var progress: CGFloat = 0.0
	@State private var lineWidth: CGFloat = 50
	@State private var isFastCharging: Bool = false
	@State private var donutColor: Color = .red
	
    var body: some View {
		VStack(spacing: 100) {
			ZStack {
				DonutShape(lineWidth: lineWidth)
					.fill(
						Color.gray.opacity(0.5),
						style: FillStyle(eoFill: true)
					)

				Circle()
					.trim(from: 0, to: progress)
					.stroke(
						donutColor,
						style: StrokeStyle(lineWidth: lineWidth, lineCap: .butt)
					)
					.rotationEffect(Angle(degrees: -90))
			}
			.frame(width: 200, height: 200)
			
			donutButton(title: "진행률 랜덤 변경") {
				progress = CGFloat.random(in: 0.0 ... 1.0)
			}
			
			donutButton(
				title: isFastCharging ? "일반 충전 모드 전환" : "고속 충전 모드 전환",
				completion: {
					isFastCharging.toggle()
					lineWidth = isFastCharging ? 20 : 70
				}
			)
		}
    }
	
	@ViewBuilder
	private func donutButton(title: String, completion: @escaping () -> Void) -> some View {
		Button {
			withAnimation(.easeInOut(duration: 1)) {
				completion()
				switch progress {
				case 0..<0.3: donutColor = .red
				case 0.3..<0.7: donutColor = .yellow
				case 0.7..<1.0: donutColor = .green
				default: print("outOfRange")
				}
			}
		} label: {
			Text(title)
				.font(.title3).bold()
				.foregroundStyle(.white)
				.padding()
				.padding(.horizontal, 50)
				.frame(height: 40)
				.background(Color.blue)
				.clipShape(Capsule())
		}
	}
}

#Preview {
    DonutView()
}
