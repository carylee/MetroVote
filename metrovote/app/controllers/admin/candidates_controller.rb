class Admin::CandidatesController < CandidatesController
  #
  # GET /admin/elections/:election_id/positions/:position_id/candidates/new
  # GET /admin/elections/:election_id/positions/:position_id/candidates/new.xml
  def new
    @election = Election.find(params[:election_id])
    @position = Position.find(params[:position_id])
    @candidate = @position.candidates.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @candidate }
    end
  end

  # POST /candidates
  # POST /candidates.xml
  def create
    @election = Election.find(params[:election_id])
    @position = Position.find(params[:position_id])
    @candidate = @position.candidates.build(params[:candidate])
    logger.debug(@candidate)

    respond_to do |format|
      if @candidate.save
        @candidate.fetch_data
        format.html { redirect_to(admin_election_position_path(@position.id), :notice => 'Candidate was successfully created.') }
        format.xml  { render :xml => @candidate, :status => :created, :location => @candidate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @candidate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /candidates
  # GET /candidates.xml
  def index
    @candidates = Candidate.find_all_by_position_id(params[:position_id])

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

  # GET /admin/elections/:election_id/positions/:position_id/candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
    @position = @candidate.position
    @election = @position.election
  end

  # PUT /admin/elections/1/positions/1/candidates/1
  # PUT /admin/elections/1/positions/1/candidates/1.xml
  def update
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      if @candidate.update_attributes(params[:candidate])
        format.html { redirect_to(admin_election_position_candidate_path(@candidate), :notice => 'Candidate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @candidate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/elections/1/positions/1/candidates/1
  # DELETE /admin/elections/1/positions/1/candidates/1.xml
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to(candidates_url) }
      format.xml  { head :ok }
    end
  end


end
