//
//  ResultView.swift
//  Cofee
//
//  Created by coltec on 09/05/23.
//

import Foundation
import SwiftUI

struct ResultView: View {
    
    @State var navigationBarHidden = true
    
    @ObservedObject var viewModel: ResultViewModel
    @State var result: Bool
    
    
    var body: some View {
        
        Group{
            switch viewModel.uiState { //validando os casos de uso desta tela
                case .goToCalcScreen:
                    viewModel.calcView()
                case .goToHomeScreen:
                    Text("Carregar tela home")
                case .error(let msg):
                    loadingView(error: msg)
                case .none:
                    loadingView()
            }
        }
    }
    
    
}

extension ResultView {
    
    func loadingView(error: String? = nil) -> some View {
        
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack(alignment: .center){
                    Spacer(minLength: 40)
                    VStack(alignment: .center, spacing: 8){
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 30)
                        
                        Text("Cofee Calc")
                            .foregroundColor(.cyan)
                            .font(.title.bold())
                            .padding(.horizontal, 8)
                        
                        msgView
                        
                        buttonReturn
                            
                        
                        Text("Copyright: @YYY")
                            .foregroundColor(.gray)
                            .font(Font.system(size: 13).bold())
                            .padding(.top,36)
                    } //VStack
                } //VStack
            } //ScrollView
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.white)
            .navigationBarTitle("Cofee Calc", displayMode: .inline)
            .navigationBarHidden(navigationBarHidden)
        }
        
        
    }
        
}
    
extension ResultView{
    var msgView: some View{
        
        VStack{
            
            if($result.wrappedValue){
                Text("Seu consumo de café diário é aceitável")
                    .font(.title3.bold())
                    .padding(.horizontal, 8)
            }else{
                Text("Seu consumo de café diário está além do recomendado")
                    .font(.title3.bold())
                    .padding(.horizontal, 8)
                    .foregroundColor(Color.red)
            }

        }
        .padding(.top,36)
        
    }
    
}


extension ResultView{
    var buttonReturn: some View{
        Button("Retornar"){
            viewModel.returnToCalc()
        }
        .padding(.top,36)
    }
}



struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: ResultViewModel(), result: true)
        ResultView(viewModel: ResultViewModel(), result: false)
    }
}
