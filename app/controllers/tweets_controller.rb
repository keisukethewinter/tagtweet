class TweetsController < ApplicationController

  def index
    @tweets = Tweets.all.order(create_at: :desc)
  end

  def new
    @tweet = TweetsTag.new
  end

  def create
    @tweet = TweetsTag.new(tweet_params)
    if @tweet.valid?
      @tweet.save
      return redirect_to root_path
    else
      render "new"
    end

    private

    def tweet_params
      params.require(:tweets_tag).permit(:message, :name)
    end

end
