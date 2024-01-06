//
//  ImageCarouselView.swift
//  hotel-app
//
//  Created by Evelina on 26.12.2023.
//

import SwiftUI

struct ImageCarouselView: View {
    @State private var currentImageIndex = 0
    let images: [ImageView]
    
    init(images: [ImageView]) {
        self.images = images
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if images.count != 0 {
                images[currentImageIndex]
                    .cornerRadius(15)
                    .gesture(
                        DragGesture()
                            .onEnded({ value in
                                let threshold: CGFloat = 50
                                if value.translation.width > threshold {
                                    withAnimation {
                                        currentImageIndex = max(0, currentImageIndex - 1)
                                    }
                                } else if value.translation.width < threshold {
                                    withAnimation {
                                        currentImageIndex = min(images.count - 1, currentImageIndex + 1)
                                    }
                                }
                            })
                    )
                HStack {
                    ForEach(0..<images.count) { i in
                        Circle()
                            .fill(currentImageIndex == i ? Color.black : Asset.grayCircleColor.swiftUIColor)
                            .frame(width: 7, height: 7)
                            .padding(5)
                    }
                }
                .background(Color.white)
                .cornerRadius(5)
                .frame(width: 75, height: 17)
                .padding(.bottom, 8)
            }
        }
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarouselView(images: [])
    }
}
