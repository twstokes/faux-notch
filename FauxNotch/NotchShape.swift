//
//  NotchShape.swift
//  FauxNotch
//
//  Created by Tanner W. Stokes on 10/20/21.
//

import SwiftUI

/// Big thanks to the following blog for the tips:
/// https://adrianhall.github.io/swift/2020/05/03/swiftui-masks/
struct NotchShape: Shape {
    let radius: CGFloat = 8
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let paddedRect = rect.insetBy(dx: radius, dy: 0)
        
        let brc = CGPoint(x: paddedRect.maxX - radius, y: paddedRect.maxY - radius)
        let blc = CGPoint(x: paddedRect.minX + radius, y: paddedRect.maxY - radius)
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addRelativeArc(center: CGPoint(x: rect.width, y: radius), radius: radius,
          startAngle: Angle.degrees(270), delta: Angle.degrees(-90))
        path.addRelativeArc(center: brc, radius: radius,
          startAngle: Angle.degrees(0), delta: Angle.degrees(90))
        path.addRelativeArc(center: blc, radius: radius,
          startAngle: Angle.degrees(90), delta: Angle.degrees(90))
        path.addRelativeArc(center: CGPoint(x: 0, y: radius), radius: radius,
          startAngle: Angle.degrees(0), delta: Angle.degrees(-90))
        path.closeSubpath()
        
        return path
    }
}

struct NotchShape_Previews: PreviewProvider {
    static var previews: some View {
        NotchShape()
            .frame(width: 200, height: 22)
    }
}
