import SwiftUI

struct DropdownMenuListRow: View {
    let option: DropdownMenuOption
    
    let onSelectedAction: (_ option: DropdownMenuOption) -> Void
    
    var body: some View {
        Button(action: {
            self.onSelectedAction(option)
        }) {
            Text(option.option)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.white)
        .padding(.vertical, 10)
        .padding(.horizontal)
    }
}
