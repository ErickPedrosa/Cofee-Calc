

import SwiftUI

//Essa classe é um modelo observável pelo nosso renderizador de UI
class SplashViewModel: ObservableObject{
    @Published var uiState: SplashUIState = .loading
    
    func onAppear(){
        //faz algo assincrono e muda o estado de uiState
        
        //como ainda nao vimos como usar um banco, vamos simular uma espera
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            //o bloco sera disparado apos 2 segundos
            self.uiState = .goToCalcScreen
        }
    }
}

extension SplashViewModel{
    func calcView() -> some View{
        return SplashViewRouter.makeCalcView()
    }
}
