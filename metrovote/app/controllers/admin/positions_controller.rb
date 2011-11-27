class Admin::PositionsController < PositionsController
  def index
    @election = Election.find(params[:election_id])
    @positions = @election.positions

    respond_to do |format|
      format.html
    end
  end

  def show
    @position = Position.find(params[:id])
    @election = Election.find(params[:election_id])
    @candidate1 = @position.candidates[0]
    @candidate2 = @position.candidates[1]
    respond_to do |format|
      format.html
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

  # POST /positions
  # POST /positions.xml
  def create
    @election = Election.find(params[:election_id])
    @position = @election.positions.build(params[:position])

    respond_to do |format|
      if @position.save
        format.html { redirect_to("/admin/elections/#{@election.id.to_s}/positions/#{@position.id.to_s}", :notice => 'Position was successfully created.') }
        format.xml  { render :xml => @position, :status => :created, :location => @position }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /positions/1/edit
  def edit
    @election = Election.find(params[:election_id])
    @position = Position.find(params[:id])
  end



end
