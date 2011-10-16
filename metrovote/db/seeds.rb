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
                 :bio => "Bobby started his career in city service as a laborer in Local 1239 working at the Seattle Department of Transportation (SDOT). He has since held multiple leadership positions within city government, including SDOT's Safety, Health and Environmental Manager and the City's Contracting Manager. He worked his way up, eventually landing the job he has now as SDOT's Contracting Equity and Compliance Manager, helping small businesses with the city's contracting processes.",
                 :twitter => "BobbyForch",
                 :position_id => position1.id,
                 :facebook => "http://www.facebook.com/pages/Bobby-Forch/80010933301",
                 :email => "forchforcouncil@gmail.com",
				 :phone => "(555) 555-5555"
                 :photo => "http://washingtonbus.org/blog/blog-images/forch.jpg"
                )

Candidate.create(:name => "Jean Godden",
                 :website => "http://www.jeangodden.com",
                 :bio => "I have served as a Seattle City Councilwoman since 2004. My years of experience balancing our city's budget, bringing new jobs to the region, and protecting our environment fuel my passion for public service.",
                 :twitter => "SeattleScribe",
                 :position_id => position1.id,
                 :facebook => "http://www.facebook.com/reelectjeangodden",
                 :email => "info@jeangodden.com",
				 :phone => "(555) 555-5555"
                 :photo => "http://wedgwoodcc.org/wp-content/uploads/2011/02/godden.jpg"
                )

Candidate.create(:name => "Bruce Harrell",
                 :website => "http://www.electbruceharrell.com",
                 :bio => "Bruce A. Harrell (born 1958) is currently serving as a member of the Seattle City Council. He was first elected in 2007 from a field of five candidates. He is currently Chair of the Energy, Technology, and Civil Rights Committee and is responsible for oversight of Seattle City Light, the city's public power utility and the city's Department of Information and Technology. Harrell is Vice Chair of Public Utilities & Neighborhoods and member of Parks & Seattle Center. He sits on the Executive Board for the Puget Sound Regional Council and is a member of the Puget Sound Regional Transportation Policy Board. Bruce Harrell also sits on the King County Flood Control Zone Advisory Committee and the Fire Facilities Oversight Committee.",
                 :twitter => "bruceharrell",
                 :position_id => position3.id,
                 :facebook => "http://www.facebook.com/bruceharrell",
                 :email => "bruceharrell2011@gmail.com",
				 :phone => "(555) 555-5555"
                 :photo => "http://www.edgeonthenet.com/display/viewimage_story.php?id=119836"
                )

Candidate.create(:name => "Brad Meacham",
                 :website => "http://www.electbradmeacham.com",
                 :bio => "Brad is a third-generation Washingtonian who has always been deeply engaged in Seattle - following key civic issues and voting absentee even while he lived abroad. He served on the board of the Municipal League of King County for three years and was elected chairman twice. He is currently in his fifth year on the board of Richard Hugo House and has also been a member of the Eastlake Community Council. In addition, he recently completed a Master of Public Administration (M.P.A.) degree from the Evans School at the University of Washington.",
                 :position_id => position3.id,
                 :twitter => "bradmeacham",
                 :facebook => "http://www.facebook.com/electbradmeacham",
                 :email => "forchforcouncil@gmail.com",
				 :phone => "(555) 555-5555"
                 :photo => "http://seattletransitblog.com/wp-content/uploads/2011/07/meacham.png"
                )

Candidate.create(:name => "Dale L. Pusey",
                 :website => "http://www.dalepusey.com",
                 :bio => "Dale Pusey is a 32 year-old accountant and West Seattleite running for Seattle City Council Position 5 as the sole challenger against two-term incumbent Tom Rasmussen. Johnathon Fitzpatrick spoke to him for seattlepi.com and Pusey discussed his beef with the Council on transit and his idea to preserve the Alaskan Way Viaduct as a park.",
                 :twitter => "dalepusey",
                 :position_id => position5.id,
                 :facebook => "http://www.facebook.com/pages/People-for-Dale-Pusey/210451178991456",
                 :email => "dale.pusey@clearwire.net",
				 :phone => "(555) 555-5555"
                 :photo => "http://www.dalepusey.com/images/dale2.jpg"
                )

