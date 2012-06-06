class StackItemsController < ApplicationController
  # GET /stack_items
  # GET /stack_items.json
  def index
    @stack_items = StackItem.all(:order => 'created_at DESC')
    @top_stack_item = @stack_items.first

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stack_items }
    end
  end

  # GET /stack_items/1
  # GET /stack_items/1.json
  def show
    @stack_item = StackItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stack_item }
    end
  end

  # GET /stack_items/new
  # GET /stack_items/new.json
  def new
    @stack_item = StackItem.new
    @stack_items = StackItem.all(:order => 'created_at DESC')
    @top_stack_item = @stack_items.first

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stack_item }
    end
  end

  # GET /stack_items/1/edit
  def edit
    @stack_item = StackItem.find(params[:id])
  end

  # POST /stack_items
  # POST /stack_items.json
  def create
    @stack_item = StackItem.new(params[:stack_item])

    respond_to do |format|
      if @stack_item.save
        format.html { redirect_to stack_items_url }
        format.json { render json: @stack_item, status: :created, location: @stack_item }
      else
        format.html { render action: "new" }
        format.json { render json: @stack_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stack_items/1
  # PUT /stack_items/1.json
  def update
    @stack_item = StackItem.find(params[:id])

    respond_to do |format|
      if @stack_item.update_attributes(params[:stack_item])
        format.html { redirect_to @stack_item, notice: 'Stack item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stack_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stack_items/1
  # DELETE /stack_items/1.json
  def destroy
    @stack_item = StackItem.find(params[:id])
    @stack_item.destroy

    respond_to do |format|
      format.html { redirect_to stack_items_url }
      format.json { head :no_content }
    end
  end

  # GET /stack_items/new_email
  def new_email
    @email_form

    respond_to do |format|
      format.html # new_email.html.erb
    end
  end

  # POST /stack_items/new_email
  def create_email
    @email_address = params[:email_address]

    respond_to do |format|
        StackMailer.latest_stack_email(@email_address).deliver
        format.html { redirect_to stack_items_url, notice: "Email sent!" }
      end
  end
end
