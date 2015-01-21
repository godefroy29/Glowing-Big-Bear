# encoding: UTF-8

# Permet de lancer une partie

load "ProjetGtk.rb"
load "Langue.rb"
load "Menu.rb"
load "Credits.rb"
load 'Tuile.rb'

#Lancement de la fenetre de jeu générée par Gtk
Gtk.init
builder = Gtk::Window.new()
builder.set_default_size(1024,768)
builder.set_title("TakuZu Deluxe")
langue = Langue.new()
Menu.afficher(builder, langue)

builder.show_all
Gtk.main

class Jeu
	# new(string s_tab)

	attr_accessor :tab #grille de Jeu
	attr_reader :solution #memorise la solution

	def initialize(s_tab)#s_tab est une chaine de caracteres
		@tab=Array.new
		@solution=String.new
		@solution=s_tab
		0.upto (s_tab.length-1) do |x|
			if s_tab[x]=='_' #remplace un "_" par une TuileJouable
				@tab[x]=TuileJouable.new
			elsif s_tab[x]=="0"
				@tab[x]=Tuile.new(0)
			elsif s_tab[x]=="1"
				@tab[x]=Tuile.new(1)
			end
		end
	end

	def etatSuivant(numeroTuile)
		if(@tab[numeroTuile].respond_to? :changerEnSuivant) then
			@tab[numeroTuile].changerEnSuivant
			#valeurs possibles -1,0,1
		end
	end

	def etatBleu(numeroTuile)
		if(@tab[numeroTuile].respond_to? :changerEnBleu) then
			@tab[numeroTuile].changerEnBleu
		end	
	end

	def etatRouge(numeroTuile)
		if(@tab[numeroTuile].respond_to? :changerEnRouge) then
			@tab[numeroTuile].changerEnRouge
		end
	end

	def etatVide(numeroTuile)
		if(@tab[numeroTuile].respond_to? :changerEnVide) then
			@tab[numeroTuile].changerEnVide
		end
	end

	def aideUneTuille
		0.upto solution.length-1 do |x|
			if @tab[x]=="_" #remplace un "_" par une TuileJouable
				return @tab[x]=@solution[x]
			end
		end
	end

	def affichageJeu
		0.upto (@tab.size-1) do |x|
			print @tab[x].to_s
		end
	end
end