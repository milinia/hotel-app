//
//  HorizontalCollectionView.swift
//  hotel-app
//
//  Created by Evelina on 28.12.2023.
//

import SwiftUI

struct HorizontalCollectionView: View {
    private var elements: [String]
    private enum UIConstants {
        static let spacing: CGFloat = 15
        static let alignment: HorizontalAlignment = .leading
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
    }
    
    init(elements: [String]) {
        self.elements = elements
    }
    
    var body: some View {
        let tags = elements.map({Tag(title: $0, size: getStringSize(string: $0, font: Font.custom("SF Pro Display", size: 16).weight(.medium)))})
        let rows = computeRows(elements: tags)
        VStack(alignment: UIConstants.alignment, spacing: 6) {
            ForEach(rows, id: \.self) { rowElements in
                HStack(spacing: 6) {
                    ForEach(rowElements, id: \.self) { element in
                        Text(element.title)
                            .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .foregroundColor(Asset.grayTextColor.swiftUIColor)
                            .background(RoundedRectangle(cornerRadius: 8)
                                .fill(Asset.grayCircleColor.swiftUIColor)
                        )
                        .fixedSize()
                    }
                }
            }
        }
    }
    
    func computeRows(elements: [Tag]) -> [[Tag]] {
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        var totalWidth: CGFloat = 0
        if !elements.isEmpty {
            elements.forEach { element in
                totalWidth += element.size + UIConstants.spacing
                if totalWidth > UIConstants.screenWidth {
                    totalWidth = element.size + UIConstants.spacing
                    rows.append(currentRow)
                    currentRow.removeAll()
                    currentRow.append(element)
                } else {
                    currentRow.append(element)
                }
            }
            if !currentRow.isEmpty {
                rows.append(currentRow)
                currentRow.removeAll()
            }
            return rows
        } else {
            return rows
        }
    }
    
    private func getStringSize(string: String, font: Font) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 16.0)
        let attributes = [NSAttributedString.Key.font: font]
        let size = string.size(withAttributes: attributes)
        return size.width
    }
}

struct HorizontalCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCollectionView(elements: ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"])
    }
}
