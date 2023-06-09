/// A view that displays the question on a flashcard.
///
/// Use this view to display the question side of a flashcard.
///
/// - Parameters:
///   - question: The question to display on the flashcard.
///   - info: Additional information to display on the flashcard.

import SwiftUI

struct QuestionView: View {
    var question: String
    var info: String?

    var body: some View {
        VStack {
            Text(question)
                .font(.system(size: 36))
                .minimumScaleFactor(0.5)
                .lineLimit(1)

            if let info = info {
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

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: "I")
    }
}
