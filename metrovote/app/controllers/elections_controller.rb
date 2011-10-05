class ElectionsController < ApplicationController
  # GET /elections
  # GET /elections.xml
  def index
    @elections = Election.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @elections }
    end
  end

  # GET /elections/1
  # GET /elections/1.xml
  def show
    @election = Election.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @election }
    end
  end

  # GET /elections/new
  # GET /elections/new.xml
  def new
    @election = Election.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @election }
    end
  end

  # GET /elections/1/edit
  def edit
    @election = Election.find(params[:id])
  end

  # POST /elections
  # POST /elections.xml
  def create
    @election = Election.new(params[:election])

    respond_to do |format|
      if @election.save
        format.html { redirect_to(@election, :notice => 'Election was successfully created.') }
        format.xml  { render :xml => @election, :status => :created, :location => @election }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @election.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /elections/1
  # PUT /elections/1.xml
  def update
    @election = Election.find(params[:id])

    respond_to do |format|
      if @election.update_attributes(params[:election])
        format.html { redirect_to(@election, :notice => 'Election was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @election.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /elections/1
  # DELETE /elections/1.xml
  def destroy
    @election = Election.find(params[:id])
    @election.destroy

    respond_to do |format|
      format.html { redirect_to(elections_url) }
      format.xml  { head :ok }
    end
  end
end
