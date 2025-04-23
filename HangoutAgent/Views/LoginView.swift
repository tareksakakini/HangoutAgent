//
//  LoginView.swift
//  CliqueApp
//
//  Created by Tarek Sakakini on 1/6/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var vm: ViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    @State var showWrongMessage: Bool = false
    @State var goToNextScreen: Bool = false
    @State var isPasswordVisible = false
    @State var isVerified = false
    @State var wrongMessage: String = " "
    @State var user: User? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    LoginSheet
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
        .environmentObject(ViewModel())
}

extension LoginView {
    private var LoginSheet: some View {
        VStack {
            Title
            UserFields
            WrongMessage
            SignInButton
            
        }
        .frame(width: 300, height: 450)
        .background(Color.primary)
        .cornerRadius(20)
        .shadow(radius: 50)
    }
    
    private var Title: some View {
        HStack {
            Image("yalla_transparent")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .foregroundColor(Color(.systemBackground))
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(.systemBackground))
                .frame(width: 5, height: 50, alignment: .leading)
            
            Text("Login")
                .foregroundColor(Color(.systemBackground))
                .font(.largeTitle)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var UserFields: some View {
        VStack {
            EmailField
            PasswordField
        }
    }
    
    private var EmailField: some View {
        TextField("", text: $email, prompt: Text("Enter your email here ...").foregroundColor(Color.primary))
            .foregroundColor(.primary)
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .padding()
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
    
    private var PasswordField: some View {
        HStack {
            if isPasswordVisible {
                TextField("", text: $password, prompt: Text("Enter your password here ...").foregroundColor(Color.primary))
                    .foregroundColor(.primary)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .padding()
            } else {
                SecureField("", text: $password, prompt: Text("Enter your password here ...").foregroundColor(Color.primary))
                    .foregroundColor(.primary)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .padding()
            }
            
            Button {
                isPasswordVisible.toggle()
            } label: {
                Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                    .foregroundColor(.primary)
                    .padding()
            }
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
        .padding(.horizontal)
    }
    
    private var WrongMessage: some View {
        Text(wrongMessage)
            .font(.caption)
            .foregroundColor(Color(.systemBackground))
            .padding(2)
    }
    
    private var SignInButton: some View {
        
        Button {
            wrongMessage = " "
            if let returnedUser = vm.verifyUser(username: email, password: password) {
                user = returnedUser
                goToNextScreen = true
            } else {
                wrongMessage = "Email or password is incorrect"
            }
        } label: {
            Text("Sign in")
                .padding()
                .padding(.horizontal)
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .foregroundColor(Color.primary)
                .bold()
                .shadow(color: Color(.systemBackground).opacity(0.3), radius: 20, x: 0, y: 15)
        }
        .navigationDestination(isPresented: $goToNextScreen) {
            if let user {
                ChatListView(user: user)
            }
        }
    }
}
