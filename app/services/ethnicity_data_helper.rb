# frozen_string_literal: true

module EthnicityDataHelper

  def ethnicity_hash
    {
      'Native American/Alaskan Native': native_american,
      Black: black,
      White: white,
      Asian: asian,
      'Hawaiian/Pacific Islander': pacific,
      Latinx: latinx,
      'Multi-Racial': multi_racial
    }
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

  def pacific
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
