//
//  BC73Grid.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/24/25.
//

import SwiftUI

struct BC73Grid: View {
    
    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 8, verticalSpacing: 8) {
            ForEach(0..<4) { i in
                GridRow(alignment: .bottom) {
                    ForEach(0..<4) { j in
                        let cellNumber = (i * 4) + (j + 1)
                        
                        if cellNumber == 7 {
                            Color.green
                                .gridCellUnsizedAxes([.horizontal, .vertical])
                        } else {
                            cell(cellNumber)
                                .gridCellColumns(cellNumber == 6 ? 2 : 1)
                                .gridColumnAlignment(cellNumber == 1 ? .trailing : cellNumber == 4 ? .leading : .center)
                        }
                    }
                }
            }
        }
    }
    
    private func cell(_ int: Int) -> some View {
        Text("\(int)")
            .frame(height: int == 10 ? 20 : nil)
            .font(.largeTitle)
            .padding()
            .background(.blue)
    }
}

#Preview {
    BC73Grid()
}
