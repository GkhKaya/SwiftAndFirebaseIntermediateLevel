//
//  SettingsView.swift
//  SwiftAndFirebaseIntermediateLevel
//
//  Created by Gokhan Kaya on 12.09.2023.
//

import SwiftUI

@MainActor
final class SettingsViewViewMolel : ObservableObject{
    func signOut() throws{
        try AuthManager.shared.signOut()
    }
    
    func resetPassword() async throws{
        let authUser = try AuthManager.shared.getAuthenticatedUser()
        guard let email = authUser.email else{
            throw URLError(.fileDoesNotExist)
        }
        try await AuthManager.shared.resetPassword(email: email )
    }
    
    func updateEmail() async throws{
        
        let email = "test123@testing.com"
        
        try await AuthManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws{
        
        let password = "12345678"
        
        try await AuthManager.shared.updatePassword(password: password)
    }
}

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewViewMolel()
    @Binding var showSignInView : Bool
    var body: some View {
        List{
            Button("Log out"){
                Task{
                    do{
                        try viewModel.signOut()
                        showSignInView = true
                    }catch{
                        print(error)
                    }
                }
            }
            Button("Reset Password"){
                Task{
                    do{
                        try await viewModel.resetPassword()
                        print("Password reset")
                    }catch{
                        print(error)
                    }
                }
            }
            Button("Update Email"){
                Task{
                    do{
                        try await viewModel.updateEmail()
                        print("Email updated")
                    }catch{
                        print(error)
                    }
                }
            }
            Button("Update Password"){
                Task{
                    do{
                        try await viewModel.updatePassword()
                        print("Password updated")
                    }catch{
                        print(error)
                    }
                }
            }
            
        }.navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingsView(showSignInView: .constant(false))
            
        }
    }
}
