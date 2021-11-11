//
//  FloatingButton.swift
//  NeopopSwiftUI
//
//  Created by Utkarsh Dayal on 10/11/21.
//

import SwiftUI

struct FloatingButton: ButtonStyle {
    
    var buttonModel: NeopopButtonModel
    
    @State var buttonState: NeopopButtonState?
    
    @State var isAnimating = false
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .center) {
            Rectangle()
                .frame(width: buttonModel.buttonWidth, height: buttonModel.buttonHeight, alignment: .center)
                .scaleEffect(0.98)
                .rotation3DEffect(.degrees(30), axis: (1, 0, 0), anchor: .bottom, anchorZ: 0, perspective: 1)
                .foregroundColor(Color(buttonModel.shadowColor ?? .clear))
                .offset(y: configuration.isPressed ? 3 : (isAnimating ? 8 : 3))
                .animation(!isAnimating ? nil : .easeInOut(duration: 2).repeatForever(), value: isAnimating)
            
            
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Spacer()
                    switch buttonState{
                    case .animating :
                        LottieView(name: buttonModel.loadingLottieName ?? "", loopMode: .loop)
                    default :
                        //leftImage
                        if let leftImage = buttonModel.leftImage {
                            Image(uiImage: leftImage)
                                .renderingMode(.template)
                                .padding(.trailing, 6)
                                .padding(.bottom, 2)
                        }
                        //label
                        configuration.label
                            .font(.custom(buttonModel.fontName ?? "NotoSansMyanmar-Bold", size: buttonModel.fontSize ?? 14))
                            .padding(.horizontal,6)
                        //rightImage
                        if let rightImage = buttonModel.rightImage {
                            Image(uiImage: rightImage)
                                .renderingMode(.template)
                                .padding(.trailing, 6)
                                .padding(.bottom, 2)
                        }
                    }
                    Spacer()
                }
                .frame(width: buttonModel.buttonWidth, height: buttonModel.buttonHeight, alignment: .center)
                .border(Color(buttonModel.borderColor ?? .clear), width: buttonModel.borderWidth ?? 0)
                .foregroundColor(Color(buttonModel.fontColor ?? .clear))
                .background(Color(buttonModel.backgroundColor ?? .clear))
                .rotation3DEffect(.degrees(30), axis: (1, 0, 0), anchor: .bottom, anchorZ: 0, perspective: 1)
                
                Rectangle()
                    .frame(width: buttonModel.buttonWidth, height: buttonModel.edgeThickness, alignment: .center)
                    .foregroundColor(Color(buttonModel.edgeColor ?? .clear))
                    .rotation3DEffect(.degrees(-20), axis: (1, 0, 0), anchor: .top, anchorZ: 0, perspective: 1)
            }
            .offset(y: configuration.isPressed ? -3 : (isAnimating ? -8 : -3))
            .animation(!isAnimating ? nil : .easeInOut(duration: 2).repeatForever(), value: isAnimating)
            
        }
        .onChange(of: configuration.isPressed, perform: {value in
            self.isAnimating = !value
        })
        .onAppear{
            self.isAnimating = true
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            Button("Press Me"){
                print("hello")
            }.buttonStyle(FloatingButton(buttonModel: NeopopHelper.default_floating_button_model(), buttonState: .normal))
        }
        .preferredColorScheme(.light)
    }
}
