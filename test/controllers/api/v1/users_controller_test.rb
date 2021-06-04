require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
  end
  
  test "should create user" do
    post '/api/v1/users', params: { 
      user: { 
        name: 'user_test', 
        email: 'test@starwars.com', 
        password: '12345678', 
        password_digest:'12345678' 
      } 
    }, as: :json

    assert_response 201
  end

  test "tokenizer" do

    post '/api/v1/user_token', params: {
      auth:{
        email:"test@starwars.com",
        password:"12345678"
      }
    }

    assert_response 201
  end

end
