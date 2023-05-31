require_relative '../config/environment'
require_relative '../models/students'
require 'pry'

Student.create(name: "John Doe", email: "john.doe@example.com")
Student.create(name: "Jane Smith", email: "jane.smith@example.com")
Student.create(name: "Michael Johnson", email: "michael.johnson@example.com")
Student.create(name: "Emily Brown", email: "emily.brown@example.com")
Student.create(name: "Daniel Wilson", email: "daniel.wilson@example.com")
Student.create(name: "Olivia Davis", email: "olivia.davis@example.com")
Student.create(name: "William Anderson", email: "william.anderson@example.com")
Student.create(name: "Sophia Martinez", email: "sophia.martinez@example.com")
Student.create(name: "Ethan Thompson", email: "ethan.thompson@example.com")
Student.create(name: "Ava Taylor", email: "ava.taylor@example.com")

binding.pry
