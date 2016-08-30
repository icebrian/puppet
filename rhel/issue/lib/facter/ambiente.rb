Facter.add("ambiente") do
  setcode do
    hostname = Facter.value(:hostname)
    hostname = hostname.downcase

    # Get environment based on machine hostname
    if hostname.include? "dev"
      ambiente = "development"
    elsif hostname.include? "dev"
      ambiente = "development"
    elsif hostname.include? "sit"
      ambiente = "development"
    else
      ambiente = "production"
    end
    ambiente
  end
end
