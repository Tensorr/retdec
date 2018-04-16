/*
 * YARA rules for ARM64 ELF compiler detection.
 * Copyright (c) 2017 Avast Software, licensed under the MIT license
 */

import "elf"

rule gc
{
	meta:
		tool = "C"
		name = "gc"
		language = "Go"
		pattern = "E00340F9E12300910200009400000000E2FFFF?042?0??9140003FD6000080D2C80B80D2010000D4FDFFFF1700000000E00B80B9C80B80D2010000D4C0035FD6600C8092E10740F9E21380B9E31780B9?80????2010000D41FFC3FB14300005400008012"
	strings:
		$1 = { E0 03 40 F9 E1 23 00 91 02 00 00 94 00 00 00 00 E2 FF FF ?0 42 ?0 ?? 91 40 00 3F D6 00 00 80 D2 C8 0B 80 D2 01 00 00 D4 FD FF FF 17 00 00 00 00 E0 0B 80 B9 C8 0B 80 D2 01 00 00 D4 C0 03 5F D6 60 0C 80 92 E1 07 40 F9 E2 13 80 B9 E3 17 80 B9 ?8 0? ?? ?2 01 00 00 D4 1F FC 3F B1 43 00 00 54 00 00 80 12 }
	condition:
		$1 at elf.entry_point
}
