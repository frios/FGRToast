//
//  Toast.swift
//  LocationApp
//
//  Created by Ferdinand Rios on 9/15/21.
//

import SwiftUI

public struct Toast: View {
    
    @Binding public var show: Bool

    public var message: String
    public var duration: Double = 2.0
    public var fontSize: Font = .title
    public var textColor: Color = Color(.secondaryLabel)
    public var backgroundColor : Color = Color (.clear)
    public var encapsulate: Bool = false
    
    public var body: some View {
        Text(message)
            .font(fontSize)
            .foregroundColor(textColor)
            .padding(.horizontal)
            .padding(.vertical, 2.0)
            .background(backgroundColor)
            .if(encapsulate, transform: { view in
                view.clipShape(Capsule())
            })
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    show = false
                }
            }
    }

}

public extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

public struct Toast_Previews: PreviewProvider {
    public static var previews: some View {
        Toast(show: .constant(true), message: "hello world")
            
    }
}
