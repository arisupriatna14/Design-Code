//
//  ContentView.swift
//  DesignCode
//
//  Created by Ari Supriatna on 12/12/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState  = CGSize.zero
  
    var body: some View {
      ZStack {
        
        BlurView(style: .systemMaterial)
        
        TitleView()
          .blur(radius: show ? 20 : 0)
          .animation(.default)
        
        CardBottomView()
          .blur(radius: show ? 20 : 0)
          .animation(.default)
        
        CardView()
          .background(show ? Color.red : Color("background9"))
          .shadow(radius: 20)
          .cornerRadius(10)
          .offset(x: 0, y: show ? -400 : -40)
          .scaleEffect(0.85)
          .rotationEffect(Angle(degrees: show ? 15.0 : 0))
//          .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10, y: 10, z: 10))
          .animation(.easeInOut(duration: 0.5))
          .blendMode(.hardLight)
          .offset(x: viewState.width, y: viewState.height)
          
        CardView()
          .background(show ? Color("background5") : Color("background8"))
          .shadow(radius: 20)
          .cornerRadius(10)
          .offset(x: 0, y: show ? -200 : -20)
          .scaleEffect(0.9)
          .rotationEffect(Angle(degrees: show ? 10.0 : 0))
//          .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10, y: 10, z: 10))
          .animation(.easeInOut(duration: 0.3))
          .blendMode(.hardLight)
          .offset(x: viewState.width, y: viewState.height)
        
        CertificateView()
          .offset(x: viewState.width, y: viewState.height)
          .scaleEffect(0.95)
          .rotationEffect(Angle(degrees: show ? 5.0 : 0))
//          .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10, y: 10, z: 10))
          .animation(.spring())
          .onTapGesture {
            self.show.toggle()
          }
          .gesture(
            DragGesture()
              .onChanged({ value in
                self.viewState = value.translation
                self.show = true
              })
              .onEnded({ value in
                self.viewState = CGSize.zero
                self.show = false
              })
          )
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
  var body: some View {
    VStack {
      Text("Card Back")
    }
    .frame(width: 340.0, height: 220.0)
  }
}

struct CertificateView: View {
  var item = Certificate(title: "UI Design", image: "Background", width: 340, height: 220)
  
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text(item.title)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(Color("accent"))
            .padding(.top)
          Text(/*@START_MENU_TOKEN@*/"Certificate"/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.white)
        }
        Spacer()
        Image("Logo")
          .resizable()
          .frame(width: 30.0, height: 30.0)
      }
      .padding(.horizontal)
      Spacer()
      Image(item.image)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .offset(y: 50.0)
    }
    .frame(width: CGFloat(item.width), height: CGFloat(item.height))
    .background(Color.black)
    .cornerRadius(10.0)
    .shadow(radius: 10)
  }
}

struct TitleView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Certificate")
          .font(.largeTitle)
          .fontWeight(.heavy)
        Spacer()
      }
      Image("Illustration5")
      Spacer()
    }.padding()
  }
}

struct CardBottomView: View {
  var body: some View {
    VStack {
      Rectangle()
        .frame(width: 60, height: 6)
        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        .opacity(0.1)
      Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
        .lineLimit(10)
        .padding(.top)
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity)
    .padding()
    .padding(.horizontal)
    .background(BlurView(style: .systemMaterial))
    .cornerRadius(30)
    .shadow(radius: 20)
    .offset(y: 600)
  }
}
