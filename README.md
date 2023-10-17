# Setting Up a Ruby on Rails Project

This README will guide you through setting up a Ruby on Rails project with the following requirements:

- Ruby: 3.2.2
- Rails: 7.1.0
- Database: MySQL

## Prerequisites

Before you begin, make sure you have the following software installed on your system:

- Ruby: 3.2.2
- Rails: 7.1.0. You can install it with `gem install rails`.
- MYSQL: You should have MYSQL installed and configured on your system.

## Getting Started

Follow these steps to set up your Ruby on Rails project:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/adityapanditdev/productivity_hub_backend.git
   cd productivity_hub_backend

2. **Run command for installing bundle:**

   bundle install

3. **Setup database.yml file**

4.  **Create the database:**

   rails db:create

5.  **Migrate database:**

   rails db:migrate

6.  **seed database:**

   rails db:seed

7.  **Run server:**

   rails s -p 3000
