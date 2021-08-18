class SightingsController < ApplicationController

    def show
        sighting = Sighting.find_by(id: params[:id])
            if sighting
                render json: { id: sighting.id, bird: sighting.bird.name, location: sighting.location}
            else
                render json: { message: "No sighting found with that id"}
            end
                # render json: sighting, include: [:bird, :location]
    end

    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location], except: [:updated_at]
    end

end
