//
//  ContentView.swift
//  FlashCards Watch App
//
//  Created by Starla Wise on 3/26/23.
//

import SwiftUI

// New comment


struct ContentView: View {
    var flashcards = [
        // Singular
        Flashcard(question: "I", answer: "Yo"),
        Flashcard(question: "You", answer: "Tú", info: "casual / familiar"),
        Flashcard(question: "You", answer: "Usted", info: "formal / polite"),
        Flashcard(question: "He", answer: "Él"),
        Flashcard(question: "She", answer: "Ella"),
        // Plural
        Flashcard(question: "We", answer: "Nosotros", info: "masculine"),
        Flashcard(question: "We", answer: "Nosotras", info: "feminine"),
        Flashcard(question: "You All", answer: "Vosotros", info: "casual - masculine"),
        Flashcard(question: "You All", answer: "Vosotras", info: "casual - feminine"),
        Flashcard(question: "You All", answer: "Ustedes", info: "formal / polite"),
        Flashcard(question: "They", answer: "Ellos", info: "masculine"),
        Flashcard(question: "They", answer: "Ellas", info: "feminine"),
        
    ]

    var body: some View {
        TabView {
            ForEach(flashcards, id: \.self) { flashcard in
                FlashcardView(flashcard: flashcard)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .background(Color.white)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
