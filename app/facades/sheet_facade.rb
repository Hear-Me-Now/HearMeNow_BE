class SheetFacade
  def self.get_sheets(sheet_name)
    response = SheetService.get_sheet(sheet_name)
  end
end
