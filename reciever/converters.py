class FloatUrlParameterConverter:
    """Reference
    https://stackoverflow.com/a/61861142/7999665
    """

    regex = '[0-9]+\.?[0-9]+'

    def to_python(self, value):
        return float(value)

    def to_url(self, value):
        return str(value)