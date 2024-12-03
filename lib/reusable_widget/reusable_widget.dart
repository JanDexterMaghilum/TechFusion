import 'package:flutter/material.dart';

// Logo Widget
Widget myLogo() {
  return Container(
    height: 120, // Reduced height for better proportion
    width: 120,  // Making it square
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        'assets/logo.png',
        fit: BoxFit.contain,
      ),
    ),
  );
}

// App Title Widget
Widget appTitle() {
  return Column(
    children: [
      const SizedBox(height: 16),
      Text(
        'BIRTHTRACK',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
          color: Colors.red[400],
        ),
      ),
      const SizedBox(height: 8),
      Text(
        'Welcome Back',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

// Reusable Text Field
Widget reusableTextfield(String text, bool isPasswordType) {
  return TextField(
    obscureText: isPasswordType,
    decoration: InputDecoration(
      hintText: text,
      border: const OutlineInputBorder(),
    ),
  );
}

// Forgot Password Button
Widget forgotPasswordButton(Function() onTap) {
  return TextButton(
    onPressed: onTap,
    child: const Text('Forgot Password?'),
  );
}

// Sign In Button
Widget signInButton(BuildContext context, Function() onTap) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE91E63), // Pink color
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      child: const Text(
        'SIGN IN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

// Sign Up Button
Widget signUpButton(Function() onTap) {
  return TextButton(
    onPressed: onTap,
    child: const Text('Don\'t have an account? Sign Up'),
  );
}

// Form Section
Widget loginForm(BuildContext context, {
  required Function() onSignIn,
  required Function() onForgotPassword,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required GlobalKey<FormState> formKey,
  required bool isPasswordVisible,
  required Function() togglePasswordVisibility,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 15,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    padding: const EdgeInsets.all(20),
    child: Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: togglePasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          forgotPasswordButton(onForgotPassword),
          const SizedBox(height: 30),
          signInButton(context, onSignIn),
        ],
      ),
    ),
  );
}