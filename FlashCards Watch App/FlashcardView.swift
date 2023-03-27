/// A view that displays a flashcard with a question and an answer.
///
/// Use this view to show a single flashcard. The user can toggle between the question and answer by tapping on the card.


import SwiftUI
import AVFoundation


struct FlashcardView: View {
    var flashcard: Flashcard
    
    @State private var showAnswer = false
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            if showAnswer {
                AnswerView(answer: flashcard.answer, info: flashcard.info)
            } else {
                QuestionView(question: flashcard.question, info: flashcard.info)
            }
        }
        .padding()
        .onTapGesture {
            withAnimation {
                self.showAnswer.toggle()
            }
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
