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
            List(answers) { answer in
                VStack {
                    Text(answer.question)
                }
            }.onAppear() {
                apiCall().getAnswers { (answers) in
                    self.answers = answers
                }
            }
            .navigationTitle("Вопросы")
        }
    }
}

#Preview {
    ContentView()
}
