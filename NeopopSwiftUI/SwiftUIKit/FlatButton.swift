//
//  FlatButton.swift
//  NeopopSwiftUI
//
//  Created by Utkarsh Dayal on 09/11/21.
//

import SwiftUI
import Lottie

struct FlatButton: ButtonStyle {
    
    var buttonModel: NeopopButtonModel
    
    @State var buttonState: NeopopButtonState?
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: calcZStackAlignment(buttonDirection: buttonModel.buttonDirection)){
            //right edge
            if buttonModel.buttonDirection == .topLeft || buttonModel.buttonDirection == .leftEdge || buttonModel.buttonDirection == .bottomLeft {
                Rectangle()
                    .foregroundColor(Color(buttonModel.edgeColor ?? .clear))
                    .frame(width: buttonModel.edgeThickness, height: buttonModel.buttonHeight)
                    .transformEffect(getCGAffineTransformForLeftEdge(buttonDirection: buttonModel.buttonDirection))
            }
            
            //bottom edge
            if buttonModel.buttonDirection == .topLeft || buttonModel.buttonDirection == .topEdge || buttonModel.buttonDirection == .topRight {
                Rectangle()
                    .foregroundColor(Color(buttonModel.edgeColor?.withAlphaComponent(0.6) ?? .clear))
                    .frame(width: buttonModel.buttonWidth, height: buttonModel.edgeThickness)
                    .transformEffect(getCGAffineTransformForTopEdge(buttonDirection: buttonModel.buttonDirection))
                    .rotation3DEffect(buttonModel.buttonDirection == .topEdge ? .degrees(45) : .degrees(0), axis: (1, 0, 0), anchor: .bottom, anchorZ: 0, perspective: 1)
            }
            
            //top edge
            if buttonModel.buttonDirection == .bottomLeft || buttonModel.buttonDirection == .bottomEdge || buttonModel.buttonDirection == .bottomRight {
                Rectangle()
                    .foregroundColor(Color(buttonModel.edgeColor?.withAlphaComponent(0.6) ?? .clear))
                    .frame(width: buttonModel.buttonWidth, height: buttonModel.edgeThickness)
                    .transformEffect(getCGAffineTransformForBottomEdge(buttonDirection: buttonModel.buttonDirection))
                    .rotation3DEffect(buttonModel.buttonDirection == .bottomEdge ? .degrees(-45) : .degrees(0), axis: (1, 0, 0), anchor: .top, anchorZ: 0, perspective: 1)
                
            }
            
            //left edge
            if buttonModel.buttonDirection == .rightEdge || buttonModel.buttonDirection == .topRight || buttonModel.buttonDirection == .bottomRight {
                Rectangle()
                    .foregroundColor(Color(buttonModel.edgeColor ?? .clear))
                    .frame(width: buttonModel.edgeThickness, height: buttonModel.buttonHeight)
                    .transformEffect(getCGAffineTransformForRightEdge(buttonDirection: buttonModel.buttonDirection))
            }
            
            VStack(alignment: .center, spacing: 0) {
                switch buttonState {
                case .animating:
                    LottieView(name: buttonModel.loadingLottieName ?? "", loopMode: .loop)
                default:
                    HStack(alignment: .center, spacing: 0){
                        //leftImage
                        if let leftImage = buttonModel.leftImage {
                            Image(uiImage: leftImage)
                                .renderingMode(.template)
                                .padding(.trailing, 6)
                                .padding(.bottom, 2)
                        }
                        //label
                        configuration.label
                            .font(.custom("NotoSansMyanmar-Bold", size: 14))
                            .padding(.horizontal,6)
                        //rightImage
                        if let rightImage = buttonModel.rightImage {
                            Image(uiImage: rightImage)
                                .renderingMode(.template)
                                .padding(.trailing, 6)
                                .padding(.bottom, 2)
                        }
                    }
                }
            }
            .zIndex(1)
            .frame(width: buttonModel.buttonWidth, height: buttonModel.buttonHeight, alignment: .center)
            .border(Color(buttonModel.borderColor ?? .clear), width: buttonModel.borderWidth ?? 0)
            .foregroundColor(Color(buttonModel.fontColor ?? .clear))
            .background(Color(buttonModel.backgroundColor ?? .clear))
            .offset(x: configuration.isPressed ? getButtonPressOffset(buttonDirection: buttonModel.buttonDirection).0 : 0 , y: configuration.isPressed ? getButtonPressOffset(buttonDirection: buttonModel.buttonDirection).1 : 0)
            .scaleEffect(x: getXYScale(state: configuration.isPressed, buttonDirection: buttonModel.buttonDirection), y: getXYScale(state: configuration.isPressed, buttonDirection: buttonModel.buttonDirection), anchor: getScaleAnchor(buttonDirection: buttonModel.buttonDirection))
            .animation(.none, value: configuration.isPressed)
        }
        .allowsHitTesting(isButtonTapAllowed(buttonState: buttonState))
        .clipShape(Rectangle().path(in: CGRect(x: 0, y: 0, width: buttonModel.buttonWidth ?? .infinity, height: buttonModel.buttonHeight ?? .infinity)))
    }
    
    private func calcHStackAlignment(buttonDirection: NeopopButtonDirection) -> VerticalAlignment {
        switch buttonDirection {
        case .topLeft, .topEdge, .topRight:
            return .bottom
        case .leftEdge, .rightEdge:
            return .center
        case .bottomLeft, .bottomEdge, .bottomRight:
            return .top
        }
        
    }
    
    private func calcZStackAlignment(buttonDirection: NeopopButtonDirection) -> Alignment {
        switch buttonDirection {
        case .topLeft:
            return .bottomTrailing
        case .topEdge:
            return .bottom
        case .topRight:
            return .bottomLeading
        case .leftEdge:
            return .trailing
        case .rightEdge:
            return .leading
        case .bottomLeft:
            return .topTrailing
        case .bottomEdge:
            return .top
        case .bottomRight:
            return .topLeading
        }
    }
    
    private func getCGAffineTransformForTopEdge(buttonDirection: NeopopButtonDirection) -> CGAffineTransform {
        var a: CGFloat = 1, b: CGFloat = 0, c: CGFloat = 0, d: CGFloat = 1, tx: CGFloat = 0, ty: CGFloat = 0
        switch buttonDirection {
        case .leftEdge, .rightEdge, .bottomLeft, .bottomEdge, .bottomRight, .topEdge:
            break
        case .topLeft:
            a = 1; b = 0; c = 1; d = 1; tx = -(buttonModel.edgeThickness ?? 0); ty = 0
        case .topRight:
            a = 1; b = 0; c = -1; d = 1; tx = (buttonModel.edgeThickness ?? 0); ty = 0
        }
        return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }
    
    private func getCGAffineTransformForBottomEdge(buttonDirection: NeopopButtonDirection) -> CGAffineTransform {
        var a: CGFloat = 1, b: CGFloat = 0, c: CGFloat = 0, d: CGFloat = 1, tx: CGFloat = 0, ty: CGFloat = 0
        switch buttonDirection {
        case .topLeft, .topEdge, .topRight, .leftEdge, .rightEdge, .bottomEdge:
            break
        case .bottomLeft:
            a = 1; b = 0; c = -1; d = 1; tx = 0; ty = 0
        case .bottomRight:
            a = 1; b = 0; c = 1; d = 1; tx = 0; ty = 0
        }
        return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }
    
    private func getCGAffineTransformForLeftEdge(buttonDirection: NeopopButtonDirection) -> CGAffineTransform {
        var a: CGFloat = 1, b: CGFloat = 0, c: CGFloat = 0, d: CGFloat = 1, tx: CGFloat = 0, ty: CGFloat = 0
        switch buttonDirection {
        case .topEdge, .topRight, .rightEdge, .bottomEdge, .bottomRight, .leftEdge:
            break
        case .topLeft:
            a = 1; b = 1; c = 0; d = 1; tx = 0; ty = -(buttonModel.edgeThickness ?? 0)
        case .bottomLeft:
            a = 1; b = -1; c = 0; d = 1; tx = 0; ty = (buttonModel.edgeThickness ?? 0)
        }
        return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }
    
    private func getCGAffineTransformForRightEdge(buttonDirection: NeopopButtonDirection) -> CGAffineTransform {
        var a: CGFloat = 1, b: CGFloat = 0, c: CGFloat = 0, d: CGFloat = 1, tx: CGFloat = 0, ty: CGFloat = 0
        switch buttonDirection {
        case .topLeft, .topEdge, .leftEdge, .bottomLeft, .bottomEdge, .rightEdge:
            break
        case .topRight:
            a = 1; b = -1; c = 0; d = 1; tx = 0; ty = 0
        case .bottomRight:
            a = 1; b = 1; c = 0; d = 1; tx = 0; ty = 0
        }
        return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }
    
    private func getButtonPressOffset(buttonDirection: NeopopButtonDirection) -> (CGFloat, CGFloat) {
        var tx: CGFloat = 0, ty: CGFloat = 0
        let displacement = (buttonModel.edgeThickness ?? 0) / tan(1)
        switch buttonDirection {
        case .topLeft:
            tx = -displacement; ty = -displacement
        case .topEdge:
            tx = 0; ty = -(displacement * sin(0.785))
        case .topRight:
            tx = displacement; ty = -displacement
        case .leftEdge:
            tx = -(displacement * sin(0.785)); ty = 0
        case .rightEdge:
            tx = (displacement * sin(0.785)); ty = 0
        case .bottomLeft:
            tx = -displacement; ty = displacement
        case .bottomEdge:
            tx = 0; ty = (displacement * sin(0.785))
        case .bottomRight:
            tx = displacement; ty = displacement
        }
        return (tx, ty)
    }
    
    private func isEdgeDirected(buttonDirection: NeopopButtonDirection) -> Bool {
        switch buttonDirection {
        case .topLeft, .topRight, .bottomLeft, .bottomRight:
            return false
        case .topEdge, .leftEdge, .rightEdge, .bottomEdge:
            return true
        }
    }
    
    private func getXYScale(state: Bool, buttonDirection: NeopopButtonDirection) -> CGFloat {
        if !state || !isEdgeDirected(buttonDirection: buttonDirection) { return 1 }
        return 0.98
    }
    
    private func getScaleAnchor(buttonDirection: NeopopButtonDirection) -> UnitPoint{
        switch buttonDirection {
        case .topLeft, .topRight, .bottomLeft, .bottomRight:
            return .center
        case .topEdge:
            return .top
        case .leftEdge:
            return .leading
        case .rightEdge:
            return .trailing
        case .bottomEdge:
            return .bottom
        }
    }
    
    private func isButtonTapAllowed(buttonState: NeopopButtonState?) -> Bool {
        switch buttonState{
        case .normal:
            return true
        case .animating:
            return false
        default:
            return true
        }
    }
}

struct FlatButton_Previews: PreviewProvider {
    
    static var previews: some View {
        HStack{
            Button("Press Me"){
                print("hello")
            }.buttonStyle(FlatButton(buttonModel: NeopopHelper.primary50_flat_button_model(style: .dark), buttonState: .normal))
        }
        .preferredColorScheme(.light)
    }
}
