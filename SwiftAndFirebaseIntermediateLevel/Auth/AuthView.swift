//
//  AuthView.swift
//  SwiftAndFirebaseIntermediateLevel
//
//  Created by Gokhan Kaya on 12.09.2023.
//

import SwiftUI

struct AuthView: View {
    @Binding var showSignInView: Bool
    var body: some View {
        VStack {
            NavigationLink{
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sign In With Email")
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
        .navigationTitle("Sign In")
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack(){
            AuthView(showSignInView: .constant(false))
        }
    }
}
