   1              		.arch armv8-a
   2              		.file	"lkm_tau.c"
   3              		.text
   4              		.section	.modinfo,"a"
   5              		.type	__UNIQUE_ID_license288, %object
   6              		.size	__UNIQUE_ID_license288, 12
   7              	__UNIQUE_ID_license288:
   8 0000 6C696365 		.string	"license=GPL"
   8      6E73653D 
   8      47504C00 
   9              		.type	__UNIQUE_ID_author289, %object
  10              		.size	__UNIQUE_ID_author289, 21
  11              	__UNIQUE_ID_author289:
  12 000c 61757468 		.string	"author=Felix Mueller"
  12      6F723D46 
  12      656C6978 
  12      204D7565 
  12      6C6C6572 
  13              		.type	__UNIQUE_ID_description290, %object
  14              		.size	__UNIQUE_ID_description290, 21
  15              	__UNIQUE_ID_description290:
  16 0021 64657363 		.string	"description=lkm_crpi"
  16      72697074 
  16      696F6E3D 
  16      6C6B6D5F 
  16      63727069 
  17              		.type	__UNIQUE_ID_version291, %object
  18              		.size	__UNIQUE_ID_version291, 13
  19              	__UNIQUE_ID_version291:
  20 0036 76657273 		.string	"version=0.01"
  20      696F6E3D 
  20      302E3031 
  20      00
  21              		.section	.rodata
  22              		.align	3
  23              	.LC0:
  24 0000 01365374 		.string	"\0016Starting lkm_crpi!\n"
  24      61727469 
  24      6E67206C 
  24      6B6D5F63 
  24      72706921 
  25 0016 0000     		.align	3
  26              	.LC1:
  27 0018 0136706F 		.string	"\0016pointer: %p, next pointer: %p\n"
  27      696E7465 
  27      723A2025 
  27      702C206E 
  27      65787420 
  28 0039 00000000 		.align	3
  28      000000
  29              	.LC2:
  30 0040 01367465 		.string	"\0016testvalue: %lu\n"
  30      73747661 
  30      6C75653A 
  30      20256C75 
  30      0A00
  31 0052 00000000 		.align	3
  31      0000
  32              	.LC3:
  33 0058 01362564 		.string	"\0016%d acces value: %lu %d (%ld)\n"
  33      20616363 
  33      65732076 
  33      616C7565 
  33      3A20256C 
  34              		.align	3
  35              	.LC4:
  36 0078 01362D2D 		.string	"\0016--------\n"
  36      2D2D2D2D 
  36      2D2D0A00 
  37              		.section	.init.text,"ax",@progbits
  38              		.align	2
  39              		.type	lkm_example_init, %function
  40              	lkm_example_init:
  41 0000 5F2403D5 		hint	34 // bti c
  42              		.section	__patchable_function_entries,"aw",@progbits
  43              		.align	3
  44 0000 00000000 		.8byte	.LPFE1
  44      00000000 
  45              		.section	.init.text
  46              	.LPFE1:
  47 0004 1F2003D5 		nop
  48 0008 1F2003D5 		nop
  49 000c 3F2303D5 		hint	25 // paciasp
  50 0010 FD7BB7A9 		stp	x29, x30, [sp, -144]!
  51 0014 FD030091 		mov	x29, sp
  52 0018 F35301A9 		stp	x19, x20, [sp, 16]
  53 001c F51300F9 		str	x21, [sp, 32]
  54 0020 004138D5 		mrs	x0, sp_el0
  55 0024 00001591 		add	x0, x0, 1344
  56 0028 010040F9 		ldr	x1, [x0]
  57 002c E14700F9 		str	x1, [sp, 136]
  58 0030 010080D2 		mov	x1, 0
  59 0034 00000090 		adrp	x0, .LC0
  60 0038 00000091 		add	x0, x0, :lo12:.LC0
  61 003c 00000094 		bl	_printk
  62 0040 61008052 		mov	w1, 3
  63 0044 00988152 		mov	w0, 3264
  64 0048 00000094 		bl	__get_free_pages
  65 004c E02300F9 		str	x0, [sp, 64]
  66 0050 E02340F9 		ldr	x0, [sp, 64]
  67 0054 E02700F9 		str	x0, [sp, 72]
  68 0058 E02340F9 		ldr	x0, [sp, 64]
  69 005c E02B00F9 		str	x0, [sp, 80]
  70 0060 FF3F00B9 		str	wzr, [sp, 60]
  71 0064 37000014 		b	.L2
  72              	.L4:
  73 0068 E03F40B9 		ldr	w0, [sp, 60]
  74 006c 00040011 		add	w0, w0, 1
  75 0070 004C1453 		lsl	w0, w0, 12
  76 0074 027C4093 		sxtw	x2, w0
  77 0078 E03F40B9 		ldr	w0, [sp, 60]
  78 007c 00581753 		lsl	w0, w0, 9
  79 0080 007C4093 		sxtw	x0, w0
  80 0084 00F07DD3 		lsl	x0, x0, 3
  81 0088 E12340F9 		ldr	x1, [sp, 64]
  82 008c 2000008B 		add	x0, x1, x0
  83 0090 E12B40F9 		ldr	x1, [sp, 80]
  84 0094 4100018B 		add	x1, x2, x1
  85 0098 010000F9 		str	x1, [x0]
  86 009c E03F40B9 		ldr	w0, [sp, 60]
  87 00a0 004C1453 		lsl	w0, w0, 12
  88 00a4 017C4093 		sxtw	x1, w0
  89 00a8 E02B40F9 		ldr	x0, [sp, 80]
  90 00ac 2000008B 		add	x0, x1, x0
  91 00b0 E20300AA 		mov	x2, x0
  92 00b4 E03F80B9 		ldrsw	x0, [sp, 60]
  93 00b8 00F07DD3 		lsl	x0, x0, 3
  94 00bc E1830191 		add	x1, sp, 96
  95 00c0 226820F8 		str	x2, [x1, x0]
  96 00c4 E03F40B9 		ldr	w0, [sp, 60]
  97 00c8 1F100071 		cmp	w0, 4
  98 00cc 01010054 		bne	.L3
  99 00d0 E03F40B9 		ldr	w0, [sp, 60]
 100 00d4 00581753 		lsl	w0, w0, 9
 101 00d8 007C4093 		sxtw	x0, w0
 102 00dc 00F07DD3 		lsl	x0, x0, 3
 103 00e0 E12340F9 		ldr	x1, [sp, 64]
 104 00e4 2000008B 		add	x0, x1, x0
 105 00e8 1F0000F9 		str	xzr, [x0]
 106              	.L3:
 107 00ec E03F40B9 		ldr	w0, [sp, 60]
 108 00f0 00581753 		lsl	w0, w0, 9
 109 00f4 007C4093 		sxtw	x0, w0
 110 00f8 00F07DD3 		lsl	x0, x0, 3
 111 00fc E12340F9 		ldr	x1, [sp, 64]
 112 0100 2300008B 		add	x3, x1, x0
 113 0104 E03F40B9 		ldr	w0, [sp, 60]
 114 0108 00581753 		lsl	w0, w0, 9
 115 010c 007C4093 		sxtw	x0, w0
 116 0110 00F07DD3 		lsl	x0, x0, 3
 117 0114 E12340F9 		ldr	x1, [sp, 64]
 118 0118 2000008B 		add	x0, x1, x0
 119 011c 000040F9 		ldr	x0, [x0]
 120 0120 E20300AA 		mov	x2, x0
 121 0124 E10303AA 		mov	x1, x3
 122 0128 00000090 		adrp	x0, .LC1
 123 012c 00000091 		add	x0, x0, :lo12:.LC1
 124 0130 00000094 		bl	_printk
 125 0134 E03F40B9 		ldr	w0, [sp, 60]
 126 0138 00040011 		add	w0, w0, 1
 127 013c E03F00B9 		str	w0, [sp, 60]
 128              	.L2:
 129 0140 E03F40B9 		ldr	w0, [sp, 60]
 130 0144 1F100071 		cmp	w0, 4
 131 0148 0DF9FF54 		ble	.L4
 132 014c FF3F00B9 		str	wzr, [sp, 60]
 133 0150 29000014 		b	.L5
 134              	.L8:
 135 0154 E03F80B9 		ldrsw	x0, [sp, 60]
 136 0158 00F07DD3 		lsl	x0, x0, 3
 137 015c E1830191 		add	x1, sp, 96
 138 0160 346860F8 		ldr	x20, [x1, x0]
 139 0164 E02740F9 		ldr	x0, [sp, 72]
 140 0168 E02300F9 		str	x0, [sp, 64]
 141 016c 0A000014 		b	.L6
 142              	.L7:
 143 0170 E02340F9 		ldr	x0, [sp, 64]
 144 0174 130040F9 		ldr	x19, [x0]
 145 0178 E10313AA 		mov	x1, x19
 146 017c 00000090 		adrp	x0, .LC2
 147 0180 00000091 		add	x0, x0, :lo12:.LC2
 148 0184 00000094 		bl	_printk
 149 0188 E02340F9 		ldr	x0, [sp, 64]
 150 018c 000040F9 		ldr	x0, [x0]
 151 0190 E02300F9 		str	x0, [sp, 64]
 152              	.L6:
 153 0194 E02340F9 		ldr	x0, [sp, 64]
 154 0198 1F0000F1 		cmp	x0, 0
 155 019c A1FEFF54 		bne	.L7
 156 01a0 00000094 		bl	read_pmccntr
 157 01a4 F50300AA 		mov	x21, x0
 158 01a8 930240F9 		ldr	x19, [x20]
 159 01ac 00000094 		bl	read_pmccntr
 160 01b0 000015CB 		sub	x0, x0, x21
 161 01b4 E02F00F9 		str	x0, [sp, 88]
 162 01b8 E02F40F9 		ldr	x0, [sp, 88]
 163 01bc 00000094 		bl	determineL1Miss
 164 01c0 E42F40F9 		ldr	x4, [sp, 88]
 165 01c4 E303002A 		mov	w3, w0
 166 01c8 E20313AA 		mov	x2, x19
 167 01cc E13F40B9 		ldr	w1, [sp, 60]
 168 01d0 00000090 		adrp	x0, .LC3
 169 01d4 00000091 		add	x0, x0, :lo12:.LC3
 170 01d8 00000094 		bl	_printk
 171 01dc 00000090 		adrp	x0, .LC4
 172 01e0 00000091 		add	x0, x0, :lo12:.LC4
 173 01e4 00000094 		bl	_printk
 174 01e8 E03F40B9 		ldr	w0, [sp, 60]
 175 01ec 00040011 		add	w0, w0, 1
 176 01f0 E03F00B9 		str	w0, [sp, 60]
 177              	.L5:
 178 01f4 E03F40B9 		ldr	w0, [sp, 60]
 179 01f8 1F100071 		cmp	w0, 4
 180 01fc CDFAFF54 		ble	.L8
 181 0200 E02740F9 		ldr	x0, [sp, 72]
 182 0204 61008052 		mov	w1, 3
 183 0208 00000094 		bl	free_pages
 184 020c 00008052 		mov	w0, 0
 185 0210 E103002A 		mov	w1, w0
 186 0214 004138D5 		mrs	x0, sp_el0
 187 0218 00001591 		add	x0, x0, 1344
 188 021c E24740F9 		ldr	x2, [sp, 136]
 189 0220 030040F9 		ldr	x3, [x0]
 190 0224 420003EB 		subs	x2, x2, x3
 191 0228 030080D2 		mov	x3, 0
 192 022c 40000054 		beq	.L10
 193 0230 00000094 		bl	__stack_chk_fail
 194              	.L10:
 195 0234 E003012A 		mov	w0, w1
 196 0238 F35341A9 		ldp	x19, x20, [sp, 16]
 197 023c F51340F9 		ldr	x21, [sp, 32]
 198 0240 FD7BC9A8 		ldp	x29, x30, [sp], 144
 199 0244 BF2303D5 		hint	29 // autiasp
 200 0248 C0035FD6 		ret
 201              		.size	lkm_example_init, .-lkm_example_init
 202              		.global	init_module
 203              		.set	init_module,lkm_example_init
 204              		.section	.rodata
 205 0084 00000000 		.align	3
 206              	.LC5:
 207 0088 01365374 		.string	"\0016Stopping lkm_crpi!\n"
 207      6F707069 
 207      6E67206C 
 207      6B6D5F63 
 207      72706921 
 208              		.section	.exit.text,"ax",@progbits
 209              		.align	2
 210              		.type	lkm_example_exit, %function
 211              	lkm_example_exit:
 212 0000 3F2303D5 		hint	25 // paciasp
 213 0004 FD7BBFA9 		stp	x29, x30, [sp, -16]!
 214 0008 FD030091 		mov	x29, sp
 215 000c 00000090 		adrp	x0, .LC5
 216 0010 00000091 		add	x0, x0, :lo12:.LC5
 217 0014 00000094 		bl	_printk
 218 0018 1F2003D5 		nop
 219 001c FD7BC1A8 		ldp	x29, x30, [sp], 16
 220 0020 BF2303D5 		hint	29 // autiasp
 221 0024 C0035FD6 		ret
 222              		.size	lkm_example_exit, .-lkm_example_exit
 223              		.global	cleanup_module
 224              		.set	cleanup_module,lkm_example_exit
 225              		.text
 226              		.align	2
 227              		.type	read_pmccntr, %function
 228              	read_pmccntr:
 229 0000 3F2303D5 		hint	25 // paciasp
 230 0004 FF4300D1 		sub	sp, sp, #16
 231              	#APP
 232              	// 22 "/home/pi/tau/lkm_tau.c" 1
 233 0008 009D3BD5 		mrs x0, pmccntr_el0
 234              	// 0 "" 2
 235              	#NO_APP
 236 000c E00700F9 		str	x0, [sp, 8]
 237 0010 E00740F9 		ldr	x0, [sp, 8]
 238 0014 FF430091 		add	sp, sp, 16
 239 0018 BF2303D5 		hint	29 // autiasp
 240 001c C0035FD6 		ret
 241              		.size	read_pmccntr, .-read_pmccntr
 242              		.align	2
 243              		.global	determineL1Miss
 244              		.type	determineL1Miss, %function
 245              	determineL1Miss:
 246 0020 5F2403D5 		hint	34 // bti c
 247              		.section	__patchable_function_entries
 248              		.align	3
 249 0008 00000000 		.8byte	.LPFE2
 249      00000000 
 250              		.text
 251              	.LPFE2:
 252 0024 1F2003D5 		nop
 253 0028 1F2003D5 		nop
 254 002c 3F2303D5 		hint	25 // paciasp
 255 0030 FF4300D1 		sub	sp, sp, #16
 256 0034 E00700F9 		str	x0, [sp, 8]
 257 0038 E00740F9 		ldr	x0, [sp, 8]
 258 003c 1F3C00F1 		cmp	x0, 15
 259 0040 E0979F1A 		cset	w0, hi
 260 0044 001C0012 		and	w0, w0, 255
 261 0048 FF430091 		add	sp, sp, 16
 262 004c BF2303D5 		hint	29 // autiasp
 263 0050 C0035FD6 		ret
 264              		.size	determineL1Miss, .-determineL1Miss
 265              		.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
 266              		.section	.note.GNU-stack,"",@progbits
 267              		.section	.note.gnu.property,"a"
 268              		.align	3
 269 0000 04000000 		.word	4
 270 0004 10000000 		.word	16
 271 0008 05000000 		.word	5
 272 000c 474E5500 		.string	"GNU"
 273 0010 000000C0 		.word	3221225472
 274 0014 04000000 		.word	4
 275 0018 03000000 		.word	3
 276 001c 00000000 		.align	3
