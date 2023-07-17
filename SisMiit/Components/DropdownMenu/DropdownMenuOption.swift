import Foundation

struct DropdownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension DropdownMenuOption {

    static let hostels: [DropdownMenuOption] = [
        DropdownMenuOption(option: "KKS JPE"),
        DropdownMenuOption(option: "KKS JT"),
    ]
    
}
