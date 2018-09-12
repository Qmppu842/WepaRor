class RaitingsController < ApplicationController
    def index
      @raitings = Raiting.all

    end

    def to_s
      puts "Moi"
      puts "console.log(\"moiqq\ss");"
    end
end