Candidate.create(:name => "Tom Rasmussen",
                 :website => "http://tom4seattle.com/",
                 :bio => "Tom Rasmussen is a member of the Seattle City Council, first elected in 2003. Between September 2004 and December 2007 he was chair of the Housing, Human Services & Health Committee, vice chair of the Urban Development & Planning Committee, and a member of the Transportation Committee. On January 7, 2008 Tom was sworn in for his second term on City Council. From January 2008 through December 2009, he was chair of the Parks & Seattle Center Committee, the vice chair of the Culture, Civil Rights, Heath and Personnel Committee, and the Labor Policy Committee. He is currently chair of the Transportation Committee, vice chair of the Parks and Seattle Center Committee, and a member of the Housing, Human Services, Health, and Culture Committee.",
                 :twitter => "Tom4Seattle",
                 :position_id => position5.id,
                 :facebook => "http://www.facebook.com/pages/Tom-Rasmussen-for-Seattle-City-Council/133544566715511",
                 :email => "info@tom4seattle.com",
				 :phone => "(555) 555-5555"
                 :photo => "http://tom4seattle.com/images/uploaded/bio.jpg"
                )

Candidate.create(:name => "Tim Burgess",
                 :website => "http://www.electtimburgess.com/",
                 :bio => "Tim Burgess is a member of the Seattle City Council, former journalist, Seattle Police Department detective and international humanitarian worker. Burgess was elected in November, 2007 with 64% of the vote. He assumed office on January 1, 2008 and his term expires December 31, 2011. Burgess chairs the Public Safety and Education Committee and co-chairs the Built Environment Committee, Domestic Violence Prevention Council and the Family and Education Levy Oversight Committee. Prior to his election to the City Council, Burgess chaired his neighborhood community council and served 12 years on Seattle's Ethics and Elections Commission.",
                 :position_id => position7.id,
                 :twitter => "ElectTimBurgess",
                 :facebook => "http://www.facebook.com/pages/Elect-Tim-Burgess/151303868270933",
                 :email => "info@electtimburgess.com",
				 :phone => "(555) 555-5555"
                 :photo => "http://electtimburgess.com/images/tim-head.jpg"
                )

Candidate.create(:name => "David L. Schraer",
                 :website => "http://davidforseattle.com/",
                 :bio => "My name is David Schraer and I am running for Seattle City Council position seven. An architect, small business owner, community development professional and long-time political activist, I will bring unique perspective to the council which can be summarized as short-term pragmatism coupled with long-term idealism. Here is my story.",
                 :position_id => position7.id,
                 :twitter => "",
                 :facebook => "http://www.facebook.com/pages/David-For-Seattle/225560587477278?sk=wall",
                 :email => "david@inplainair.com",
				 :phone => "(555) 555-5555"
                 :photo => "https://lh5.googleusercontent.com/-BjFGERGrSbI/AAAAAAAAAAI/AAAAAAAAAYY/g7VO9DuOZz4/photo.jpg"
                )

Candidate.create(:name => "Sally Clark",
                 :website => "http://electsallyclark.com/",
                 :bio => "Sally J. Clark is a member of the Seattle City Council, appointed to fill the vacant seat formerly occupied by Jim Compton in January 2006. She was elected to a one-year term in November 2006 and a four year term in 2007. Clark chairs the Planning, Land Use, and Neighborhoods committees. She used to be a legislative aide to former City Councilwoman Tina Podlodowski, and worked as a legislative aide to King County Councilmember Bob Ferguson before joining Lifelong AIDS Alliance as director of community resources. At Lifelong AIDS Alliance Sally oversaw public policy and advocacy, HIV prevention education, volunteer recruitment and training, and insurance premium payment assistance. Clark was an editor for the Seattle Gay News and has written for The Advocate. She is an open lesbian.",
                 :position_id => position9.id,
                 :twitter => "sally4council",
                 :facebook => "http://www.facebook.com/votesally",
                 :email => "info@electsallyclark.com",
				 :phone => "(555) 555-5555"
                 :photo => "http://wpcnet.org/end_uploads/sally_clark.jpg"
                )

Candidate.create(:name => "Dian Ferguson",
                 :bio => "My vision is of a Seattle where everyone belongs, and where no individual and no neighborhood is left behind. It is a place where small businesses thrive, and where children and youth are well-educated. In my vision public safety is front and center, police are accountable to the public as public servants, and we have a commitment to that larger something which comes through shared effort and mutual benefit. I am up for the challenge. My skills, knowledge and experience set me apart from the business-as-usual conversations and solutions that dominate Seattle City Council. This is why I have decided to run. I need your support through dollars, time, endorsements, commitment and prayers to change the course of Seattle's current direction.",
                 :website => "http://www.dianferguson.com/",
                 :twitter => "electdian",
                 :position_id => position9.id,
                 :facebook => "http://www.facebook.com/pages/Elect-Dian-Ferguson/154297187967305",
                 :email => "logan@dianferguson.com",
				 :phone => "(555) 555-5555"
                 :photo => "http://hphotos-sea1.fbcdn.net/hphotos-snc6/231196_160441710686186_154297187967305_382078_8147866_n.jpg"
                )
