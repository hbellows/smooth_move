# frozen_string_literal: true

module EthnicityDataHelper

  def ethnicity_hash
    # {
    #   Bicycle: bike,
    #   Carpool: carpool,
    #   Drive:   drive,
    #   Motorcycle: motorcycle,
    #   'Public Transportation': public_transport,
    #   Walk: walk
    # }
  end

  def multi_racial
    ethnicity_stats[:pop_2ormore].to_i
  end

  def asian
    ethnicity_stats[:pop_asian].to_i
  end

  def black
    ethnicity_stats[:pop_black].to_i
  end

  def hawaiian
    ethnicity_stats[:pop_hawaiian].to_i
  end

  def latinx
    ethnicity_stats[:pop_latino].to_i
  end

  def native_american
    ethnicity_stats[:pop_native].to_i
  end

  def white
    ethnicity_stats[:pop_white].to_i
  end
end
