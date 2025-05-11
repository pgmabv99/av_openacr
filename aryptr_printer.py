import gdb
import gdb.printing

# Debug print to confirm loading
print("Loading aryptr_printer.py")

class AryPtrPrinter:
    def __init__(self, val):
        self.val = val

    def to_string(self):
        print("AryPtrPrinter.to_string invoked")  # Debug print
        # Get the number of elements
        n_elems = int(self.val['n_elems'])
        if n_elems <= 0:
            return "aryptr (empty)"

        # Get the pointer to elems
        elems = self.val['elems']
        if not elems:
            return "aryptr (null)"

        try:
            # Read exactly n_elems characters as raw bytes
            chars = []
            for i in range(n_elems):
                # Read 1 byte from memory
                mem = gdb.selected_inferior().read_memory(elems + i, 1)
                byte = ord(mem.tobytes())  # convert to int
                if 32 <= byte < 127:
                    chars.append(mem.tobytes().decode('utf-8', errors='ignore'))  
                else:
                    chars.append('.')
            return ''.join(chars)
        except Exception as e:
            print(f"Error in to_string: {str(e)}")  # Debug print
            return f"aryptr (error: {str(e)})"

    def display_hint(self):
        return 'string'

def build_pretty_printer():
    pp = gdb.printing.RegexpCollectionPrettyPrinter("aryptr")
    # Match algo::aryptr<char> and algo::strptr
    pp.add_printer('aryptr', '^algo::aryptr<char>$|^algo::strptr$', AryPtrPrinter)
    return pp

# Clear existing global pretty-printers
gdb.pretty_printers = [pp for pp in gdb.pretty_printers if pp.name != "aryptr" and pp.name != "strptr"]

# Clear existing pretty-printers for all objfiles
for objfile in gdb.objfiles() or []:
    if hasattr(objfile, 'pretty_printers'):
        objfile.pretty_printers = [pp for pp in objfile.pretty_printers if pp.name != "aryptr" and pp.name != "strptr"]

# Register the new pretty-printer globally
gdb.printing.register_pretty_printer(None, build_pretty_printer(), replace=True)