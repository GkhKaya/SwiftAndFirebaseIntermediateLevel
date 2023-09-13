//
//  RootView.swift
//  SwiftAndFirebaseIntermediateLevel
//
//  Created by Gokhan Kaya on 12.09.2023.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView : Bool = false
    var body: some View {
        ZStack{
            NavigationStack{
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear(){
            let authUser = try?AuthManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack{
                AuthView(showSignInView: $showSignInView)
            }
        }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
