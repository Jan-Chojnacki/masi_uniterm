//
//  ErrorLine.swift
//  uniterm
//
//  Created by Jan Chojnacki on 27/04/2025.
//


import SwiftUI

struct ErrorLine: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                let inset: CGFloat = 1
                let MainLineStart = CGPoint(x: inset, y: 5)
                let MainLineEnd = CGPoint(x: size.width - inset, y: 5)

                var path = Path()

                path.move(to: MainLineStart)
                path.addLine(to: MainLineEnd)

                context.stroke(
                    path, with: .color(.red),
                    style: StrokeStyle(lineWidth: 2, dash: [4, 3]))
            }
        }
    }
}