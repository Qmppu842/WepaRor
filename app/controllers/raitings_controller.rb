class RaitingsController < ApplicationController
    def index
      @raitings = Raiting.all

    end
end
