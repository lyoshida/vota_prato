#coding:utf-8
class Restaurante < ActiveRecord::Base
  # é possivel criar um Restaurante com mass assignment se tiver apenas nome e endereco 
  attr_accessible :nome, :endereco, :especialidade

  validates_length_of :nome, :maximum => 80
  validates_length_of :especialidade, :maximum => 40
  validates_presence_of :nome, :message => "Nome eh obrigatorio"
  validates_presence_of :endereco, :message => "deve ser preenchido"
  validates_presence_of :especialidade, :message => "deve ser preenchido"
  
  validates_uniqueness_of :nome, message: "nome já cadastrado"
  validates_uniqueness_of :endereco, message: "endereco já cadastrado"
  #outra forma
  #validates :nome, :presence => {:message=>"obrigatorio"},
  #					:length => {:maximum=>80}

  validates :nome, :exclusion => {:in => ["admin", "usuario"]}

  validate :primeira_letra_deve_ser_maiuscula
  private
  def primeira_letra_deve_ser_maiuscula
  	errors.add(:nome, "primeira letra deve ser maiuscula") unless nome=~ /[A-Z].*/ #/\A[A-Z].*\z/
  end

  #validates :sexo, :inclusion => {:in => %w{m f}} # %w{m f} é equivalente a ["m", "f"]
  #validates :telefone, :format => {:with => /regex/}
  #validates :senha, :length => {:in => (6..10), :too_short "muito curto", :too_long "muito longo"}
  #validates :idade, :numericality => true (ou :numericality =>{:only_integer=>true})
  #validates :nome, :uniqueness => true
  #validates :cidade, :uniqueness => {:scope => :estado }
  #validates :termos_de_uso, :acceptance => true #nesse caso estou validando com algo que nao existe no modelo
  #se ele receber :termos_de_uso no hash do post ele executa o post.

  #validates :senha, :confirmation=>true
  
=begin
  validate :valida_cpf # validate sem o s para metodos customizados
  private

  def valida_cpf
  	if (condicao)
  		errors.add :cpf, "CPF Invalido"
  	end
  end
=end

end
