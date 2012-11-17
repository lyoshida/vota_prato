class HelloWorldController < ApplicationController

	def hello_world
		# render :text => "Hello, world!"
		#hora = Time.now #nao funciona
		@hora = Time.now
		@primeiro_restaurante = Restaurante.first
	end

end
