# From www.riscvassembler.org by Kaya Celebi

from riscv_assembler.convert import AssemblyConverter
# cnv = AssemblyConverter()
cnv = AssemblyConverter(output_type="t")
cnv.convert("simple.s")
#outputs to binary file simple.bin
