import SwiftUI

struct DropdownMenu: View {
   
    @State private var isOptionsPresented: Bool = false
    
    @Binding var selectedOption: DropdownMenuOption?
    
    let placeholder: String
    
    let options: [DropdownMenuOption]
    
    var body: some View {
        Button(action: {
            self.isOptionsPresented.toggle()
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.option)
                    .fontWeight(.medium)
                    .foregroundColor(selectedOption == nil ? .gray : .white)
                
                Spacer()
                
                Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
        }
        .foregroundColor(.white)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundColor(.white)
        }
        .overlay(alignment: .top) {
            VStack {
                if self.isOptionsPresented {
                    Spacer(minLength: 60)
                    DropdownMenuList(options: self.options) { option in
                        self.isOptionsPresented = false
                        self.selectedOption = option
                    }
                }
            }
        }
        .padding(
            .bottom,
            self.isOptionsPresented ? CGFloat(self.options.count * 32) > 300 ?
            300 + 30 : CGFloat(self.options.count * 32) + 30 : 0)
    }
}
