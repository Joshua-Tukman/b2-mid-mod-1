class MovieActorsController < ApplicationController

  def update
    @movie = Movie.find(params[:movie_id])
    actor = Actor.find_by(name: params[:name])
    ActorMovie.create(movie_id: @movie.id, actor_id: actor.id)
    redirect_to "/movies/#{@movie.id}"
  end

  def movie_actor_params
    params.permit(:name)
  end
end
