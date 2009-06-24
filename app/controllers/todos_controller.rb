class TodosController < ApplicationController
  # GET /todos
  # GET /todos.xml
  def index
    @todos = Todo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.xml
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.xml
  def new
    @todo = Todo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.xml
  def create
    @todo = Todo.new(params[:todo])

    respond_to do |format|
      if @todo.save
        flash[:notice] = 'Todo was successfully created.'
        format.html { redirect_to(todos_path) }
        format.xml  { render :xml => @todo, :status => :created, :location => @todo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.xml
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        flash[:notice] = 'Todo was successfully updated.'
        format.html { redirect_to(todos_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.xml
  def destroy
    @todo = Todo.find(params[:id])
    
    flash[:notice] = "#{@todo.name} successfully removed"
    
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to(todos_url) }
      format.xml  { head :ok }
    end
  end
  
  def update_all
    @todos = params[:todos]
    @todos.each do |key, values| 
      todo = Todo.find(key)
      values['complete'] = values['complete'] == '1' if values['complete'].present?
      todo.attributes = values
      todo.save!
    end unless @todos.empty?
    
    flash[:notice] = "Update Successful..."
    
    respond_to do |format|
      format.html { redirect_to todos_path() }
      format.js    #will call the rjs
    end
  end
  
  def confirm_delete
    @todo = Todo.find(params[:id])
  end
end
