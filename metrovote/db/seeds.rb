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
