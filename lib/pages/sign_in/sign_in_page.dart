import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:urbetrack_flutter_challenge/providers/auth_provider.dart';
import 'package:urbetrack_flutter_challenge/utils/constants.dart';
import 'package:urbetrack_flutter_challenge/utils/validator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  FocusNode _usernameFocusNode;
  FocusNode _passwordFocusNode;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Image.asset(
                        Theme.of(context).brightness == Brightness.light
                            ? 'assets/images/urbetrack.png'
                            : 'assets/images/urbetrack_white.png',
                        height: 112,
                      ),
                      Spacer(),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _usernameController,
                        focusNode: _usernameFocusNode,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                        ),
                        validator: Validator.validateUsername,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: '••••••••••',
                        ),
                        validator: Validator.validatePassword,
                      ),
                      Spacer(flex: 2),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                          color: Theme.of(context).buttonColor,
                          onPressed: _isLoading ? null : () => _signIn(context),
                          child: const Text('Sign in'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);
      try {
        final bool didAuthenticate = await context
            .read<AuthProvider>()
            .signInWithUsernameAndPassword(
                _usernameController.text, _passwordController.text);
        if (didAuthenticate) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.home,
            (_) => false,
          );
        } else {
          _passwordFocusNode.requestFocus();
          _scaffoldKey.currentState.showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: const Text('Invalid credentials'),
            ),
          );
        }
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }
}
