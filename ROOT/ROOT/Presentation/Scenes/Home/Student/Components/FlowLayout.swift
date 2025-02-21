import SwiftUI

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(
            in: proposal.replacingUnspecifiedDimensions().width,
            subviews: subviews,
            spacing: spacing
        )
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(
            in: bounds.width,
            subviews: subviews,
            spacing: spacing
        )
        
        for (index, line) in result.lines.enumerated() {
            let y = result.lineOrigins[index].y + bounds.minY
            var x = bounds.minX
            
            for viewIndex in line {
                let view = subviews[viewIndex]
                let viewSize = result.sizes[viewIndex]
                
                view.place(
                    at: CGPoint(x: x, y: y),
                    proposal: ProposedViewSize(viewSize)
                )
                x += viewSize.width + spacing
            }
        }
    }
    
    struct FlowResult {
        var lines: [[Int]] = [[]]
        var lineOrigins: [CGPoint] = [.zero]
        var sizes: [CGSize] = []
        var size: CGSize = .zero
        
        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var currentX: CGFloat = 0
            var currentY: CGFloat = 0
            var lineHeight: CGFloat = 0
            
            for (index, view) in subviews.enumerated() {
                let viewSize = view.sizeThatFits(.unspecified)
                sizes.append(viewSize)
                
                if currentX + viewSize.width > maxWidth, !lines[lines.count - 1].isEmpty {
                    currentX = 0
                    currentY += lineHeight + spacing
                    lineHeight = 0
                    lines.append([])
                    lineOrigins.append(CGPoint(x: 0, y: currentY))
                }
                
                lines[lines.count - 1].append(index)
                currentX += viewSize.width + spacing
                lineHeight = max(lineHeight, viewSize.height)
                size.width = max(size.width, currentX)
            }
            
            size.height = currentY + lineHeight
        }
    }
}
