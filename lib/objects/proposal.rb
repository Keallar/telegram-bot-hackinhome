module Bot
  class Proposal
    attr_accessor :type, :additional_info

    def initialize(type, additional_info)
      @type = type
      @additional_info = additional_info
    end
  end
end
