//
//  Bacteria.swift
//  Bacteriotopia
//
//  Created by Николай Никитин on 22.12.2022.
//

import SwiftUI

class Bacteria {

  //MARK: - Properties
  enum Direction {
    case north, east, west, south

    var rotation: Double {
      switch self {
      case .north: return 0
      case .east: return 90
      case .south: return 180
      case .west: return 270
      }
    }

    var opposite: Direction {
      switch self {
      case .north: return .south
      case .east: return .west
      case .south: return .north
      case .west: return .east
      }
    }

    var next: Direction {
      switch self {
      case .north: return .east
      case .east: return .south
      case .south: return .west
      case .west: return .north
      }
    }
  }

  var row: Int
  var column: Int
  var color = Color.gray
  var direction = Direction.north

  //MARK: - Init
  init(row: Int, column: Int) {
    self.row = row
    self.column = column
  }
}
