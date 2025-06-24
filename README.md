# Postgram - Social Media Management System

Postgram is a web-based social media management system that allows users to interact with a social media database through a user-friendly interface. The system provides functionality for inserting, viewing, and querying social media data.

## Features

- **User Management**: Create and manage user profiles
- **Social Interactions**: 
  - Post creation and management
  - Comment system
  - Like functionality
  - Friendship connections
- **Data Management**:
  - Insert new data through forms
  - View existing data
  - Execute custom queries
- **Modern UI**: Clean and responsive design with Font Awesome icons

## Technical Stack

- **Frontend**:
  - HTML5
  - CSS3
  - JavaScript
  - Font Awesome for icons
- **Backend**:
  - PHP
  - MySQL Database
- **Server Requirements**:
  - XAMPP or similar local server environment
  - MySQL database named 'postgram'

## Project Structure

- `index.html` - Main landing page
- `insert.html` - Data insertion interface
- `view.html` - Data viewing interface
- `query.html` - Custom query interface
- `styles.css` - Main stylesheet
- `script.js` - Main JavaScript functionality
- `config_mysql.php` - Database configuration
- Various PHP files for handling specific operations (insert_user.php, insert_post.php, etc.)

## Setup Instructions

1. Ensure XAMPP (or similar) is installed and running
2. Import the database schema into MySQL
3. Place all files in your web server's root directory
4. Configure database connection in `config_mysql.php`
5. Access the application through your web browser

## Usage

1. Start at the main page (index.html)
2. Choose between:
   - Insert Data: Add new records to the database
   - View Data: Browse existing records
   - Query: Execute custom database queries

## Security Notes

- Default database credentials are set to local development values
- Ensure to change these credentials before deploying to production
- Implement proper security measures for production use
