class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @devices = current_user.devices
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)
    @device.user_id = current_user.id
    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def turn_on
    @devices = current_user.devices                   # Select all the devices that this user owns
    TCPServer.open('http://107.170.218.128/criduino', 5632) do |server|     # Socket to listen on the port you want
      while client = server.accept                    # Wait for a client to connect
        @temp = client.gets                           # Reads the message from the client
        @macs = @devices.select{ |device| device.mac = @temp } # Select the mac address that in the database that matches with the one sent by the client
        if @macs.size > 0                              # If @macs is bigger than zero it means that this user owns this device and the command can be sent
          client.puts "Turn On"                        # Sending a generic message to the client
        end
        client.close                                  # Disconnect from the client
        sleep 0.01
        redirect_to root_path
      end
    end
  end

  def turn_off
    @devices = current_user.devices                   # Select all the devices that this user owns
    TCPServer.open('http://107.170.218.128/criduino', 5632) do |server|     # Socket to listen on the port you want
      while client = server.accept                    # Wait for a client to connect
        @temp = client.gets                           # Reads the message from the client
        @macs = @devices.select{ |device| device.mac = @temp } # Select the mac address that in the database that matches with the one sent by the client
        if @macs.size > 0                              # If @macs is bigger than zero it means that this user owns this device and the command can be sent
          client.puts "Turn Off"                        # Sending a generic message to the client
        end
        client.close                                   # Disconnect from the client
        sleep 0.01
        redirect_to :back
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:mac, :status, :user_id)
    end
end
