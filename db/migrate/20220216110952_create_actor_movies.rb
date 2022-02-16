class CreateActorMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :actor_movies do |t|
      t.references :actor
      t.references :movie

      t.timestamps
    end
  end
end
