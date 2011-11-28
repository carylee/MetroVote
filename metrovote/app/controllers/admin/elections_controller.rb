class Admin::ElectionsController < ElectionsController
  # GET /elections
  # GET /elections.xml
  def index
    @elections = Election.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @elections }
    end
  end
  #
  # GET /admin/elections/new
  # GET /admin/elections/new.xml
  def new
    @election = Election.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @election }
    end
  end

  # GET /admin/elections/1/edit
  def edit
    @election = Election.find(params[:id])
  end

  # POST /admin/elections
  # POST /admin/elections.xml
  def create
    @election = Election.new(params[:election])

    respond_to do |format|
      if @election.save
        format.html { redirect_to(admin_election_path(@election), :notice => 'Election was successfully created.') }
        format.xml  { render :xml => @election, :status => :created, :location => @election }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @election.errors, :status => :unprocessable_entity }
      end
    end
  end


end
