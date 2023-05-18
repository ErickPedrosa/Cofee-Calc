
import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    
    var body: some View {
        Group{
            switch viewModel.uiState { //validando os casos de uso desta tela
                case .loading:
                    loadingView()
                case .goToCalcScreen:
                    viewModel.calcView()
                case .goToHomeScreen:
                    Text("Carregar tela home")
                case .error(let msg):
                    loadingView(error: msg)
            }
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

//Forma 3
extension SplashView{
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
            
            if let error = error { //descompactando o opcional
                Text("")
                    .alert(isPresented: .constant(true)){ //sempre true pois se o parametro nao e nulo, estamos em estado de erro
                        Alert(title: Text("HabitPlus"),
                              message: Text(error),
                              dismissButton: .default(Text("Ok")){
                                //faz algo quando some o alerta
                                }
                        )
                    }
            }
            
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
