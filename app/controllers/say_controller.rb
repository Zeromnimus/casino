class SayController < ApplicationController
  def hello
  	@time = Time.now
  end

  def goodbye
  	@time = Time.now
  end
  
  def files
  	@time = Time.now
    @files = Dir.glob('*')
  end
end
