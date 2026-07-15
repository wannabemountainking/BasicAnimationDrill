//
//  LinearProgressBarView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/15/26.
//

import SwiftUI

struct LinearProgressBarView: View {
	
	@State private var barWidth: CGFloat = 0
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 8)
				.fill(Color.gray.opacity(0.2))
				.frame(height: 20)
				.frame(maxWidth: .infinity)
				.overlay(alignment: .leading) {
					RoundedRectangle(cornerRadius: 8)
                        .fill(Color.accentColor)
                        .frame(width: <#T##CGFloat?#>)
						
				}
                .background(
                    Geometr
                )
		}
    }
}

#Preview {
    LinearProgressBarView()
}
