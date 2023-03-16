from RPA.Excel.Files import Files
from RPA.Tables import Tables
from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import library, keyword


@library
class ExcelEtl:

    def __init__(self):
        self.xlsx = Files()
        self.table = Tables()
        self.excel = BuiltIn().get_library_instance("RPA.Excel.Files")

    @keyword
    def create_excel_workbook_from_table(self, path, table):
        self.xlsx.create_workbook(path)
        self.xlsx.append_rows_to_worksheet(table, header=True)
        self.xlsx.save_workbook()

    @keyword
    def read_excel_worksheet_to_table(self, path, worksheet):
        self.xlsx.open_workbook(path)
        try:
            return self.table.create_table(self.xlsx.read_worksheet(worksheet, header=True))
        finally:
            self.xlsx.close_workbook()