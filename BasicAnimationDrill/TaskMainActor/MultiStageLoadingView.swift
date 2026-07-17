//
//  MultiStageLoadingView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/17/26.
//

import SwiftUI


enum LoadingState: CaseIterable, Equatable {
	case idle, connecting, downloading, done
	
	static let delayTime: CGFloat = 0.8
	
	var progress: CGFloat {
		switch self {
		case .idle: return 0
		case .connecting: return 0.33
		case .downloading: return 0.66
		case .done: return 1.0
		}
	}
	
	var message: String {
		switch self {
		case .idle: return "0단계: 준비 중..."
		case .connecting: return "1단계: 서버 연결 중..."
		case .downloading: return "2단계: 데이터 다운로드 중..."
		case .done: return "3단계: 완료!"
		}
	}
}

struct WideKey: PreferenceKey {
	typealias Value = CGFloat
	
	static let defaultValue: CGFloat = 0
	static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
		value = nextValue()
	}
}

struct MultiStageLoadingView: View {
	
	@State private var barWidth: CGFloat = 0
	@State private var currentStage: LoadingState = .idle
	
    var body: some View {
		VStack(spacing: 30) {
			Text(currentStage.message)
				.font(.title2)
				.fontWeight(.semibold)
			progressBar(stage: currentStage)
			
			Text("progress: \(Int((currentStage.progress * 100).rounded()))%")
		}
		.padding()
		.task {
			for stage in LoadingState.allCases {
				currentStage = stage
				try? await Task.sleep(for: .seconds(0.8))
			}
		}
    }
	
	@ViewBuilder
	private func progressBar(stage: LoadingState) -> some View {
		Rectangle()
			.fill(Color.gray.opacity(0.2))
			.frame(height: 20)
			.frame(maxWidth: .infinity)
			.overlay(alignment: .leading) {
				Rectangle()
					.fill(Color.accentColor)
					.frame(width: barWidth * stage.progress)
					.animation(.easeOut(duration: 1.0), value: stage)
			}
			.background(
				GeometryReader { geo in
					Color.clear.preference(key: WideKey.self, value: geo.size.width)
				}
			)
			.onPreferenceChange(WideKey.self) { newValue in
				barWidth = newValue
			}
	}
}

#Preview {
    MultiStageLoadingView()
}
