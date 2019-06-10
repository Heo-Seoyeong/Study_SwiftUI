//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Seoyeong Heo on 2019/06/10.
//  Copyright © 2019 landmarks. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    var body: some View {
        List(landmarkData.identified(by: \.id)) { landmark in
            NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                LandmarkRow(landmark: landmark)
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif
