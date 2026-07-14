//
//  ExtensionCardView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/14/26.
//

import SwiftUI

struct ExtensionCardView: View {
	
	@State private var cardAUnfold: Bool = false
	@State private var cardBUnfold: Bool = false
	
	var body: some View {
		HStack(spacing: 0) {
			makeCardView(
				title: "카드 A",
				isUnfold: cardAUnfold
			)
			.onTapGesture {
				cardAUnfold.toggle()
			}
			makeCardView(
				title: "카드 B",
				isUnfold: cardBUnfold
			)
			.onTapGesture {
				cardBUnfold.toggle()
			}
		}
		.padding()

	}
	
	@ViewBuilder
	private func makeCardView(title: String, isUnfold: Bool) -> some View {
			VStack(spacing: 20) {
				Text(title)
				Text(isUnfold ? "(펼쳐짐)" : "(접힘)")
				
				if isUnfold {
					Text("추가 내용이 여기에 나타납니다...")
				}
			}
			.font(.title3)
			.fontWeight(.semibold)
			.frame(maxWidth: .infinity)
			.frame(height: isUnfold ? 200 : 80)
			.contentShape(Rectangle())
			.border(Color.gray, width: 2)
			.frame(height: 80, alignment: .top)
			.clipped()
			.buttonStyle(.plain)
			.animation(.easeInOut(duration: 1), value: isUnfold)
	}
}

#Preview {
    ExtensionCardView()
}
