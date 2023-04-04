# frozen_string_literal: true

class SheetFacade
  def self.get_sheet(sheet_name)
    response = SheetService.get_sheet(sheet_name)[:values]
    response.shift
    response
  end
end
