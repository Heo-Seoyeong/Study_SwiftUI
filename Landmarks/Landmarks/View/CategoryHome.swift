//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Seoyeong Heo on 2019/06/11.
//  Copyright © 2019 landmarks. All rights reserved.
//

import SwiftUI

struct CategoryHome : View {
    var categories: [String: [Landmark]] {
        .init(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }

    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }

    var body: some View {
        List {
            FeaturedLandmarks(landmarks: featured)
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .listRowInsets(EdgeInsets())

            ForEach(categories.keys.sorted().identified(by: \.self)) { key in
                CategoryRow(categoryName: key, items: self.categories[key]!)
            }
            .listRowInsets(EdgeInsets())

            NavigationButton(destination: LandmarkList()) {
                Text("See All")
            }
        }
        .navigationBarTitle(Text("Featured"))
        .navigationBarItems(trailing:
            PresentationButton(
                Image(systemName: "person.crop.circle")
                    .imageScale(.large)
                    .accessibility(label: Text("User Profile"))
                    .padding(),
                destination: ProfileHost()
            )
        )
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image(forSize: 250).resizable()
    }
}

#if DEBUG
struct CategoryHome_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkList()
                .environmentObject(UserData())
        }
    }
}
#endif
