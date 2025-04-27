//
//  ParallelizationLine.swift
//  uniterm
//
//  Created by Jan Chojnacki on 27/04/2025.
//


import SwiftUI

struct ParallelizationLine: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                let inset: CGFloat = 1
                let MainLineStart = CGPoint(x: inset, y: 1)
                let MainLineEnd = CGPoint(x: size.width - inset, y: 1)

                let LeftLineStart = CGPoint(x: inset, y: 0)
                let LeftLineEnd = CGPoint(x: inset, y: 10)

                let RightLineStart = CGPoint(x: size.width - inset, y: 0)
                let RightLineEnd = CGPoint(x: size.width - inset, y: 10)

                var path = Path()

                path.move(to: MainLineStart)
                path.addLine(to: MainLineEnd)

                path.move(to: LeftLineStart)
                path.addLine(to: LeftLineEnd)

                path.move(to: RightLineStart)
                path.addLine(to: RightLineEnd)

                context.stroke(path, with: .color(.blue), lineWidth: 2)
            }
        }
    }
}