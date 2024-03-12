//
//  DraggableRectangleChangingColor.swift
//  SparrowCodeSwiftUIBootcamp_Task5
//
//  Created by Валерий Зазулин on 13.03.2024.
//

import SwiftUI

struct DraggableRectangleChangingColor: View {
    
    @State var offset: CGSize = .zero
    let rectWidthAndHeight: Double = 120
    
    let stringOffset: String = ""
    
    var body: some View {
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundStyle(Color.white)
                Rectangle()
                    .foregroundStyle(Color.pink)
                Rectangle()
                    .foregroundStyle(Color.yellow)
                Rectangle()
                    .foregroundStyle(Color.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(rightRectangleColors(offset: offset)!)
                    .frame(width: rectWidthAndHeight, height: rectWidthAndHeight)
                    .offset(offset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                    offset = value.translation
                            }
                        
                            .onEnded { value in
                                withAnimation(.easeInOut) {
                                    offset = .zero
                                }
                            }
                    )
            )
        .ignoresSafeArea()
    }
    
    func rightRectangleColors(offset: CGSize) -> LinearGradient? {
        let screenHeight = UIScreen.main.bounds.height
        let position = offset.height + screenHeight / 2
        
        if position < screenHeight / 4 - rectWidthAndHeight / 2 {
            return LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: .black, location: (-screenHeight / 4 + (-offset.height)) / rectWidthAndHeight + 0.5),
                    Gradient.Stop(color: .white, location: (-screenHeight / 4 + (-offset.height)) / rectWidthAndHeight + 0.5)
                ]),
                startPoint: .top,
                endPoint: .bottom)
        }
        
        if position >= ((screenHeight / 4) - (rectWidthAndHeight / 2)) && position < (screenHeight / 8 * 3) {
            return LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: .black, location: (-screenHeight / 4 + (-offset.height)) / rectWidthAndHeight + 0.5),
                    Gradient.Stop(color: .white, location: (-screenHeight / 4 + (-offset.height)) / rectWidthAndHeight + 0.5)
                ]),
                startPoint: .top,
                endPoint: .bottom)
        }
        
        if position >= screenHeight / 8 * 3 && position < screenHeight / 4 * 3 - rectWidthAndHeight / 2{
            return LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: .white, location: -offset.height / rectWidthAndHeight + 0.5),
                    Gradient.Stop(color: .black, location: -offset.height / rectWidthAndHeight + 0.5)
                ]),
                startPoint: .top,
                endPoint: .bottom)
        }
        
        if position >= screenHeight / 4 * 3 - rectWidthAndHeight / 2 && position < screenHeight / 8 * 7 {
            return LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: .black, location: (screenHeight / 4 + (-offset.height)) / rectWidthAndHeight + 0.5),
                    Gradient.Stop(color: .white, location: (screenHeight / 4 + (-offset.height)) / rectWidthAndHeight + 0.5)
                ]),
                startPoint: .top,
                endPoint: .bottom)
        }
        
        if position >= screenHeight / 8 * 7 {
            return LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: .black, location: (screenHeight / 4 + (-offset.height)) / rectWidthAndHeight + 0.5),
                    Gradient.Stop(color: .white, location: (screenHeight / 4 + (-offset.height)) / rectWidthAndHeight + 0.5)
                ]),
                startPoint: .top,
                endPoint: .bottom)
        }
        return nil
    }
}

#Preview {
    DraggableRectangleChangingColor()
}
