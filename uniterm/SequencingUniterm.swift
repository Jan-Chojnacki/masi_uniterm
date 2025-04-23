//
//  singleUniterm.swift
//  uniterm
//
//  Created by Jan Chojnacki on 19/04/2025.
//

import SwiftUI

struct SequencingUniterm: View {
    var body: some View {
        VStack(spacing: 0) {
            Canvas { context, size in
                let inset: CGFloat = 10
                let start = CGPoint(x: inset, y: inset)
                let end = CGPoint(x: size.width - inset, y: inset)
                let control1 = CGPoint(x: size.width / 4, y: 0)
                let control2 = CGPoint(x: size.width - size.width / 4, y: 0)
                var path = Path()

                let pointStart = Path(
                    ellipseIn: CGRect(
                        x: start.x - 1, y: start.y - 1, width: 2, height: 2))
                
                let pointEnd = Path(
                    ellipseIn: CGRect(
                        x: end.x - 1, y: end.y - 1, width: 2, height: 2))
                
                path.move(to: start)
                path.addCurve(to: end, control1: control1, control2: control2)
                context.stroke(path, with: .color(.blue), lineWidth: 2)
                context.fill(pointStart, with: .color(.blue))
                context.fill(pointEnd, with: .color(.blue))
            }
            .frame(width: 80, height: 12)
            HStack(spacing: 0) {
                Button("A") {

                }
                .buttonStyle(.plain)
                Spacer()
                Button("B") {

                }
                .buttonStyle(.plain)
            }
            .frame(width: 60)
        }
        .padding()
    }
}

#Preview {
    SequencingUniterm()
}
