# Use the official Ruby image from Docker Hub
FROM ruby:3.2.2

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y nodejs default-libmysqlclient-dev

# Install Rails gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of your Rails application code into the container
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
