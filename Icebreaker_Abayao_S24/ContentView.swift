//
//  ContentView.swift
//  Icebreaker-Abayayo-S24
//
//  Created by ea on 2/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var textFirstName: String = ""
    @State var textLastName: String = ""
    @State var textPrefName: String = ""
    @State var textAnswer: String = ""
    @State var textQuestion: String = ""
    
    var body: some View {
        
        VStack {
            Text("Icebreaker")
                .font(.system(size: 40))
                .bold()
            Text("Built with Swift UI")
            
            TextField("First Name", text: $textFirstName)
            
            TextField("Last Name", text: $textLastName)
            
            TextField("Preferred Name", text: $textPrefName)
            
            Button(action: {
                setRandomQuestion()}){
                Text("Get a new random question")
                        .font(.system(size: 28))
            }
            Text(textQuestion)
            
            TextField("Answer", text: $textAnswer)
            
            Button(action: {
                writeStudentToFirebase()}){
                Text("Submit")
                        .font(.system(size: 28))
            }
        }
        .font(.largeTitle)
        .multilineTextAlignment(.center)
        .autocorrectionDisabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .padding()
    }
    
    func setRandomQuestion(){
        print("Set random question pressed")
    }
    
    func writeStudentToFirebase(){
        print("Submit button pressed")
        print("First Name: \(textFirstName)")
        print("Last Name: \(textLastName)")
        print("Pref Name: \(textPrefName)")
        print("Answer: \(textAnswer)")
    }
}

#Preview {
    ContentView()
}
