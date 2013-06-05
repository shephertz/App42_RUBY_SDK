
require 'com/shephertz/App42/paas/sdk/ruby/ServiceAPI.rb';

require 'com/shephertz/App42/paas/sdk/ruby/user/UserService.rb';

require 'com/shephertz/App42/paas/sdk/ruby/user/User.rb';

require 'com/shephertz/App42/paas/sdk/ruby/App42BadParameterException.rb';

require 'com/shephertz/App42/paas/sdk/ruby/App42Exception.rb';

require 'com/shephertz/App42/paas/sdk/ruby/App42NotFoundException.rb';

require 'com/shephertz/App42/paas/sdk/ruby/App42Response.rb';

class SampleApp

def testCreateUser

#Enter your Public Key and Private Key Here in Constructor. You can

#get it once you will create a app in app42 console
sp = App42::ServiceAPI.new("5eb93d9761c7ae8bcad39df96e195eae8b9e55d66e93eb895a0fb10d0bdaa862","dc06f233fc72adfaaced4f538df1beca5169a5c76e0ca21912ee63d3c7ce255b")

#Create Instance of User Service

userService = sp.buildUserService()

#create user or call other available method on the user service

#reference

  begin
    
user = userService.createUser("test21.app123", "67899","test12.app@shephertz.com");

#Fetch the returned JSON response

puts" User Creation Successfull !!! JSON Response is : " + user.to_s;

  rescue App42BadParameterException => ex
    
  puts("App42BadParameterException ");
  
    # Exception Caught
    
    # Check if User already Exist by checking app error code
    
    if ex.app_error_code == 2001
    
    # Do exception Handling for Already created User.
    
    puts "User already exist with given user name";
    
    end
    
    rescue App42SecurityException => ex
    
    puts("App42SecurityException ");
    
    # Exception Caught
    
    # Check for authorization Error due to invalid Public/Private Key
    
    if ex.app_error_code == 1401
    
    # Do exception Handling here
    
    end
    
    rescue App42Exception =>ex
    
    puts "App42Exception ";
    
    # Exception Caught due to other Validation
    
    end
    
    end
    
    end

testObj = SampleApp.new();
testObj.testCreateUser();