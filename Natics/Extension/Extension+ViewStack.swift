//
//  Extension+ViewStack.swift
//  Natics
//
//  Created by Jackie Leonardy on 10/11/21.
//
import SwiftUI

/// WrappingHStack is a UI Element that works in a very similar way to HStack,
///  but automatically positions overflowing elements on next lines.
///  It can be customized by using alignment (controls the alignment of the
///  items, it may get ignored when combined with `dynamicIncludingBorders`
///  or `.dynamic` spacing), spacing (use `.constant` for fixed spacing,
///  `.dynamic` to have the items fill the width of the WrappingHSTack and
///  `.dynamicIncludingBorders` to fill the full width with equal spacing
///  between items and from the items to the border.)
public struct WrappingHStack: View {
    private struct CGFloatPreferenceKey: PreferenceKey {
        static var defaultValue = CGFloat.zero
        static func reduce(value: inout CGFloat , nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
    
    enum ViewType {
        case any(AnyView)
        case newLine
        
        init<V: View>(rawView: V) {
            switch rawView {
            case is NewLine: self = .newLine
            default: self = .any(AnyView(rawView))
            }
        }
    }
    
    public enum Spacing {
        case constant(CGFloat)
        case dynamic(minSpacing: CGFloat)
        case dynamicIncludingBorders(minSpacing: CGFloat)
        
        internal var estimatedSpacing: CGFloat {
            switch self {
            case .constant(let constantSpacing):
                return constantSpacing
            case .dynamic(minSpacing: let minSpacing), .dynamicIncludingBorders(minSpacing: let minSpacing):
                return minSpacing
            }
        }
    }
    
    let items: [ViewType]
    let alignment: HorizontalAlignment
    let spacing: Spacing
    @State private var height: CGFloat = 0
    
    public var body: some View {
        GeometryReader { geo in
            InternalWrappingHStack (
                width: geo.frame(in: .global).width,
                alignment: alignment,
                spacing: spacing,
                content: items
            )
            .anchorPreference(
                key: CGFloatPreferenceKey.self,
                value: .bounds,
                transform: {
                    geo[$0].size.height
                }
            )
        }
        .frame(height: height)
        .onPreferenceChange(CGFloatPreferenceKey.self, perform: {
            height = $0
        })
    }
}


// Convenience inits that allows 10 Elements (just like HStack).
// Based on https://alejandromp.com/blog/implementing-a-equally-spaced-stack-in-swiftui-thanks-to-tupleview/
public extension WrappingHStack {
    private static func viewType<V: View>(from view: V) -> ViewType {
        switch view {
        case is NewLine: return .newLine
        default: return .any(AnyView(view))
        }
    }

    /// Instatiates a WrappingHStack
    /// - Parameters:
    ///   - data: The items to show
    ///   - id: The `KeyPath` to use as id for the items
    ///   - alignment: Controls the alignment of the items. This may get
    ///    ignored when combined with `.dynamicIncludingBorders` or
    ///    `.dynamic` spacing.
    ///   - spacing: Use `.constant` for fixed spacing, `.dynamic` to have
    ///    the items fill the width of the WrappingHSTack and
    ///    `.dynamicIncludingBorders` to fill the full width with equal spacing
    ///    between items and from the items to the border.
    ///   - content: The content and behavior of the view.
    init<Data: RandomAccessCollection, Content: View>(_ data: Data, id: KeyPath<Data.Element, Data.Element> = \.self, alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = data.map { Self.viewType(from: content($0[keyPath: id])) }
    }

    init<A: View>(alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: () -> A) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = [Self.viewType(from: content())]
    }

    init<A: View, B: View>(alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: () -> TupleView<(A, B)>) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = [Self.viewType(from: content().value.0),
                      Self.viewType(from: content().value.1)]
    }

