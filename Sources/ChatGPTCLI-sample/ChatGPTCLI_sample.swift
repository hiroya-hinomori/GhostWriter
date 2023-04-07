import Foundation

@main
public struct ChatGPTCLI_sample {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(ChatGPTCLI_sample().text)
        
        let arguments = CommandLine.arguments
        guard arguments.count == 3,
              let x = Int(arguments[1]),
              let y = Int(arguments[2]) else {
            print("Usage: $ swift run sample <x> <y>")
            exit(1)
        }

        let result = x + y
        print("Result: \(result)")
    }
}
