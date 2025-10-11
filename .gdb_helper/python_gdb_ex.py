import gdb
import os

class _ContinueUntilInterest(gdb.Function):

    def __init__(self):
        super().__init__("_continue_until_interest")
        self._cache = {}

    def invoke(self, pattern):
        pattern = pattern.string()
        try:
            while 1:
                frame = gdb.newest_frame()
                symtab = frame.find_sal().symtab
                func_name = frame.function()
                avail_source = symtab and func_name
                if avail_source:
                    file_path = symtab.fullname()
                    if (not pattern or (pattern in func_name.name or pattern in file_path)) and self._cache.setdefault(file_path, os.path.exists(file_path)):
                        break
                gdb.execute("si")
                continue
        except Exception as e:
            print(e)

        return 0

_ContinueUntilInterest()

class PyEval(gdb.Function):

    def __init__ (self):
        super(PyEval, self).__init__("py")

    def invoke (self, expr):
        return eval(expr.string())

PyEval()
