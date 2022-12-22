//
//  GameBoard.swift
//  Bacteriotopia
//
//  Created by Николай Никитин on 22.12.2022.
//

import SwiftUI

class GameBoard: ObservableObject {
  let rowCount = 11
  let columnCount = 22

  @Published var grid = [[Bacteria]]()

  init() {
    reset()
  }

  //MARK: - Methods
  func reset() {
    grid.removeAll()

    for row in 0..<rowCount {
      var newRow = [Bacteria]()
      for column in 0..<columnCount {
        let bacteria = Bacteria(row: row, column: column)
        if row <= rowCount / 2 {
          if row == 0 && column == 0 {
            bacteria.direction = .north
          } else if row == 0 && column == 1 {
            bacteria.direction = .east
          } else if row == 1 && column == 0 {
            bacteria.direction = .south
          } else {
            bacteria.direction = Bacteria.Direction.allCases.randomElement()!
          }
        } else {
          if let conterpart = getBacteria(atRow: rowCount - 1 - row, column: columnCount - 1 - column) {
            bacteria.direction = conterpart.direction.opposite
          }
        }
        newRow.append(bacteria)
      }
      grid.append(newRow)
    }
    grid[0][0] .color = .green
    grid[rowCount-1][columnCount - 1].color = .red
  }

  func getBacteria(atRow row: Int, column: Int) -> Bacteria? {
    guard row >= 0 else { return nil }
    guard row < grid.count else { return nil }
    guard column >= 0 else { return nil }
    guard column < grid[0].count else { return nil }
    return grid[row][column]
  }

  func infect(from bacteria: Bacteria) {
    
  }
}
