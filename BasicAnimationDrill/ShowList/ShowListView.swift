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
		VStack {
			ForEach(items.enumerated(), id: \.offset) { index, item in
				CardView(item: item)
					.offset(x: 0, y: isCardVisible ? 0 : 300)
					.opacity(isCardVisible ? 1 : 0)
					.animation(.easeInOut(duration: 1).delay((Double(index) * 0.15)), value: isCardVisible)
			}
			
			Button("목록 표시") {
				isCardVisible.toggle()
			}
		}
    }
}

struct CardView: View {
	
	let item: Item
	
	var body: some View {
		VStack(alignment: .center, spacing: 30) {
			switch item.cardShape {
			case .roundedRect:
				ShapeView(
					item: item,
					content: AnyShape(RoundedRectangle(cornerRadius: 10))
				)
			case .rect:
				ShapeView(
					item: item,
					content: AnyShape(Rectangle())
				)
			case .capsule:
				ShapeView(
					item: item,
					content: AnyShape(Capsule())
				)
			case .circle:
				ShapeView(
					item: item,
					content: AnyShape(Circle())
				)
			}
		}
	}
}

struct ShapeView: View {
	
	let item: Item
	let content: AnyShape
	
	init( item: Item, content: AnyShape) {
		self.item = item
		self.content = content
	}
	
	var body: some View {
		content
			.stroke(item.backgroundColor, lineWidth: 2)
			.fill(item.backgroundColor)
			.frame(maxWidth: .infinity)
			.frame(height: 70)
			.overlay(alignment: .center) {
				Text(item.description)
					.font(.title)
					.fontWeight(.semibold)
			}
			.padding()
		
	}
}

struct AnyShape: Shape {
	let content: any Shape
	
	init(_ shape: any Shape) {
		self.content = shape
	}
	
	func path(in rect: CGRect) -> Path {
		content.path(in: rect)
	}
}

#Preview {
    ShowListView()
}
