////
////  TestView(LLM-AI).swift
////  Weather-Pal
////
////  Created by Tim Seufert on 15.08.25.
////
//
//import SwiftUI
//import CoreML
//
//struct TestView_LLM_AI_: View {
//    
//    @State private var llmInputText: String = ""
//    @State private var llmOutputText: String = "The response will appear here..."
//    
//    var body: some View {
//        ZStack{
//            VStack{
//                Text("LLM Test View")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .font(.system(size: 30, weight: .bold))
//                Spacer()
//                
//                VStack{
//                    TextField("Input", text: $llmInputText )
//                        .frame(width: 300, height: 50)
//                        .font(.system(size: 20, weight: .regular))
//                        .textFieldStyle(.roundedBorder)
//                    //Hmm...how to realize the "Send" Button?
//                }
//                
//                Button{
//                    Task{
//                        await llmQuery()
//                    }
//                } label: {
//                    Text("Send query")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                        .foregroundStyle(.white)
//                        .background(Color.blue)
//                        .frame(width: 200, height: 50)
//                        .background(
//                            Capsule()
//                                .fill(Color.blue)
//                        )
//                }
//            }
//        }
//    }
//    
//    func llmQuery() async {
//        guard !llmInputText.isEmpty else { return }
//        
//        let llm = model()
//        let queryText = llmInputText
//        
//        llmOutputText = ""
//        llmInputText = ""
//        
//        do {
//            let conversation = [MLChatMessage(role: .user, content: queryText)]
//            let responseStream = llm.prediction(from: conversation)
//            
//            for try await token in responseStream {
//                llmOutputText.append(token)
//            }
//        } catch {
//            llmOutputText = "Fehler: \(error.localizedDescription)"
//        }
//    }
//    
//}
//
//#Preview {
//    TestView_LLM_AI_()
//}
