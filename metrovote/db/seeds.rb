# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Candidate.delete_all

Candidate.create(:name => "Bobby Forch",
                 :position => "Council Seat 1",
                 :website => "http://bobbyforch.com",
                 :twitter => "BobbyForch",
                 :facebook => "http://www.facebook.com/pages/Bobby-Forch/80010933301",
                 :email => "forchforcouncil@gmail.com",
                 :photo => "http://washingtonbus.org/blog/blog-images/forch.jpg"
                )

Candidate.create(:name => "Jean Godden",
                 :position => "Council Seat 1",
                 :website => "http://www.jeangodden.com",
                 :twitter => "SeattleScribe",
                 :facebook => "http://www.facebook.com/reelectjeangodden",
                 :email => "info@jeangodden.com",
                 :photo => ""
                )

Candidate.create(:name => "Bruce Harrell",
                 :position => "Council Seat 3",
                 :website => "http://www.electbruceharrell.com",
                 :twitter => "bruceharrell",
                 :facebook => "http://www.facebook.com/bruceharrell",
                 :email => "bruceharrell2011@gmail.com",
                 :photo => ""
                )

Candidate.create(:name => "Brad Meacham",
                 :position => "Council Seat 3",
                 :website => "http://www.electbradmeacham.com",
                 :twitter => "bradmeacham",
                 :facebook => "http://www.facebook.com/electbradmeacham",
                 :email => "forchforcouncil@gmail.com",
                 :photo => ""
                )

Candidate.create(:name => "Dale L. Pusey",
                 :position => "Council Seat 5",
                 :website => "http://www.dalepusey.com",
                 :twitter => "dalepusey",
                 :facebook => "http://www.facebook.com/pages/People-for-Dale-Pusey/210451178991456",
                 :email => "dale.pusey@clearwire.net",
                 :photo => "http://www.dalepusey.com/images/dale2.jpg"
                )

Candidate.create(:name => "Tom Rasmussen",
                 :position => "Council Seat 5",
                 :website => "http://tom4seattle.com/",
                 :twitter => "Tom4Seattle",
                 :facebook => "http://www.facebook.com/pages/Tom-Rasmussen-for-Seattle-City-Council/133544566715511",
                 :email => "info@tom4seattle.com",
                 :photo => "http://tom4seattle.com/images/uploaded/bio.jpg"
                )
				
Candidate.create(:name => "Tim Burgess",
                 :position => "Council Seat 7",
                 :website => "http://www.electtimburgess.com/",
                 :twitter => "ElectTimBurgess",
                 :facebook => "http://www.facebook.com/pages/Elect-Tim-Burgess/151303868270933",
                 :email => "info@electtimburgess.com",
                 :photo => "http://electtimburgess.com/images/tim-head.jpg"
                )
				
Candidate.create(:name => "David L. Schraer",
                 :position => "Council Seat 7",
                 :website => "http://davidforseattle.com/",
                 :twitter => "",
                 :facebook => "http://www.facebook.com/pages/David-For-Seattle/225560587477278?sk=wall",
                 :email => "david@inplainair.com",
                 :photo => ""
                )
				
Candidate.create(:name => "Sally Clark",
                 :position => "Council Seat 9",
                 :website => "http://electsallyclark.com/",
                 :twitter => "sally4council",
                 :facebook => "http://www.facebook.com/votesally",
                 :email => "info@electsallyclark.com",
                 :photo => ""
                )
				
Candidate.create(:name => "Dian Ferguson",
                 :position => "Council Seat 9",
                 :website => "http://www.dianferguson.com/",
                 :twitter => "electdian",
                 :facebook => "http://www.facebook.com/pages/Elect-Dian-Ferguson/154297187967305",
                 :email => "logan@dianferguson.com",
                 :photo => ""
                )