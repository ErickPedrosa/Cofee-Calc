
import SwiftUI


enum SplashViewRouter{
    
    static func makeCalcView() -> some View{
        let viewModel = CalcViewModel()
        return CalcView(viewModel: viewModel)
    }
}
