//
//  RandomArcFromColorListView.swift
//  DDExploringCharts
//
//  Created by joe on 12/22/24.
//

import SwiftUI

struct RandomArcFromColorListView: View {
    // parameters
    let colors: [Color]
    let index: Int
    let minRadius: CGFloat
    let maxRadius: CGFloat
    let opacity: CGFloat
    
    // random constant
    let startTrim = Double.random(in: 0...0.5)
    let endTrim = 1.0
//    let endTrim = Double.random(in: 0.6...1.0)
    
    // computed properties
    var isValidIndex: Bool {
        index < colors.count && index >= 0
    }
    var theIndex: Int {
        isValidIndex ? index : 0
    }
    var count: CGFloat { CGFloat(colors.count) }
    var color: Color { colors[theIndex] }
    var endRadius: CGFloat {
        minRadius + maxRadius / count
    }
    var rotate: CGFloat { Double.random(in: 0...360) }
    
    var body: some View {
        ArcView(
            color: color.opacity(opacity),
            startRadius: minRadius,
            endRadius: endRadius,
            startTrim: startTrim,
            endTrim: endTrim,
            rotate: rotate
        )
    }
}

#Preview {
    RandomArcFromColorListView(
        colors: Color.defaultColors,
        index: 0,
        minRadius: 170,
        maxRadius: 180,
        opacity: 0.9
    )
}
