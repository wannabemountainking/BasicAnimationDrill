//
//  SingleDelayLoading.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/17/26.
//

import SwiftUI


struct SingleDelayLoading: View {
	
	@State private var isLoading: Bool = true
	
    var body: some View {
		
		VStack {
			if !isLoading {
				VStack {
					Label("데이터 로드 완료", systemImage: "checkmark.circle.fill")
					Text("안녕하세요")
				}
				.transition(.opacity)
			} else {
				ProgressView("로딩 중...")
					.transition(.opacity)
			}
		}
		.animation(.easeOut(duration: 0.5), value: isLoading)
		.task {
			try? await Task.sleep(for: .seconds(2))
			isLoading = false
		}
		
    }
}

#Preview {
    SingleDelayLoading()
}
