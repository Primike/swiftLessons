//
//  AL12NavBarPreferenceKey.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/15/23.
//

import Foundation
import SwiftUI

struct AL12NavTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct AL12NavSubtitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}


struct AL12NavBackButtonPreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    
    func customNavigationTitle(_ title: String) -> some View {
        preference(key: AL12NavTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationSubtitle(_ subtitle: String?) -> some View {
        preference(key: AL12NavSubtitlePreferenceKey.self, value: subtitle)
    }

    func customNavigationBackButton(_ hidden: Bool) -> some View {
        preference(key: AL12NavBackButtonPreferenceKey.self, value: hidden)
    }

    func customNavBarItems(title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationBackButton(backButtonHidden)
    }
}
