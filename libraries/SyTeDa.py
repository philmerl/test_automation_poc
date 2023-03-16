from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import library, keyword
from RPA.Tables import Tables
from faker import Faker
from os import environ


@library
class SyTeDa:

    def __init__(self):
        # self.faker = BuiltIn().get_library_instance('FakerLibrary') Robot wrapper lib for faker
        self.faker = Faker("de_DE")
        # self.etl = BuiltIn().get_library_instance('ExcelEtl')
        self.table = Tables()

    @keyword
    def generate_test_data_from_scratch(self, size):
        gen = [{
            "index": i,
            "name": self.faker.address(),
            "text": self.faker.text()
        } for i in range(0, int(size))]
        return self.table.create_table(gen, columns=['index', 'name', 'text'])

    @keyword
    def generate_triangle(self, tr_type):
        if tr_type == 'Equilateral':
            return {'a': 3, 'b': 3, 'c': 3}
        elif tr_type == 'Isosceles':
            return {'a': 3, 'b': 3, 'c': 4}
        elif tr_type == 'Scalene':
            return {'a': 3, 'b': 4, 'c': 5}
        else:
            return {'a': 3, 'b': 4, 'c': 7}

    def get_system_user(self):
        return environ.get('USERNAME')
