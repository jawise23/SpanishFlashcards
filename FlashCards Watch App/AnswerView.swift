/// A view that displays the answer on a flashcard.
///
/// Use this view to display the answer side of a flashcard.
///
/// - Parameters:
///   - answer: The answer to display on the flashcard.
///   - info: Additional information to display on the flashcard.

import SwiftUI

struct AnswerView: View {
    var answer: String
    var info: String?

    var body: some View {
        VStack {
            Text(answer)
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
        .background(Color.gray)
        .cornerRadius(10)
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(answer: "Yo")
    }
}
