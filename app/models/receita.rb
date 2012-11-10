#coding: utf-8
class Receita < ActiveRecord::Base
  attr_accessible :prato_id, :conteudo

  belongs_to :prato

  validates_presence_of :conteudo, message: " - deve ser preenchido"

  validates_presence_of :prato_id
  validates_associated :prato

end
