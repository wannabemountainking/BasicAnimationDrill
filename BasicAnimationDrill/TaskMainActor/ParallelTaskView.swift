//
//  ParallelTaskView.swift
//  BasicAnimationDrill
//
//  Created by YoonieMac on 7/18/26.
//

import SwiftUI

struct ParallelTaskView: View {
	
	
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ServerCallResult {
	let id = UUID()
	var message: String
	var waitingTime: TimeInterval
	var isLoading: Bool
}

#Preview {
    ParallelTaskView()
}
