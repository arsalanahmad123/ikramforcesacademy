class QuestionsController < ApplicationController

    before_action :set_question, only: [:destroy]
    before_action :set_paper, only: [:new, :create,:destroy]
    
    def new
        @question = Question.new 
        @multiple_choice = @question.multiple_choices.new 
    end

    def create
        @question = Question.new question_params
        @question.paper_id = @paper.id
        @multiple_choice = @question.multiple_choices.first
        @multiple_choice.question_id = @question.id
        if @question.save
            flash[:notice] = "Question was successfully created"
            redirect_to new_paper_question_path(@paper)
        else
            flash[:alert] = "Question was not created"
            render 'new'
        end
    end

    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        redirect_to paper_path(@paper)
    end

    private

    def set_question
        @question = Question.find(params[:id])
    end

    def question_params
        params.require(:question).permit(:title, :paper_id,:correct_ans,multiple_choices_attributes: [:ans1, :ans2, :ans3,:ans4,:question_id])
    end

    def set_paper
        @paper = Paper.find(params[:paper_id])
    end
    
    # def multiple_choice_params
    #     params.require(:question).permit(:question_id,multiple_choices_attributes: [:ans1, :ans2, :ans3, :ans4, :correct_ans])
    # end

end

