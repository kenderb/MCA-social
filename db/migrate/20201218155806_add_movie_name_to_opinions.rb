class AddMovieNameToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_column :opinions, :movie_name, :string
  end
end
