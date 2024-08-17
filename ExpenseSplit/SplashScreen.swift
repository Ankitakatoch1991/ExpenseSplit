//
//  SplashScreen.swift
//  ExpenseSplit
//
//  Created by Ankita Katoch on 8/12/24.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                
                VStack {
                    
                    Image("SplashLogo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                    
                    Text("ExpenseSplit")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top, 20)
                }
            }
            .onAppear {
                withAnimation(.easeIn(duration: 1.5)) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
