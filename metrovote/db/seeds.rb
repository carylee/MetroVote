# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Article.delete_all
Tweet.delete_all
Candidate.delete_all
Position.delete_all
Election.delete_all

seattleElections = Election.create(:title => "Seattle City Council Elections",
                :location => "Seattle, WA",
                :keyword => "seattle"
               )

position1 = Position.create(:title => "Council Seat 1", :election_id => seattleElections.id)
position3 = Position.create(:title => "Council Seat 3", :election_id => seattleElections.id)
position5 = Position.create(:title => "Council Seat 5", :election_id => seattleElections.id)
position7 = Position.create(:title => "Council Seat 7", :election_id => seattleElections.id)
position9 = Position.create(:title => "Council Seat 9", :election_id => seattleElections.id)

Candidate.create(:name => "Bobby Forch",
                 :website => "http://bobbyforch.com",
                 :bio => "Bobby started his career in city service as a laborer in Local 1239 working at the Seattle Department of Transportation (SDOT). He has since held multiple leadership positions within city government, including SDOT’s Safety, Health and Environmental Manager and the City’s Contracting Manager. He worked his way up, eventually landing the job he has now as SDOT’s Contracting Equity and Compliance Manager, helping small businesses with the city’s contracting processes.",
                 :twitter => "BobbyForch",
                 :position_id => position1.id,
                 :facebook => "http://www.facebook.com/pages/Bobby-Forch/80010933301",
                 :email => "forchforcouncil@gmail.com",
                 :photo => "http://washingtonbus.org/blog/blog-images/forch.jpg"
                )

Candidate.create(:name => "Jean Godden",
                 :website => "http://www.jeangodden.com",
                 :bio => "I have served as a Seattle City Councilwoman since 2004. My years of experience balancing our city’s budget, bringing new jobs to the region, and protecting our environment fuel my passion for public service.",
                 :twitter => "SeattleScribe",
                 :position_id => position1.id,
                 :facebook => "http://www.facebook.com/reelectjeangodden",
                 :email => "info@jeangodden.com",
                 :photo => ""
                )

Candidate.create(:name => "Bruce Harrell",
                 :website => "http://www.electbruceharrell.com",
                 :twitter => "bruceharrell",
                 :position_id => position3.id,
                 :facebook => "http://www.facebook.com/bruceharrell",
                 :email => "bruceharrell2011@gmail.com",
                 :photo => ""
                )

Candidate.create(:name => "Brad Meacham",
                 :website => "http://www.electbradmeacham.com",
                 :position_id => position3.id,
                 :twitter => "bradmeacham",
                 :facebook => "http://www.facebook.com/electbradmeacham",
                 :email => "forchforcouncil@gmail.com",
                 :photo => ""
                )

Candidate.create(:name => "Dale L. Pusey",
                 :website => "http://www.dalepusey.com",
                 :twitter => "dalepusey",
                 :position_id => position5.id,
                 :facebook => "http://www.facebook.com/pages/People-for-Dale-Pusey/210451178991456",
                 :email => "dale.pusey@clearwire.net",
                 :photo => "http://www.dalepusey.com/images/dale2.jpg"
                )

Candidate.create(:name => "Tom Rasmussen",
                 :website => "http://tom4seattle.com/",
                 :twitter => "Tom4Seattle",
                 :position_id => position5.id,
                 :facebook => "http://www.facebook.com/pages/Tom-Rasmussen-for-Seattle-City-Council/133544566715511",
                 :email => "info@tom4seattle.com",
                 :photo => "http://tom4seattle.com/images/uploaded/bio.jpg"
                )
				
Candidate.create(:name => "Tim Burgess",
                 :website => "http://www.electtimburgess.com/",
                 :position_id => position7.id,
                 :twitter => "ElectTimBurgess",
                 :facebook => "http://www.facebook.com/pages/Elect-Tim-Burgess/151303868270933",
                 :email => "info@electtimburgess.com",
                 :photo => "http://electtimburgess.com/images/tim-head.jpg"
                )
				
Candidate.create(:name => "David L. Schraer",
                 :website => "http://davidforseattle.com/",
                 :position_id => position7.id,
                 :twitter => "",
                 :facebook => "http://www.facebook.com/pages/David-For-Seattle/225560587477278?sk=wall",
                 :email => "david@inplainair.com",
                 :photo => ""
                )
				
Candidate.create(:name => "Sally Clark",
                 :website => "http://electsallyclark.com/",
                 :position_id => position9.id,
                 :twitter => "sally4council",
                 :facebook => "http://www.facebook.com/votesally",
                 :email => "info@electsallyclark.com",
                 :photo => ""
                )
				
Candidate.create(:name => "Dian Ferguson",
                 :website => "http://www.dianferguson.com/",
                 :twitter => "electdian",
                 :position_id => position9.id,
                 :facebook => "http://www.facebook.com/pages/Elect-Dian-Ferguson/154297187967305",
                 :email => "logan@dianferguson.com",
                 :photo => ""
                )
