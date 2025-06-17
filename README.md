# PBlog: A Modern Blogging Platform

PBlog is a full-featured blogging application built with Ruby on Rails. It features a sleek, dark-mode UI with a "bento grid" layout for a modern, visually engaging experience. The platform allows users to sign up, create posts with images, and interact with content.

![PBlog Screenshot](placeholder.png) <!-- It's a good idea to replace 'placeholder.png' with an actual screenshot of your app! -->

---

### Features

*   **User Authentication:** Secure sign-up, login, and session management using Devise.
*   **Post Creation:** Users can create new blog posts with titles and content.
*   **Image Uploads:** Posts can feature a main photo, which is displayed in the bento grid.
*   **Modern UI:** A custom, dark-themed user interface with a responsive bento grid layout.
*   **Animations:** Subtle fade-in animations for a smoother user experience.
*   **Custom Theming:** A clear and organized CSS structure for easy theming and customization.

---

### Getting Started

To get a local copy up and running, follow these simple steps.

#### Prerequisites

*   Ruby `3.3.0` (or as specified in `.ruby-version`)
*   Bundler `2.5.7` (or as specified in `Gemfile.lock`)
*   Node.js (for JavaScript runtime)
*   PostgreSQL (or your database of choice)

#### Installation

1.  **Clone the repo**
    ```sh
    git clone https://github.com/your_username/pblog.git
    cd pblog
    ```
2.  **Install Gems**
    ```sh
    bundle install
    ```
3.  **Install JavaScript dependencies**
    ```sh
    npm install
    ```
4.  **Set up the database**
    ```sh
    rails db:create
    rails db:migrate
    ```
5.  **Run the server**
    ```sh
    rails server
    ```
    The application will be available at `http://localhost:3000`.

---

### Future Enhancements

*   Full CRUD functionality for posts (Edit/Delete).
*   Rich text editing for post content with Action Text.
*   A commenting system for posts.
*   User profiles to display user-specific content.
*   Authorization rules with Pundit to control user permissions.
