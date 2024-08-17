//
//  HomeScreen.swift
//  ExpenseSplit
//
//  Created by Ankita Katoch on 8/9/24.
//

import Foundation
import SwiftUI

struct Friend: Identifiable {
    let id = UUID()
    let name: String
    let avatar: String
    let balance: String
    let isOwed: Bool
}

struct HomeScreen: View {
    @State private var showSettleBill = false
        @State private var showCalculateTip = false
    let friends = [
        Friend(name: "Elephany", avatar: "elephant", balance: "€92.21", isOwed: false),
        Friend(name: "Girrafy", avatar: "Girraf", balance: "£20.00", isOwed: true),
        Friend(name: "Simba", avatar: "Simba", balance: "settled up", isOwed: false),
        Friend(name: "Jerry", avatar: "jerry", balance: "$17.51", isOwed: false),
        Friend(name: "Timothy", avatar: "tim", balance: "$87.28", isOwed: true),
        Friend(name: "Pumba", avatar: "pumba", balance: "₹1,550.50", isOwed: true)
    ]
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
//                    Button(action: {
//                        // Handle add friends action
//                    }) {
//                        Text("Add friends")
//                    }
//                    .padding()
                }
//
                .navigationBarTitle("Home Screen", displayMode: .inline)
                Text("Friends")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                BalanceSummaryView().padding(.bottom).background()
                
//                BalanceSummaryView {
////                    (showSettleBill: $showSettleBill, showCalculateTip: $showCalculateTip)
//                                    .padding(.bottom)
                
                List(friends) { friend in
                    FriendRow(friend: friend)
                }
                .listStyle(PlainListStyle())
            }
//            .navigationBarHidden(true)
//                        .sheet(isPresented: $showSettleBill) {
//                            SettleBillView()
//                        }
//                        .sheet(isPresented: $showCalculateTip) {
//                            CalculateTipView()
            .navigationBarTitle("Home Screen", displayMode: .inline)
                        .navigationBarItems(
                            leading: Button(action: {
                                showSettleBill = true
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .imageScale(.large)
                            },
                            
                            trailing: Button(action: {
                                // Handle cart action
                            }) {
                                Image(systemName: "heart.fill")
                                    .imageScale(.large)
                                    .overlay(
                                        Text("2")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .padding(5)
                                            .background(Color.red)
                                            .clipShape(Circle())
                                            .offset(x: 10, y: -10)
                                    )
                            })
        }
    }
}

struct BalanceSummaryView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Total balance")
                .font(.headline)
            HStack {
                VStack(alignment: .leading) {
                    Text("You owe")
                        .foregroundColor(.red)
                    Text("€92.21")
                        .foregroundColor(.red)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("You are owed")
                        .foregroundColor(.green)
                    Text("$69.77 + ₹1,550.50 + £20.00")
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding([.leading, .trailing])
    }
}

struct FriendRow: View {
    let friend: Friend
    
    var body: some View {
        HStack {
            Image(friend.avatar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text(friend.name)
                    .font(.headline)
                Text(friend.balance)
                    .foregroundColor(friend.isOwed ? .green : .red)
            }
            Spacer()
            if friend.balance != "settled up" {
                Text(friend.isOwed ? "owes you" : "you owe")
                    .foregroundColor(friend.isOwed ? .green : .red)
            }
        }
        .padding(.vertical, 0.1)
        
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()

    }
}




