# frozen_string_literal: true

module TransportationDataHelper

  def transport_hash
    {
      Bicycle: bike,
      Carpool: carpool,
      Drive:   drive,
      Motorcycle: motorcycle,
      'Public Transportation': public_transport,
      Walk: walk
    }
  end

  def drive
    transportation_stats[:transport_cartruckorvan].to_i
  end

  def carpool
    transportation_stats[:transport_carpooled].to_i
  end

  def public_transport
    transportation_stats[:transport_publictrans].to_i
  end

  def motorcycle
    transportation_stats[:transport_motorcycle]
  end
  
  def bike
    transportation_stats[:transport_bicycle].to_i
  end

  def walk
    transportation_stats[:transport_walked]
  end
end