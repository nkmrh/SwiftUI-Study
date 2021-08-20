//
//  Polygon.swift
//  Matchedgeometryeffect-part1
//
//  Created by hajime-nakamura on 2021/08/13.
//

import SwiftUI

struct Polygon: View {
    @Environment(\.polygonSides) var sides: Double
    let color: Color

    var body: some View {
        Group {
            if sides >= 30 {
                Circle()
                    .stroke(color, lineWidth: 10)
            } else {
                PolygonShape(sides: sides)
                    .stroke(color, lineWidth: 10)
            }
        }
    }

    struct PolygonShape: Shape {
        var sides: Double

        func path(in rect: CGRect) -> Path {
            let h = Double(min(rect.size.width, rect.size.height)) / 2.0
            let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
            var path = Path()
            let extra: Int = Double(sides) != Double(Int(sides)) ? 1 : 0

            for i in 0..<Int(sides) + extra {
                let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180

                let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))

                if i == 0 {
                    path.move(to: pt) // move to first vertex
                } else {
                    path.addLine(to: pt) // draw line to next vertex
                }
            }

            path.closeSubpath()

            return path
        }
    }
}

extension EnvironmentValues {
    var polygonSides: Double {
        get { return self[PolygonSidesKey.self] }
        set { self[PolygonSidesKey.self] = newValue }
    }
}

public struct PolygonSidesKey: EnvironmentKey {
    public static let defaultValue: Double = 4
}

extension AnyTransition {
    static var polygonTriangle: AnyTransition {
        AnyTransition.modifier(
            active: PolygonModifier(sides: 30, opacity: 0),
            identity: PolygonModifier(sides: 3, opacity: 1)
        )
    }

    static var polygonCircle: AnyTransition {
        AnyTransition.modifier(
            active: PolygonModifier(sides: 3, opacity: 0),
            identity: PolygonModifier(sides: 30, opacity: 1)
        )
    }

    struct PolygonModifier: AnimatableModifier {
        var sides, opacity: Double

        var animatableData: Double {
            get { sides }
            set { sides = newValue }
        }

        func body(content: Content) -> some View {
            return content
                .environment(\.polygonSides, sides)
                .opacity(opacity)
        }
    }
}
