# NGO Project

This repository contains the source code for an NGO project aimed at providing emergency help, education, and awareness, especially for children and young girls. The project includes both a mobile application built using Flutter and a website that integrates with a common server.

## Features

- **User Authentication**: Secure user signup and login functionality.
- **Chatbot Integration**: AI-powered chatbot using the Gemini API to provide instant support and answer FAQs.
- **Emergency Help Posts**: Users can view and post emergency help requests categorized by type.
- **Payment Integration**: Secure and seamless payment gateway for donations.
- **E-Certificate Generation**: Automatically generates and sends e-certificates to donors after successful donations.
- **Volunteer Sign-up**: Allows users to sign up as volunteers, providing their details and field of interest.
- **Admin Panel**: Admins can filter and manage feedback, view donation records, and manage users.

## Tech Stack

- **Frontend**: 
  - Flutter for the mobile application
  - TypeScript for the web application
- **Backend**: 
  - Node.js with Express.js
  - MongoDB for database management
  - Mongoose for object data modeling
- **Cloud Services**:
  - Cloudinary for image and media storage
- **AI Integration**:
  - Langchain package for managing chatbot prompts and responses
  - Gemini API for AI-driven chatbot functionality
- **Payment Processing**:
  - Integrated with Google Pay and other payment gateways
- **Certificate Generation**:
  - Generates PDF certificates using custom templates upon successful donations

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/ngo-project.git
   cd ngo-project
   ```

2. **Install dependencies for the server:**

   ```bash
   npm install
   ```

3. **Run the server:**

   ```bash
   npm run dev
   ```

4. **Set up the Flutter app:**
   
   - Open the Flutter project in your preferred IDE.
   - Run `flutter pub get` to install dependencies.
   - Connect your device/emulator and run the app.

## Configuration

- **Environment Variables**:
  - Create a `.env` file in the root directory of the server.
  - Define variables for database connection, API keys, and other sensitive information.

## Contributing

We welcome contributions from the community. Please read our [Contributing Guidelines](CONTRIBUTING.md) for more details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Thanks to the open-source community for providing the tools and libraries used in this project.
- Special thanks to the contributors and volunteers who helped bring this project to life.

---

Feel free to adjust any sections or add more details as needed!
