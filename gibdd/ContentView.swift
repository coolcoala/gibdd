//
//  ContentView.swift
//  gibdd
//
//  Created by Sova on 04.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State var answers = [Answers]()
    var body: some View {
        NavigationView {
            List(1..<41) { num in
                NavigationLink("Билет №\(num)", destination: AnswersView(numOfTicket: num))
            }
            .navigationTitle("Вопросы")
        }
    }
}

struct AnswersView: View {
    @State var answers = [Answers]()
    @State var numOfTicket: Int
    var body: some View {
        NavigationView {
            List(answers) { answer in
                NavigationLink(destination: AnswerView(answer: answer)) {
                    Text(answer.question)
                }
            }.onAppear() {
                apiCall().getAnswers(completion:{ (answers) in
                    self.answers = answers
                }, num: numOfTicket)
            }
            .navigationTitle("Билет №\(numOfTicket)")
        }
    }
}

struct AnswerView: View {
    @State var answer: Answers
    @State private var selectedAnswerId: UUID? = nil
    var body: some View {
        NavigationView {
            VStack {
                Text(answer.question)
                List(answer.answers) { _answer in
                    Text(_answer.answerText).onTapGesture {
                        selectedAnswerId = _answer.id
                    }
                    .listRowBackground(selectedAnswerId == _answer.id ? (_answer.isCorrect ? Color.green : Color.red) : Color.white)
                }
            }
        }
        .navigationTitle(answer.title)
    }
}


#Preview {
    ContentView()
}
