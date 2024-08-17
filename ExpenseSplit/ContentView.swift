import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                
                // Background circles
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white)
                Circle()
                    .scale(1.35)
                    .foregroundColor(Color.blue.opacity(0.15))
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    // Username TextField
                    createTextField("Username", text: $username, wrongInput: $wrongUsername)
                    
                    // Password SecureField
                    createSecureField("Password", text: $password, wrongInput: $wrongPassword)
                    
                    // Login Button
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .accessibilityLabel("Login Button")
                    
                    // Navigation on successful login
                    .navigationDestination(isPresented: $showingLoginScreen) {
                        HomeScreen()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    // Function to authenticate user
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "ankita" {
            wrongUsername = 0
            if password.lowercased() == "test" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
    
    // Helper function to create a TextField
    func createTextField(_ placeholder: String, text: Binding<String>, wrongInput: Binding<Int>) -> some View {
        TextField(placeholder, text: text)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
            .border(Color.red, width: CGFloat(wrongInput.wrappedValue))
    }
    
    // Helper function to create a SecureField
    func createSecureField(_ placeholder: String, text: Binding<String>, wrongInput: Binding<Int>) -> some View {
        SecureField(placeholder, text: text)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
            .border(Color.red, width: CGFloat(wrongInput.wrappedValue))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



