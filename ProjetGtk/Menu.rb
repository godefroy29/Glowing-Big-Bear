# encoding: UTF-8

##
# Auteur PHILIPPE ARMANGER
# Version 0.1 : Date : Wed Jan 21 13:47:35 CET 2015
#


class Menu

	def Menu.afficher(fenetre, langue)

		padding = 40
		
		boutonJouer = Gtk::Button.new(langue.jouer)	
		boutonTutoriel = Gtk::Button.new(langue.tutoriel)
		boutonOptions = Gtk::Button.new(langue.options)
		boutonScore = Gtk::Button.new(langue.score)
		boutonCredits = Gtk::Button.new(langue.credits)
		boutonQuitter = Gtk::Button.new(langue.quitter)

		vbox = Gtk::VBox.new(false,10)
		
		boutonCredits.signal_connect('clicked'){
			fenetre.remove(vbox)
			Credits.afficher(fenetre, langue)
		}
		
		boutonQuitter.signal_connect('clicked'){Gtk.main_quit}
	
		vbox = Gtk::VBox.new(false,10)
		
		# Ajout des boutons a la vbox
		vbox.pack_start(boutonJouer, false, false, padding)
		vbox.pack_start(boutonTutoriel, false, false, padding)
		vbox.pack_start(boutonOptions, false, false, padding)
		vbox.pack_start(boutonScore, false, false, padding)
		vbox.pack_start(boutonCredits, false, false, padding)
		vbox.pack_start(boutonQuitter, false, false, padding)

		fenetre.add(vbox)
		fenetre.show_all
	end
	
end # Marqueur de fin de classe
