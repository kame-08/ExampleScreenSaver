# ExampleScreenSaver

## Description
昔ながらのDVDScreenSaverをiOSAppで再現しました。

**Demo**
<img width="1000" alt="ExampleScreenSaverForiOS" src="https://user-images.githubusercontent.com/86101228/167664851-df2a0ca3-d46d-45c6-aad5-87692dad15bc.gif">

## Features
1. SwiftUIでGeometryReaderを使用して作成しました。
2. iOSではImageが壁に当たるとバイブレーションで衝撃が再現されています。
3. ImageをVectorDataで作成したため、どんな端末でも奇麗に表示できます。
4. iOS,iPadOS,MacOSに対応しており、各OSに合ったImageが表示されます。
5. iPadOSではSplitViewにも対応しており、途中でViewのサイズを変えても端末の向きを変えても適切に動作します。

## Installation
`git clone https://github.com/kame-08/GeometryReaderTest.git`

## Usage
Appを起動すれば自動的に動き始めます。  
Viewのサイズを変えてImageの動きを楽しんだり、  
2秒おきに衝撃が伝わるのでタイマーとして使えたり。  
GeometryReaderの動きを体感していただける思います。

## LookBack
今後より良くするためには
- [ ] 現在は`UIScreen.main.bounds.width`を使用して起動時の位置を指定しているが、  
      MacOSやSplitViewの状態で起動すると2秒ほど位置がずれてしまうため、  
      `geometry.size.width`を起動時にも使用できるようにしたい。
- [ ] 本家同様、ImageのColorを壁に当たったタイミングですぐに切り替えられるようにしたい。
- [ ] 本家同様、等速直線運動をするようにしたい。
- [ ] iPhoneX以降ではノッチの裏に行かずにノッチにも跳ね返ると面白いと思う。
