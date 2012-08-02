module MochaExtensions
  module ObjectMethods
    def expects_message(*args, &block)
      Mocha::Configuration.allow(:stubbing_non_existent_method) { expects(*args, &block) }
    end

    def stubs_message(*args, &block)
      Mocha::Configuration.allow(:stubbing_non_existent_method) { stubs(*args, &block) }
    end
  end
end

class Object
  include MochaExtensions::ObjectMethods
end
