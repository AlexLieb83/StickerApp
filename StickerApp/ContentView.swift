//
//  ContentView.swift
//  StickerApp
//
//  Created by Alex Liebhaber on 11/12/25.
//

//textfeild to enter students one at a time
//-- plus button to add their name to list of students
//-- clear button to clear the list of students
// pick a winner button to pick and display winner from list
// clicking pick a winner again should select another random student from list

//focus as well. Can't remember how this is added

//who gets a sticker?
//clear btn -- red       pick a winner btn -- green
// sticker.png


//This week's posters are:
// No posters // students names with commas between

import SwiftUI

struct ContentView: View {
    @State private var winningMessage = ""
    @State private var name = ""
    @State private var posters: [String] = []
    @FocusState private var textFieldIsFocused: Bool
    
    
    var body: some View {
        VStack {
            Text("Who Gets a Sticker?")
                .font(.largeTitle)
                .fontWeight(.black)
            
            HStack {
                Button("Clear") {
                    clearNames()
                }
                .tint(.red.opacity(0.8))
                
                Spacer()
                
                Button("Pick a Winner"){
                    selectWinner()
                }
                .tint(.green.opacity(0.8))
            }
            .buttonStyle(.glassProminent)
            .font(.title2)
            .fontWeight(.bold)
            .disabled(posters.isEmpty)
            
            
            Image("sticker")
                .resizable()
                .scaledToFit()
            
            Text(winningMessage)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            Text("This Week's Posters Are:")
                .font(.largeTitle)
                .fontWeight(.black)
                .multilineTextAlignment(.center)
            
//            TextField("Student Name", text: $studentName)
//                .font(.largeTitle)
//                .fontWeight(.black)
//                .multilineTextAlignment(.center)
            
            Text(
                posters.isEmpty ? "No Posters This Week" : "\(posters.joined(separator: ", "))"
            )
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            HStack {
                TextField("enter name", text: $name)
                    .font(.title2)
                    .textFieldStyle(.roundedBorder)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 1)
                    }
                    .autocorrectionDisabled()
                    .focused($textFieldIsFocused)
                
                Button {
                    addName()
                } label: {
                    Image(systemName: "plus")
                }
                .bold()
            }
            .font(.title2)
    
        }
        .padding()
    }
    
    func addName() {
        if !name.isEmpty {
            posters.append(name)
            name = ""
            textFieldIsFocused = false
        }
    }
    
    func clearNames() {
        posters.removeAll()
        winningMessage = ""
        name = ""
        textFieldIsFocused = false
    }
    
    func selectWinner() {
        winningMessage = "This Week's Winner is: \n\(posters.randomElement() ?? "No Winners This Week")"
            name = ""
            textFieldIsFocused = false
            
    }
}

#Preview {
    ContentView()
}
