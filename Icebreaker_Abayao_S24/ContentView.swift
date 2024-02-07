//
//  ContentView.swift
//  Icebreaker-Abayayo-S24
//
//  Created by ea on 2/6/24.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    let db = Firestore.firestore()
    
    @State var textFirstName: String = ""
    @State var textLastName: String = ""
    @State var textPrefName: String = ""
    @State var textAnswer: String = ""
    @State var textQuestion: String = ""
    
    @State var questions = [Question]()
    
    var body: some View {
        
        VStack {
            Text("Icebreaker").font(.system(size: 40)).bold()
            Text("Built with Swift UI")
            
            TextField("First Name", text: $textFirstName)
            
            TextField("Last Name", text: $textLastName)
            
            TextField("Preferred Name", text: $textPrefName)
            
            Button(action: { setRandomQuestion()}){
                Text("Get a new random question").font(.system(size: 28))
            }
            Text(textQuestion)
            
            TextField("Answer", text: $textAnswer)
            
            Button(action: {
                if (textAnswer != "") {
                    writeStudentToFirebase()
                }
                resetTextFields()
            })
            {
                Text("Submit").font(.system(size: 28))
            }
        }
        .font(.largeTitle)
        .multilineTextAlignment(.center)
        .autocorrectionDisabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .padding()
        .onAppear(){ getQuestionsFromFirebase() }
    }
    
    func resetTextFields(){
        textFirstName = ""
        textLastName = ""
        textPrefName = ""
        textQuestion = ""
        textAnswer = ""
    }
    
    func setRandomQuestion(){
        print("Set random question pressed")
        var newQuestion = questions.randomElement()?.text
        if(newQuestion != nil){
            self.textQuestion = newQuestion!
        }
    }
    
    func getQuestionsFromFirebase(){
        db.collection("questions")
            .getDocuments() { (querySnapshot, err) in
                if let err = err { // if error is not nil
                    print("Error getting documents: \(err)")
                } else { // get question documents from firebase
                    for document in querySnapshot!.documents {
                        print("\(document.documentID)")
                        if let question = Question(id: document.documentID, data: document.data()) {
                            print("Question ID = \(question.id), text = \(question.text)")
                            
                            self.questions.append(question)
                        }
                    }
                }
            }
    }
    
    func writeStudentToFirebase(){
        print("Submit button pressed")
        print("First Name: \(textFirstName)")
        print("Last Name: \(textLastName)")
        print("Pref Name: \(textPrefName)")
        print("Answer: \(textAnswer)")
        print("Question: \(textQuestion)")
        print("Class: ios-spring2024")
        
        let data = ["first_name": textFirstName,
                    "last_name" : textLastName,
                    "pref_name" : textPrefName,
                    "question"  : textQuestion,
                    "answer"    : textAnswer,
                    "class"     : "ios-spring2024"] as [String: Any]
        
        var ref: DocumentReference? = nil
        ref = db.collection("students")
            .addDocument(data: data) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
    }
}

#Preview {
    ContentView()
}
