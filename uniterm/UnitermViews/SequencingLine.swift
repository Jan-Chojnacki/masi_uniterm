import SwiftUI

struct SequencingLine: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                let inset: CGFloat = 1
                let MainLineStart = CGPoint(x: inset, y: 10)
                let MainLineEnd = CGPoint(x: size.width - inset, y: 10)

                let control1 = CGPoint(x: size.width / 4, y: 0)
                let control2 = CGPoint(x: size.width - size.width / 4, y: 0)

                var path = Path()

                let pointStart = Path(
                    ellipseIn: CGRect(
                        x: MainLineStart.x - 1,
                        y: MainLineStart.y - 1,
                        width: 2,
                        height: 2))

                let pointEnd = Path(
                    ellipseIn: CGRect(
                        x: MainLineEnd.x - 1,
                        y: MainLineEnd.y - 1,
                        width: 2,
                        height: 2))

                path.move(to: MainLineStart)
                path.addCurve(
                    to: MainLineEnd, control1: control1, control2: control2)

                context.stroke(path, with: .color(.blue), lineWidth: 2)
                context.fill(pointStart, with: .color(.blue))
                context.fill(pointEnd, with: .color(.blue))
            }
        }
    }
}