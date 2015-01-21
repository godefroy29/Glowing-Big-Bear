load 'Tuile.rb'
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
		@tab[numeroTuile].changerEnSuivant
		#valeurs possibles -1,0,1
	end

	def etatBleu(numeroTuile)
		@tab[numeroTuile].changerEnBleu
	end

	def etatRouge(numeroTuile)
		@tab[numeroTuile].changerEnRouge
	end

	def etatVide(numeroTuile)
		@tab[numeroTuile].changerEnVide
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
			print "#{@tab[x]} => #{tab[x].couleur}"
		end
	end
end