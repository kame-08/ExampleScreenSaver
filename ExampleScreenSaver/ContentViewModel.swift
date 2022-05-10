//
//  ContentViewModel.swift
//  ExampleScreenSaver
//
//  Created by Ryo on 2022/04/26.
//

import Foundation
import UIKit

class ContentViewModel: ObservableObject {
    //trueの場合→falseの場合←
    var isXMovement = Bool.random()
    //trueの場合↓falseの場合↑
    var isYMovement = Bool.random()
    
    //移動先の座標
    var XMovement:Int = 0
    var YMovement:Int = 0
    
    //画像サイズ
    @Published var imageWidth:Int = 0
    @Published var imageHeight:Int = 0
    
    //直前に処理したif文(debug用)
    @Published var debug = "-,-"
    
    //画像の色
    @Published var randomColor = (red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    
    //移動先の座標を計算
    func movement (x:Int, y:Int, viewWidth:Int, viewHeight:Int){
        //画像サイズの調整
        if viewWidth <= viewHeight {
            imageWidth = viewWidth / 3
            imageHeight = imageWidth / 3
        } else {
            imageWidth = viewHeight / 3
            imageHeight = imageWidth / 3
        }
        
        if isXMovement,isYMovement{
            debug = "↘︎," //進行方向
            if (viewWidth - imageWidth) - x <= (viewHeight - imageHeight) - y{
                XMovement += (viewWidth - imageWidth) - x
                YMovement += (viewWidth - imageWidth) - x
                isXMovement = false
                debug += "→" //ぶつかる方向
            }else{
                XMovement += (viewHeight - imageHeight) - y
                YMovement += (viewHeight - imageHeight) - y
                isYMovement = false
                debug += "↓" //ぶつかる方向
            }
        }else if isXMovement, !isYMovement{
            debug = "↗︎," //進行方向
            if (viewWidth - imageWidth) - x < y {
                XMovement += (viewWidth - imageWidth) - x
                YMovement -= (viewWidth - imageWidth) - x
                isXMovement = false
                debug += "→" //ぶつかる方向
            }else{
                XMovement += y
                YMovement -= y
                isYMovement = true
                debug += "↑" //ぶつかる方向
            }
        }else if !isXMovement,isYMovement{
            debug = "↙︎," //進行方向
            if x <= (viewHeight - imageHeight) - y{
                XMovement -= x
                YMovement += x
                isXMovement = true
                debug += "←" //ぶつかる方向
            } else {
                XMovement -= (viewHeight - imageHeight) - y
                YMovement += (viewHeight - imageHeight) - y
                isYMovement = false
                debug += "↓" //ぶつかる方向
            }
        } else if !isXMovement, !isYMovement{
            debug = "↖︎," //進行方向
            if x <= y{
                YMovement -= x
                XMovement -= x
                isXMovement = true
                debug += "←" //ぶつかる方向
            }else{
                XMovement -= y
                YMovement -= y
                isYMovement = true
                debug += "↑" //ぶつかる方向
            }
        }
    }
    
    //画像の色をランダムに指定
    func changeCalor(){
        randomColor.red = Double.random(in: 0...1)
        randomColor.green = Double.random(in: 0...1)
        randomColor.blue = Double.random(in: 0...1)
    }
    
    init(){
        //端末横幅
        let screenWidth = Int(UIScreen.main.bounds.width)
        //端末縦幅
        let screenHeight = Int(UIScreen.main.bounds.height)
        
        if screenWidth <= screenHeight {
            //画像の大きさを指定
            imageWidth = screenWidth / 3
            imageHeight = imageWidth / 3
            //起動時の座標を指定
            XMovement = (screenWidth - imageWidth) / 2
            YMovement = (screenHeight - imageHeight) / 2
        } else {
            //画像の大きさを指定
            imageWidth = screenHeight / 3
            imageHeight = imageWidth / 3
            //起動時の座標を指定
            XMovement = (screenWidth - imageWidth) / 2
            YMovement = (screenHeight - imageHeight) / 2
        }
    }
}

