//
//  ContentView.swift
//  RockPaperScissorPractiseApp
//
//  Created by Shubham on 01/10/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State var allGameChoices = ["Rock", "Paper", "Scissor"]
    var randomNumber = Int.random(in: 0...2)
    var randomCondition = ["Win", "Loose"].randomElement()
    @State private var selectedPlayerChoice = ""
    @State private var showingScore = false
    @State private var outcomeString = ""
    @State private var currentQuestionNumber = 1
    
    var computerSelectedGameChoiceValue: String {
        return allGameChoices[randomNumber]
    }
    
    @State private var scoreValue: Int = 0
    
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            Form {
                // MARK: Section
                Section {
                    HStack {
                        Text("Computer Choice:")
                        Spacer()
                        Text(allGameChoices[randomNumber])
                            .bold()
                            .foregroundStyle(Color.blue)
                    }
                    
                    HStack {
                        Text("You should:")
                        Spacer()
                        Text("\(randomCondition ?? "")")
                            .bold()
                            .foregroundStyle(.red)
                    }
                } header: {
                    Text("Conditions for the game")
                }
                
                Section {
                    HStack {
                        
                        Button("Rock") {
                            print("Rock")
                            checkAnswer("Rock")
                            showingScore.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        
                        
                        Spacer()
                        
                        Button("Paper") {
                            print("Paper")
                            checkAnswer("Paper")
                            showingScore.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        
                        
                        Spacer()
                        
                        
                        Button("Scissor") {
                            print("Scissor")
                            checkAnswer("Scissor")
                            showingScore.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        
                        
                    }
                    .padding()
                    .bold()
                    .foregroundStyle(Color.white)
                    
                } header: {
                    Text("Select your choice")
                }
                
                
                // MARK: Output section
                Section {
                    HStack {
                        Text("Score:")
                        Spacer()
                        Text("\(scoreValue)")
                            .bold()
                            .foregroundStyle(.green)
                    }
                }
            }
            .alert((currentQuestionNumber <= 5) ? "You \(outcomeString)" : "Game over!", isPresented: $showingScore) {
                Button((currentQuestionNumber <= 5) ? "OK" : "Restart") {
                    askQuestion()
                    print(currentQuestionNumber)
                }
            } message: {
                Text("Your score is \(scoreValue)")
            }
            
            .navigationTitle("Rock Paper Scissor")
        }
    }
    
    func checkAnswer(_ passedValue: String) {
        selectedPlayerChoice = passedValue
        if scoreValue < 0 {
            scoreValue = 0
        }
        
        switch computerSelectedGameChoiceValue {
        case "Rock":
            switch selectedPlayerChoice {
            case "Rock":
                outcomeString = "Draw"
                break
            case "Paper":
                scoreValue += 1
                outcomeString = "Win"

                
            case "Scissor":
                scoreValue -= 1
                outcomeString = "Loose"

                
            default:
                break
            }
            
        case "Paper":
            switch selectedPlayerChoice {
            case "Rock":
                scoreValue -= 1
                outcomeString = "Loose"

                
            case "Paper":
                outcomeString = "Draw"
                break
                
            case "Scissor":
                scoreValue += 1
                outcomeString = "Win"
                
            default:
                break
            }
            
            
        case "Scissor":
            switch selectedPlayerChoice {
            case "Rock":
                scoreValue += 1
                outcomeString = "Win"
                
            case "Paper":
                scoreValue -= 1
                outcomeString = "Loose"
                
            case "Scissor":
                outcomeString = "Draw"
                break
                
            default:
                break
            }
        default:
            break
        }
        
        if currentQuestionNumber > 5 {
            currentQuestionNumber = 1
        }
    }
    
    func askQuestion() {
        currentQuestionNumber += 1
        allGameChoices.shuffle()
    }
}

#Preview {
    ContentView()
}
