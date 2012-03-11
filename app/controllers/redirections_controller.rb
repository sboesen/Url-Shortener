class RedirectionsController < ApplicationController
  # GET /redirections
  # GET /redirections.json
  include RedirectionsHelper
  def index
    @unique_url = get_unique_url
    #@redirections = Redirection.all
    @redirection = Redirection.new

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @redirections }
    end
  end
  def redirect
    path = params[:path]
    @url = Redirection.find_by_path(path)
    redirect_to @url.url

    
  end

  # GET /redirections/1
  # GET /redirections/1.json
  def show
    @redirection = Redirection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @redirection }
    end
  end

  # GET /redirections/new
  # GET /redirections/new.json
  def new
    @redirection = Redirection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @redirection }
    end
  end

  # GET /redirections/1/edit
  def edit
    @redirection = Redirection.find(params[:id])
  end

  # POST /redirections
  # POST /redirections.json
  def create
    @root_url = root_url
    @redirection = Redirection.new(params[:redirection])

    respond_to do |format|
      if @redirection.save
        format.html { redirect_to @redirection, notice: 'Redirection was successfully created.' }
        format.json { render json: @redirection, status: :created, location: @redirection }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @redirection.errors, status: :unprocessable_entity }
        format.js
        logger.debug @redirection.url
      end

    end
  end

  # PUT /redirections/1
  # PUT /redirections/1.json
  def update
    @redirection = Redirection.find(params[:id])

    respond_to do |format|
      if @redirection.update_attributes(params[:redirection])
        format.html { redirect_to @redirection, notice: 'Redirection was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @redirection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redirections/1
  # DELETE /redirections/1.json
  def destroy
    @redirection = Redirection.find(params[:id])
    @redirection.destroy

    respond_to do |format|
      format.html { redirect_to redirections_url }
      format.json { head :ok }
    end
  end
end
