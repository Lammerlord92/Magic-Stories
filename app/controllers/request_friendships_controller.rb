class RequestFriendshipsController < ApplicationController
  before_action :set_request_friendship, only: [:show, :edit, :update, :destroy, :cancel_friendship]

  # GET /request_friendships
  # GET /request_friendships.json
  def index
    @request_friendships = RequestFriendship.all
  end

  # GET /request_friendships/1
  # GET /request_friendships/1.json
  def show
  end

  # GET /request_friendships/new
  def new
    @request_friendship = RequestFriendship.new
  end

  # GET /request_friendships/1/edit
  def edit
  end

  # POST /request_friendships
  # POST /request_friendships.json
  def create
    @request_friendship = RequestFriendship.new(request_friendship_params)

    respond_to do |format|
      if @request_friendship.save
        format.html { redirect_to @request_friendship, notice: 'Request friendship was successfully created.' }
        format.json { render :show, status: :created, location: @request_friendship }
      else
        format.html { render :new }
        format.json { render json: @request_friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_friendships/1
  # PATCH/PUT /request_friendships/1.json
  def update
    respond_to do |format|
      if @request_friendship.update(request_friendship_params)
        format.html { redirect_to @request_friendship, notice: 'Request friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_friendship }
      else
        format.html { render :edit }
        format.json { render json: @request_friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_friendships/1
  # DELETE /request_friendships/1.json
  def destroy
    @request_friendship.destroy
    respond_to do |format|
      format.html { redirect_to request_friendships_url, notice: 'Request friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  ## De aquí para arriba es scaffold, vale para un ADMIN, pero de aquí para abajo vamos a pensar las cosas...
  # GET introducir recipient en la URL

  #send_request/:recipient
  def send_request
    a = current_user.id
    @request_friendship = RequestFriendship.new({message: "", status: "PENDING", sender_id: a, recipient_id: params[:recipient]})
  end

  #Método especifico del clasico create - POST
  def creates
    result = RequestFriendship.new
    result.sender_id = current_user.id
    result.status = "PENDING"
    result.recipient_id = params[:request_friendship][:recipient_id]
    result.message = params[:request_friendship][:message]



    respond_to do |format|
      if result.save
        format.html { redirect_to welcome_index_path, notice: 'Request friendship was successfully created.' }
      else
        @request_friendship = result
        format.html { render :new }
      end
    end
  end


  #Dado la id (de la request_friendship :rf) - Es como un update
  def deciding_request
    request_friendship = RequestFriendship.find(params[:rf])

    begin
      n = current_user.id
      if n != request_friendship.recipient_id
        throw Exception
      end


      #Para que no sea grande ni saque datos explicitos ponemos un número 1 = ACCEPTED, 2 = REJECTED
      choice = "ACCEPTED"
      if (params[:choice] == "2")
        choice = "REJECTED"
      end


      result = RequestFriendship.where({recipient_id: current_user.id, sender_id: request_friendship.sender_id,
                                        status: "PENDING"}).last

      message_suffix = ""
      respond_to do |format|
        if result.update({status: choice})
          if(choice == "ACCEPTED")
            Friendship.createFriendship(result)
            message_suffix = "ACEPTADO"
          else
            message_suffix = "DENEGADO"
          end
          format.html { redirect_to welcome_index_path, notice: 'La petición se ha ' << message_suffix }
        else
          format.html { render 'welcome/index' }
        end
      end
    rescue Exception
      render 'welcome/index'
    end

  end



  def show_pending
    @request_friendships = RequestFriendship.where({recipient_id: current_user.id, status: "PENDING"})
  end

  def cancel_friendship
    @request_friendship.friendships.each do |friendship|
      Friendship.destroy(friendship.id)
    end
    RequestFriendship.destroy(@request_friendship.id)
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request_friendship
    @request_friendship = RequestFriendship.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_friendship_params
    params.require(:request_friendship).permit(:message, :status, :sender_id, :recipient_id)
  end

end
