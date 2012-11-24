class RestaurantesController < ApplicationController
	
	#layout 'premium', :only => :new
	#before_filter :loga, :only => [:new, :edit]
	#after_filter :loga_de_novo
	#around_filter :around # o around filter passa a action como bloco para a funcao
	
	#respond_to :xml, :json, :html

	def index
		@restaurantes = Restaurante.order("nome").page(params['page']).per(3)
		#respond_with @restaurantes #(para usar com respond_to chamo restaurantes.json)
	end

	def show
		@restaurante = Restaurante.find(params[:id])
	end

	def new
		@restaurante = Restaurante.new
		# if 1==2
		# 	render :new, :layout => 'premium'
		# else
		# 	render :new
		# end
	end

	def create
		@restaurante = Restaurante.new(params[:restaurante])
		if @restaurante.save
			redirect_to(action: "show", id:@restaurante)
		else
			render action: "new"
		end
	end

	def edit
		@restaurante = Restaurante.find(params[:id])
	end

	def update
		@restaurante = Restaurante.find(params[:id])
		if @restaurante.update_attributes(params[:restaurante])
		  redirect_to(action: "show", id: @restaurante)
		else
		  render action: "edit"
		end  
	end

	def destroy
		@restaurante = Restaurante.find(params[:id])
		@restaurante.destroy

		redirect_to(action: "index")
	end

	def mostra
		@coisa = Restaurante.first
	end

	private
	def loga
		puts "*"*100
	end

	def loga_de_novo
		puts "de novo!"*20
	end

	# def around
	# 	?
	# 	yield
	# 	?
	# end
end
