//
//  ContentView.swift
//  Bacteriotopia
//
//  Created by Николай Никитин on 22.12.2022.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var board = GameBoard()

    var body: some View {
        VStack {
          HStack {
            Text("Green: 0")
            Spacer()
            Text("Bacteriotopia")
            Spacer()
            Text("Red: 0")
          }
          .font(.system(size: 20).weight(.black))
          VStack {
            ForEach(0..<11, id: \.self) { row in
              HStack {
                ForEach(0..<22, id: \.self) { column in
                  let bacteria = board.grid[row][column]
                  BacteriaView(bacteria: bacteria) {

                  }
                }
              }
            }
          }
        }
        .padding()
        .fixedSize()
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
