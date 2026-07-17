//
//  TextWipeRevealView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/17/26.
//

import SwiftUI

struct TextWipeRevealView: View {
	
	@State private var maskWidth: CGFloat = 0
	
	
	struct WidthKey: PreferenceKey {
		static var defaultValue: CGFloat = 0
		static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
			value = nextValue()
		}
		
	}
	
    var body: some View {
		ZStack {
			ZStack {
				Text("HELLO WORLD")
					.font(.system(size: 50, weight: .bold))
					.foregroundStyle(Color.gray.opacity(0.3))
			}
			ZStack {
				Text("HELLO WORLD")
					.font(.system(size: 50, weight: .bold))
					.foregroundStyle(Gradient(colors: [.accentColor, .yellow, .pink]))
					.mask(alignment: .leading, {
						Rectangle()
							.frame(width: maskWidth, alignment: .leading)
					})
					.background(
						GeometryReader(
							content: { geo in
								Color.clear.preference(
									key: WidthKey.self,
									value: geo.size.width
								)
						})
					)
			}
		}
		.onPreferenceChange(WidthKey.self) { newWidth in
			maskWidth = newWidth
		}
    }
}

#Preview {
    TextWipeRevealView()
}
