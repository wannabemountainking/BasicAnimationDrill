//
//  DonutView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/9/26.
//

import SwiftUI

struct DonutView: View {
	
	@State private var progress: CGFloat = 0.0
	
    var body: some View {
		
		VStack(spacing: 30) {
			DonutShape(innerRadiusRatio: 0.5)
				.trim(from: 0, to: progress)
				.fill(Color.green, style: FillStyle(eoFill: true))
				.frame(width: 200, height: 200)
			
			Button("진행율 랜덤 변경") {
				withAnimation(.easeInOut(duration: 0.8)) {
					progress = CGFloat.random(in: 0.0 ... 1.0)
					
				}
				
			}
		}
    }
}

#Preview {
    DonutView()
}
