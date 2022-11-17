class PapersController < ApplicationController
    before_action :set_paper, only: [:show, :edit, :update, :destroy]
    before_action :require_admin, only: [:show, :edit, :update, :destroy]
    before_action :require_user_authenticate, only: [:start_paper, :submit_paper]
    before_action :require_user, only: [:index]

    def index
        @papers = Paper.all.order("created_at DESC")
    end

    def new
        @paper = Paper.new
    end

    def create
        @paper = Paper.new(paper_params)
        if @paper.save
            flash[:notice] = "Paper was successfully created."
            redirect_to @paper
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @paper.update(paper_params)
            flash[:notice] = "Paper was successfully updated."
            redirect_to @paper
        else
            render 'edit'
        end
    end 

    def destroy
        @paper.destroy
        flash[:alert] = "Paper was successfully deleted."
        redirect_to papers_path
    end


    def start_paper
        @paper = Paper.find(params[:id])
    end

    def submit_paper 
        @paper = Paper.find(params[:id])
        @questions = @paper.questions
        all_answers = []
        @questions.each do |question|
            answer = UserAnswer.find_or_initialize_by(user_id: current_user.id, question_id: question.id, paper_id: @paper.id)
            answer.selected_answer = params["choice_#{question.id}"]
            if question.correct_ans == params["choice_"+question.id.to_s]
                answer.is_correct = true
            end
            all_answers << answer
        end
        if all_answers.all?(&:save)
            flash[:notice] = "Paper was successfully submitted."
            redirect_to result_paper_path(@paper)
        else
            render 'start_paper'
        end
    end

    def result_paper
        @paper = Paper.find(params[:id])
        @user_answers = UserAnswer.where(user_id: current_user.id, paper_id: params[:id])
    end

    private

    def set_paper
        @paper = Paper.find(params[:id])
    end

    def paper_params
        params.require(:paper).permit(:subject)
    end

    def require_admin
        if !user_signed_in?
            flash[:alert] = "You must be logged in to perform that action."
            redirect_to root_path
        elsif !user_signed_in? || (user_signed_in? and !current_user.admin?)
            flash[:alert] = "Only admins can perform that action"
            redirect_to papers_path
        end
    end

    def require_user_authenticate
        if user_signed_in? && current_user.is_block==true
            flash[:alert] = "You are currently blocked by admin. Contact Admin in order to unblock."
            redirect_to root_path
        end
    end

    def require_user
        if !user_signed_in?
            flash[:alert] = "You must be logged in to perform that action."
            redirect_to root_path
        end
    end

end

