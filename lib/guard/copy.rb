require 'guard'
require 'guard/guard'
require 'guard/watcher'
require 'guard/helpers/starter'

module Guard
  class Copy < Guard
    include ::Guard::Helpers::Starter

    def act_on(directory, file)
      target = target_filename(directory, file)
      FileUtils.mkdir_p(File.dirname(target))

      if FileUtils.cp(file, target, preserve: true)
        file
      else
        raise Exception.new("Copying failed.")
      end
    end
  end
end

