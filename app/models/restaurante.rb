class Restaurante < ActiveRecord::Base
  # é possivel criar um Restaurante com mass assignment se tiver apenas nome e endereco 
  attr_accessible :nome, :endereco, :especialidade
end
