class MyCommentsController < ApplicationController
  before_action :set_my_comment, only: [:show, :edit, :update, :destroy]

  # GET /my_comments
  # GET /my_comments.json
  def index
    @my_comments = MyComment.all
  end

  # GET /my_comments/1
  # GET /my_comments/1.json
  def show
  end

  # GET /my_comments/new
  def new
    @my_comment = MyComment.new(params.permit(:my_thread_id))
  end

  # GET /my_comments/1/edit
  def edit
  end

  # POST /my_comments
  # POST /my_comments.json
  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    @my_comment = @my_thread.my_comments.new(my_comment_params)
    #@my_comment = MyComment.new(my_comment_params)

    #respond_to do |format|
      if @my_comment.save
        p @my_comment
        redirect_to my_thread_path(@my_thread.id)
        #format.html { redirect_to @my_comment, notice: 'My comment was successfully created.' }
        #format.json { render :show, status: :created, location: @my_comment }
      else
        format.html { render :new }
        format.json { render json: @my_comment.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /my_comments/1
  # PATCH/PUT /my_comments/1.json
  def update
    respond_to do |format|
      if @my_comment.update(my_comment_params)
        format.html { redirect_to @my_comment, notice: 'My comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_comment }
      else
        format.html { render :edit }
        format.json { render json: @my_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_comments/1
  # DELETE /my_comments/1.json
  def destroy
    @my_comment = MyComment.find(params[:id])
    @my_comment.destroy
    respond_to do |format|
      format.html { redirect_to my_thread_path(params[:my_thread_id]), notice: 'My comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_comment
      @my_comment = MyComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_comment_params
      params.require(:my_comment).permit(:content)
      #params.require(:my_comment).permit(:content, :my_thread_id)
    end
end