    init<A: View, B: View, C: View>(alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: () -> TupleView<(A, B, C)>) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = [Self.viewType(from: content().value.0),
                      Self.viewType(from: content().value.1),
                      Self.viewType(from: content().value.2)]
    }

    init<A: View, B: View, C: View, D: View>(alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: () -> TupleView<(A, B, C, D)>) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = [Self.viewType(from: content().value.0),
                      Self.viewType(from: content().value.1),
                      Self.viewType(from: content().value.2),
                      Self.viewType(from: content().value.3)]
    }

    init<A: View, B: View, C: View, D: View, E: View>(alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: () -> TupleView<(A, B, C, D, E)>) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = [Self.viewType(from: content().value.0),
                      Self.viewType(from: content().value.1),
                      Self.viewType(from: content().value.2),
                      Self.viewType(from: content().value.3),
                      Self.viewType(from: content().value.4)]
    }

    init<A: View, B: View, C: View, D: View, E: View, F: View>(alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: () -> TupleView<(A, B, C, D, E, F)>) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = [Self.viewType(from: content().value.0),
                      Self.viewType(from: content().value.1),
                      Self.viewType(from: content().value.2),
                      Self.viewType(from: content().value.3),
                      Self.viewType(from: content().value.4),
                      Self.viewType(from: content().value.5)]
    }

    init<A: View, B: View, C: View, D: View, E: View, F: View, G: View>(alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: () -> TupleView<(A, B, C, D, E, F, G)>) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = [Self.viewType(from: content().value.0),
                      Self.viewType(from: content().value.1),
                      Self.viewType(from: content().value.2),
                      Self.viewType(from: content().value.3),
                      Self.viewType(from: content().value.4),
                      Self.viewType(from: content().value.5),
                      Self.viewType(from: content().value.6)]
    }

    init<A: View, B: View, C: View, D: View, E: View, F: View, G: View, H: View>(alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: () -> TupleView<(A, B, C, D, E, F, G, H)>) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = [Self.viewType(from: content().value.0),
                      Self.viewType(from: content().value.1),
                      Self.viewType(from: content().value.2),
                      Self.viewType(from: content().value.3),
                      Self.viewType(from: content().value.4),
                      Self.viewType(from: content().value.5),
                      Self.viewType(from: content().value.6),
                      Self.viewType(from: content().value.7)]
    }

    init<A: View, B: View, C: View, D: View, E: View, F: View, G: View, H: View, I: View>(alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: () -> TupleView<(A, B, C, D, E, F ,G, H, I)>) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = [Self.viewType(from: content().value.0),
                      Self.viewType(from: content().value.1),
                      Self.viewType(from: content().value.2),
                      Self.viewType(from: content().value.3),
                      Self.viewType(from: content().value.4),
                      Self.viewType(from: content().value.5),
                      Self.viewType(from: content().value.6),
                      Self.viewType(from: content().value.7),
                      Self.viewType(from: content().value.8)]
    }

    init<A: View, B: View, C: View, D: View, E: View, F: View, G: View, H: View, I: View, J: View>(alignment: HorizontalAlignment = .leading, spacing: Spacing = .constant(8), @ViewBuilder content: () -> TupleView<(A, B, C, D, E, F ,G, H, I, J)>) {
        self.spacing = spacing
        self.alignment = alignment
        self.items = [Self.viewType(from: content().value.0),
                      Self.viewType(from: content().value.1),
                      Self.viewType(from: content().value.2),
                      Self.viewType(from: content().value.3),
                      Self.viewType(from: content().value.4),
                      Self.viewType(from: content().value.5),
                      Self.viewType(from: content().value.6),
                      Self.viewType(from: content().value.7),
                      Self.viewType(from: content().value.8),
                      Self.viewType(from: content().value.9)]
    }
}

public struct NewLine: View {
    public init() { }
    public let body = Spacer(minLength: .infinity)
}

struct InternalWrappingHStack: View {
    let width: CGFloat
    let alignment: HorizontalAlignment
    let spacing: WrappingHStack.Spacing
    let content: [WrappingHStack.ViewType]
    let firstItemOfEachLane: [Int]

    init(width: CGFloat, alignment: HorizontalAlignment, spacing: WrappingHStack.Spacing, content: [WrappingHStack.ViewType]) {
        self.width = width
        self.alignment = alignment
        self.spacing = spacing
        self.content = content

        firstItemOfEachLane = content
            .enumerated()
            .reduce((firstItems: [], currentLineWidth: width)) { (result, contentIterator) -> (firstItemOfEachLane: [Int], currentLineWidth: CGFloat) in
                var (firstItemOfEachLane, currentLineWidth) = result

                switch contentIterator.element {
                case .newLine:
                    return (firstItemOfEachLane + [contentIterator.offset], width)
                case .any(let anyView):
                    #if os(iOS)
                    let hostingController = UIHostingController(rootView: HStack(spacing: spacing.estimatedSpacing) { anyView })
                    #else
                    let hostingController = NSHostingController(rootView: HStack(spacing: spacing.estimatedSpacing) { anyView })
                    #endif

                    let itemWidth = hostingController.view.intrinsicContentSize.width

                    if result.currentLineWidth + itemWidth + spacing.estimatedSpacing > width {
                        currentLineWidth = itemWidth
                        firstItemOfEachLane.append(contentIterator.offset)
                    } else {
                        currentLineWidth += itemWidth + spacing.estimatedSpacing
                    }
                    return (firstItemOfEachLane, currentLineWidth)
                }
            }.0
    }

    var totalLanes: Int {
        firstItemOfEachLane.count
    }

    func startOf(lane i: Int) -> Int {
        firstItemOfEachLane[i]
    }

    func endOf(lane i: Int) -> Int {
        i == totalLanes - 1 ? content.count - 1 : firstItemOfEachLane[i + 1] - 1
    }

    func hasExactlyOneElement(lane i: Int) -> Bool {
        startOf(lane: i) == endOf(lane: i)
    }

    func shouldHaveSideSpacers(lane i: Int) -> Bool {
        if case .constant = spacing {
            return true
        }
        if case .dynamic = spacing, hasExactlyOneElement(lane: i) {
            return true
        }
        return false
    }

    var body: some View {
        VStack(alignment: alignment, spacing: 0) {
            ForEach(0 ..< totalLanes, id: \.self) { laneIndex in
                HStack(spacing: 0) {
                    if alignment == .center || alignment == .trailing, shouldHaveSideSpacers(lane: laneIndex) {
                        Spacer(minLength: 0)
                    }

                    ForEach(startOf(lane: laneIndex) ... endOf(lane: laneIndex), id: \.self) {
                        if case .dynamicIncludingBorders = spacing,
                           startOf(lane: laneIndex) == $0
                        {
                            Spacer(minLength: spacing.estimatedSpacing)
                        }

                        if case .any(let anyView) = content[$0] {
                            anyView
                        }

                        if endOf(lane: laneIndex) != $0 {
                            if case .constant(let exactSpacing) = spacing {
                                Spacer(minLength: 0)
                                    .frame(width: exactSpacing)
                            } else {
                                Spacer(minLength: spacing.estimatedSpacing)
                            }
                        } else if case .dynamicIncludingBorders = spacing {
                            Spacer(minLength: spacing.estimatedSpacing)
                        }
                    }

                    if alignment == .center || alignment == .leading, shouldHaveSideSpacers(lane: laneIndex) {
                        Spacer(minLength: 0)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
