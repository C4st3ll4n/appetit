import 'package:fappetite/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';
import 'login_presenter.dart';

class LoginPage extends StatelessWidget {
  
  final LoginPresenter presenter;

  const LoginPage({Key key, this.presenter}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
  
    void _hideKeyboard() {
      final _currentFocus = FocusScope.of(context);
      if(_currentFocus.hasPrimaryFocus){
        _currentFocus.unfocus();
      }
    }
    
    return Scaffold(
      body: Builder(
        builder: (contexto) {
          presenter.isLoadingStream.listen(
            (isLoading) {
              if (isLoading) {
                showSimpleLoading(contexto);
              } else {
                hideLoading(contexto);
              }
            },
          );

          presenter.mainErrorStream.listen(
            (error) {
              if (error != null && error.trim().isNotEmpty) {
                showErrorMessage(contexto, error);
            }
            }
          );

          presenter.navigateToStream.listen(
                  (page) {
                if (page != null && page.trim().isNotEmpty) {
                  Get.offAllNamed(page);
                }
              }
          );
          
          return GestureDetector(
            onTap: _hideKeyboard,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoginHeader(),
                  Headline2(
                    text: "Seja bem-vindo!",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Text("Nós sabemos a importância de estar sempre de barriga cheia e o quanto isso pode ajudar seu dia.",
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Provider(
                      create: (BuildContext context) => presenter,
                      child: Form(
                        child: Column(
                          children: [
                            EmailInput(),
                            Padding(
                              padding: const EdgeInsets.only(top:28.0, bottom: 32),
                              child: PasswordInput(),
                            ),
                            LoginButton(),
                        
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  
}



