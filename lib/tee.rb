# frozen_string_literal: true
require "tee/version"

module Tee
  # Instances of Tee::File can be used as Logger targets. Logged messages will
  # be written to all the targets specified in the initializer.
  #
  # In addition to Files, strings may be passed to the initializer. They are
  # interpeted as filenames, and will be opened with mode "w" (not "a", so each
  # run will overwrite the file).
  class File
    def initialize(*targets)
       @targets = targets
       @targets.each_with_index do |file, index|
         if String === file
           @targets[index] = File.open(file, "w")
         end
       end
    end

    def write(*args)
      @targets.each { |t| t.write(*args); t.flush }
    end

    def close
      @targets.each(&:close)
    end
  end
end
