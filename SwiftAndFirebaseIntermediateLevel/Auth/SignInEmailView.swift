//
//  SignInEmailView.swift
//  SwiftAndFirebaseIntermediateLevel
//
//  Created by Gokhan Kaya on 12.09.2023.
//

import SwiftUI

@MainActor
final class SıgnInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws{
        guard !email.isEmpty,!password.isEmpty else {
            print("No email and passwornd found.")
            return
        }
        
        try await AuthManager.shared.createUser(email: email, password: password)
    }
    
    func signIn() async throws{
        guard !email.isEmpty,!password.isEmpty else {
            print("No email and passwornd found.")
            return
        }
        
        try await AuthManager.shared.signInUser(email: email, password: password)
    }
}

struct SignInEmailView: View {
    @StateObject private var viewmodel = SıgnInEmailViewModel()
    @Binding var showSignInView : Bool
    var body: some View {
        VStack{
            Spacer()
            TextField("Email...",text: $viewmodel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            SecureField("Password...",text: $viewmodel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                Task{
                    do{
                        try await viewmodel.signUp()
                        showSignInView = false
                        return
                    }catch{
                        print(error)
                    }
                    
                    do{
                        try await viewmodel.signIn()
                        showSignInView = false
                        return
                    }catch{
                        print(error)
                    }
                    
                }
            } label: {
                Text("Sign In ")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Sign In With Email")
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SignInEmailView(showSignInView: .constant(false))
        }
    }
}
