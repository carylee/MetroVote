require 'open-uri'
class CandidatesController < ApplicationController
  # GET /candidates
  # GET /candidates.xml
  def index
    @candidates = Candidate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @candidates }
    end
  end

  # GET /candidates/1
  # GET /candidates/1.xml
  def show
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @candidate }
    end
  end

  def facebook
    @c = Candidate.get_facebook_info params[:fb]
    respond_to do |format|
      format.json{ render :json => @c.to_json }
    end
  end

  # GET /candidates/new
  # GET /candidates/new.xml
  def new
    @candidate = Candidate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @candidate }
    end
  end

  # GET /candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
  end

  # POST /candidates
  # POST /candidates.xml
  def create
    @candidate = Candidate.new(params[:candidate])

    respond_to do |format|
      if @candidate.save
        @candidate.fetch_data
        format.html { redirect_to(@candidate, :notice => 'Candidate was successfully created.') }
        format.xml  { render :xml => @candidate, :status => :created, :location => @candidate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @candidate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /candidates/1
  # PUT /candidates/1.xml
  def update
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      if @candidate.update_attributes(params[:candidate])
        format.html { redirect_to(@candidate, :notice => 'Candidate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @candidate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.xml
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to(candidates_url) }
      format.xml  { head :ok }
    end
  end

  def get_contact(url)
    @doc = Nokogiri::HTML(open(url))
    @doc.xpath("//a").each do |link|
      matches = /contact/i.match(link.children.text)
      unless matches.nil?
        path = make_absolute(link.attributes['href'].value, url)
        return path
      end
    end
    return nil
  end

  def make_absolute( href, root )
    URI.parse(root).merge(URI.parse(href)).to_s
  end

  def scrape(website)
    doc = Nokogiri::HTML(open(website))
    twitter = ''
    doc.xpath('///a').each do |link|
      url = link['href']
      matches = /twitter.com(\/#!)?\/(\w*)/i.match(url)
      unless matches.nil?
        twitter = matches[2]
      end
    end
    phone_matches = /\(?\b([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\b/i.match(doc)
    if phone_matches.nil?
      phone = ""
    else
      phone = phone_matches[0]
    end
    email_matches = /[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})/i.match(doc)
    if email_matches.nil?
      email = ""
    else
      email = email_matches[0]
    end
    scraped = {:email => email, :phone => phone, :twitter => twitter}
    return scraped
  end

  def fix_http_if_missing(url)
    matches = /http/i.match(url)
    if matches.nil?
      url = "http://" + url
    end
    return url
  end

  def contact_info
    url = fix_http_if_missing params[:url]
    info = scrape(url)
    phone = info[:phone]
    email = info[:email]
    twitter = info[:twitter]
    if info[:email].empty? or info[:phone].empty?
      contact_url = get_contact(url)
      unless contact_url.nil?
        backup = scrape(contact_url)
        unless backup[:email].empty?
          email = backup[:email]
        end
        unless backup[:phone].empty?
          phone = backup[:phone]
        end
        unless backup[:twitter].empty?
          twitter = backup[:twitter]
        end
      end
    end
    respond_to do |format|
      format.json{ render :json => {:email => email, :phone => phone, :twitter => twitter}.to_json }
    end
  end

end
