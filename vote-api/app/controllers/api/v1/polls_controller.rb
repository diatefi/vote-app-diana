class Api::V1::PollsController < ApplicationController
  def index
    render json: Poll.all, include: :votes
  end

  def show
    poll = Poll.find(params[:id])
    render json: poll, include: :votes
  end

  def create
    # создаём сам опрос
    poll = Poll.new(title: poll_params[:title])
    if poll.save
      # создаём варианты как голоса
      (poll_params[:options] || []).each do |opt|
        poll.votes.create!(option: opt)
      end
      render json: poll, include: :votes, status: :created
    else
      render json: { errors: poll.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:title, options: [])
  end
end
