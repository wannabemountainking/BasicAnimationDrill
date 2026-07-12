//
//  ShowListView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/12/26.
//

import SwiftUI

enum CardShape {
	case roundedRect
	case rect
	case circle
	case capsule
}

struct Item: Identifiable {
	let id = UUID()
	let cardShape: CardShape
	let description: String
	let backgroundColor: Color
}

struct ShowListView: View {
	
	@State private var isCardVisible: Bool = false
	let items: [Item] = [
		Item(cardShape: .roundedRect, description: "둥근직사각형", backgroundColor: .gray.opacity(0.3)),
		Item(cardShape: .capsule, description: "캡슐", backgroundColor: .orange.opacity(0.3)),
		Item(cardShape: .rect, description: "직사각형", backgroundColor: .yellow.opacity(0.3)),
		Item(cardShape: .roundedRect, description: "중복", backgroundColor: .mint.opacity(0.3)),
		Item(cardShape: .rect, description: "또직사각형", backgroundColor: .brown.opacity(0.3))
	]
	
    var body: some View {
        
    }
}

struct CardView<Content: View>: View {
	
	var item: Item
	var content: Content
	
	init(item: Item, @ViewBuilder content: () -> Content) {
		self.item = item
		self.content = content()
	}
	
	var body: some View {
		ZStack {
//			switch item.cardShape {
//			case .roundedRect:
//				RoundedRectangle(cornerRadius: 10)
//			}
		}
	}
}

#Preview {
    ShowListView()
}
