class SheetService
  def self.conn
    url = 'https://sheets.googleapis.com'
    response = Faraday.new(url: url) do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end

  def self.get_sheet(sheet_name)
    response = conn.get("/v4/spreadsheets/#{id}/values/#{sheet_name}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.id
    '1TeZ7Us1_hKnbMFoMUhNEnINzBgLB3vR8nJRwF8LO04M'
  end
end
