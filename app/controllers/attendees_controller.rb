class AttendeesController < ApplicationController
  # GET /attendees
  # GET /attendees.json
  def index
	if session[:user] then
		@attendees = Attendee.all

		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @attendees }
		end
	else
		redirect_to('/login')
	end
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
    @user = session[:user]
    my_children = (session[:my_children] or [])
    if (@user or (my_children.include?(params[:id].to_i))) then
      @attendee = Attendee.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @attendee }
      end
    else
      redirect_to('/')
    end
  end

  # GET /attendees/new
  # GET /attendees/new.json
  def new
    @user = session[:user]
    @attendee = Attendee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendee }
    end
  end

  # GET /attendees/1/edit
  def edit
    @user = session[:user]
    @attendee = Attendee.find(params[:id])
  end

  # POST /attendees
  # POST /attendees.json
  def create
    @attendee = Attendee.new(params[:attendee])

    respond_to do |format|
      if @attendee.save
        session[:my_children] = (session[:my_children] or []) + [@attendee.id]
        puts "session[:my_children]=#{session[:my_children]}"
        format.html { redirect_to @attendee, notice: "#{@attendee.child_name} is registered for VBS!" }
        format.json { render json: @attendee, status: :created, location: @attendee }
      else
        format.html { render action: "new" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendees/1
  # PUT /attendees/1.json
  def update
    @attendee = Attendee.find(params[:id])

    respond_to do |format|
      if @attendee.update_attributes(params[:attendee])
        format.html { redirect_to @attendee, notice: 'Attendee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy

    respond_to do |format|
      format.html { redirect_to attendees_url }
      format.json { head :no_content }
    end
  end
end
