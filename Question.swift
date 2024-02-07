//
//  Question.swift
//  Icebreaker_Abayao_S24
//
//  Created by ea on 2/6/24.
//

import Foundation

class Question{
    var id: String
    var text: String
    
    init?(id: String, data: [String: Any]){
        guard let text = data["text"] as? String
        else {
            return nil
        }
        self.id = id
        self.text = text
    }
}
