# Capstone Project

# ExpenseSplit App

This is a SwiftUI-based app for splitting expenses among friends. The app includes features for managing friends, viewing balances, settling bills, and calculating tips.

## Features

- **Welcome Screen**: A welcome screen to introduce the app.
- **Login & User Authentication**: Secure login and user authentication.
- **Secure Bank Details**: Secure storage and management of bank details.
- **Friend List**: A list of friends with balances.
- **Add Expense Page**: Add new expenses.
- **Settle Page**: Settle expenses between friends.
- **Offline Mode**: Use the app without an internet connection.
- **Bill Splitting**: Split bills among friends.
- **Tip Calculation**: Add and split tips among friends.

## Screenshots

Represents a friend screen with their name, avatar, balance, and whether they owe you money or I owe.

![Friends](https://github.com/user-attachments/assets/d7de4766-e026-4678-82bc-fcb9da0cbc92)


## Code Overview

## Models

Friend
- Represents a friend with their name, avatar, balance, and whether they owe you money.

```
struct Friend: Identifiable {
        let id = UUID()
        let name: String
        let avatar: String
        let balance: String
        let isOwed: Bool
        }
```

Views
- FriendsView
- The main view displaying the list of friends and the total balance summary.

```
struct FriendsView: View {
    @State private var showSettleBill = false
    @State private var showCalculateTip = false

    let friends = [
        // Friend data
    ]

    var body: some View {
        // View content
    }
}
```


## Requirements

- iOS 14.0+
- Xcode 12.0+
- SwiftUI


## Usages

- Adding Friends
- Click on the "Add friends" button at the top right of the Friends screen.
- Enter the friend's details and save.
- Viewing Total Balance
- The total balance is displayed at the top of the Friends screen, showing how much you owe and how much you are owed.
- Settling the Bill
- Click on the "Settle the bill" button in the total balance summary section.
- A modal will appear where you can manage and settle outstanding balances.
- Calculating Tip
- Click on the "Calculate tip" button in the total balance summary section.
- A modal will appear where you can calculate and split the tip among friends.


## Acknowledgements

Icons and images used in the app will be sourced from Google.com.

## Contact

For any queries or issues, please contact ankitakatoch1991@gmail.com

# ExpenseSplit
