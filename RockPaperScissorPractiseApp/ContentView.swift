//
//  ContentView.swift
//  RockPaperScissorPractiseApp
//
//  Created by Shubham on 01/10/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    var allGameChoices = ["Rock", "Paper", "Scissor"]
    var randomNumber = Int.random(in: 0...2)
    var allOutcomeChoices = ["Win", "Loose"]
    @State private var selectedOutcomeChoice = "Win"
    @State private var selectedPlayerChoice = ""
    
    var computerSelectedGameChoiceValue: String {
        return allGameChoices[randomNumber]
    }
    
    var scoreValue: Int {
        switch computerSelectedGameChoiceValue {
        case "Rock":
            switch selectedPlayerChoice {
            case "Rock":
                return 0
                
            case "Paper":
                return 1
                
            case "Scissor":
                return -1
            default:
                return 0
            }
            
        case "Paper":
            switch selectedPlayerChoice {
            case "Rock":
                return -1
                
            case "Paper":
                return 0
                
            case "Scissor":
                return 1
            default:
                return 0
            }

            
        case "Scissor":
            switch selectedPlayerChoice {
            case "Rock":
                return 1
                
            case "Paper":
                return -1
                
            case "Scissor":
                return 0
            default:
                return 0
            }

            
        default:
            return 0
        }
    }
    
    
    // MARK: Body
    var body: some View {
        VStack {
            Text(allGameChoices[randomNumber])
            
            Picker("Choice", selection: $selectedOutcomeChoice) {
                ForEach(allOutcomeChoices, id: \.self) {
                    Text($0)
                }
            }
            
            Picker("Player Choice", selection: $selectedPlayerChoice) {
                ForEach(allGameChoices, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.palette)
            
            Text("Score: \(scoreValue)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
