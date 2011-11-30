class PositionsController < ApplicationController
  # GET /positions
  # GET /positions.xml
  def index
    @positions = Position.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @positions }
    end
  end

  # GET /positions/1
  # GET /positions/1.xml
  def show
    @position = Position.find(params[:id])
    @positions = @position.election.positions
    @candidate1 = @position.candidates[0]
    @candidate2 = @position.candidates[1]
    logger.debug(@candidate1)
    logger.debug(@candidate2)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @position }
    end
  end

  # GET /elections/:election_id/positions/new
  # GET /elections/:election_id/positions/new.xml
  def new
    @election = Election.find(params[:election_id])
    @position = @election.positions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @position }
    end
  end

  # GET /elections/1/positions/1/edit
  def edit
    @position = Position.find(params[:id])
  end

  # POST /positions
  # POST /positions.xml
  def create
    @election = Election.find(params[:election_id])
    @position = @election.positions.build(params[:position])

    respond_to do |format|
      if @position.save
        format.html { redirect_to(@position, :notice => 'Position was successfully created.') }
        format.xml  { render :xml => @position, :status => :created, :location => @position }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /positions/1
  # PUT /positions/1.xml
  def update
    @position = Position.find(params[:id])

    respond_to do |format|
      if @position.update_attributes(params[:position])
        format.html { redirect_to(@position, :notice => 'Position was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.xml
  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    respond_to do |format|
      format.html { redirect_to(positions_url) }
      format.xml  { head :ok }
    end
  end
end
