//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Круглич Влад on 8.03.24.
//

import SwiftUI

struct ContentView: View {
    @State var choice = ""
    @State var enemyChoice = ""
    @State var warningText = ""
    @State var resultText = ""
    var body: some View {
        VStack {
            Text(resultText)
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.blue)
            HStack(spacing: 20) {
                Image(choice)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("VS")
                    .fontWeight(.bold)
                    .font(.system(size: 60))
                Image(enemyChoice)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            Text(warningText)
                .foregroundColor(.red)
                .padding(.top, 60)
            myChoice(choice: $choice)
                .padding()
                .border(.black, width: 1)
            buttonStartGame(choice: $choice, enemyChoice: $enemyChoice, warningText: $warningText, resultText: $resultText)
                .padding(.top, 30)
        }
    }
}

struct myChoice : View {
    @Binding var choice : String
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                choice = "rock"
            }) {
                Image("rock")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            Button(action: {
                choice = "paper"
            }) {
                Image("paper")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            Button(action: {
                choice = "scissors"
            }) {
                Image("scissors")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
        }
        .font(.system(size: 20))
    }
}

func whoWin(_ choice: String, _ enemyChoice: String) -> String {
    switch choice {
        case "rock":
        if (enemyChoice == "paper") {
            return "Проиграли!"
        }
        else if (enemyChoice == "rock") {
            return "Ничья!"
        }
        else {
            return "Победили!"
        }
    case "paper":
        if (enemyChoice == "scissors") {
            return "Проиграли"
        }
        else if (enemyChoice == "rock") {
            return "Ничья!"
        }
        else {
            return "Победили!"
        }
    case "scissors":
        if (enemyChoice == "rock") {
            return "Проиграли!"
        }
        else if (enemyChoice == "scissors") {
            return "Ничья!"
        }
        else {
            return "Победили!"
        }
    default:
        return ""
    }
}

var arrayGame = ["rock", "paper", "scissors"]
struct buttonStartGame : View {
    @Binding var choice : String
    @Binding var enemyChoice : String
    @Binding var warningText : String
    @Binding var resultText : String
    var body: some View {
        HStack() {
            Button(action: {
                if (choice == "") {
                warningText = "Сделайте свой выбор!"
                }
                else {
                    warningText = ""
                    enemyChoice = arrayGame[Int.random(in: 0...2)]
                    resultText = whoWin(choice, enemyChoice)
                }
            }) {
                Text("Играть!")
                    .frame(width: 120, height: 70)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
