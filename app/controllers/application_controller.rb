class ApplicationController < ActionController::Base
  def hello
    render html: 'Hello girls!, welcome to our new website. :)'
  end
end
