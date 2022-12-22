//
//  BacteriaView.swift
//  Bacteriotopia
//
//  Created by Николай Никитин on 22.12.2022.
//

import SwiftUI

struct BacteriaView: View {

  //MARK: - View Properties
  var bacteria: Bacteria
  var rotationAction: () -> Void
  var image: String {
    switch bacteria.color {
    case .red:
      return "chevron.up.square.fill"
    case .green:
      return "chevron.up.circle.fill"
    default:
      return "chevron.up.circle"
    }
  }

  //MARK: - View Body
    var body: some View {
      ZStack {
        Button(action: rotationAction) {
          Image(systemName: image)
            .resizable()
            .foregroundColor(bacteria.color)
        }
        .buttonStyle(.plain)
        .frame(width: 16, height: 16)

        Rectangle()
          .fill(bacteria.color)
          .frame(width: 2, height: 8)
          .offset(y: -11)      }
      .rotationEffect(.degrees(bacteria.direction.rotation))
    }
}

struct BacteriaView_Previews: PreviewProvider {
    static var previews: some View {
      BacteriaView(bacteria: Bacteria(row: 0, column: 0)) { }
    }
}
