//
//  FlashcardView.swift
//  FlashCards Watch App
//
//  Created by Starla Wise on 3/26/23.
//

import SwiftUI
import AVFoundation


struct FlashcardView: View {
    var flashcard: Flashcard
    
    @State private var showAnswer = false
    let synthesizer = AVSpeechSynthesizer()
    
    
    var body: some View {
        VStack {
            if showAnswer {
                VStack {
                    Text(flashcard.answer)
                        .font(.system(size: 36))
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)

                    
                    if let info = flashcard.info {
                        Text(info)
                            .font(.system(size: 18))
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                    }
                }
                .font(.system(size: 36))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray)
                .cornerRadius(10)
            } else {
                VStack {
                    Text(flashcard.question)
                        .font(.system(size: 36))
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)

                    if let info = flashcard.info {
                        Text(info)
                            .font(.system(size: 18))
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                    }
                }
                .font(.system(size: 36))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
        }
        .padding()
        .onTapGesture {
            self.showAnswer.toggle()
            if self.showAnswer {
                let utterance = AVSpeechUtterance(string: self.flashcard.answer)
                utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
                self.synthesizer.speak(utterance)
            } else {
                self.synthesizer.stopSpeaking(at: .immediate)
            }
        }
    }
}

struct FlashCard_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(flashcard: Flashcard(question: "You", answer: "Tú", info: "casual / familiar"))
    }
}
