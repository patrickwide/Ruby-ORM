#!/bin/bash

# Prompt for project name
read -p "Enter project name: " project_name

# Create directory with project name
mkdir "$project_name"

# Change into project directory
cd "$project_name"

# Format project name with first letter capitalized
project_name_capitalized="$(tr '[:lower:]' '[:upper:]' <<< ${project_name:0:1})${project_name:1}"

# Prompt for additional questions
read -p "Do you want to use Git? [y/n]: " use_git
read -p "Do you want to create a README file? [y/n]: " create_readme

# Initialize project with Bundler
bundle init

# Add gems to Gemfile
echo "gem 'rake'" >> Gemfile
echo "gem 'sinatra'" >> Gemfile
echo "gem 'sinatra-activerecord'" >> Gemfile
echo "gem 'sqlite3'" >> Gemfile
echo "gem 'yaml'" >> Gemfile
echo "gem 'pry'" >> Gemfile
echo "gem 'thin'" >> Gemfile

# Install gems
bundle install

# Create Rakefile and append the require statements
cat << EOF > Rakefile
require 'sinatra/activerecord/rake'
require 'config/environment'
EOF

# Create directories
mkdir app
mkdir app/controllers
mkdir app/models
mkdir config
mkdir db

# Create files
touch config/database.yml
touch config/environment.rb
touch db/seeds.rb
touch app/api.rb

# Update database.yml
cat << EOF > config/database.yml
development:
  adapter: sqlite3
  database: db/development.sqlite3

# Additional configurations for other databases
# production:
#   adapter: mysql2
#   host: localhost
#   database: myapp_production
#   username: root
#   password: password
#
# test:
#   adapter: postgresql
#   host: localhost
#   database: myapp_test
#   username: postgres
#   password: password
EOF

# Update environment.rb
cat << EOF > config/environment.rb
# Set the default RACK_ENV to 'development' if it's not already set
ENV['RACK_ENV'] ||= 'development'

# Load the necessary gems and dependencies based on the RACK_ENV
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])
EOF

# Update api.rb
cat << EOF > app/api.rb
require 'bundler/setup'
require 'sinatra'
require './sinatra/activerecord'

# Add require_relative statements for controllers and models
# Example:
# require_relative 'path/to/controller'
# require_relative 'path/to/model'

class $project_name_capitalized < Sinatra::Base
    # Add use statements for controllers
    # Example:
    # use ControllerName

    get '/' do
        { message: 'Hello, World!' }.to_json
    end

end

$project_name_capitalized.run!
EOF

# Initialize Git if user chooses to use it
if [[ $use_git =~ ^[Yy]$ ]]; then
    git init
    git add .
    git commit -m "Initial commit"
fi

# Create README file if user chooses to create it
if [[ $create_readme =~ ^[Yy]$ ]]; then
    touch README.md
    echo "# $project_name" >> README.md
fi

# Instructions for the user
echo ""
echo "Project setup completed in '$project_name' directory!"
echo "Next steps:"
echo "- Change into the project directory: 'cd $project_name'"
echo "- Modify the necessary files (controllers, models, etc.) to build your application."
echo "- Start the application by running 'ruby app/api.rb' in the project directory."
echo "- Access the application in your browser at 'http://localhost:4567'."