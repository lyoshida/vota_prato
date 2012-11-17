#auxiliar para tirar complexidades das views
#ver chamada no restaurantes.show.html.erb
module RestaurantesHelper

	def boas_vindas
		if params[:user] == '1'
			return '<h2>Oi, usuario</h2>'.html_safe # metodo html safe evita o escape do html
		else
			return '<h2>quem e vc?</h2>'.html_safe
		end
	end
end
