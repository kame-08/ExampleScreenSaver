//
//  ContentView.swift
//  ExampleScreenSaver
//
//  Created by Ryo on 2022/04/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack{
                Image("OSScreen")
                    .resizable()
                    .frame(width: CGFloat(viewModel.imageWidth), height: CGFloat(viewModel.imageHeight))
                    .foregroundColor(Color(red:viewModel.randomColor.red, green: viewModel.randomColor.green, blue: viewModel.randomColor.blue))
                    .animation(.linear(duration: 2))
                
                //debug用
                //Text(viewModel.debug)
                //  .font(.largeTitle)
                //  .fontWeight(.black)
                //  .foregroundColor(Color.gray)
            }
            .onAppear(){
                //2秒おきに座標を移動
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
                    
                    let x = Int(geometry.frame(in: .global).origin.x)
                    let y = Int(geometry.frame(in: .global).origin.y)
                    let ViewWidth = Int(geometry.size.width)
                    let ViewHeight = Int(geometry.size.height)
                    viewModel.movement(x: x, y: y, viewWidth: ViewWidth, viewHeight: ViewHeight)
                    
                    //画像の色をランダムに指定
                    viewModel.changeCalor()
                    
                    //振動
                    UINotificationFeedbackGenerator().notificationOccurred(.success)
                }
            }
            
        }.offset(x: CGFloat(viewModel.XMovement), y: CGFloat(viewModel.YMovement))
            .edgesIgnoringSafeArea(.all)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
