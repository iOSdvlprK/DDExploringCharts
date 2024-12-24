//
//  ColorfulButtonView.swift
//  DDExploringCharts
//
//  Created by joe on 12/22/24.
//

import SwiftUI

struct ColorfulButtonView: View {
    @Binding var colors: [Color]
    let dim: CGFloat
    let offset: CGFloat
    let action: () -> Void
    
    @State private var flip: Bool = false
    
    var count: CGFloat {
        CGFloat(colors.count)
    }
    var factor: CGFloat {
        (dim - offset) / count
    }
    var lastColor: Color {
        colors.last ?? .black
    }
    
    func minRadius(i: Int, offset: CGFloat) -> CGFloat {
        return factor * CGFloat(i) + offset
    }
    func maxRadius(i: Int, offset: CGFloat) -> CGFloat {
        return factor * CGFloat(i + 1) + offset
    }
    
    var body: some View {
        ZStack {
            ForEach(0 ..< colors.count, id: \.self) { i in
                RandomArcFromColorListView(
                    colors: colors,
                    index: i,
                    minRadius: minRadius(i: i, offset: offset),
                    maxRadius: maxRadius(i: i, offset: offset),
                    opacity: 0.9
                )
            }
            
            Circle()
                .stroke(lastColor, lineWidth: factor)
                .frame(width: dim, height: dim)
        }
        .rotation3DEffect(flip ? .zero : .degrees(180), axis: (x:
                .random(in: -1...1), y: .random(in: -1...1), z: 0))
        .onTapGesture {
            colors = Color.randomColorsN(n: colors.count)
            
            withAnimation {
                flip.toggle()
            }
            
            // call action
            action()
        }
    }
}

#Preview {
    ColorfulButtonView(
        colors: .constant(Color.defaultColors),
        dim: 40,
        offset: 10,
        action: {}
    )
}
