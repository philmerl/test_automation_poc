from robot.api.deco import library, keyword
from jsonschema import validate


@library
class JsonSchema:

    @keyword
    def validate_json(self, inst, schema):
        schema = {
            "type": "object",
            "properties": {
                "type": {"type": "string"},
                "setup": {"type": "string"},
                "punchline": {"type": "string"},
                "id": {"type": "number"}
            },
            "required": ["type", "setup", "punchline", "id"]
        }
        validate(instance=inst, schema=schema)
