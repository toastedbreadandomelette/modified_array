	.file	"main.cpp"
	.text
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEE6_M_runEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEE6_M_runEv:
.LFB12537:
	.cfi_startproc
	endbr64
	movq	16(%rdi), %rsi
	movq	32(%rdi), %rdx
	vmovsd	8(%rdi), %xmm3
	vmovsd	24(%rdi), %xmm2
	cmpq	%rdx, %rsi
	jbe	.L10
	movq	40(%rdi), %rax
	movq	%rsi, %r8
	subq	%rdx, %r8
	movq	8(%rax), %rdi
	leaq	-1(%r8), %rax
	cmpq	$2, %rax
	jbe	.L3
	vaddsd	%xmm2, %xmm3, %xmm0
	movq	%r8, %rcx
	shrq	$2, %rcx
	vaddsd	%xmm0, %xmm3, %xmm1
	leaq	(%rdi,%rdx,8), %rax
	vunpcklpd	%xmm0, %xmm2, %xmm0
	vaddsd	%xmm1, %xmm3, %xmm4
	salq	$5, %rcx
	addq	%rax, %rcx
	vunpcklpd	%xmm4, %xmm1, %xmm1
	vmulsd	.LC0(%rip), %xmm3, %xmm4
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vbroadcastsd	%xmm4, %ymm4
	.p2align 4,,10
	.p2align 3
.L4:
	vmovapd	%ymm0, %ymm1
	vmovupd	%ymm1, (%rax)
	addq	$32, %rax
	vaddpd	%ymm4, %ymm0, %ymm0
	cmpq	%rcx, %rax
	jne	.L4
	movq	%r8, %rax
	andq	$-4, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	addq	%rax, %rdx
	testq	%rax, %rax
	js	.L5
	vcvtsi2sdq	%rax, %xmm0, %xmm0
.L6:
	vfmadd231sd	%xmm0, %xmm3, %xmm2
	cmpq	%rax, %r8
	je	.L9
	vzeroupper
.L3:
	leaq	1(%rdx), %rcx
	vmovsd	%xmm2, (%rdi,%rdx,8)
	leaq	0(,%rdx,8), %rax
	vaddsd	%xmm2, %xmm3, %xmm2
	cmpq	%rcx, %rsi
	jbe	.L10
	addq	$2, %rdx
	vaddsd	%xmm2, %xmm3, %xmm3
	vmovsd	%xmm2, 8(%rdi,%rax)
	cmpq	%rdx, %rsi
	jbe	.L10
	vmovsd	%xmm3, 16(%rdi,%rax)
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	vzeroupper
.L10:
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rax, %rcx
	shrq	%rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L6
	.cfi_endproc
.LFE12537:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv:
.LFB12538:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movl	8(%rax), %r8d
	movl	24(%rdi), %ecx
	movq	32(%rdi), %rdx
	movq	40(%rdi), %rsi
	movq	48(%rdi), %rdi
	pushq	%r8
	.cfi_def_cfa_offset 24
	movl	12(%rax), %r8d
	movl	16(%rax), %r9d
	pushq	%r8
	.cfi_def_cfa_offset 32
	movl	20(%rax), %r8d
	call	*56(%rax)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12538:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv:
.LFB12539:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movq	8(%rax), %r8
	movl	32(%rdi), %ecx
	movq	40(%rdi), %rdx
	movq	48(%rdi), %rsi
	movq	56(%rdi), %rdi
	pushq	%r8
	.cfi_def_cfa_offset 24
	movq	16(%rax), %r8
	movl	24(%rax), %r9d
	pushq	%r8
	.cfi_def_cfa_offset 32
	movl	28(%rax), %r8d
	call	*64(%rax)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12539:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv:
.LFB12540:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movl	8(%rax), %r8d
	movl	24(%rdi), %ecx
	movq	32(%rdi), %rdx
	movq	40(%rdi), %rsi
	movq	48(%rdi), %rdi
	pushq	%r8
	.cfi_def_cfa_offset 24
	movl	12(%rax), %r8d
	movl	16(%rax), %r9d
	pushq	%r8
	.cfi_def_cfa_offset 32
	movl	20(%rax), %r8d
	call	*56(%rax)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12540:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv:
.LFB12541:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movq	8(%rax), %r8
	movl	32(%rdi), %ecx
	movq	40(%rdi), %rdx
	movq	48(%rdi), %rsi
	movq	56(%rdi), %rdi
	pushq	%r8
	.cfi_def_cfa_offset 24
	movq	16(%rax), %r8
	movl	24(%rax), %r9d
	pushq	%r8
	.cfi_def_cfa_offset 32
	movl	28(%rax), %r8d
	call	*64(%rax)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12541:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv:
.LFB12542:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movl	8(%rax), %r8d
	movl	24(%rdi), %ecx
	movq	32(%rdi), %rdx
	movq	40(%rdi), %rsi
	movq	48(%rdi), %rdi
	pushq	%r8
	.cfi_def_cfa_offset 24
	movl	12(%rax), %r8d
	movl	16(%rax), %r9d
	pushq	%r8
	.cfi_def_cfa_offset 32
	movl	20(%rax), %r8d
	call	*56(%rax)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12542:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv:
.LFB12543:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movq	8(%rax), %r8
	movl	32(%rdi), %ecx
	movq	40(%rdi), %rdx
	movq	48(%rdi), %rsi
	movq	56(%rdi), %rdi
	pushq	%r8
	.cfi_def_cfa_offset 24
	movq	16(%rax), %r8
	movl	24(%rax), %r9d
	pushq	%r8
	.cfi_def_cfa_offset 32
	movl	28(%rax), %r8d
	call	*64(%rax)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12543:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv:
.LFB12544:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movl	8(%rax), %r8d
	movl	24(%rdi), %ecx
	movq	32(%rdi), %rdx
	movq	40(%rdi), %rsi
	movq	48(%rdi), %rdi
	pushq	%r8
	.cfi_def_cfa_offset 24
	movl	12(%rax), %r8d
	movl	16(%rax), %r9d
	pushq	%r8
	.cfi_def_cfa_offset 32
	movl	20(%rax), %r8d
	call	*56(%rax)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12544:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv:
.LFB12545:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movq	8(%rax), %r8
	movl	32(%rdi), %ecx
	movq	40(%rdi), %rdx
	movq	48(%rdi), %rsi
	movq	56(%rdi), %rdi
	pushq	%r8
	.cfi_def_cfa_offset 24
	movq	16(%rax), %r8
	movl	24(%rax), %r9d
	pushq	%r8
	.cfi_def_cfa_offset 32
	movl	28(%rax), %r8d
	call	*64(%rax)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12545:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv
	.text
	.p2align 4
	.globl	_Z15mul_mt_internalP7ComplexIdvES1_S1_iiiii
	.type	_Z15mul_mt_internalP7ComplexIdvES1_S1_iiiii, @function
_Z15mul_mt_internalP7ComplexIdvES1_S1_iiiii:
.LFB10941:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$1256, %rsp
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, 200(%rsp)
	movq	%rdx, 80(%rsp)
	movl	%r8d, 228(%rsp)
	movl	%r9d, 64(%rsp)
	movl	24(%rbp), %eax
	movl	24(%rbp), %ebx
	subl	16(%rbp), %eax
	andl	$3, %eax
	subl	%eax, %ebx
	movl	%ebx, 8(%rsp)
	cmpl	%ebx, 16(%rbp)
	jge	.L35
	movl	%r9d, %edi
	movl	%r9d, %eax
	andl	$-4, %eax
	sall	$5, %edi
	movl	%eax, %ebx
	movl	%eax, 68(%rsp)
	movl	%edi, -72(%rsp)
	movl	%r9d, %eax
	leal	(%r8,%r8), %edi
	movl	%edi, -32(%rsp)
	movl	%eax, %edi
	leal	0(,%rax,4), %eax
	movl	%eax, 36(%rsp)
	movl	%edi, %eax
	imull	16(%rbp), %edi
	movl	%r8d, %r10d
	andl	$-8, %r10d
	movl	%edi, -68(%rsp)
	movl	16(%rbp), %edi
	movl	%r8d, %r9d
	leal	1(%rdi), %edx
	movl	%eax, %edi
	imull	%edx, %eax
	movl	%edi, %esi
	imull	%r8d, %edx
	movl	%eax, -64(%rsp)
	movl	16(%rbp), %eax
	sall	$5, %r9d
	leal	2(%rax), %ecx
	movl	%edi, %eax
	imull	%ecx, %eax
	movl	%r9d, -20(%rsp)
	movl	%edx, -48(%rsp)
	movl	%eax, -60(%rsp)
	movl	16(%rbp), %eax
	movl	%r8d, %r9d
	addl	$3, %eax
	imull	%eax, %esi
	imull	%r8d, %eax
	movl	%r8d, %edx
	andl	$-4, %edx
	movl	%eax, -40(%rsp)
	leal	-1(%r10), %eax
	shrl	$3, %eax
	salq	$3, %rax
	movq	%rax, 16(%rsp)
	movl	%ebx, %eax
	imull	%r8d, %eax
	imull	16(%rbp), %r9d
	imull	%r8d, %ecx
	movl	%eax, 32(%rsp)
	leal	-1(%r8), %eax
	movl	%eax, 192(%rsp)
	movl	%r8d, %eax
	shrl	$2, %eax
	decl	%eax
	incq	%rax
	salq	$6, %rax
	movq	%rax, 112(%rsp)
	leal	-1(%rdi), %eax
	movl	%edx, 108(%rsp)
	subl	%ebx, %eax
	movslq	%ebx, %rdx
	movl	%esi, -56(%rsp)
	addq	%rdx, %rax
	leal	0(,%r8,4), %esi
	movl	%r10d, 208(%rsp)
	movl	%esi, 196(%rsp)
	movl	%r9d, -52(%rsp)
	movl	%ecx, -44(%rsp)
	movl	$0, -24(%rsp)
	movl	$0, -28(%rsp)
	movq	%rdx, -8(%rsp)
	movq	%rax, -16(%rsp)
.L34:
	movl	16(%rbp), %eax
	addl	$32, 16(%rbp)
	movl	8(%rsp), %ebx
	movl	%eax, -36(%rsp)
	addl	$31, %eax
	cmpl	%eax, %ebx
	cmovg	16(%rbp), %ebx
	movl	68(%rsp), %edi
	movl	%ebx, 52(%rsp)
	testl	%edi, %edi
	jle	.L57
	movl	-28(%rsp), %eax
	movl	-68(%rsp), %ebx
	movq	$0, 56(%rsp)
	addl	%eax, %ebx
	movl	%ebx, -104(%rsp)
	movl	-64(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -100(%rsp)
	movl	-60(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -96(%rsp)
	movl	-56(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -92(%rsp)
	movl	-24(%rsp), %eax
	movl	-52(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -88(%rsp)
	movl	-48(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -84(%rsp)
	movl	-44(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -80(%rsp)
	movl	-40(%rsp), %ebx
	addl	%eax, %ebx
	movl	-32(%rsp), %eax
	movl	%ebx, -76(%rsp)
	movl	%eax, 48(%rsp)
	movslq	208(%rsp), %rbx
	movl	192(%rsp), %eax
	movq	%rbx, 176(%rsp)
	subl	%ebx, %eax
	addq	%rbx, %rax
	movq	%rax, (%rsp)
.L56:
	movq	56(%rsp), %rbx
	movl	68(%rsp), %edi
	movl	%ebx, %eax
	leal	31(%rbx), %edx
	addl	$32, %eax
	cmpl	%edx, %edi
	cmovle	%edi, %eax
	movl	-36(%rsp), %edi
	movl	%eax, 44(%rsp)
	cmpl	%edi, 52(%rsp)
	jle	.L37
	subl	%ebx, %eax
	decl	%eax
	shrl	$2, %eax
	salq	$2, %rax
	movq	%rax, 24(%rsp)
	movl	-76(%rsp), %eax
	movl	48(%rsp), %edx
	movl	%eax, 244(%rsp)
	movl	-80(%rsp), %eax
	subl	-32(%rsp), %edx
	movl	%eax, 240(%rsp)
	movl	-84(%rsp), %eax
	movl	%ebx, 40(%rsp)
	movl	%eax, 236(%rsp)
	movl	-88(%rsp), %eax
	movl	%edx, 12(%rsp)
	movl	%eax, 232(%rsp)
	movl	-92(%rsp), %eax
	movl	%edi, 104(%rsp)
	movl	%eax, 100(%rsp)
	movl	-96(%rsp), %eax
	movq	%r15, 72(%rsp)
	movl	%eax, 96(%rsp)
	movl	-100(%rsp), %eax
	movl	%eax, 92(%rsp)
	movl	-104(%rsp), %eax
	movl	%eax, 88(%rsp)
	.p2align 4,,10
	.p2align 3
.L38:
	movl	40(%rsp), %ebx
	cmpl	%ebx, 44(%rsp)
	jle	.L42
	movq	56(%rsp), %rdi
	movslq	88(%rsp), %rdx
	movq	80(%rsp), %rsi
	leaq	(%rdi,%rdx), %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %r14
	movslq	92(%rsp), %rax
	movl	228(%rsp), %ecx
	addq	%rdi, %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %r13
	movslq	96(%rsp), %rax
	movl	48(%rsp), %r15d
	addq	%rdi, %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %rbx
	movslq	100(%rsp), %rax
	movl	%r15d, 224(%rsp)
	addq	%rdi, %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %r11
	movl	%ecx, %eax
	addl	%r15d, %eax
	movl	%eax, 216(%rsp)
	movl	%r15d, %eax
	subl	%ecx, %eax
	movl	%eax, 220(%rsp)
	movq	24(%rsp), %rax
	movslq	236(%rsp), %rcx
	addq	%rdi, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	64(%rsi,%rax), %rax
	movq	%rax, 184(%rsp)
	movslq	232(%rsp), %rax
	movq	72(%rsp), %rdi
	movq	%rax, %rdx
	salq	$4, %rdx
	leaq	(%rdi,%rdx), %rsi
	salq	$4, %rcx
	movq	%rsi, 128(%rsp)
	movq	%rdi, %rsi
	addq	%rcx, %rsi
	movq	%rcx, 144(%rsp)
	movslq	240(%rsp), %rcx
	movq	%rsi, 136(%rsp)
	salq	$4, %rcx
	addq	%rdi, %rcx
	movq	%rcx, 152(%rsp)
	movslq	244(%rsp), %rcx
	movq	%rdi, %rsi
	salq	$4, %rcx
	addq	%rcx, %rsi
	movq	%rsi, 160(%rsp)
	movq	16(%rsp), %rsi
	movq	%rcx, 256(%rsp)
	leaq	(%rsi,%rax), %rcx
	salq	$4, %rcx
	leaq	128(%rdi,%rcx), %rsi
	movq	%rsi, 168(%rsp)
	movq	176(%rsp), %rsi
	negq	%rdx
	leaq	(%rax,%rsi), %rcx
	addq	(%rsp), %rax
	salq	$4, %rax
	leaq	16(%rdi,%rax), %rax
	movq	%rax, 248(%rsp)
	salq	$4, %rcx
	movl	12(%rsp), %eax
	addq	%rdi, %rcx
	movq	%rcx, 120(%rsp)
	movl	%eax, 212(%rsp)
	movq	%rdx, %r12
	.p2align 4,,10
	.p2align 3
.L41:
	movl	208(%rsp), %esi
	testl	%esi, %esi
	jle	.L81
	movslq	212(%rsp), %rdi
	movslq	220(%rsp), %rsi
	movslq	224(%rsp), %rcx
	movslq	216(%rsp), %rdx
	movq	200(%rsp), %rax
	salq	$4, %rdi
	salq	$4, %rsi
	salq	$4, %rcx
	salq	$4, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	addq	%rax, %rdi
	addq	%rax, %rsi
	addq	%rax, %rcx
	addq	%rax, %rdx
	movq	160(%rsp), %r10
	movq	152(%rsp), %r9
	movq	136(%rsp), %r8
	movq	128(%rsp), %rax
	movq	168(%rsp), %r15
	vmovapd	%ymm5, 648(%rsp)
	vmovapd	%ymm5, 680(%rsp)
	vmovapd	%ymm5, 712(%rsp)
	vmovapd	%ymm5, 744(%rsp)
	vmovapd	%ymm5, 616(%rsp)
	vmovapd	%ymm5, 584(%rsp)
	vmovapd	%ymm5, 552(%rsp)
	vmovapd	%ymm5, 520(%rsp)
	vmovapd	%ymm5, 488(%rsp)
	vmovapd	%ymm5, 456(%rsp)
	vmovapd	%ymm5, 424(%rsp)
	vmovapd	%ymm5, 392(%rsp)
	vmovapd	%ymm5, 360(%rsp)
	vmovapd	%ymm5, 328(%rsp)
	vmovapd	%ymm5, 296(%rsp)
	vmovapd	%ymm5, 264(%rsp)
	.p2align 4,,10
	.p2align 3
.L39:
	vmovupd	(%rax), %ymm1
	vpermilpd	$5, (%rdi), %ymm3
	vmulpd	(%rdi), %ymm1, %ymm14
	vmulpd	%ymm3, %ymm1, %ymm2
	vpermilpd	$5, (%rsi), %ymm7
	vmulpd	(%rsi), %ymm1, %ymm12
	vpermilpd	$5, (%rdx), %ymm13
	vhsubpd	%ymm14, %ymm14, %ymm14
	vhaddpd	%ymm2, %ymm2, %ymm2
	vmulpd	(%rcx), %ymm1, %ymm10
	vhsubpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm2, %ymm14, %ymm14
	vmulpd	%ymm7, %ymm1, %ymm2
	vmulpd	(%rdx), %ymm1, %ymm8
	vmovupd	32(%rax), %ymm6
	vpermilpd	$5, 32(%rsi), %ymm9
	vmulpd	32(%rdi), %ymm6, %ymm4
	vhaddpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm8, %ymm8, %ymm8
	vmovapd	%ymm3, 1224(%rsp)
	vblendpd	$10, %ymm2, %ymm12, %ymm12
	vpermilpd	$5, (%rcx), %ymm2
	vhsubpd	%ymm4, %ymm4, %ymm4
	vmovapd	%ymm2, 1160(%rsp)
	vmulpd	%ymm2, %ymm1, %ymm2
	vmulpd	%ymm13, %ymm1, %ymm1
	vmulpd	32(%rsi), %ymm6, %ymm3
	vhsubpd	%ymm10, %ymm10, %ymm10
	vpermilpd	$5, 32(%rcx), %ymm15
	vhaddpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm2, %ymm10, %ymm10
	vblendpd	$10, %ymm1, %ymm8, %ymm8
	vpermilpd	$5, 32(%rdi), %ymm1
	vmulpd	32(%rcx), %ymm6, %ymm2
	vmovapd	%ymm1, 1096(%rsp)
	vmulpd	%ymm1, %ymm6, %ymm1
	vpermilpd	$5, 32(%rdx), %ymm11
	vmovupd	64(%rax), %ymm5
	vhsubpd	%ymm2, %ymm2, %ymm2
	vmovapd	%ymm13, 1128(%rsp)
	vhaddpd	%ymm1, %ymm1, %ymm1
	vmulpd	64(%rdi), %ymm5, %ymm13
	vmovupd	96(%rax), %ymm0
	vblendpd	$10, %ymm1, %ymm4, %ymm4
	vmulpd	%ymm9, %ymm6, %ymm1
	vmovapd	%ymm7, 1192(%rsp)
	vhsubpd	%ymm13, %ymm13, %ymm13
	vmovapd	%ymm9, 1064(%rsp)
	vmovapd	%ymm15, 1032(%rsp)
	vhaddpd	%ymm1, %ymm1, %ymm1
	vmovapd	%ymm11, 1000(%rsp)
	vaddpd	%ymm14, %ymm4, %ymm4
	vblendpd	$10, %ymm1, %ymm3, %ymm3
	vmulpd	%ymm15, %ymm6, %ymm1
	vaddpd	%ymm12, %ymm3, %ymm3
	subq	$-128, %rax
	subq	$-128, %rdi
	subq	$-128, %rsi
	vhaddpd	%ymm1, %ymm1, %ymm1
	subq	$-128, %rcx
	subq	$-128, %rdx
	vblendpd	$10, %ymm1, %ymm2, %ymm2
	vmulpd	-96(%rdx), %ymm6, %ymm1
	vmulpd	%ymm11, %ymm6, %ymm6
	vmulpd	-64(%rsi), %ymm5, %ymm11
	vaddpd	%ymm10, %ymm2, %ymm2
	subq	$-128, %r8
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm11, %ymm11, %ymm11
	subq	$-128, %r9
	vblendpd	$10, %ymm6, %ymm1, %ymm1
	vpermilpd	$5, -64(%rdi), %ymm6
	vaddpd	%ymm8, %ymm1, %ymm1
	vmovapd	%ymm6, 968(%rsp)
	vmulpd	%ymm6, %ymm5, %ymm6
	subq	$-128, %r10
	vhaddpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm6, %ymm13, %ymm13
	vpermilpd	$5, -64(%rsi), %ymm6
	vpermilpd	$5, -64(%rcx), %ymm15
	vmovapd	%ymm6, 936(%rsp)
	vmulpd	%ymm6, %ymm5, %ymm6
	vmulpd	-64(%rcx), %ymm5, %ymm9
	vmulpd	-64(%rdx), %ymm5, %ymm7
	vmovapd	%ymm15, 904(%rsp)
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm9, %ymm9, %ymm9
	vhsubpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm6, %ymm11, %ymm11
	vmulpd	%ymm15, %ymm5, %ymm6
	vhaddpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm6, %ymm9, %ymm9
	vpermilpd	$5, -64(%rdx), %ymm6
	vmulpd	%ymm6, %ymm5, %ymm5
	vmovapd	%ymm6, 872(%rsp)
	vmulpd	-32(%rdi), %ymm0, %ymm6
	vhaddpd	%ymm5, %ymm5, %ymm5
	vhsubpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm5, %ymm7, %ymm7
	vpermilpd	$5, -32(%rdi), %ymm5
	vmulpd	%ymm0, %ymm5, %ymm15
	vhaddpd	%ymm15, %ymm15, %ymm15
	vblendpd	$10, %ymm15, %ymm6, %ymm6
	vaddpd	%ymm13, %ymm6, %ymm6
	vaddpd	%ymm6, %ymm4, %ymm4
	vaddpd	264(%rsp), %ymm4, %ymm14
	vmulpd	-32(%rsi), %ymm0, %ymm4
	vmovapd	%ymm14, 264(%rsp)
	vpermilpd	$5, -32(%rsi), %ymm14
	vmulpd	%ymm14, %ymm0, %ymm6
	vhsubpd	%ymm4, %ymm4, %ymm4
	vmovapd	%ymm14, 840(%rsp)
	vhaddpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm6, %ymm4, %ymm4
	vaddpd	%ymm11, %ymm4, %ymm4
	vmovupd	-64(%r8), %ymm6
	vaddpd	%ymm4, %ymm3, %ymm3
	vaddpd	296(%rsp), %ymm3, %ymm12
	vmulpd	-32(%rcx), %ymm0, %ymm3
	vmovapd	%ymm12, 296(%rsp)
	vpermilpd	$5, -32(%rcx), %ymm12
	vmulpd	%ymm12, %ymm0, %ymm4
	vhsubpd	%ymm3, %ymm3, %ymm3
	vmovapd	%ymm12, 808(%rsp)
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm3, %ymm3
	vaddpd	%ymm9, %ymm3, %ymm3
	vaddpd	%ymm3, %ymm2, %ymm2
	vaddpd	328(%rsp), %ymm2, %ymm10
	vmulpd	-32(%rdx), %ymm0, %ymm2
	vmovapd	%ymm10, 328(%rsp)
	vpermilpd	$5, -32(%rdx), %ymm10
	vmulpd	%ymm10, %ymm0, %ymm0
	vhsubpd	%ymm2, %ymm2, %ymm2
	vmovapd	%ymm10, 776(%rsp)
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm0, %ymm2, %ymm2
	vaddpd	%ymm7, %ymm2, %ymm2
	vmovupd	-32(%r8), %ymm0
	vmovupd	-96(%r8), %ymm7
	vaddpd	%ymm2, %ymm1, %ymm1
	vmulpd	%ymm5, %ymm0, %ymm15
	vaddpd	360(%rsp), %ymm1, %ymm8
	vmovupd	-128(%r8), %ymm1
	vmovapd	%ymm8, 360(%rsp)
	vmulpd	-128(%rdi), %ymm1, %ymm14
	vmulpd	1224(%rsp), %ymm1, %ymm2
	vmulpd	-128(%rsi), %ymm1, %ymm12
	vmulpd	-128(%rcx), %ymm1, %ymm10
	vmulpd	-128(%rdx), %ymm1, %ymm8
	vhsubpd	%ymm14, %ymm14, %ymm14
	vhaddpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm12, %ymm12, %ymm12
	vmulpd	-96(%rdi), %ymm7, %ymm4
	vblendpd	$10, %ymm2, %ymm14, %ymm14
	vmulpd	1192(%rsp), %ymm1, %ymm2
	vhsubpd	%ymm8, %ymm8, %ymm8
	vmulpd	-96(%rsi), %ymm7, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm10, %ymm10, %ymm10
	vhaddpd	%ymm2, %ymm2, %ymm2
	vmulpd	-64(%rdi), %ymm6, %ymm13
	vhsubpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm2, %ymm12, %ymm12
	vmulpd	1160(%rsp), %ymm1, %ymm2
	vmulpd	1128(%rsp), %ymm1, %ymm1
	vhsubpd	%ymm13, %ymm13, %ymm13
	vmulpd	-64(%rsi), %ymm6, %ymm11
	vmulpd	-64(%rcx), %ymm6, %ymm9
	vhaddpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm1, %ymm1, %ymm1
	vhaddpd	%ymm15, %ymm15, %ymm15
	vblendpd	$10, %ymm2, %ymm10, %ymm10
	vblendpd	$10, %ymm1, %ymm8, %ymm8
	vmulpd	1096(%rsp), %ymm7, %ymm1
	vmulpd	-96(%rcx), %ymm7, %ymm2
	vhsubpd	%ymm11, %ymm11, %ymm11
	vhsubpd	%ymm9, %ymm9, %ymm9
	vhaddpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm2, %ymm2, %ymm2
	vblendpd	$10, %ymm1, %ymm4, %ymm4
	vmulpd	1064(%rsp), %ymm7, %ymm1
	vaddpd	%ymm14, %ymm4, %ymm4
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm3, %ymm3
	vmulpd	1032(%rsp), %ymm7, %ymm1
	vaddpd	%ymm12, %ymm3, %ymm3
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm2, %ymm2
	vmulpd	-96(%rdx), %ymm7, %ymm1
	vmulpd	1000(%rsp), %ymm7, %ymm7
	vaddpd	%ymm10, %ymm2, %ymm2
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm1, %ymm1
	vmulpd	968(%rsp), %ymm6, %ymm7
	vaddpd	%ymm8, %ymm1, %ymm1
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm13, %ymm13
	vmulpd	936(%rsp), %ymm6, %ymm7
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm11, %ymm11
	vmulpd	904(%rsp), %ymm6, %ymm7
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm9, %ymm9
	vmulpd	-64(%rdx), %ymm6, %ymm7
	vmulpd	872(%rsp), %ymm6, %ymm6
	vhsubpd	%ymm7, %ymm7, %ymm7
	vhaddpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm6, %ymm7, %ymm7
	vmulpd	-32(%rdi), %ymm0, %ymm6
	vhsubpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm15, %ymm6, %ymm6
	vaddpd	%ymm13, %ymm6, %ymm6
	vaddpd	%ymm6, %ymm4, %ymm4
	vmulpd	840(%rsp), %ymm0, %ymm6
	vaddpd	392(%rsp), %ymm4, %ymm4
	vmovapd	%ymm4, 392(%rsp)
	vmulpd	-32(%rsi), %ymm0, %ymm4
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm6, %ymm4, %ymm4
	vaddpd	%ymm11, %ymm4, %ymm4
	vaddpd	%ymm4, %ymm3, %ymm3
	vaddpd	424(%rsp), %ymm3, %ymm4
	vmulpd	-32(%rcx), %ymm0, %ymm3
	vmovapd	%ymm4, 424(%rsp)
	vmulpd	808(%rsp), %ymm0, %ymm4
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm3, %ymm3
	vaddpd	%ymm9, %ymm3, %ymm3
	vaddpd	%ymm3, %ymm2, %ymm2
	vaddpd	456(%rsp), %ymm2, %ymm4
	vmulpd	-32(%rdx), %ymm0, %ymm2
	vmulpd	776(%rsp), %ymm0, %ymm0
	vmovapd	%ymm4, 456(%rsp)
	vmovupd	-64(%r9), %ymm6
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmulpd	-64(%rdi), %ymm6, %ymm13
	vmulpd	-64(%rsi), %ymm6, %ymm11
	vblendpd	$10, %ymm0, %ymm2, %ymm2
	vaddpd	%ymm7, %ymm2, %ymm2
	vmovupd	-96(%r9), %ymm7
	vhsubpd	%ymm13, %ymm13, %ymm13
	vaddpd	%ymm2, %ymm1, %ymm1
	vmulpd	-96(%rdi), %ymm7, %ymm4
	vmulpd	-96(%rsi), %ymm7, %ymm3
	vaddpd	488(%rsp), %ymm1, %ymm8
	vmovupd	-128(%r9), %ymm1
	vhsubpd	%ymm11, %ymm11, %ymm11
	vmulpd	-128(%rdi), %ymm1, %ymm14
	vmulpd	1224(%rsp), %ymm1, %ymm2
	vmulpd	-128(%rsi), %ymm1, %ymm12
	vmulpd	-128(%rcx), %ymm1, %ymm10
	vmovapd	%ymm8, 488(%rsp)
	vhsubpd	%ymm14, %ymm14, %ymm14
	vhaddpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm12, %ymm12, %ymm12
	vmulpd	-128(%rdx), %ymm1, %ymm8
	vblendpd	$10, %ymm2, %ymm14, %ymm14
	vmulpd	1192(%rsp), %ymm1, %ymm2
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm10, %ymm10, %ymm10
	vhsubpd	%ymm8, %ymm8, %ymm8
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm2, %ymm2, %ymm2
	vmulpd	-64(%rcx), %ymm6, %ymm9
	vmovupd	-32(%r9), %ymm0
	vblendpd	$10, %ymm2, %ymm12, %ymm12
	vmulpd	1160(%rsp), %ymm1, %ymm2
	vmulpd	1128(%rsp), %ymm1, %ymm1
	vhsubpd	%ymm9, %ymm9, %ymm9
	vmulpd	%ymm5, %ymm0, %ymm15
	vhaddpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm2, %ymm10, %ymm10
	vblendpd	$10, %ymm1, %ymm8, %ymm8
	vmulpd	1096(%rsp), %ymm7, %ymm1
	vmulpd	-96(%rcx), %ymm7, %ymm2
	vhaddpd	%ymm15, %ymm15, %ymm15
	vhaddpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm2, %ymm2, %ymm2
	vblendpd	$10, %ymm1, %ymm4, %ymm4
	vmulpd	1064(%rsp), %ymm7, %ymm1
	vaddpd	%ymm14, %ymm4, %ymm4
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm3, %ymm3
	vmulpd	1032(%rsp), %ymm7, %ymm1
	vaddpd	%ymm12, %ymm3, %ymm3
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm2, %ymm2
	vmulpd	-96(%rdx), %ymm7, %ymm1
	vmulpd	1000(%rsp), %ymm7, %ymm7
	vaddpd	%ymm10, %ymm2, %ymm2
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm1, %ymm1
	vmulpd	968(%rsp), %ymm6, %ymm7
	vaddpd	%ymm8, %ymm1, %ymm1
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm13, %ymm13
	vmulpd	936(%rsp), %ymm6, %ymm7
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm11, %ymm11
	vmulpd	904(%rsp), %ymm6, %ymm7
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm9, %ymm9
	vmulpd	-64(%rdx), %ymm6, %ymm7
	vmulpd	872(%rsp), %ymm6, %ymm6
	vhsubpd	%ymm7, %ymm7, %ymm7
	vhaddpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm6, %ymm7, %ymm7
	vmulpd	-32(%rdi), %ymm0, %ymm6
	vhsubpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm15, %ymm6, %ymm6
	vaddpd	%ymm13, %ymm6, %ymm6
	vaddpd	%ymm6, %ymm4, %ymm4
	vaddpd	520(%rsp), %ymm4, %ymm6
	vmulpd	-32(%rsi), %ymm0, %ymm4
	vmovapd	%ymm6, 520(%rsp)
	vmulpd	840(%rsp), %ymm0, %ymm6
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm6, %ymm4, %ymm4
	vaddpd	%ymm11, %ymm4, %ymm4
	vaddpd	%ymm4, %ymm3, %ymm3
	vmulpd	808(%rsp), %ymm0, %ymm4
	vaddpd	552(%rsp), %ymm3, %ymm6
	vmulpd	-32(%rcx), %ymm0, %ymm3
	vhaddpd	%ymm4, %ymm4, %ymm4
	vmovapd	%ymm6, 552(%rsp)
	vhsubpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm4, %ymm3, %ymm3
	vaddpd	%ymm9, %ymm3, %ymm3
	vmovupd	-128(%r10), %ymm4
	vaddpd	%ymm3, %ymm2, %ymm2
	vmulpd	-128(%rdx), %ymm4, %ymm12
	vmovupd	-96(%r10), %ymm3
	vaddpd	584(%rsp), %ymm2, %ymm6
	vmulpd	-32(%rdx), %ymm0, %ymm2
	vmulpd	776(%rsp), %ymm0, %ymm0
	vhsubpd	%ymm12, %ymm12, %ymm12
	vmulpd	-96(%rdi), %ymm3, %ymm11
	vmulpd	-96(%rsi), %ymm3, %ymm10
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmovapd	%ymm6, 584(%rsp)
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm0, %ymm2, %ymm2
	vaddpd	%ymm7, %ymm2, %ymm2
	vmulpd	1224(%rsp), %ymm4, %ymm0
	vmovupd	-64(%r10), %ymm7
	vaddpd	%ymm2, %ymm1, %ymm1
	vmulpd	-128(%rdi), %ymm4, %ymm2
	vmovupd	-32(%r10), %ymm6
	vhaddpd	%ymm0, %ymm0, %ymm0
	vaddpd	616(%rsp), %ymm1, %ymm8
	vmulpd	-128(%rsi), %ymm4, %ymm1
	vhsubpd	%ymm2, %ymm2, %ymm2
	vmovapd	%ymm8, 616(%rsp)
	vmulpd	1160(%rsp), %ymm4, %ymm8
	vblendpd	$10, %ymm0, %ymm2, %ymm2
	vmulpd	1192(%rsp), %ymm4, %ymm0
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm10, %ymm10, %ymm10
	vhaddpd	%ymm8, %ymm8, %ymm8
	vmulpd	%ymm5, %ymm6, %ymm5
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm0, %ymm1, %ymm1
	vmulpd	-128(%rcx), %ymm4, %ymm0
	vmulpd	1128(%rsp), %ymm4, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm5
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm8, %ymm0, %ymm0
	vblendpd	$10, %ymm4, %ymm12, %ymm12
	vmulpd	1096(%rsp), %ymm3, %ymm4
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm11, %ymm11
	vmulpd	1064(%rsp), %ymm3, %ymm4
	vmulpd	-96(%rcx), %ymm3, %ymm9
	vmulpd	-96(%rdx), %ymm3, %ymm8
	vmulpd	-64(%rdi), %ymm7, %ymm13
	vmulpd	904(%rsp), %ymm7, %ymm14
	vhaddpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm9, %ymm9, %ymm9
	vhsubpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm4, %ymm10, %ymm10
	vmulpd	1032(%rsp), %ymm3, %ymm4
	vmulpd	1000(%rsp), %ymm3, %ymm3
	vhsubpd	%ymm13, %ymm13, %ymm13
	vhaddpd	%ymm14, %ymm14, %ymm14
	vmulpd	872(%rsp), %ymm7, %ymm15
	vhaddpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm3, %ymm3, %ymm3
	vaddpd	%ymm11, %ymm2, %ymm2
	vblendpd	$10, %ymm4, %ymm9, %ymm9
	vblendpd	$10, %ymm3, %ymm8, %ymm8
	vmulpd	968(%rsp), %ymm7, %ymm3
	vmulpd	-64(%rsi), %ymm7, %ymm4
	vaddpd	%ymm10, %ymm1, %ymm1
	vaddpd	%ymm9, %ymm0, %ymm0
	vaddpd	%ymm8, %ymm12, %ymm12
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm3, %ymm13, %ymm13
	vmulpd	936(%rsp), %ymm7, %ymm3
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm3, %ymm4, %ymm4
	vmulpd	-64(%rcx), %ymm7, %ymm3
	vhsubpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm14, %ymm3, %ymm3
	vmulpd	-64(%rdx), %ymm7, %ymm14
	vhaddpd	%ymm15, %ymm15, %ymm7
	vhsubpd	%ymm14, %ymm14, %ymm14
	vblendpd	$10, %ymm7, %ymm14, %ymm7
	vmulpd	-32(%rdi), %ymm6, %ymm14
	vhsubpd	%ymm14, %ymm14, %ymm14
	vblendpd	$10, %ymm5, %ymm14, %ymm14
	vaddpd	%ymm14, %ymm13, %ymm13
	vmulpd	840(%rsp), %ymm6, %ymm5
	vaddpd	%ymm13, %ymm2, %ymm2
	vaddpd	744(%rsp), %ymm2, %ymm2
	vhaddpd	%ymm5, %ymm5, %ymm5
	vmovapd	%ymm2, 744(%rsp)
	vmulpd	-32(%rsi), %ymm6, %ymm2
	vhsubpd	%ymm2, %ymm2, %ymm2
	vblendpd	$10, %ymm5, %ymm2, %ymm2
	vaddpd	%ymm2, %ymm4, %ymm4
	vmulpd	808(%rsp), %ymm6, %ymm2
	vaddpd	%ymm4, %ymm1, %ymm1
	vaddpd	712(%rsp), %ymm1, %ymm4
	vmulpd	-32(%rcx), %ymm6, %ymm1
	vhaddpd	%ymm2, %ymm2, %ymm2
	vmovapd	%ymm4, 712(%rsp)
	vhsubpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm2, %ymm1, %ymm1
	vaddpd	%ymm1, %ymm3, %ymm3
	vaddpd	%ymm3, %ymm0, %ymm0
	vaddpd	680(%rsp), %ymm0, %ymm5
	vmulpd	-32(%rdx), %ymm6, %ymm0
	vmulpd	776(%rsp), %ymm6, %ymm6
	vmovapd	%ymm5, 680(%rsp)
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm6, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm7, %ymm7
	vaddpd	%ymm7, %ymm12, %ymm12
	vaddpd	648(%rsp), %ymm12, %ymm5
	vmovapd	%ymm5, 648(%rsp)
	cmpq	%rax, %r15
	jne	.L39
	vmovapd	264(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm3
	vunpckhpd	%xmm5, %xmm5, %xmm2
	vmovapd	%xmm5, %xmm0
	vaddsd	%xmm2, %xmm3, %xmm5
	vmovsd	%xmm5, 1224(%rsp)
	vaddsd	%xmm0, %xmm1, %xmm5
	vmovsd	%xmm5, 1192(%rsp)
	vmovapd	296(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm3
	vunpckhpd	%xmm5, %xmm5, %xmm2
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm2, %xmm3, %xmm5
	vmovsd	%xmm5, 1160(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vmovsd	%xmm5, 1128(%rsp)
	vmovapd	328(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 1096(%rsp)
	vaddsd	%xmm0, %xmm1, %xmm5
	vmovsd	%xmm5, 1064(%rsp)
	vmovapd	360(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 1032(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vmovsd	%xmm5, 1000(%rsp)
	vmovapd	392(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 968(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vmovsd	%xmm5, 936(%rsp)
	vmovapd	424(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 904(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vmovsd	%xmm5, 872(%rsp)
	vmovapd	456(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm3
	vunpckhpd	%xmm5, %xmm5, %xmm2
	vmovapd	%xmm5, %xmm0
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 840(%rsp)
	vaddsd	%xmm0, %xmm1, %xmm5
	vmovsd	%xmm5, 808(%rsp)
	vmovapd	488(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 776(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vmovsd	%xmm5, 488(%rsp)
	vmovapd	520(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 520(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vmovsd	%xmm5, 456(%rsp)
	vmovapd	552(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 552(%rsp)
	vaddsd	%xmm0, %xmm1, %xmm5
	vmovsd	%xmm5, 424(%rsp)
	vmovapd	584(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 584(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vmovsd	%xmm5, 392(%rsp)
	vmovapd	616(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 616(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vmovsd	%xmm5, 360(%rsp)
	vmovapd	744(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vunpckhpd	%xmm4, %xmm4, %xmm2
	vmovsd	%xmm5, 744(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vextractf128	$0x1, %ymm4, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm3
	vmovsd	%xmm5, 328(%rsp)
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 712(%rsp)
	vaddsd	%xmm4, %xmm1, %xmm5
	vmovsd	%xmm5, 296(%rsp)
	vmovapd	680(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vmovapd	%xmm5, %xmm1
	vaddsd	%xmm3, %xmm2, %xmm5
	vmovsd	%xmm5, 680(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vmovq	%xmm5, %r10
	vmovapd	648(%rsp), %ymm5
	vextractf128	$0x1, %ymm5, %xmm14
	vunpckhpd	%xmm14, %xmm14, %xmm15
	vunpckhpd	%xmm5, %xmm5, %xmm1
	vmovapd	%xmm5, %xmm0
	vaddsd	%xmm1, %xmm15, %xmm5
	vmovq	%xmm5, %r15
	vaddsd	%xmm0, %xmm14, %xmm5
	vmovsd	%xmm5, 648(%rsp)
.L46:
	movl	208(%rsp), %edi
	cmpl	%edi, 228(%rsp)
	jle	.L44
	movslq	216(%rsp), %rcx
	movq	176(%rsp), %rax
	movslq	212(%rsp), %r9
	movslq	220(%rsp), %r8
	movslq	224(%rsp), %rdi
	addq	%rcx, %rax
	salq	$4, %r9
	salq	$4, %r8
	salq	$4, %rdi
	movq	%r10, 264(%rsp)
	salq	$4, %rax
	negq	%rcx
	movq	%r9, %r10
	movq	120(%rsp), %rdx
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	144(%rsp), %rdi
	addq	200(%rsp), %rax
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L43:
	leaq	(%r10,%rax), %rsi
	vmovsd	8(%rdx), %xmm6
	vmovsd	(%rsi,%rcx), %xmm13
	vmovsd	(%rdx), %xmm7
	vmulsd	%xmm6, %xmm13, %xmm15
	vmovsd	8(%rsi,%rcx), %xmm3
	leaq	(%r9,%rax), %rsi
	vmovsd	(%rsi,%rcx), %xmm12
	vmovsd	8(%rsi,%rcx), %xmm2
	vfmadd231sd	%xmm3, %xmm7, %xmm15
	leaq	(%r8,%rax), %rsi
	vmovsd	(%rsi,%rcx), %xmm11
	vmovsd	8(%rsi,%rcx), %xmm1
	leaq	(%rdi,%rdx), %rsi
	vmovsd	(%rsi,%r12), %xmm5
	vmovsd	8(%rsi,%r12), %xmm4
	vaddsd	8(%r14), %xmm15, %xmm15
	movq	256(%rsp), %rsi
	vmovsd	(%rax), %xmm10
	addq	%rdx, %rsi
	vmovsd	(%rsi,%r12), %xmm8
	vmovsd	8(%rsi,%r12), %xmm9
	vmovsd	8(%rax), %xmm0
	vmovsd	%xmm15, 8(%r14)
	vmulsd	%xmm6, %xmm12, %xmm15
	vmovsd	%xmm13, %xmm13, %xmm14
	vfmadd213sd	(%r14), %xmm7, %xmm14
	addq	$16, %rdx
	addq	$16, %rax
	vfmadd231sd	%xmm7, %xmm2, %xmm15
	vfnmadd231sd	%xmm3, %xmm6, %xmm14
	vaddsd	24(%r14), %xmm15, %xmm15
	vmovsd	%xmm14, (%r14)
	vmovsd	%xmm15, 24(%r14)
	vmulsd	%xmm11, %xmm6, %xmm15
	vmovsd	%xmm12, %xmm12, %xmm14
	vfmadd213sd	16(%r14), %xmm7, %xmm14
	vfmadd231sd	%xmm7, %xmm1, %xmm15
	vfnmadd231sd	%xmm6, %xmm2, %xmm14
	vaddsd	40(%r14), %xmm15, %xmm15
	vmovsd	%xmm14, 16(%r14)
	vmovsd	%xmm15, 40(%r14)
	vmulsd	%xmm6, %xmm10, %xmm15
	vmovsd	%xmm7, %xmm7, %xmm14
	vfmadd213sd	32(%r14), %xmm11, %xmm14
	vfmadd231sd	%xmm0, %xmm7, %xmm15
	vfmadd213sd	48(%r14), %xmm10, %xmm7
	vfnmadd231sd	%xmm6, %xmm1, %xmm14
	vaddsd	56(%r14), %xmm15, %xmm15
	vfnmadd132sd	%xmm0, %xmm7, %xmm6
	vmovsd	%xmm14, 32(%r14)
	vmovsd	%xmm15, 56(%r14)
	vmovsd	%xmm13, %xmm13, %xmm7
	vmovsd	%xmm6, 48(%r14)
	vfmadd213sd	0(%r13), %xmm5, %xmm7
	vmulsd	%xmm4, %xmm13, %xmm6
	vfnmadd231sd	%xmm3, %xmm4, %xmm7
	vfmadd231sd	%xmm5, %xmm3, %xmm6
	vmovsd	%xmm7, 0(%r13)
	vaddsd	8(%r13), %xmm6, %xmm6
	vmovsd	%xmm12, %xmm12, %xmm7
	vfmadd213sd	16(%r13), %xmm5, %xmm7
	vmovsd	%xmm6, 8(%r13)
	vmulsd	%xmm4, %xmm12, %xmm6
	vfnmadd231sd	%xmm4, %xmm2, %xmm7
	vfmadd231sd	%xmm5, %xmm2, %xmm6
	vmovsd	%xmm7, 16(%r13)
	vmovsd	%xmm11, %xmm11, %xmm7
	vaddsd	24(%r13), %xmm6, %xmm6
	vfmadd213sd	32(%r13), %xmm5, %xmm7
	vmovsd	%xmm6, 24(%r13)
	vmulsd	%xmm11, %xmm4, %xmm6
	vfnmadd231sd	%xmm4, %xmm1, %xmm7
	vfmadd231sd	%xmm5, %xmm1, %xmm6
	vmovsd	%xmm7, 32(%r13)
	vaddsd	40(%r13), %xmm6, %xmm6
	vmovsd	%xmm6, 40(%r13)
	vmulsd	%xmm4, %xmm10, %xmm6
	vfmadd231sd	%xmm5, %xmm0, %xmm6
	vfmadd213sd	48(%r13), %xmm10, %xmm5
	vaddsd	56(%r13), %xmm6, %xmm6
	vfnmadd132sd	%xmm0, %xmm5, %xmm4
	vmovsd	%xmm6, 56(%r13)
	vmovsd	%xmm4, 48(%r13)
	vmulsd	%xmm9, %xmm13, %xmm4
	vfmadd231sd	%xmm3, %xmm8, %xmm4
	vmulsd	%xmm9, %xmm3, %xmm3
	vfmsub231sd	%xmm8, %xmm13, %xmm3
	vaddsd	(%rbx), %xmm3, %xmm5
	vmovsd	%xmm5, (%rbx)
	vaddsd	8(%rbx), %xmm4, %xmm5
	vmovsd	%xmm5, 8(%rbx)
	vmulsd	%xmm9, %xmm12, %xmm5
	vfmadd231sd	%xmm8, %xmm2, %xmm5
	vmulsd	%xmm9, %xmm2, %xmm2
	vfmsub231sd	%xmm8, %xmm12, %xmm2
	vaddsd	16(%rbx), %xmm2, %xmm6
	vmovsd	%xmm6, 16(%rbx)
	vaddsd	24(%rbx), %xmm5, %xmm6
	vmovsd	%xmm6, 24(%rbx)
	vmulsd	%xmm9, %xmm11, %xmm6
	vfmadd231sd	%xmm8, %xmm1, %xmm6
	vmulsd	%xmm9, %xmm1, %xmm1
	vfmsub231sd	%xmm11, %xmm8, %xmm1
	vaddsd	32(%rbx), %xmm1, %xmm7
	vmovsd	%xmm7, 32(%rbx)
	vaddsd	40(%rbx), %xmm6, %xmm7
	vmovsd	%xmm7, 40(%rbx)
	vmulsd	%xmm9, %xmm10, %xmm7
	vfmadd231sd	%xmm0, %xmm8, %xmm7
	vmulsd	%xmm9, %xmm0, %xmm0
	vfmsub231sd	%xmm8, %xmm10, %xmm0
	vaddsd	48(%rbx), %xmm0, %xmm8
	vmovsd	%xmm8, 48(%rbx)
	vaddsd	56(%rbx), %xmm7, %xmm8
	vmovsd	%xmm8, 56(%rbx)
	vaddsd	(%r11), %xmm3, %xmm3
	vmovsd	%xmm3, (%r11)
	vaddsd	8(%r11), %xmm4, %xmm4
	vaddsd	16(%r11), %xmm2, %xmm2
	vaddsd	24(%r11), %xmm5, %xmm5
	vaddsd	32(%r11), %xmm1, %xmm1
	vaddsd	40(%r11), %xmm6, %xmm6
	vaddsd	48(%r11), %xmm0, %xmm0
	vaddsd	56(%r11), %xmm7, %xmm7
	vmovsd	%xmm4, 8(%r11)
	vmovsd	%xmm2, 16(%r11)
	vmovsd	%xmm5, 24(%r11)
	vmovsd	%xmm1, 32(%r11)
	vmovsd	%xmm6, 40(%r11)
	vmovsd	%xmm0, 48(%r11)
	vmovsd	%xmm7, 56(%r11)
	cmpq	%rdx, 248(%rsp)
	jne	.L43
	movq	264(%rsp), %r10
.L44:
	vmovsd	1192(%rsp), %xmm5
	addq	$64, %r14
	vaddsd	-64(%r14), %xmm5, %xmm0
	vmovsd	1224(%rsp), %xmm5
	addq	$64, %r13
	vmovsd	%xmm0, -64(%r14)
	vaddsd	-56(%r14), %xmm5, %xmm0
	vmovsd	1128(%rsp), %xmm5
	addq	$64, %rbx
	vmovsd	%xmm0, -56(%r14)
	vaddsd	-48(%r14), %xmm5, %xmm0
	vmovsd	1160(%rsp), %xmm5
	addq	$64, %r11
	vmovsd	%xmm0, -48(%r14)
	vaddsd	-40(%r14), %xmm5, %xmm0
	vmovsd	1064(%rsp), %xmm5
	vmovsd	%xmm0, -40(%r14)
	vaddsd	-32(%r14), %xmm5, %xmm0
	vmovsd	1096(%rsp), %xmm5
	vmovsd	%xmm0, -32(%r14)
	vaddsd	-24(%r14), %xmm5, %xmm0
	vmovsd	1000(%rsp), %xmm5
	vmovsd	%xmm0, -24(%r14)
	vaddsd	-16(%r14), %xmm5, %xmm0
	vmovsd	1032(%rsp), %xmm5
	vmovsd	%xmm0, -16(%r14)
	vaddsd	-8(%r14), %xmm5, %xmm0
	vmovsd	936(%rsp), %xmm5
	vmovsd	%xmm0, -8(%r14)
	vaddsd	-64(%r13), %xmm5, %xmm0
	vmovsd	968(%rsp), %xmm5
	vmovsd	%xmm0, -64(%r13)
	vaddsd	-56(%r13), %xmm5, %xmm0
	vmovsd	872(%rsp), %xmm5
	vmovsd	%xmm0, -56(%r13)
	vaddsd	-48(%r13), %xmm5, %xmm0
	vmovsd	%xmm0, -48(%r13)
	vmovsd	904(%rsp), %xmm5
	vaddsd	-40(%r13), %xmm5, %xmm0
	vmovsd	808(%rsp), %xmm5
	vmovsd	%xmm0, -40(%r13)
	vaddsd	-32(%r13), %xmm5, %xmm0
	vmovsd	840(%rsp), %xmm5
	vmovsd	%xmm0, -32(%r13)
	vaddsd	-24(%r13), %xmm5, %xmm0
	vmovsd	488(%rsp), %xmm5
	vmovsd	%xmm0, -24(%r13)
	vaddsd	-16(%r13), %xmm5, %xmm0
	vmovsd	776(%rsp), %xmm5
	vmovsd	%xmm0, -16(%r13)
	vaddsd	-8(%r13), %xmm5, %xmm0
	vmovsd	456(%rsp), %xmm5
	vmovsd	%xmm0, -8(%r13)
	vaddsd	-64(%rbx), %xmm5, %xmm0
	vmovsd	520(%rsp), %xmm5
	vmovsd	%xmm0, -64(%rbx)
	vaddsd	-56(%rbx), %xmm5, %xmm0
	vmovsd	424(%rsp), %xmm5
	vmovsd	%xmm0, -56(%rbx)
	vaddsd	-48(%rbx), %xmm5, %xmm0
	vmovsd	552(%rsp), %xmm5
	vmovsd	%xmm0, -48(%rbx)
	vaddsd	-40(%rbx), %xmm5, %xmm0
	vmovsd	392(%rsp), %xmm5
	vmovsd	%xmm0, -40(%rbx)
	vaddsd	-32(%rbx), %xmm5, %xmm0
	vmovsd	584(%rsp), %xmm5
	vmovsd	%xmm0, -32(%rbx)
	vaddsd	-24(%rbx), %xmm5, %xmm0
	vmovsd	%xmm0, -24(%rbx)
	vmovsd	360(%rsp), %xmm5
	movl	196(%rsp), %eax
	vaddsd	-16(%rbx), %xmm5, %xmm0
	vmovsd	616(%rsp), %xmm5
	addl	%eax, 212(%rsp)
	vmovsd	%xmm0, -16(%rbx)
	vaddsd	-8(%rbx), %xmm5, %xmm0
	vmovsd	328(%rsp), %xmm5
	vmovsd	%xmm0, -8(%rbx)
	vaddsd	-64(%r11), %xmm5, %xmm0
	vmovsd	744(%rsp), %xmm5
	vmovsd	%xmm0, -64(%r11)
	vaddsd	-56(%r11), %xmm5, %xmm0
	vmovsd	296(%rsp), %xmm5
	vmovsd	%xmm0, -56(%r11)
	vaddsd	-48(%r11), %xmm5, %xmm0
	vmovsd	712(%rsp), %xmm5
	vmovsd	%xmm0, -48(%r11)
	vaddsd	-40(%r11), %xmm5, %xmm0
	vmovq	%r10, %xmm5
	vmovsd	%xmm0, -40(%r11)
	vaddsd	-32(%r11), %xmm5, %xmm0
	vmovsd	680(%rsp), %xmm5
	vmovsd	%xmm0, -32(%r11)
	vaddsd	-24(%r11), %xmm5, %xmm0
	vmovsd	648(%rsp), %xmm5
	vaddsd	-16(%r11), %xmm5, %xmm14
	vmovq	%r15, %xmm5
	vaddsd	-8(%r11), %xmm5, %xmm15
	vmovsd	%xmm0, -24(%r11)
	vmovsd	%xmm14, -16(%r11)
	vmovsd	%xmm15, -8(%r11)
	addl	%eax, 216(%rsp)
	addl	%eax, 220(%rsp)
	addl	%eax, 224(%rsp)
	cmpq	%r14, 184(%rsp)
	jne	.L41
.L42:
	movl	68(%rsp), %ebx
	cmpl	%ebx, 64(%rsp)
	jle	.L47
	movq	-8(%rsp), %rdi
	movslq	88(%rsp), %rax
	movq	80(%rsp), %rbx
	leaq	(%rax,%rdi), %rdx
	salq	$4, %rdx
	leaq	(%rbx,%rdx), %r13
	movslq	92(%rsp), %rdx
	addq	-16(%rsp), %rax
	addq	%rdi, %rdx
	salq	$4, %rdx
	salq	$4, %rax
	leaq	(%rbx,%rdx), %r15
	leaq	16(%rbx,%rax), %rax
	movslq	96(%rsp), %rdx
	movq	%rax, 968(%rsp)
	movslq	232(%rsp), %rax
	addq	%rdi, %rdx
	salq	$4, %rdx
	movq	%rax, %r9
	movq	%rax, 1000(%rsp)
	movslq	236(%rsp), %rax
	leaq	(%rbx,%rdx), %r14
	movslq	100(%rsp), %rdx
	movq	%rax, %r8
	movq	%rax, 1032(%rsp)
	movslq	240(%rsp), %rax
	addq	%rdi, %rdx
	movq	%rax, 1064(%rsp)
	movq	%rax, %rdi
	salq	$4, %rdx
	movslq	244(%rsp), %rax
	addq	%rbx, %rdx
	movq	%rdx, 1224(%rsp)
	movq	%rax, %rsi
	movq	72(%rsp), %rdx
	movq	%rax, 1096(%rsp)
	movq	%r14, 1160(%rsp)
	salq	$4, %r9
	salq	$4, %r8
	salq	$4, %rdi
	salq	$4, %rsi
	movl	32(%rsp), %r12d
	movq	200(%rsp), %r14
	movq	%r15, 1192(%rsp)
	addq	%rdx, %r9
	addq	%rdx, %r8
	addq	%rdx, %rdi
	addq	%rdx, %rsi
	movq	%r13, %r15
	.p2align 4,,10
	.p2align 3
.L48:
	movl	228(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L82
	cmpl	$2, 192(%rsp)
	jbe	.L66
	movslq	%r12d, %rcx
	vxorpd	%xmm8, %xmm8, %xmm8
	salq	$4, %rcx
	movq	112(%rsp), %r10
	addq	%r14, %rcx
	xorl	%eax, %eax
	vmovapd	%ymm8, %ymm5
	vmovapd	%ymm8, %ymm10
	vmovapd	%ymm8, %ymm9
	vmovapd	%ymm8, %ymm7
	vmovapd	%ymm8, %ymm6
	vmovapd	%ymm8, %ymm4
	vmovapd	%ymm8, %ymm3
	.p2align 4,,10
	.p2align 3
.L50:
	vmovupd	(%rcx,%rax), %ymm0
	vmovupd	(%r9,%rax), %ymm2
	vunpcklpd	32(%rcx,%rax), %ymm0, %ymm1
	vunpcklpd	32(%r9,%rax), %ymm2, %ymm11
	vunpckhpd	32(%rcx,%rax), %ymm0, %ymm0
	vunpckhpd	32(%r9,%rax), %ymm2, %ymm2
	vpermpd	$216, %ymm1, %ymm1
	vpermpd	$216, %ymm0, %ymm0
	vpermpd	$216, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm2, %ymm12
	vmulpd	%ymm0, %ymm2, %ymm2
	vpermpd	$216, %ymm11, %ymm11
	vfmadd231pd	%ymm0, %ymm11, %ymm12
	vfmsub132pd	%ymm1, %ymm2, %ymm11
	vmovupd	(%r8,%rax), %ymm2
	vaddpd	%ymm12, %ymm4, %ymm4
	vaddpd	%ymm11, %ymm3, %ymm3
	vunpcklpd	32(%r8,%rax), %ymm2, %ymm11
	vunpckhpd	32(%r8,%rax), %ymm2, %ymm2
	vpermpd	$216, %ymm11, %ymm11
	vpermpd	$216, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm2, %ymm12
	vmulpd	%ymm0, %ymm2, %ymm2
	vfmadd231pd	%ymm0, %ymm11, %ymm12
	vfmsub132pd	%ymm1, %ymm2, %ymm11
	vmovupd	(%rdi,%rax), %ymm2
	vaddpd	%ymm12, %ymm6, %ymm6
	vaddpd	%ymm11, %ymm5, %ymm5
	vunpcklpd	32(%rdi,%rax), %ymm2, %ymm11
	vunpckhpd	32(%rdi,%rax), %ymm2, %ymm2
	vpermpd	$216, %ymm11, %ymm11
	vpermpd	$216, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm2, %ymm12
	vmulpd	%ymm0, %ymm2, %ymm2
	vfmadd231pd	%ymm0, %ymm11, %ymm12
	vfmsub132pd	%ymm1, %ymm2, %ymm11
	vmovupd	(%rsi,%rax), %ymm2
	vaddpd	%ymm12, %ymm8, %ymm8
	vaddpd	%ymm11, %ymm7, %ymm7
	vunpcklpd	32(%rsi,%rax), %ymm2, %ymm11
	vunpckhpd	32(%rsi,%rax), %ymm2, %ymm2
	vpermpd	$216, %ymm11, %ymm11
	vpermpd	$216, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm2, %ymm12
	vmulpd	%ymm0, %ymm2, %ymm2
	addq	$64, %rax
	vfmadd231pd	%ymm0, %ymm11, %ymm12
	vfmsub132pd	%ymm1, %ymm2, %ymm11
	vaddpd	%ymm12, %ymm10, %ymm10
	vaddpd	%ymm11, %ymm9, %ymm9
	cmpq	%r10, %rax
	jne	.L50
	vextractf128	$0x1, %ymm10, %xmm1
	vaddpd	%xmm10, %xmm1, %xmm1
	movl	108(%rsp), %eax
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vextractf128	$0x1, %ymm9, %xmm1
	vaddpd	%xmm9, %xmm1, %xmm1
	movl	%eax, %ecx
	vunpckhpd	%xmm1, %xmm1, %xmm2
	vaddpd	%xmm1, %xmm2, %xmm2
	vextractf128	$0x1, %ymm8, %xmm1
	vaddpd	%xmm8, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm2, %xmm2
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vextractf128	$0x1, %ymm7, %xmm1
	vaddpd	%xmm7, %xmm1, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm7
	vaddpd	%xmm1, %xmm7, %xmm7
	vextractf128	$0x1, %ymm6, %xmm1
	vaddpd	%xmm6, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm7, %xmm7
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vextractf128	$0x1, %ymm5, %xmm1
	vaddpd	%xmm5, %xmm1, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm5
	vaddpd	%xmm1, %xmm5, %xmm5
	vextractf128	$0x1, %ymm4, %xmm1
	vaddpd	%xmm4, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm5, %xmm5
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vextractf128	$0x1, %ymm3, %xmm1
	vaddpd	%xmm3, %xmm1, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm3
	vaddpd	%xmm1, %xmm3, %xmm3
	vunpcklpd	%xmm0, %xmm3, %xmm3
	cmpl	%eax, 228(%rsp)
	je	.L55
.L49:
	movl	228(%rsp), %ebx
	subl	%ecx, %ebx
	movl	%ebx, 1128(%rsp)
	cmpl	$1, %ebx
	je	.L52
	movslq	%r12d, %r10
	movq	1000(%rsp), %r11
	addq	%rcx, %r10
	salq	$4, %r10
	leaq	(%rcx,%r11), %r13
	addq	%r14, %r10
	vmovupd	16(%r10), %xmm4
	vmovupd	(%r10), %xmm0
	salq	$4, %r13
	addq	%rdx, %r13
	vunpcklpd	%xmm4, %xmm0, %xmm1
	vmovupd	16(%r13), %xmm8
	vunpckhpd	%xmm4, %xmm0, %xmm0
	vmovupd	0(%r13), %xmm4
	movq	1032(%rsp), %r11
	vunpcklpd	%xmm8, %xmm4, %xmm6
	vunpckhpd	%xmm8, %xmm4, %xmm4
	vmulpd	%xmm1, %xmm4, %xmm8
	vmulpd	%xmm0, %xmm4, %xmm4
	leaq	(%rcx,%r11), %rbx
	salq	$4, %rbx
	addq	%rdx, %rbx
	vfmadd231pd	%xmm0, %xmm6, %xmm8
	vmovupd	16(%rbx), %xmm9
	vfmsub132pd	%xmm1, %xmm4, %xmm6
	vmovupd	(%rbx), %xmm4
	movq	1064(%rsp), %r11
	vunpcklpd	%xmm9, %xmm4, %xmm10
	vunpckhpd	%xmm9, %xmm4, %xmm4
	vmulpd	%xmm1, %xmm4, %xmm9
	vmulpd	%xmm0, %xmm4, %xmm4
	addq	%rcx, %r11
	salq	$4, %r11
	addq	%rdx, %r11
	vfmadd231pd	%xmm0, %xmm10, %xmm9
	vmovupd	16(%r11), %xmm11
	vfmsub132pd	%xmm1, %xmm4, %xmm10
	vmovupd	(%r11), %xmm4
	addq	1096(%rsp), %rcx
	vunpcklpd	%xmm11, %xmm4, %xmm12
	vunpckhpd	%xmm11, %xmm4, %xmm4
	vmulpd	%xmm1, %xmm4, %xmm11
	vmulpd	%xmm0, %xmm4, %xmm4
	salq	$4, %rcx
	addq	%rdx, %rcx
	vmovupd	16(%rcx), %xmm14
	vfmadd231pd	%xmm0, %xmm12, %xmm11
	vfmsub132pd	%xmm1, %xmm4, %xmm12
	vmovupd	(%rcx), %xmm4
	movl	1128(%rsp), %ebx
	vunpcklpd	%xmm14, %xmm4, %xmm13
	vunpckhpd	%xmm14, %xmm4, %xmm4
	vmulpd	%xmm1, %xmm4, %xmm14
	vmulpd	%xmm0, %xmm4, %xmm4
	movl	%ebx, %ecx
	andl	$-2, %ecx
	addl	%ecx, %eax
	vfmadd231pd	%xmm0, %xmm13, %xmm14
	vfmsub132pd	%xmm1, %xmm4, %xmm13
	vunpckhpd	%xmm14, %xmm14, %xmm0
	vaddpd	%xmm14, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vunpckhpd	%xmm13, %xmm13, %xmm0
	vaddpd	%xmm13, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm2, %xmm2
	vunpckhpd	%xmm11, %xmm11, %xmm0
	vaddpd	%xmm11, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vunpckhpd	%xmm12, %xmm12, %xmm0
	vaddpd	%xmm12, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm7, %xmm7
	vunpckhpd	%xmm9, %xmm9, %xmm0
	vaddpd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vunpckhpd	%xmm10, %xmm10, %xmm0
	vaddpd	%xmm10, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm5
	vunpckhpd	%xmm8, %xmm8, %xmm0
	vaddpd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vunpckhpd	%xmm6, %xmm6, %xmm0
	vaddpd	%xmm6, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm3
	cmpl	%ebx, %ecx
	je	.L55
.L52:
	leal	(%r12,%rax), %ecx
	movl	232(%rsp), %ebx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	vmovupd	(%r14,%rcx), %xmm0
	leal	(%rbx,%rax), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	vmovupd	(%rdx,%rcx), %xmm1
	vpermilpd	$1, %xmm0, %xmm4
	vpermilpd	$0, %xmm1, %xmm6
	vpermilpd	$3, %xmm1, %xmm1
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovapd	%xmm6, %xmm8
	movl	236(%rsp), %ebx
	leal	(%rbx,%rax), %ecx
	vfmadd132pd	%xmm0, %xmm1, %xmm8
	vfmsub132pd	%xmm0, %xmm1, %xmm6
	movslq	%ecx, %rcx
	salq	$4, %rcx
	movl	240(%rsp), %ebx
	vmovsd	%xmm6, %xmm8, %xmm1
	vaddpd	%xmm1, %xmm3, %xmm3
	vmovupd	(%rdx,%rcx), %xmm1
	leal	(%rbx,%rax), %ecx
	vpermilpd	$0, %xmm1, %xmm6
	vpermilpd	$3, %xmm1, %xmm1
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovapd	%xmm6, %xmm8
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addl	244(%rsp), %eax
	vfmadd132pd	%xmm0, %xmm1, %xmm8
	vfmsub132pd	%xmm0, %xmm1, %xmm6
	cltq
	salq	$4, %rax
	vmovsd	%xmm6, %xmm8, %xmm1
	vaddpd	%xmm1, %xmm5, %xmm5
	vmovupd	(%rdx,%rcx), %xmm1
	vpermilpd	$0, %xmm1, %xmm6
	vpermilpd	$3, %xmm1, %xmm1
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovapd	%xmm6, %xmm8
	vfmadd132pd	%xmm0, %xmm1, %xmm8
	vfmsub132pd	%xmm0, %xmm1, %xmm6
	vmovsd	%xmm6, %xmm8, %xmm1
	vaddpd	%xmm1, %xmm7, %xmm7
	vmovupd	(%rdx,%rax), %xmm1
	vpermilpd	$0, %xmm1, %xmm6
	vpermilpd	$3, %xmm1, %xmm1
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovapd	%xmm6, %xmm4
	vfmadd132pd	%xmm0, %xmm1, %xmm4
	vfmsub132pd	%xmm0, %xmm1, %xmm6
	vmovsd	%xmm6, %xmm4, %xmm0
	vaddpd	%xmm0, %xmm2, %xmm2
.L55:
	vaddpd	(%r15), %xmm3, %xmm3
	movq	1192(%rsp), %rax
	movq	1160(%rsp), %rbx
	vmovupd	%xmm3, (%r15)
	vaddpd	(%rax), %xmm5, %xmm5
	movq	1224(%rsp), %rcx
	addq	$16, %rax
	vmovupd	%xmm5, -16(%rax)
	vaddpd	(%rbx), %xmm7, %xmm7
	addq	$16, %rcx
	addq	$16, %rbx
	vmovupd	%xmm7, -16(%rbx)
	vaddpd	-16(%rcx), %xmm2, %xmm2
	addq	$16, %r15
	movq	%rax, 1192(%rsp)
	vmovupd	%xmm2, -16(%rcx)
	movq	%rbx, 1160(%rsp)
	movq	%rcx, 1224(%rsp)
	addl	228(%rsp), %r12d
	cmpq	968(%rsp), %r15
	jne	.L48
.L47:
	addl	$4, 104(%rsp)
	movl	36(%rsp), %eax
	addl	%eax, 88(%rsp)
	addl	%eax, 92(%rsp)
	addl	%eax, 96(%rsp)
	addl	%eax, 100(%rsp)
	movl	104(%rsp), %ebx
	movl	196(%rsp), %eax
	addl	%eax, 232(%rsp)
	addl	%eax, 236(%rsp)
	addl	%eax, 240(%rsp)
	addl	%eax, 244(%rsp)
	cmpl	%ebx, 52(%rsp)
	jg	.L38
	movq	72(%rsp), %r15
.L37:
	addq	$32, 56(%rsp)
	movl	-20(%rsp), %ebx
	addl	%ebx, 48(%rsp)
	movq	56(%rsp), %rax
	cmpl	%eax, 68(%rsp)
	jg	.L56
.L57:
	movl	-72(%rsp), %ebx
	movl	8(%rsp), %eax
	addl	%ebx, -28(%rsp)
	movl	-20(%rsp), %ebx
	addl	%ebx, -24(%rsp)
	cmpl	16(%rbp), %eax
	jg	.L34
.L35:
	movl	8(%rsp), %eax
	cmpl	%eax, 24(%rbp)
	jle	.L79
	movl	64(%rsp), %edx
	testl	%edx, %edx
	jle	.L79
	movl	228(%rsp), %edi
	movl	%eax, %ebx
	imull	%edi, %eax
	imull	%edx, %ebx
	movl	%eax, %r12d
	movl	%edi, %eax
	shrl	%eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, %r11
	movq	80(%rsp), %rax
	andl	$-2, %edi
	leaq	16(%rax), %r14
	leal	-1(%rdx), %eax
	movq	%rax, 1224(%rsp)
	movl	%edi, %r13d
.L31:
	movq	1224(%rsp), %rdi
	movslq	%ebx, %rax
	movslq	%r12d, %r10
	movq	%rax, %r8
	leaq	(%rdi,%rax), %rsi
	movq	%r10, %rdx
	salq	$4, %r8
	salq	$4, %rsi
	salq	$4, %rdx
	addq	80(%rsp), %r8
	addq	%r14, %rsi
	addq	%r15, %rdx
	xorl	%r9d, %r9d
.L64:
	movl	228(%rsp), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	testl	%eax, %eax
	jle	.L63
	cmpl	$1, 228(%rsp)
	je	.L67
	movslq	%r9d, %rdi
	movq	%rdi, %rcx
	salq	$4, %rcx
	addq	200(%rsp), %rcx
	xorl	%eax, %eax
	vxorpd	%xmm3, %xmm3, %xmm3
.L59:
	vmovupd	(%rcx,%rax), %ymm0
	vmovupd	(%rdx,%rax), %ymm1
	vpermilpd	$5, %ymm0, %ymm4
	vpermilpd	$0, %ymm1, %ymm2
	vpermilpd	$15, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm1
	vmovapd	%ymm0, %ymm4
	addq	$32, %rax
	vfmadd132pd	%ymm2, %ymm1, %ymm4
	vfmsub132pd	%ymm2, %ymm1, %ymm0
	vshufpd	$10, %ymm4, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm3
	cmpq	%r11, %rax
	jne	.L59
	vextractf128	$0x1, %ymm3, %xmm0
	vaddpd	%xmm3, %xmm0, %xmm0
	movl	%r13d, %eax
	cmpl	%r13d, 228(%rsp)
	je	.L63
.L58:
	leaq	(%rax,%r10), %rcx
	addq	%rdi, %rax
	movq	200(%rsp), %rdi
	salq	$4, %rcx
	salq	$4, %rax
	vmovupd	(%rdi,%rax), %xmm2
	vmovupd	(%r15,%rcx), %xmm1
	vpermilpd	$1, %xmm2, %xmm3
	vpermilpd	$0, %xmm1, %xmm4
	vpermilpd	$3, %xmm1, %xmm1
	vmulpd	%xmm3, %xmm1, %xmm1
	vmovapd	%xmm2, %xmm3
	vfmadd132pd	%xmm4, %xmm1, %xmm3
	vfmsub132pd	%xmm4, %xmm1, %xmm2
	vmovsd	%xmm2, %xmm3, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
.L63:
	vmovupd	%xmm0, (%r8)
	addq	$16, %r8
	addl	228(%rsp), %r9d
	cmpq	%rsi, %r8
	jne	.L64
	incl	8(%rsp)
	addl	64(%rsp), %ebx
	addl	228(%rsp), %r12d
	movl	8(%rsp), %eax
	cmpl	%eax, 24(%rbp)
	jne	.L31
.L79:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	xorl	%r15d, %r15d
	movq	$0x000000000, 648(%rsp)
	movq	%r15, 680(%rsp)
	movq	%r15, 296(%rsp)
	movq	%r15, 712(%rsp)
	movq	%r15, 328(%rsp)
	movq	%r15, 744(%rsp)
	movq	%r15, 360(%rsp)
	movq	%r15, 616(%rsp)
	movq	%r15, 392(%rsp)
	movq	%r15, 584(%rsp)
	movq	%r15, 424(%rsp)
	movq	%r15, 552(%rsp)
	movq	%r15, 456(%rsp)
	movq	%r15, 520(%rsp)
	movq	%r15, 488(%rsp)
	movq	%r15, 776(%rsp)
	movq	%r15, 808(%rsp)
	movq	%r15, 840(%rsp)
	movq	%r15, 872(%rsp)
	movq	%r15, 904(%rsp)
	movq	%r15, 936(%rsp)
	movq	%r15, 968(%rsp)
	movq	%r15, 1000(%rsp)
	movq	%r15, 1032(%rsp)
	movq	%r15, 1064(%rsp)
	movq	%r15, 1096(%rsp)
	movq	%r15, 1128(%rsp)
	movq	%r15, 1160(%rsp)
	movq	%r15, 1192(%rsp)
	movq	%r15, 1224(%rsp)
	movq	%r15, %r10
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L82:
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovapd	%xmm2, %xmm7
	vmovapd	%xmm2, %xmm5
	vmovapd	%xmm2, %xmm3
	jmp	.L55
.L66:
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovapd	%xmm2, %xmm7
	vmovapd	%xmm2, %xmm5
	vmovapd	%xmm2, %xmm3
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.L49
.L67:
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	movslq	%r9d, %rdi
	jmp	.L58
	.cfi_endproc
.LFE10941:
	.size	_Z15mul_mt_internalP7ComplexIdvES1_S1_iiiii, .-_Z15mul_mt_internalP7ComplexIdvES1_S1_iiiii
	.p2align 4
	.globl	_Z19mul_mt_internal_c32P7ComplexIfvES1_S1_iiiii
	.type	_Z19mul_mt_internal_c32P7ComplexIfvES1_S1_iiiii, @function
_Z19mul_mt_internal_c32P7ComplexIfvES1_S1_iiiii:
.LFB10927:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$1192, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, 48(%rsp)
	movq	%rsi, 184(%rsp)
	movq	%rdx, 56(%rsp)
	movl	%r8d, 196(%rsp)
	movl	%r9d, 40(%rsp)
	movl	24(%rbp), %eax
	movl	24(%rbp), %edi
	subl	16(%rbp), %eax
	andl	$3, %eax
	subl	%eax, %edi
	movl	%edi, -28(%rsp)
	cmpl	%edi, 16(%rbp)
	jge	.L90
	movl	%r9d, %esi
	sall	$6, %esi
	movl	%esi, -100(%rsp)
	movl	%r8d, %esi
	sall	$6, %esi
	movl	%esi, -32(%rsp)
	movl	%r9d, %esi
	imull	16(%rbp), %esi
	movl	%r9d, %eax
	andl	$-4, %eax
	movl	%esi, -96(%rsp)
	movl	16(%rbp), %esi
	movl	%eax, %edi
	movl	%eax, 44(%rsp)
	leal	0(,%r9,4), %eax
	leal	1(%rsi), %edx
	movl	%eax, 16(%rsp)
	movl	%r9d, %eax
	imull	%edx, %eax
	movl	%r9d, %ebx
	movl	%r8d, %r15d
	movl	%eax, -48(%rsp)
	movl	16(%rbp), %eax
	andl	$-16, %r15d
	leal	2(%rax), %ecx
	movl	%r9d, %eax
	imull	%ecx, %eax
	imull	%r8d, %edx
	movl	%r8d, %r14d
	movl	%eax, -80(%rsp)
	movl	16(%rbp), %eax
	movl	%edx, -44(%rsp)
	addl	$3, %eax
	imull	%eax, %ebx
	imull	%r8d, %eax
	movl	%r8d, %edx
	andl	$-8, %edx
	movl	%eax, -56(%rsp)
	leal	(%r8,%r8), %eax
	movl	%eax, 12(%rsp)
	leal	-1(%r15), %eax
	shrl	$4, %eax
	salq	$4, %rax
	movq	%rax, 104(%rsp)
	movl	%edi, %eax
	imull	%r8d, %eax
	imull	16(%rbp), %r14d
	imull	%r8d, %ecx
	movl	%eax, -8(%rsp)
	leal	-1(%r8), %eax
	movl	%eax, 112(%rsp)
	movl	%r8d, %eax
	shrl	$3, %eax
	decl	%eax
	incq	%rax
	salq	$6, %rax
	movq	%rax, 88(%rsp)
	leal	-1(%r9), %eax
	movl	%edx, 84(%rsp)
	subl	%edi, %eax
	movslq	%edi, %rdx
	movl	%ebx, -68(%rsp)
	addq	%rdx, %rax
	leal	0(,%r8,4), %ebx
	movl	%r15d, 192(%rsp)
	movl	%ebx, 152(%rsp)
	movl	%r14d, -64(%rsp)
	movl	%ecx, -60(%rsp)
	movl	$0, -36(%rsp)
	movl	$0, -40(%rsp)
	movq	%rdx, -16(%rsp)
	movq	%rax, -24(%rsp)
.L89:
	movl	16(%rbp), %eax
	addl	$64, 16(%rbp)
	movl	-28(%rsp), %edi
	movl	%eax, -52(%rsp)
	addl	$63, %eax
	cmpl	%eax, %edi
	cmovg	16(%rbp), %edi
	movl	44(%rsp), %esi
	movl	%edi, 28(%rsp)
	testl	%esi, %esi
	jle	.L112
	movl	-40(%rsp), %eax
	movl	-96(%rsp), %edi
	movq	$0, 32(%rsp)
	addl	%eax, %edi
	movl	%edi, -92(%rsp)
	movl	-48(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -88(%rsp)
	movl	-80(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -84(%rsp)
	movl	-68(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -76(%rsp)
	movl	-36(%rsp), %eax
	movl	-64(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -72(%rsp)
	movl	-44(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -112(%rsp)
	movl	-60(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -108(%rsp)
	movl	-56(%rsp), %edi
	addl	%eax, %edi
	movl	196(%rsp), %eax
	movl	%edi, -104(%rsp)
	movl	%eax, 24(%rsp)
.L111:
	movq	32(%rsp), %rdi
	movl	44(%rsp), %esi
	movl	%edi, %eax
	leal	63(%rdi), %edx
	addl	$64, %eax
	cmpl	%edx, %esi
	cmovle	%esi, %eax
	movl	-52(%rsp), %esi
	movl	%eax, 20(%rsp)
	cmpl	%esi, 28(%rsp)
	jle	.L92
	subl	%edi, %eax
	decl	%eax
	shrl	$2, %eax
	salq	$2, %rax
	movq	%rax, (%rsp)
	movl	-104(%rsp), %eax
	movl	12(%rsp), %edx
	movl	%eax, 164(%rsp)
	movl	-108(%rsp), %eax
	addl	24(%rsp), %edx
	movl	%eax, 160(%rsp)
	movl	-112(%rsp), %eax
	movl	%edi, 8(%rsp)
	movl	%eax, 156(%rsp)
	movl	-72(%rsp), %eax
	movl	%edx, -4(%rsp)
	movl	%eax, 116(%rsp)
	movl	-76(%rsp), %eax
	movl	%esi, 80(%rsp)
	movl	%eax, 76(%rsp)
	movl	-84(%rsp), %eax
	movl	%eax, 72(%rsp)
	movl	-88(%rsp), %eax
	movl	%eax, 68(%rsp)
	movl	-92(%rsp), %eax
	movl	%eax, 64(%rsp)
	movq	184(%rsp), %rax
	subq	$-128, %rax
	movq	%rax, 96(%rsp)
	.p2align 4,,10
	.p2align 3
.L93:
	movl	8(%rsp), %edi
	cmpl	%edi, 20(%rsp)
	jle	.L97
	movq	32(%rsp), %rsi
	movslq	64(%rsp), %rdx
	movq	56(%rsp), %rdi
	leaq	(%rdx,%rsi), %rax
	leaq	(%rdi,%rax,8), %rbx
	movslq	68(%rsp), %rax
	movl	24(%rsp), %ecx
	addq	%rsi, %rax
	leaq	(%rdi,%rax,8), %r11
	movslq	72(%rsp), %rax
	movl	%ecx, 172(%rsp)
	addq	%rsi, %rax
	leaq	(%rdi,%rax,8), %r12
	movslq	76(%rsp), %rax
	addq	%rsi, %rax
	leaq	(%rdi,%rax,8), %r14
	movl	%ecx, %eax
	subl	196(%rsp), %eax
	movl	%eax, 168(%rsp)
	addl	12(%rsp), %eax
	movl	%eax, 176(%rsp)
	movq	(%rsp), %rax
	addq	%rsi, %rax
	addq	%rdx, %rax
	leaq	32(%rdi,%rax,8), %rax
	movq	48(%rsp), %rsi
	movq	%rax, 128(%rsp)
	movslq	116(%rsp), %rax
	leaq	(%rsi,%rax,8), %r13
	movslq	156(%rsp), %rax
	leaq	(%rsi,%rax,8), %r15
	movslq	160(%rsp), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, 120(%rsp)
	movslq	164(%rsp), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, 144(%rsp)
	movl	-4(%rsp), %eax
	movl	%eax, 180(%rsp)
	.p2align 4,,10
	.p2align 3
.L96:
	movl	192(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L137
	movq	184(%rsp), %rdi
	movslq	172(%rsp), %rcx
	movslq	168(%rsp), %rdx
	leaq	(%rdi,%rcx,8), %r10
	movslq	176(%rsp), %rcx
	leaq	(%rdi,%rdx,8), %rax
	leaq	(%rdi,%rcx,8), %r9
	movslq	180(%rsp), %rcx
	addq	104(%rsp), %rdx
	leaq	(%rdi,%rcx,8), %r8
	movq	96(%rsp), %rdi
	vxorps	%xmm5, %xmm5, %xmm5
	leaq	(%rdi,%rdx,8), %rdi
	movq	%rdi, 1160(%rsp)
	movq	%r11, 136(%rsp)
	movq	144(%rsp), %rdi
	movq	120(%rsp), %rsi
	movq	1160(%rsp), %r11
	movq	%r15, %rcx
	movq	%r13, %rdx
	vmovaps	%ymm5, 584(%rsp)
	vmovaps	%ymm5, 616(%rsp)
	vmovaps	%ymm5, 648(%rsp)
	vmovaps	%ymm5, 680(%rsp)
	vmovaps	%ymm5, 552(%rsp)
	vmovaps	%ymm5, 520(%rsp)
	vmovaps	%ymm5, 488(%rsp)
	vmovaps	%ymm5, 456(%rsp)
	vmovaps	%ymm5, 424(%rsp)
	vmovaps	%ymm5, 392(%rsp)
	vmovaps	%ymm5, 360(%rsp)
	vmovaps	%ymm5, 328(%rsp)
	vmovaps	%ymm5, 296(%rsp)
	vmovaps	%ymm5, 264(%rsp)
	vmovaps	%ymm5, 232(%rsp)
	vmovaps	%ymm5, 200(%rsp)
	.p2align 4,,10
	.p2align 3
.L94:
	vmovups	(%rdx), %ymm1
	vpermilps	$177, (%rax), %ymm3
	vmulps	(%rax), %ymm1, %ymm14
	vmulps	%ymm3, %ymm1, %ymm2
	vpermilps	$177, (%r10), %ymm4
	vmulps	(%r10), %ymm1, %ymm12
	vpermilps	$177, (%r8), %ymm15
	vhsubps	%ymm14, %ymm14, %ymm14
	vhaddps	%ymm2, %ymm2, %ymm2
	vmulps	(%r9), %ymm1, %ymm10
	vpermilps	$80, %ymm14, %ymm14
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm14, %ymm14
	vmulps	%ymm4, %ymm1, %ymm2
	vhsubps	%ymm12, %ymm12, %ymm12
	vmulps	(%r8), %ymm1, %ymm8
	vmovups	32(%rdx), %ymm5
	vpermilps	$80, %ymm12, %ymm12
	vhaddps	%ymm2, %ymm2, %ymm2
	vmovaps	%ymm4, 1128(%rsp)
	vhsubps	%ymm8, %ymm8, %ymm8
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm12, %ymm12
	vpermilps	$177, (%r9), %ymm2
	vpermilps	$80, %ymm8, %ymm8
	vmovaps	%ymm2, 1096(%rsp)
	vmulps	%ymm2, %ymm1, %ymm2
	vmulps	%ymm15, %ymm1, %ymm1
	vmulps	32(%rax), %ymm5, %ymm4
	vpermilps	$177, 32(%r10), %ymm9
	vmovaps	%ymm3, 1160(%rsp)
	vmulps	32(%r10), %ymm5, %ymm3
	vhaddps	%ymm1, %ymm1, %ymm1
	vhsubps	%ymm4, %ymm4, %ymm4
	vhsubps	%ymm10, %ymm10, %ymm10
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm8, %ymm8
	vpermilps	$177, 32(%rax), %ymm1
	vpermilps	$80, %ymm4, %ymm4
	vmovaps	%ymm1, 1032(%rsp)
	vmulps	%ymm1, %ymm5, %ymm1
	vhaddps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm3, %ymm3, %ymm3
	vpermilps	$177, 32(%r9), %ymm13
	vpermilps	$80, %ymm2, %ymm2
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm10, %ymm10
	vpermilps	$80, %ymm3, %ymm3
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm4, %ymm4
	vmulps	%ymm9, %ymm5, %ymm1
	vblendps	$170, %ymm2, %ymm10, %ymm10
	vmulps	32(%r9), %ymm5, %ymm2
	vpermilps	$177, 32(%r8), %ymm11
	vmovups	64(%rdx), %ymm6
	vhaddps	%ymm1, %ymm1, %ymm1
	vmovaps	%ymm13, 968(%rsp)
	vhsubps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm3, %ymm3
	vmulps	%ymm13, %ymm5, %ymm1
	vpermilps	$80, %ymm2, %ymm2
	vmulps	64(%rax), %ymm6, %ymm13
	vmovups	96(%rdx), %ymm0
	vmovaps	%ymm15, 1064(%rsp)
	vhaddps	%ymm1, %ymm1, %ymm1
	vmovaps	%ymm9, 1000(%rsp)
	vhsubps	%ymm13, %ymm13, %ymm13
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm2, %ymm2
	vmulps	32(%r8), %ymm5, %ymm1
	vmulps	%ymm11, %ymm5, %ymm5
	vmovaps	%ymm11, 936(%rsp)
	vmulps	64(%r10), %ymm6, %ymm11
	vpermilps	$80, %ymm13, %ymm13
	vhsubps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm5, %ymm5, %ymm5
	vaddps	%ymm14, %ymm4, %ymm4
	vpermilps	$80, %ymm1, %ymm1
	vpermilps	$80, %ymm5, %ymm5
	vblendps	$170, %ymm5, %ymm1, %ymm1
	vpermilps	$177, 64(%rax), %ymm5
	vhsubps	%ymm11, %ymm11, %ymm11
	vmovaps	%ymm5, 904(%rsp)
	vmulps	%ymm5, %ymm6, %ymm5
	vpermilps	$177, 64(%r10), %ymm7
	vpermilps	$80, %ymm11, %ymm11
	vmulps	64(%r9), %ymm6, %ymm9
	vmovaps	%ymm7, 872(%rsp)
	vhaddps	%ymm5, %ymm5, %ymm5
	vpermilps	$177, 64(%r8), %ymm15
	vaddps	%ymm12, %ymm3, %ymm3
	vpermilps	$80, %ymm5, %ymm5
	vblendps	$170, %ymm5, %ymm13, %ymm13
	vmulps	%ymm7, %ymm6, %ymm5
	vhsubps	%ymm9, %ymm9, %ymm9
	vmovaps	%ymm15, 840(%rsp)
	vaddps	%ymm10, %ymm2, %ymm2
	vpermilps	$80, %ymm9, %ymm9
	vhaddps	%ymm5, %ymm5, %ymm5
	vaddps	%ymm8, %ymm1, %ymm1
	subq	$-128, %rax
	vpermilps	$80, %ymm5, %ymm5
	vblendps	$170, %ymm5, %ymm11, %ymm11
	vpermilps	$177, 64(%r9), %ymm5
	subq	$-128, %r10
	vmulps	%ymm6, %ymm5, %ymm7
	subq	$-128, %r9
	subq	$-128, %r8
	subq	$-128, %rdx
	subq	$-128, %rcx
	vhaddps	%ymm7, %ymm7, %ymm7
	subq	$-128, %rsi
	subq	$-128, %rdi
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm9, %ymm9
	vmulps	-64(%r8), %ymm6, %ymm7
	vmulps	%ymm15, %ymm6, %ymm6
	vpermilps	$177, -32(%rax), %ymm15
	vmovaps	%ymm15, 808(%rsp)
	vhsubps	%ymm7, %ymm7, %ymm7
	vhaddps	%ymm6, %ymm6, %ymm6
	vmulps	%ymm15, %ymm0, %ymm15
	vpermilps	$80, %ymm7, %ymm7
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm7, %ymm7
	vmulps	-32(%rax), %ymm0, %ymm6
	vhaddps	%ymm15, %ymm15, %ymm15
	vpermilps	$80, %ymm15, %ymm15
	vhsubps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm15, %ymm6, %ymm6
	vaddps	%ymm13, %ymm6, %ymm6
	vaddps	%ymm6, %ymm4, %ymm4
	vaddps	200(%rsp), %ymm4, %ymm14
	vmulps	-32(%r10), %ymm0, %ymm4
	vmovaps	%ymm14, 200(%rsp)
	vpermilps	$177, -32(%r10), %ymm14
	vmulps	%ymm14, %ymm0, %ymm6
	vhsubps	%ymm4, %ymm4, %ymm4
	vmovaps	%ymm14, 776(%rsp)
	vpermilps	$80, %ymm4, %ymm4
	vhaddps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm4, %ymm4
	vaddps	%ymm11, %ymm4, %ymm4
	vmovups	-64(%rcx), %ymm6
	vaddps	%ymm4, %ymm3, %ymm3
	vaddps	232(%rsp), %ymm3, %ymm12
	vmulps	-32(%r9), %ymm0, %ymm3
	vmovaps	%ymm12, 232(%rsp)
	vpermilps	$177, -32(%r9), %ymm12
	vmulps	%ymm12, %ymm0, %ymm4
	vhsubps	%ymm3, %ymm3, %ymm3
	vmovaps	%ymm12, 744(%rsp)
	vpermilps	$80, %ymm3, %ymm3
	vhaddps	%ymm4, %ymm4, %ymm4
	vpermilps	$80, %ymm4, %ymm4
	vblendps	$170, %ymm4, %ymm3, %ymm3
	vaddps	%ymm9, %ymm3, %ymm3
	vaddps	%ymm3, %ymm2, %ymm2
	vaddps	264(%rsp), %ymm2, %ymm10
	vmulps	-32(%r8), %ymm0, %ymm2
	vmovaps	%ymm10, 264(%rsp)
	vpermilps	$177, -32(%r8), %ymm10
	vmulps	%ymm10, %ymm0, %ymm0
	vhsubps	%ymm2, %ymm2, %ymm2
	vmovaps	%ymm10, 712(%rsp)
	vpermilps	$80, %ymm2, %ymm2
	vhaddps	%ymm0, %ymm0, %ymm0
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm2, %ymm2
	vaddps	%ymm7, %ymm2, %ymm2
	vmovups	-32(%rcx), %ymm0
	vmovups	-96(%rcx), %ymm7
	vaddps	%ymm2, %ymm1, %ymm1
	vaddps	296(%rsp), %ymm1, %ymm8
	vmovups	-128(%rcx), %ymm1
	vmovaps	%ymm8, 296(%rsp)
	vmulps	-128(%rax), %ymm1, %ymm14
	vmulps	1160(%rsp), %ymm1, %ymm2
	vmulps	-128(%r10), %ymm1, %ymm12
	vmulps	-128(%r9), %ymm1, %ymm10
	vmulps	-128(%r8), %ymm1, %ymm8
	vhsubps	%ymm14, %ymm14, %ymm14
	vhaddps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm12, %ymm12, %ymm12
	vpermilps	$80, %ymm14, %ymm14
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm14, %ymm14
	vmulps	1128(%rsp), %ymm1, %ymm2
	vpermilps	$80, %ymm12, %ymm12
	vhsubps	%ymm8, %ymm8, %ymm8
	vmulps	-96(%rax), %ymm7, %ymm4
	vmulps	-96(%r10), %ymm7, %ymm3
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm8, %ymm8
	vhsubps	%ymm10, %ymm10, %ymm10
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm12, %ymm12
	vmulps	1096(%rsp), %ymm1, %ymm2
	vmulps	1064(%rsp), %ymm1, %ymm1
	vhsubps	%ymm4, %ymm4, %ymm4
	vhsubps	%ymm3, %ymm3, %ymm3
	vpermilps	$80, %ymm10, %ymm10
	vpermilps	$80, %ymm4, %ymm4
	vhaddps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm3, %ymm3
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm8, %ymm8
	vmulps	1032(%rsp), %ymm7, %ymm1
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm10, %ymm10
	vmulps	-96(%r9), %ymm7, %ymm2
	vmulps	-64(%rax), %ymm6, %ymm13
	vhaddps	%ymm1, %ymm1, %ymm1
	vmulps	-64(%r10), %ymm6, %ymm11
	vmulps	-64(%r9), %ymm6, %ymm9
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm4, %ymm4
	vmulps	1000(%rsp), %ymm7, %ymm1
	vhsubps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm13, %ymm13, %ymm13
	vhsubps	%ymm11, %ymm11, %ymm11
	vpermilps	$80, %ymm2, %ymm2
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm13, %ymm13
	vpermilps	$80, %ymm11, %ymm11
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm3, %ymm3
	vmulps	968(%rsp), %ymm7, %ymm1
	vhsubps	%ymm9, %ymm9, %ymm9
	vmulps	808(%rsp), %ymm0, %ymm15
	vaddps	%ymm14, %ymm4, %ymm4
	vpermilps	$80, %ymm9, %ymm9
	vhaddps	%ymm1, %ymm1, %ymm1
	vaddps	%ymm12, %ymm3, %ymm3
	vhaddps	%ymm15, %ymm15, %ymm15
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm2, %ymm2
	vmulps	-96(%r8), %ymm7, %ymm1
	vmulps	936(%rsp), %ymm7, %ymm7
	vpermilps	$80, %ymm15, %ymm15
	vaddps	%ymm10, %ymm2, %ymm2
	vhsubps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm1, %ymm1
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm1, %ymm1
	vmulps	904(%rsp), %ymm6, %ymm7
	vaddps	%ymm8, %ymm1, %ymm1
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm13, %ymm13
	vmulps	872(%rsp), %ymm6, %ymm7
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm11, %ymm11
	vmulps	%ymm5, %ymm6, %ymm7
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm9, %ymm9
	vmulps	-64(%r8), %ymm6, %ymm7
	vmulps	840(%rsp), %ymm6, %ymm6
	vhsubps	%ymm7, %ymm7, %ymm7
	vhaddps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm7, %ymm7
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm7, %ymm7
	vmulps	-32(%rax), %ymm0, %ymm6
	vhsubps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm15, %ymm6, %ymm6
	vaddps	%ymm13, %ymm6, %ymm6
	vaddps	%ymm6, %ymm4, %ymm4
	vaddps	328(%rsp), %ymm4, %ymm6
	vmulps	-32(%r10), %ymm0, %ymm4
	vmovaps	%ymm6, 328(%rsp)
	vmulps	776(%rsp), %ymm0, %ymm6
	vhsubps	%ymm4, %ymm4, %ymm4
	vhaddps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm4, %ymm4
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm4, %ymm4
	vaddps	%ymm11, %ymm4, %ymm4
	vaddps	%ymm4, %ymm3, %ymm3
	vmulps	744(%rsp), %ymm0, %ymm4
	vaddps	360(%rsp), %ymm3, %ymm6
	vmulps	-32(%r9), %ymm0, %ymm3
	vhaddps	%ymm4, %ymm4, %ymm4
	vmovaps	%ymm6, 360(%rsp)
	vhsubps	%ymm3, %ymm3, %ymm3
	vpermilps	$80, %ymm4, %ymm4
	vpermilps	$80, %ymm3, %ymm3
	vblendps	$170, %ymm4, %ymm3, %ymm3
	vaddps	%ymm9, %ymm3, %ymm3
	vaddps	%ymm3, %ymm2, %ymm2
	vaddps	392(%rsp), %ymm2, %ymm6
	vmulps	-32(%r8), %ymm0, %ymm2
	vmulps	712(%rsp), %ymm0, %ymm0
	vmovaps	%ymm6, 392(%rsp)
	vmovups	-64(%rsi), %ymm6
	vhsubps	%ymm2, %ymm2, %ymm2
	vhaddps	%ymm0, %ymm0, %ymm0
	vmulps	-64(%rax), %ymm6, %ymm13
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm2, %ymm2
	vaddps	%ymm7, %ymm2, %ymm2
	vmovups	-96(%rsi), %ymm7
	vhsubps	%ymm13, %ymm13, %ymm13
	vaddps	%ymm2, %ymm1, %ymm1
	vmulps	-96(%rax), %ymm7, %ymm4
	vmulps	-96(%r10), %ymm7, %ymm3
	vaddps	424(%rsp), %ymm1, %ymm8
	vmovups	-128(%rsi), %ymm1
	vpermilps	$80, %ymm13, %ymm13
	vmulps	-128(%rax), %ymm1, %ymm14
	vmulps	1160(%rsp), %ymm1, %ymm2
	vmulps	-128(%r10), %ymm1, %ymm12
	vmulps	-128(%r9), %ymm1, %ymm10
	vmovaps	%ymm8, 424(%rsp)
	vhsubps	%ymm14, %ymm14, %ymm14
	vhaddps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm12, %ymm12, %ymm12
	vpermilps	$80, %ymm14, %ymm14
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm14, %ymm14
	vmulps	1128(%rsp), %ymm1, %ymm2
	vpermilps	$80, %ymm12, %ymm12
	vmulps	-128(%r8), %ymm1, %ymm8
	vhsubps	%ymm4, %ymm4, %ymm4
	vhsubps	%ymm10, %ymm10, %ymm10
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm4, %ymm4
	vhsubps	%ymm8, %ymm8, %ymm8
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm12, %ymm12
	vmulps	1096(%rsp), %ymm1, %ymm2
	vmulps	1064(%rsp), %ymm1, %ymm1
	vpermilps	$80, %ymm8, %ymm8
	vhsubps	%ymm3, %ymm3, %ymm3
	vpermilps	$80, %ymm10, %ymm10
	vhaddps	%ymm2, %ymm2, %ymm2
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm3, %ymm3
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm8, %ymm8
	vmulps	1032(%rsp), %ymm7, %ymm1
	vblendps	$170, %ymm2, %ymm10, %ymm10
	vmulps	-96(%r9), %ymm7, %ymm2
	vmulps	-64(%r10), %ymm6, %ymm11
	vmulps	-64(%r9), %ymm6, %ymm9
	vhaddps	%ymm1, %ymm1, %ymm1
	vmovups	-32(%rsi), %ymm0
	vhsubps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm4, %ymm4
	vmulps	1000(%rsp), %ymm7, %ymm1
	vpermilps	$80, %ymm2, %ymm2
	vhsubps	%ymm11, %ymm11, %ymm11
	vhsubps	%ymm9, %ymm9, %ymm9
	vaddps	%ymm14, %ymm4, %ymm4
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm11, %ymm11
	vpermilps	$80, %ymm9, %ymm9
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm3, %ymm3
	vmulps	968(%rsp), %ymm7, %ymm1
	vaddps	%ymm12, %ymm3, %ymm3
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm2, %ymm2
	vmulps	-96(%r8), %ymm7, %ymm1
	vmulps	936(%rsp), %ymm7, %ymm7
	vaddps	%ymm10, %ymm2, %ymm2
	vhsubps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm1, %ymm1
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm1, %ymm1
	vmulps	904(%rsp), %ymm6, %ymm7
	vaddps	%ymm8, %ymm1, %ymm1
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm13, %ymm13
	vmulps	872(%rsp), %ymm6, %ymm7
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm11, %ymm11
	vmulps	%ymm5, %ymm6, %ymm7
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm9, %ymm9
	vmulps	-64(%r8), %ymm6, %ymm7
	vmulps	840(%rsp), %ymm6, %ymm6
	vmulps	808(%rsp), %ymm0, %ymm15
	vhsubps	%ymm7, %ymm7, %ymm7
	vhaddps	%ymm6, %ymm6, %ymm6
	vhaddps	%ymm15, %ymm15, %ymm15
	vpermilps	$80, %ymm7, %ymm7
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm7, %ymm7
	vmulps	-32(%rax), %ymm0, %ymm6
	vpermilps	$80, %ymm15, %ymm15
	vhsubps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm15, %ymm6, %ymm6
	vaddps	%ymm13, %ymm6, %ymm6
	vmovaps	712(%rsp), %ymm15
	vaddps	%ymm6, %ymm4, %ymm4
	vaddps	456(%rsp), %ymm4, %ymm6
	vmulps	-32(%r10), %ymm0, %ymm4
	vmovaps	%ymm6, 456(%rsp)
	vmulps	776(%rsp), %ymm0, %ymm6
	vhsubps	%ymm4, %ymm4, %ymm4
	vhaddps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm4, %ymm4
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm4, %ymm4
	vaddps	%ymm11, %ymm4, %ymm4
	vaddps	%ymm4, %ymm3, %ymm3
	vmulps	744(%rsp), %ymm0, %ymm4
	vaddps	488(%rsp), %ymm3, %ymm6
	vmulps	-32(%r9), %ymm0, %ymm3
	vhaddps	%ymm4, %ymm4, %ymm4
	vmovaps	%ymm6, 488(%rsp)
	vhsubps	%ymm3, %ymm3, %ymm3
	vpermilps	$80, %ymm4, %ymm4
	vpermilps	$80, %ymm3, %ymm3
	vblendps	$170, %ymm4, %ymm3, %ymm3
	vaddps	%ymm9, %ymm3, %ymm3
	vmovups	-64(%rdi), %ymm4
	vaddps	%ymm3, %ymm2, %ymm2
	vmovups	-32(%rdi), %ymm3
	vmulps	%ymm5, %ymm4, %ymm5
	vaddps	520(%rsp), %ymm2, %ymm6
	vmulps	-32(%r8), %ymm0, %ymm2
	vmulps	%ymm15, %ymm0, %ymm0
	vmovaps	%ymm6, 520(%rsp)
	vhaddps	%ymm5, %ymm5, %ymm5
	vhsubps	%ymm2, %ymm2, %ymm2
	vhaddps	%ymm0, %ymm0, %ymm0
	vpermilps	$80, %ymm5, %ymm5
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm2, %ymm2
	vaddps	%ymm7, %ymm2, %ymm2
	vmovups	-128(%rdi), %ymm0
	vaddps	%ymm2, %ymm1, %ymm1
	vmulps	1160(%rsp), %ymm0, %ymm2
	vmulps	-128(%r10), %ymm0, %ymm7
	vaddps	552(%rsp), %ymm1, %ymm8
	vmulps	-128(%r9), %ymm0, %ymm12
	vmulps	-128(%r8), %ymm0, %ymm6
	vmovaps	%ymm8, 552(%rsp)
	vmulps	-128(%rax), %ymm0, %ymm8
	vhaddps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm7, %ymm7, %ymm7
	vhsubps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm2, %ymm2
	vhsubps	%ymm8, %ymm8, %ymm8
	vpermilps	$80, %ymm7, %ymm7
	vmovups	-96(%rdi), %ymm1
	vpermilps	$80, %ymm8, %ymm8
	vblendps	$170, %ymm2, %ymm8, %ymm8
	vmulps	1128(%rsp), %ymm0, %ymm2
	vpermilps	$80, %ymm6, %ymm6
	vmulps	-96(%rax), %ymm1, %ymm11
	vmulps	-96(%r10), %ymm1, %ymm10
	vhsubps	%ymm12, %ymm12, %ymm12
	vhaddps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm11, %ymm11, %ymm11
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm7, %ymm7
	vmulps	1096(%rsp), %ymm0, %ymm2
	vmulps	1064(%rsp), %ymm0, %ymm0
	vpermilps	$80, %ymm11, %ymm11
	vhsubps	%ymm10, %ymm10, %ymm10
	vpermilps	$80, %ymm12, %ymm12
	vhaddps	%ymm2, %ymm2, %ymm2
	vhaddps	%ymm0, %ymm0, %ymm0
	vpermilps	$80, %ymm10, %ymm10
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm6, %ymm6
	vmulps	1032(%rsp), %ymm1, %ymm0
	vblendps	$170, %ymm2, %ymm12, %ymm12
	vhaddps	%ymm0, %ymm0, %ymm0
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm11, %ymm11
	vmulps	1000(%rsp), %ymm1, %ymm0
	vmulps	-96(%r8), %ymm1, %ymm9
	vmulps	968(%rsp), %ymm1, %ymm2
	vmulps	872(%rsp), %ymm4, %ymm14
	vaddps	%ymm8, %ymm11, %ymm11
	vhaddps	%ymm0, %ymm0, %ymm0
	vhsubps	%ymm9, %ymm9, %ymm9
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm10, %ymm10
	vmulps	-96(%r9), %ymm1, %ymm0
	vmulps	936(%rsp), %ymm1, %ymm1
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm9, %ymm9
	vhaddps	%ymm14, %ymm14, %ymm14
	vhsubps	%ymm0, %ymm0, %ymm0
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm14, %ymm14
	vpermilps	$80, %ymm0, %ymm0
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm2, %ymm0, %ymm0
	vblendps	$170, %ymm1, %ymm9, %ymm9
	vmulps	-64(%rax), %ymm4, %ymm2
	vmulps	904(%rsp), %ymm4, %ymm1
	vaddps	%ymm12, %ymm0, %ymm0
	vaddps	%ymm7, %ymm10, %ymm10
	vaddps	%ymm6, %ymm9, %ymm9
	vhsubps	%ymm2, %ymm2, %ymm2
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm2, %ymm2
	vmulps	-64(%r10), %ymm4, %ymm1
	vhsubps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm14, %ymm1, %ymm13
	vmulps	-64(%r9), %ymm4, %ymm1
	vhsubps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm5, %ymm1, %ymm5
	vmulps	-64(%r8), %ymm4, %ymm1
	vmulps	840(%rsp), %ymm4, %ymm4
	vhsubps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm4, %ymm4, %ymm4
	vpermilps	$80, %ymm1, %ymm1
	vpermilps	$80, %ymm4, %ymm4
	vblendps	$170, %ymm4, %ymm1, %ymm14
	vmulps	-32(%rax), %ymm3, %ymm4
	vmulps	808(%rsp), %ymm3, %ymm1
	vhsubps	%ymm4, %ymm4, %ymm4
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm4, %ymm4
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm4, %ymm4
	vaddps	%ymm4, %ymm2, %ymm2
	vmulps	-32(%r10), %ymm3, %ymm1
	vaddps	%ymm2, %ymm11, %ymm11
	vaddps	680(%rsp), %ymm11, %ymm2
	vhsubps	%ymm1, %ymm1, %ymm1
	vmovaps	%ymm2, 680(%rsp)
	vmulps	776(%rsp), %ymm3, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm1, %ymm1
	vaddps	%ymm1, %ymm13, %ymm13
	vmulps	744(%rsp), %ymm3, %ymm2
	vmulps	-32(%r9), %ymm3, %ymm1
	vaddps	%ymm13, %ymm10, %ymm10
	vhaddps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm1, %ymm1, %ymm1
	vaddps	648(%rsp), %ymm10, %ymm7
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm2, %ymm1, %ymm1
	vaddps	%ymm1, %ymm5, %ymm5
	vmovaps	%ymm7, 648(%rsp)
	vaddps	%ymm5, %ymm0, %ymm0
	vaddps	616(%rsp), %ymm0, %ymm5
	vmulps	-32(%r8), %ymm3, %ymm0
	vmulps	%ymm15, %ymm3, %ymm3
	vmovaps	%ymm5, 616(%rsp)
	vhsubps	%ymm0, %ymm0, %ymm0
	vhaddps	%ymm3, %ymm3, %ymm3
	vpermilps	$80, %ymm0, %ymm0
	vpermilps	$80, %ymm3, %ymm3
	vblendps	$170, %ymm3, %ymm0, %ymm0
	vaddps	%ymm0, %ymm14, %ymm14
	vaddps	%ymm14, %ymm9, %ymm9
	vaddps	584(%rsp), %ymm9, %ymm5
	vmovaps	%ymm5, 584(%rsp)
	cmpq	%rax, %r11
	jne	.L94
	vmovaps	200(%rsp), %xmm0
	movq	136(%rsp), %r11
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 1160(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	232(%rsp), %xmm0
	vmovss	%xmm5, 1128(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 1096(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	264(%rsp), %xmm0
	vmovss	%xmm5, 1064(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vmovaps	%xmm0, %xmm1
	vunpckhps	%xmm0, %xmm0, %xmm0
	vmovss	%xmm5, 1032(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	296(%rsp), %xmm0
	vmovss	%xmm5, 1000(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 968(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	328(%rsp), %xmm0
	vmovss	%xmm5, 936(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 904(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	360(%rsp), %xmm0
	vmovss	%xmm5, 872(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 840(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	392(%rsp), %xmm0
	vmovss	%xmm5, 808(%rsp)
	vshufps	$85, %xmm0, %xmm0, %xmm2
	vshufps	$255, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 776(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	424(%rsp), %xmm0
	vmovss	%xmm5, 744(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 712(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	456(%rsp), %xmm0
	vmovss	%xmm5, 424(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 456(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	488(%rsp), %xmm0
	vmovss	%xmm5, 392(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vmovaps	%xmm0, %xmm1
	vunpckhps	%xmm0, %xmm0, %xmm0
	vmovss	%xmm5, 488(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	520(%rsp), %xmm0
	vmovss	%xmm5, 360(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 520(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	552(%rsp), %xmm0
	vmovss	%xmm5, 328(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 552(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	680(%rsp), %xmm0
	vmovss	%xmm5, 296(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vshufps	$85, %xmm7, %xmm7, %xmm2
	vmovss	%xmm5, 680(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vshufps	$255, %xmm7, %xmm7, %xmm1
	vmovaps	616(%rsp), %xmm0
	vmovss	%xmm5, 264(%rsp)
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm7, %xmm7, %xmm1
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vmovss	%xmm5, 648(%rsp)
	vaddss	%xmm7, %xmm1, %xmm5
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 232(%rsp)
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 616(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	584(%rsp), %xmm0
	vmovd	%xmm5, %r10d
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vshufps	$255, %xmm0, %xmm0, %xmm15
	vaddss	%xmm1, %xmm15, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovd	%xmm5, %r9d
	vaddss	%xmm0, %xmm1, %xmm5
	vmovd	%xmm5, %r8d
.L101:
	movl	192(%rsp), %esi
	cmpl	%esi, 196(%rsp)
	jle	.L99
	movq	184(%rsp), %rcx
	movslq	168(%rsp), %rdx
	movslq	192(%rsp), %rax
	leaq	(%rcx,%rdx,8), %rdi
	movslq	172(%rsp), %rdx
	leaq	(%rcx,%rdx,8), %rsi
	movslq	176(%rsp), %rdx
	leaq	(%rcx,%rdx,8), %rdx
	movq	%rdx, 584(%rsp)
	movslq	180(%rsp), %rdx
	leaq	(%rcx,%rdx,8), %rdx
	movq	584(%rsp), %rcx
	movl	%r10d, 584(%rsp)
	movq	144(%rsp), %r10
	.p2align 4,,10
	.p2align 3
.L98:
	vmovss	4(%r13,%rax,8), %xmm6
	vmovss	(%rdi,%rax,8), %xmm13
	vmovss	0(%r13,%rax,8), %xmm7
	vmulss	%xmm6, %xmm13, %xmm14
	vmovss	4(%rdi,%rax,8), %xmm3
	vmovss	(%rsi,%rax,8), %xmm12
	vmovss	(%r10,%rax,8), %xmm8
	vmovss	(%r15,%rax,8), %xmm5
	vfmadd231ss	%xmm3, %xmm7, %xmm14
	vmovss	4(%r15,%rax,8), %xmm4
	vmovss	4(%r10,%rax,8), %xmm9
	vmovss	4(%rsi,%rax,8), %xmm2
	vmovss	(%rcx,%rax,8), %xmm11
	vaddss	4(%rbx), %xmm14, %xmm14
	vmovss	4(%rcx,%rax,8), %xmm1
	vmovss	(%rdx,%rax,8), %xmm10
	vmovss	4(%rdx,%rax,8), %xmm0
	vmovss	%xmm14, 4(%rbx)
	vmulss	%xmm6, %xmm12, %xmm14
	vmovaps	%xmm13, %xmm15
	vfmadd213ss	(%rbx), %xmm7, %xmm15
	incq	%rax
	vfmadd231ss	%xmm7, %xmm2, %xmm14
	vfnmadd231ss	%xmm3, %xmm6, %xmm15
	vaddss	12(%rbx), %xmm14, %xmm14
	vmovss	%xmm15, (%rbx)
	vmovss	%xmm14, 12(%rbx)
	vmulss	%xmm11, %xmm6, %xmm14
	vmovaps	%xmm12, %xmm15
	vfmadd213ss	8(%rbx), %xmm7, %xmm15
	vfmadd231ss	%xmm7, %xmm1, %xmm14
	vfnmadd231ss	%xmm6, %xmm2, %xmm15
	vaddss	20(%rbx), %xmm14, %xmm14
	vmovss	%xmm15, 8(%rbx)
	vmovss	%xmm14, 20(%rbx)
	vmulss	%xmm6, %xmm10, %xmm14
	vmovaps	%xmm7, %xmm15
	vfmadd213ss	16(%rbx), %xmm11, %xmm15
	vfmadd231ss	%xmm0, %xmm7, %xmm14
	vfmadd213ss	24(%rbx), %xmm10, %xmm7
	vfnmadd231ss	%xmm6, %xmm1, %xmm15
	vaddss	28(%rbx), %xmm14, %xmm14
	vfnmadd132ss	%xmm0, %xmm7, %xmm6
	vmovss	%xmm15, 16(%rbx)
	vmovss	%xmm14, 28(%rbx)
	vmovaps	%xmm13, %xmm7
	vmovss	%xmm6, 24(%rbx)
	vfmadd213ss	(%r11), %xmm5, %xmm7
	vmulss	%xmm4, %xmm13, %xmm6
	vfnmadd231ss	%xmm3, %xmm4, %xmm7
	vfmadd231ss	%xmm5, %xmm3, %xmm6
	vmovss	%xmm7, (%r11)
	vaddss	4(%r11), %xmm6, %xmm6
	vmovaps	%xmm12, %xmm7
	vfmadd213ss	8(%r11), %xmm5, %xmm7
	vmovss	%xmm6, 4(%r11)
	vmulss	%xmm4, %xmm12, %xmm6
	vfnmadd231ss	%xmm4, %xmm2, %xmm7
	vfmadd231ss	%xmm5, %xmm2, %xmm6
	vmovss	%xmm7, 8(%r11)
	vmovaps	%xmm11, %xmm7
	vaddss	12(%r11), %xmm6, %xmm6
	vfmadd213ss	16(%r11), %xmm5, %xmm7
	vmovss	%xmm6, 12(%r11)
	vmulss	%xmm11, %xmm4, %xmm6
	vfnmadd231ss	%xmm4, %xmm1, %xmm7
	vfmadd231ss	%xmm5, %xmm1, %xmm6
	vmovss	%xmm7, 16(%r11)
	vaddss	20(%r11), %xmm6, %xmm6
	vmovss	%xmm6, 20(%r11)
	vmulss	%xmm4, %xmm10, %xmm6
	vfmadd231ss	%xmm5, %xmm0, %xmm6
	vfmadd213ss	24(%r11), %xmm10, %xmm5
	vaddss	28(%r11), %xmm6, %xmm6
	vfnmadd132ss	%xmm0, %xmm5, %xmm4
	vmovss	%xmm6, 28(%r11)
	vmovss	%xmm4, 24(%r11)
	vmulss	%xmm9, %xmm13, %xmm4
	vfmadd231ss	%xmm3, %xmm8, %xmm4
	vmulss	%xmm9, %xmm3, %xmm3
	vfmsub231ss	%xmm8, %xmm13, %xmm3
	vaddss	(%r12), %xmm3, %xmm5
	vmovss	%xmm5, (%r12)
	vaddss	4(%r12), %xmm4, %xmm5
	vmovss	%xmm5, 4(%r12)
	vmulss	%xmm9, %xmm12, %xmm5
	vfmadd231ss	%xmm8, %xmm2, %xmm5
	vmulss	%xmm9, %xmm2, %xmm2
	vfmsub231ss	%xmm8, %xmm12, %xmm2
	vaddss	8(%r12), %xmm2, %xmm6
	vmovss	%xmm6, 8(%r12)
	vaddss	12(%r12), %xmm5, %xmm6
	vmovss	%xmm6, 12(%r12)
	vmulss	%xmm9, %xmm11, %xmm6
	vfmadd231ss	%xmm8, %xmm1, %xmm6
	vmulss	%xmm9, %xmm1, %xmm1
	vfmsub231ss	%xmm11, %xmm8, %xmm1
	vaddss	16(%r12), %xmm1, %xmm7
	vmovss	%xmm7, 16(%r12)
	vaddss	20(%r12), %xmm6, %xmm7
	vmovss	%xmm7, 20(%r12)
	vmulss	%xmm9, %xmm10, %xmm7
	vfmadd231ss	%xmm0, %xmm8, %xmm7
	vmulss	%xmm9, %xmm0, %xmm0
	vfmsub231ss	%xmm8, %xmm10, %xmm0
	vaddss	24(%r12), %xmm0, %xmm8
	vmovss	%xmm8, 24(%r12)
	vaddss	28(%r12), %xmm7, %xmm8
	vmovss	%xmm8, 28(%r12)
	vaddss	(%r14), %xmm3, %xmm3
	vmovss	%xmm3, (%r14)
	vaddss	4(%r14), %xmm4, %xmm4
	vaddss	8(%r14), %xmm2, %xmm2
	vaddss	12(%r14), %xmm5, %xmm5
	vaddss	16(%r14), %xmm1, %xmm1
	vaddss	20(%r14), %xmm6, %xmm6
	vaddss	24(%r14), %xmm0, %xmm0
	vaddss	28(%r14), %xmm7, %xmm7
	vmovss	%xmm4, 4(%r14)
	vmovss	%xmm2, 8(%r14)
	vmovss	%xmm5, 12(%r14)
	vmovss	%xmm1, 16(%r14)
	vmovss	%xmm6, 20(%r14)
	vmovss	%xmm0, 24(%r14)
	vmovss	%xmm7, 28(%r14)
	cmpl	%eax, 196(%rsp)
	jg	.L98
	movl	584(%rsp), %r10d
.L99:
	vmovss	1128(%rsp), %xmm5
	addq	$32, %rbx
	vaddss	-32(%rbx), %xmm5, %xmm0
	vmovss	1160(%rsp), %xmm5
	addq	$32, %r11
	vmovss	%xmm0, -32(%rbx)
	vaddss	-28(%rbx), %xmm5, %xmm0
	vmovss	1064(%rsp), %xmm5
	addq	$32, %r12
	vmovss	%xmm0, -28(%rbx)
	vaddss	-24(%rbx), %xmm5, %xmm0
	vmovss	1096(%rsp), %xmm5
	addq	$32, %r14
	vmovss	%xmm0, -24(%rbx)
	vaddss	-20(%rbx), %xmm5, %xmm0
	vmovss	1000(%rsp), %xmm5
	vmovss	%xmm0, -20(%rbx)
	vaddss	-16(%rbx), %xmm5, %xmm0
	vmovss	1032(%rsp), %xmm5
	vmovss	%xmm0, -16(%rbx)
	vaddss	-12(%rbx), %xmm5, %xmm0
	vmovss	936(%rsp), %xmm5
	vmovss	%xmm0, -12(%rbx)
	vaddss	-8(%rbx), %xmm5, %xmm0
	vmovss	968(%rsp), %xmm5
	vmovss	%xmm0, -8(%rbx)
	vaddss	-4(%rbx), %xmm5, %xmm0
	vmovss	872(%rsp), %xmm5
	vmovss	%xmm0, -4(%rbx)
	vaddss	-32(%r11), %xmm5, %xmm0
	vmovss	904(%rsp), %xmm5
	vmovss	%xmm0, -32(%r11)
	vaddss	-28(%r11), %xmm5, %xmm0
	vmovss	808(%rsp), %xmm5
	vmovss	%xmm0, -28(%r11)
	vaddss	-24(%r11), %xmm5, %xmm0
	vmovss	%xmm0, -24(%r11)
	vmovss	840(%rsp), %xmm5
	vaddss	-20(%r11), %xmm5, %xmm0
	vmovss	744(%rsp), %xmm5
	vmovss	%xmm0, -20(%r11)
	vaddss	-16(%r11), %xmm5, %xmm0
	vmovss	776(%rsp), %xmm5
	vmovss	%xmm0, -16(%r11)
	vaddss	-12(%r11), %xmm5, %xmm0
	vmovss	424(%rsp), %xmm5
	vmovss	%xmm0, -12(%r11)
	vaddss	-8(%r11), %xmm5, %xmm0
	vmovss	712(%rsp), %xmm5
	vmovss	%xmm0, -8(%r11)
	vaddss	-4(%r11), %xmm5, %xmm0
	vmovss	392(%rsp), %xmm5
	vmovss	%xmm0, -4(%r11)
	vaddss	-32(%r12), %xmm5, %xmm0
	vmovss	456(%rsp), %xmm5
	vmovss	%xmm0, -32(%r12)
	vaddss	-28(%r12), %xmm5, %xmm0
	vmovss	360(%rsp), %xmm5
	vmovss	%xmm0, -28(%r12)
	vaddss	-24(%r12), %xmm5, %xmm0
	vmovss	488(%rsp), %xmm5
	vmovss	%xmm0, -24(%r12)
	vaddss	-20(%r12), %xmm5, %xmm0
	vmovss	328(%rsp), %xmm5
	vmovss	%xmm0, -20(%r12)
	vaddss	-16(%r12), %xmm5, %xmm0
	vmovss	520(%rsp), %xmm5
	vmovss	%xmm0, -16(%r12)
	vaddss	-12(%r12), %xmm5, %xmm0
	vmovss	%xmm0, -12(%r12)
	vmovss	296(%rsp), %xmm5
	movl	152(%rsp), %eax
	vaddss	-8(%r12), %xmm5, %xmm0
	vmovss	552(%rsp), %xmm5
	addl	%eax, 168(%rsp)
	vmovss	%xmm0, -8(%r12)
	vaddss	-4(%r12), %xmm5, %xmm0
	vmovss	264(%rsp), %xmm5
	addl	%eax, 172(%rsp)
	vmovss	%xmm0, -4(%r12)
	vaddss	-32(%r14), %xmm5, %xmm0
	vmovss	680(%rsp), %xmm5
	vmovss	%xmm0, -32(%r14)
	vaddss	-28(%r14), %xmm5, %xmm0
	vmovss	232(%rsp), %xmm5
	vmovss	%xmm0, -28(%r14)
	vaddss	-24(%r14), %xmm5, %xmm0
	vmovss	648(%rsp), %xmm5
	vmovss	%xmm0, -24(%r14)
	vaddss	-20(%r14), %xmm5, %xmm0
	vmovd	%r10d, %xmm5
	vmovss	%xmm0, -20(%r14)
	vaddss	-16(%r14), %xmm5, %xmm0
	vmovss	616(%rsp), %xmm5
	vmovss	%xmm0, -16(%r14)
	vaddss	-12(%r14), %xmm5, %xmm0
	vmovd	%r8d, %xmm5
	vmovss	%xmm0, -12(%r14)
	vaddss	-8(%r14), %xmm5, %xmm0
	vmovd	%r9d, %xmm5
	vaddss	-4(%r14), %xmm5, %xmm15
	vmovss	%xmm0, -8(%r14)
	vmovss	%xmm15, -4(%r14)
	addl	%eax, 176(%rsp)
	addl	%eax, 180(%rsp)
	cmpq	%rbx, 128(%rsp)
	jne	.L96
.L97:
	movl	44(%rsp), %edi
	cmpl	%edi, 40(%rsp)
	jle	.L102
	movq	-16(%rsp), %rsi
	movslq	64(%rsp), %rax
	movq	56(%rsp), %rdi
	addq	%rsi, %rax
	leaq	(%rdi,%rax,8), %r15
	movslq	68(%rsp), %rax
	movq	48(%rsp), %r11
	leaq	(%rax,%rsi), %rdx
	leaq	(%rdi,%rdx,8), %r10
	addq	-24(%rsp), %rax
	movslq	72(%rsp), %rdx
	leaq	8(%rdi,%rax,8), %rax
	addq	%rsi, %rdx
	movq	%rax, 904(%rsp)
	movslq	116(%rsp), %rax
	leaq	(%rdi,%rdx,8), %r13
	movslq	76(%rsp), %rdx
	movq	%rax, 936(%rsp)
	leaq	(%r11,%rax,8), %r8
	movslq	156(%rsp), %rax
	addq	%rsi, %rdx
	leaq	(%rdi,%rdx,8), %r12
	movq	%rax, 968(%rsp)
	leaq	(%r11,%rax,8), %rdi
	movslq	160(%rsp), %rax
	movl	-8(%rsp), %r9d
	movq	%rax, 1000(%rsp)
	leaq	(%r11,%rax,8), %rsi
	movslq	164(%rsp), %rax
	movq	%r13, %r14
	leaq	(%r11,%rax,8), %rcx
	movq	%rax, 1032(%rsp)
	movq	%rcx, 1064(%rsp)
	movq	%r15, %r13
	movq	%r12, %r15
	.p2align 4,,10
	.p2align 3
.L103:
	movl	196(%rsp), %edx
	testl	%edx, %edx
	jle	.L138
	cmpl	$6, 112(%rsp)
	jbe	.L123
	movq	184(%rsp), %rdx
	vxorps	%xmm8, %xmm8, %xmm8
	movslq	%r9d, %rax
	movq	88(%rsp), %rbx
	movq	1064(%rsp), %rcx
	leaq	(%rdx,%rax,8), %rdx
	vmovaps	%ymm8, %ymm5
	xorl	%eax, %eax
	vmovaps	%ymm8, %ymm10
	vmovaps	%ymm8, %ymm9
	vmovaps	%ymm8, %ymm7
	vmovaps	%ymm8, %ymm6
	vmovaps	%ymm8, %ymm4
	vmovaps	%ymm8, %ymm3
	.p2align 4,,10
	.p2align 3
.L105:
	vmovups	32(%rdx,%rax), %ymm12
	vmovups	(%rdx,%rax), %ymm2
	vmovups	32(%r8,%rax), %ymm14
	vshufps	$136, %ymm12, %ymm2, %ymm11
	vperm2f128	$3, %ymm11, %ymm11, %ymm1
	vshufps	$221, %ymm12, %ymm2, %ymm2
	vshufps	$68, %ymm1, %ymm11, %ymm0
	vshufps	$238, %ymm1, %ymm11, %ymm1
	vperm2f128	$3, %ymm2, %ymm2, %ymm11
	vinsertf128	$1, %xmm1, %ymm0, %ymm0
	vshufps	$68, %ymm11, %ymm2, %ymm1
	vshufps	$238, %ymm11, %ymm2, %ymm11
	vmovups	(%r8,%rax), %ymm2
	vinsertf128	$1, %xmm11, %ymm1, %ymm1
	vshufps	$136, %ymm14, %ymm2, %ymm13
	vperm2f128	$3, %ymm13, %ymm13, %ymm12
	vshufps	$221, %ymm14, %ymm2, %ymm2
	vshufps	$68, %ymm12, %ymm13, %ymm11
	vshufps	$238, %ymm12, %ymm13, %ymm12
	vperm2f128	$3, %ymm2, %ymm2, %ymm13
	vinsertf128	$1, %xmm12, %ymm11, %ymm11
	vshufps	$68, %ymm13, %ymm2, %ymm12
	vshufps	$238, %ymm13, %ymm2, %ymm13
	vinsertf128	$1, %xmm13, %ymm12, %ymm2
	vmulps	%ymm0, %ymm2, %ymm12
	vmulps	%ymm1, %ymm2, %ymm2
	vmovups	32(%rdi,%rax), %ymm14
	vfmadd231ps	%ymm1, %ymm11, %ymm12
	vfmsub132ps	%ymm0, %ymm2, %ymm11
	vmovups	(%rdi,%rax), %ymm2
	vshufps	$136, %ymm14, %ymm2, %ymm13
	vaddps	%ymm12, %ymm4, %ymm4
	vperm2f128	$3, %ymm13, %ymm13, %ymm12
	vshufps	$221, %ymm14, %ymm2, %ymm2
	vaddps	%ymm11, %ymm3, %ymm3
	vshufps	$68, %ymm12, %ymm13, %ymm11
	vshufps	$238, %ymm12, %ymm13, %ymm12
	vperm2f128	$3, %ymm2, %ymm2, %ymm13
	vinsertf128	$1, %xmm12, %ymm11, %ymm11
	vshufps	$68, %ymm13, %ymm2, %ymm12
	vshufps	$238, %ymm13, %ymm2, %ymm13
	vinsertf128	$1, %xmm13, %ymm12, %ymm2
	vmulps	%ymm0, %ymm2, %ymm12
	vmulps	%ymm1, %ymm2, %ymm2
	vmovups	32(%rsi,%rax), %ymm14
	vfmadd231ps	%ymm1, %ymm11, %ymm12
	vfmsub132ps	%ymm0, %ymm2, %ymm11
	vmovups	(%rsi,%rax), %ymm2
	vshufps	$136, %ymm14, %ymm2, %ymm13
	vaddps	%ymm12, %ymm6, %ymm6
	vperm2f128	$3, %ymm13, %ymm13, %ymm12
	vshufps	$221, %ymm14, %ymm2, %ymm2
	vaddps	%ymm11, %ymm5, %ymm5
	vshufps	$68, %ymm12, %ymm13, %ymm11
	vshufps	$238, %ymm12, %ymm13, %ymm12
	vperm2f128	$3, %ymm2, %ymm2, %ymm13
	vinsertf128	$1, %xmm12, %ymm11, %ymm11
	vshufps	$68, %ymm13, %ymm2, %ymm12
	vshufps	$238, %ymm13, %ymm2, %ymm13
	vinsertf128	$1, %xmm13, %ymm12, %ymm2
	vmulps	%ymm0, %ymm2, %ymm12
	vmulps	%ymm1, %ymm2, %ymm2
	vmovups	32(%rcx,%rax), %ymm14
	vfmadd231ps	%ymm1, %ymm11, %ymm12
	vfmsub132ps	%ymm0, %ymm2, %ymm11
	vmovups	(%rcx,%rax), %ymm2
	addq	$64, %rax
	vshufps	$136, %ymm14, %ymm2, %ymm13
	vaddps	%ymm12, %ymm8, %ymm8
	vperm2f128	$3, %ymm13, %ymm13, %ymm12
	vshufps	$221, %ymm14, %ymm2, %ymm2
	vaddps	%ymm11, %ymm7, %ymm7
	vshufps	$68, %ymm12, %ymm13, %ymm11
	vshufps	$238, %ymm12, %ymm13, %ymm12
	vperm2f128	$3, %ymm2, %ymm2, %ymm13
	vinsertf128	$1, %xmm12, %ymm11, %ymm11
	vshufps	$68, %ymm13, %ymm2, %ymm12
	vshufps	$238, %ymm13, %ymm2, %ymm13
	vinsertf128	$1, %xmm13, %ymm12, %ymm2
	vmulps	%ymm0, %ymm2, %ymm12
	vmulps	%ymm1, %ymm2, %ymm2
	vfmadd231ps	%ymm1, %ymm11, %ymm12
	vfmsub132ps	%ymm0, %ymm2, %ymm11
	vaddps	%ymm12, %ymm10, %ymm10
	vaddps	%ymm11, %ymm9, %ymm9
	cmpq	%rbx, %rax
	jne	.L105
	vextractf128	$0x1, %ymm10, %xmm0
	vaddps	%xmm10, %xmm0, %xmm0
	vextractf128	$0x1, %ymm9, %xmm2
	vaddps	%xmm9, %xmm2, %xmm2
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	movl	84(%rsp), %eax
	movl	196(%rsp), %edx
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vmovhlps	%xmm2, %xmm2, %xmm1
	vaddps	%xmm2, %xmm1, %xmm1
	vextractf128	$0x1, %ymm7, %xmm2
	vaddps	%xmm7, %xmm2, %xmm2
	vshufps	$85, %xmm1, %xmm1, %xmm9
	vaddps	%xmm1, %xmm9, %xmm9
	movq	%rcx, 1064(%rsp)
	vunpcklps	%xmm0, %xmm9, %xmm9
	vextractf128	$0x1, %ymm8, %xmm0
	vaddps	%xmm8, %xmm0, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vmovhlps	%xmm2, %xmm2, %xmm1
	vaddps	%xmm2, %xmm1, %xmm1
	vextractf128	$0x1, %ymm5, %xmm2
	vaddps	%xmm5, %xmm2, %xmm2
	vshufps	$85, %xmm1, %xmm1, %xmm7
	vaddps	%xmm1, %xmm7, %xmm7
	vunpcklps	%xmm0, %xmm7, %xmm7
	vextractf128	$0x1, %ymm6, %xmm0
	vaddps	%xmm6, %xmm0, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vmovhlps	%xmm2, %xmm2, %xmm1
	vaddps	%xmm2, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm2
	vaddps	%xmm1, %xmm2, %xmm2
	vunpcklps	%xmm0, %xmm2, %xmm2
	vextractf128	$0x1, %ymm4, %xmm0
	vaddps	%xmm4, %xmm0, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vextractf128	$0x1, %ymm3, %xmm1
	vaddps	%xmm3, %xmm1, %xmm1
	vmovhlps	%xmm1, %xmm1, %xmm3
	vaddps	%xmm1, %xmm3, %xmm3
	vshufps	$85, %xmm3, %xmm3, %xmm1
	vaddps	%xmm3, %xmm1, %xmm1
	vunpcklps	%xmm0, %xmm1, %xmm1
	cmpl	%edx, %eax
	je	.L110
	movl	%eax, %edx
.L104:
	movl	196(%rsp), %ebx
	subl	%eax, %ebx
	leal	-1(%rbx), %r12d
	movl	%ebx, 1096(%rsp)
	cmpl	$2, %r12d
	jbe	.L107
	movq	184(%rsp), %rcx
	movslq	%r9d, %r12
	addq	%rax, %r12
	leaq	(%rcx,%r12,8), %r12
	movq	936(%rsp), %rcx
	movq	%r12, 1128(%rsp)
	leaq	(%rax,%rcx), %r12
	leaq	(%r11,%r12,8), %rcx
	movq	%rcx, 1160(%rsp)
	movq	1128(%rsp), %rcx
	movq	968(%rsp), %r12
	vmovups	16(%rcx), %xmm0
	vmovups	(%rcx), %xmm14
	movq	1160(%rsp), %rcx
	vshufps	$136, %xmm0, %xmm14, %xmm11
	vmovups	16(%rcx), %xmm4
	vshufps	$221, %xmm0, %xmm14, %xmm14
	vmovups	(%rcx), %xmm0
	addq	%rax, %r12
	vshufps	$136, %xmm4, %xmm0, %xmm3
	vshufps	$221, %xmm4, %xmm0, %xmm0
	vmulps	%xmm11, %xmm0, %xmm4
	vmulps	%xmm14, %xmm0, %xmm0
	leaq	(%r11,%r12,8), %rbx
	vmovups	16(%rbx), %xmm6
	movq	1000(%rsp), %r12
	vfmadd231ps	%xmm14, %xmm3, %xmm4
	vfmsub132ps	%xmm11, %xmm0, %xmm3
	vmovups	(%rbx), %xmm0
	addq	%rax, %r12
	vshufps	$136, %xmm6, %xmm0, %xmm5
	vshufps	$221, %xmm6, %xmm0, %xmm0
	vmulps	%xmm11, %xmm0, %xmm6
	vmulps	%xmm14, %xmm0, %xmm0
	leaq	(%r11,%r12,8), %r12
	vmovups	16(%r12), %xmm10
	addq	1032(%rsp), %rax
	vfmadd231ps	%xmm14, %xmm5, %xmm6
	vfmsub132ps	%xmm11, %xmm0, %xmm5
	vmovups	(%r12), %xmm0
	leaq	(%r11,%rax,8), %rax
	vshufps	$136, %xmm10, %xmm0, %xmm8
	vshufps	$221, %xmm10, %xmm0, %xmm0
	vmulps	%xmm11, %xmm0, %xmm10
	vmulps	%xmm14, %xmm0, %xmm0
	vmovups	16(%rax), %xmm12
	movl	1096(%rsp), %ebx
	vfmadd231ps	%xmm14, %xmm8, %xmm10
	vfmsub132ps	%xmm11, %xmm0, %xmm8
	vmovups	(%rax), %xmm0
	movl	%ebx, %eax
	vshufps	$136, %xmm12, %xmm0, %xmm13
	vshufps	$221, %xmm12, %xmm0, %xmm0
	vmulps	%xmm11, %xmm0, %xmm12
	vmulps	%xmm14, %xmm0, %xmm0
	andl	$-4, %eax
	addl	%eax, %edx
	vfmadd231ps	%xmm14, %xmm13, %xmm12
	vfmsub231ps	%xmm11, %xmm13, %xmm0
	vmovhlps	%xmm12, %xmm12, %xmm11
	vaddps	%xmm12, %xmm11, %xmm12
	vshufps	$85, %xmm12, %xmm12, %xmm11
	vaddps	%xmm12, %xmm11, %xmm11
	vmovhlps	%xmm0, %xmm0, %xmm12
	vaddps	%xmm0, %xmm12, %xmm12
	vshufps	$85, %xmm12, %xmm12, %xmm0
	vaddps	%xmm12, %xmm0, %xmm0
	vunpcklps	%xmm11, %xmm0, %xmm0
	vaddps	%xmm0, %xmm9, %xmm9
	vmovhlps	%xmm10, %xmm10, %xmm0
	vaddps	%xmm10, %xmm0, %xmm10
	vshufps	$85, %xmm10, %xmm10, %xmm0
	vaddps	%xmm10, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm10
	vmovhlps	%xmm8, %xmm8, %xmm0
	vaddps	%xmm8, %xmm0, %xmm8
	vshufps	$85, %xmm8, %xmm8, %xmm0
	vaddps	%xmm8, %xmm0, %xmm0
	vunpcklps	%xmm10, %xmm0, %xmm0
	vaddps	%xmm0, %xmm7, %xmm7
	vmovhlps	%xmm6, %xmm6, %xmm0
	vaddps	%xmm6, %xmm0, %xmm6
	vshufps	$85, %xmm6, %xmm6, %xmm0
	vaddps	%xmm6, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm6
	vmovhlps	%xmm5, %xmm5, %xmm0
	vaddps	%xmm5, %xmm0, %xmm5
	vshufps	$85, %xmm5, %xmm5, %xmm0
	vaddps	%xmm5, %xmm0, %xmm0
	vunpcklps	%xmm6, %xmm0, %xmm0
	vaddps	%xmm0, %xmm2, %xmm2
	vmovhlps	%xmm4, %xmm4, %xmm0
	vaddps	%xmm4, %xmm0, %xmm4
	vshufps	$85, %xmm4, %xmm4, %xmm0
	vaddps	%xmm4, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm4
	vmovhlps	%xmm3, %xmm3, %xmm0
	vaddps	%xmm3, %xmm0, %xmm3
	vshufps	$85, %xmm3, %xmm3, %xmm0
	vaddps	%xmm3, %xmm0, %xmm0
	vunpcklps	%xmm4, %xmm0, %xmm0
	vaddps	%xmm0, %xmm1, %xmm1
	cmpl	%ebx, %eax
	je	.L110
.L107:
	movq	184(%rsp), %rcx
	movl	116(%rsp), %r12d
	leal	(%r9,%rdx), %eax
	cltq
	vmovq	(%rcx,%rax,8), %xmm0
	leal	(%r12,%rdx), %eax
	cltq
	vmovq	(%r11,%rax,8), %xmm3
	vshufps	$0xe1, %xmm0, %xmm0, %xmm4
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	movl	156(%rsp), %eax
	movl	160(%rsp), %ebx
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	addl	%edx, %eax
	cltq
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	leal	(%rbx,%rdx), %eax
	cltq
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm1, %xmm1
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	movl	164(%rsp), %eax
	addl	%edx, %eax
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm2, %xmm2
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	cltq
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	leal	1(%rdx), %eax
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm7, %xmm7
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmulps	%xmm4, %xmm3, %xmm3
	vmovaps	%xmm5, %xmm4
	vfmadd132ps	%xmm0, %xmm3, %xmm4
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovss	%xmm5, %xmm4, %xmm4
	vaddps	%xmm4, %xmm9, %xmm9
	cmpl	%eax, 196(%rsp)
	jle	.L110
	leal	(%r9,%rax), %ebx
	movslq	%ebx, %rbx
	vmovq	(%rcx,%rbx,8), %xmm0
	leal	(%r12,%rax), %ebx
	movslq	%ebx, %rbx
	vmovq	(%r11,%rbx,8), %xmm3
	vshufps	$0xe1, %xmm0, %xmm0, %xmm4
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	movl	156(%rsp), %ebx
	addl	$2, %edx
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	addl	%eax, %ebx
	movslq	%ebx, %rbx
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rbx,8), %xmm3
	movl	160(%rsp), %ebx
	addl	%eax, %ebx
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm1, %xmm1
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	movslq	%ebx, %rbx
	addl	164(%rsp), %eax
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	cltq
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rbx,8), %xmm3
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm2, %xmm2
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm7, %xmm7
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmulps	%xmm4, %xmm3, %xmm3
	vmovaps	%xmm5, %xmm4
	vfmadd132ps	%xmm0, %xmm3, %xmm4
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovss	%xmm5, %xmm4, %xmm4
	vaddps	%xmm4, %xmm9, %xmm9
	cmpl	%edx, 196(%rsp)
	jle	.L110
	leal	(%r9,%rdx), %eax
	cltq
	vmovq	(%rcx,%rax,8), %xmm0
	leal	(%r12,%rdx), %eax
	cltq
	vmovq	(%r11,%rax,8), %xmm3
	vshufps	$0xe1, %xmm0, %xmm0, %xmm4
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	movl	156(%rsp), %ebx
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	leal	(%rbx,%rdx), %eax
	cltq
	movl	160(%rsp), %ebx
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	leal	(%rbx,%rdx), %eax
	cltq
	addl	164(%rsp), %edx
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm1, %xmm1
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	movslq	%edx, %rdx
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm2, %xmm2
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rdx,8), %xmm3
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm7, %xmm7
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmulps	%xmm4, %xmm3, %xmm3
	vmovaps	%xmm5, %xmm4
	vfmadd132ps	%xmm0, %xmm3, %xmm4
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovss	%xmm5, %xmm4, %xmm4
	vaddps	%xmm4, %xmm9, %xmm9
.L110:
	vmovq	0(%r13), %xmm0
	addq	$8, %r10
	vaddps	%xmm1, %xmm0, %xmm0
	addq	$8, %r13
	addq	$8, %r14
	vmovlps	%xmm0, -8(%r13)
	vmovq	-8(%r10), %xmm0
	addq	$8, %r15
	vaddps	%xmm2, %xmm0, %xmm0
	addl	196(%rsp), %r9d
	vmovlps	%xmm0, -8(%r10)
	vmovq	-8(%r14), %xmm0
	vaddps	%xmm7, %xmm0, %xmm0
	vmovlps	%xmm0, -8(%r14)
	vmovq	-8(%r15), %xmm0
	vaddps	%xmm9, %xmm0, %xmm0
	vmovlps	%xmm0, -8(%r15)
	cmpq	904(%rsp), %r10
	jne	.L103
.L102:
	addl	$4, 80(%rsp)
	movl	16(%rsp), %eax
	addl	%eax, 64(%rsp)
	addl	%eax, 68(%rsp)
	addl	%eax, 72(%rsp)
	addl	%eax, 76(%rsp)
	movl	80(%rsp), %edi
	movl	152(%rsp), %eax
	addl	%eax, 116(%rsp)
	addl	%eax, 156(%rsp)
	addl	%eax, 160(%rsp)
	addl	%eax, 164(%rsp)
	cmpl	%edi, 28(%rsp)
	jg	.L93
.L92:
	addq	$64, 32(%rsp)
	movl	-32(%rsp), %edi
	addl	%edi, 24(%rsp)
	movq	32(%rsp), %rax
	cmpl	%eax, 44(%rsp)
	jg	.L111
.L112:
	movl	-100(%rsp), %edi
	movl	-28(%rsp), %eax
	addl	%edi, -40(%rsp)
	movl	-32(%rsp), %edi
	addl	%edi, -36(%rsp)
	cmpl	16(%rbp), %eax
	jg	.L89
.L90:
	movl	-28(%rsp), %eax
	cmpl	%eax, 24(%rbp)
	jle	.L135
	movl	40(%rsp), %esi
	testl	%esi, %esi
	jle	.L135
	movl	196(%rsp), %edi
	movl	%esi, %r13d
	imull	%eax, %r13d
	imull	%edi, %eax
	leal	-1(%rsi), %r11d
	movq	%r11, 1064(%rsp)
	movl	%eax, %ebx
	leal	-1(%rdi), %eax
	movl	%eax, 1096(%rsp)
	movl	%edi, %eax
	shrl	$2, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, %r12
	movq	56(%rsp), %rax
	andl	$-4, %edi
	movq	184(%rsp), %rsi
	movq	48(%rsp), %r11
	movl	%edi, %r14d
	leaq	8(%rax), %r15
	vxorps	%xmm2, %xmm2, %xmm2
.L86:
	movq	56(%rsp), %rdi
	movslq	%r13d, %rax
	leaq	(%rdi,%rax,8), %r9
	addq	1064(%rsp), %rax
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 1128(%rsp)
	movslq	%ebx, %rax
	movq	%rax, 1160(%rsp)
	leaq	(%r11,%rax,8), %rdi
	xorl	%edx, %edx
.L121:
	movl	196(%rsp), %eax
	vmovaps	%xmm2, %xmm0
	vmovaps	%xmm2, %xmm3
	testl	%eax, %eax
	jle	.L120
	cmpl	$2, 1096(%rsp)
	jbe	.L124
	movslq	%edx, %rax
	leaq	(%rsi,%rax,8), %rcx
	vxorps	%xmm4, %xmm4, %xmm4
	xorl	%eax, %eax
.L114:
	vmovups	(%rcx,%rax), %ymm0
	vmovups	(%rdi,%rax), %ymm1
	vpermilps	$177, %ymm0, %ymm5
	vpermilps	$160, %ymm1, %ymm3
	vpermilps	$245, %ymm1, %ymm1
	vmulps	%ymm5, %ymm1, %ymm1
	vmovaps	%ymm0, %ymm5
	addq	$32, %rax
	vfmadd132ps	%ymm3, %ymm1, %ymm5
	vfmsub132ps	%ymm3, %ymm1, %ymm0
	vblendps	$170, %ymm5, %ymm0, %ymm0
	vaddps	%ymm0, %ymm4, %ymm4
	cmpq	%rax, %r12
	jne	.L114
	vextractf128	$0x1, %ymm4, %xmm3
	vaddps	%xmm4, %xmm3, %xmm3
	vunpckhps	%xmm3, %xmm3, %xmm0
	vshufps	$255, %xmm3, %xmm3, %xmm1
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$85, %xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm1, %xmm3
	cmpl	196(%rsp), %r14d
	je	.L120
	movl	%r14d, %ecx
	movl	%r14d, %eax
.L113:
	movl	196(%rsp), %r10d
	subl	%ecx, %r10d
	cmpl	$1, %r10d
	je	.L116
	movq	1160(%rsp), %r8
	vunpcklps	%xmm3, %xmm0, %xmm0
	addq	%rcx, %r8
	vmovups	(%r11,%r8,8), %xmm3
	movslq	%edx, %r8
	addq	%rcx, %r8
	vmovups	(%rsi,%r8,8), %xmm1
	vpermilps	$160, %xmm3, %xmm4
	vpermilps	$177, %xmm1, %xmm5
	vpermilps	$245, %xmm3, %xmm3
	vmulps	%xmm5, %xmm3, %xmm3
	vmovaps	%xmm1, %xmm5
	vmovq	%xmm0, %xmm0
	movl	%r10d, %ecx
	andl	$-2, %ecx
	vfmadd132ps	%xmm4, %xmm3, %xmm5
	vfmsub132ps	%xmm4, %xmm3, %xmm1
	addl	%ecx, %eax
	vblendps	$10, %xmm5, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vunpckhps	%xmm1, %xmm1, %xmm0
	vshufps	$255, %xmm1, %xmm1, %xmm3
	vaddss	%xmm1, %xmm0, %xmm0
	vshufps	$85, %xmm1, %xmm1, %xmm1
	vaddss	%xmm1, %xmm3, %xmm3
	cmpl	%r10d, %ecx
	je	.L120
.L116:
	leal	(%rdx,%rax), %ecx
	addl	%ebx, %eax
	movslq	%ecx, %rcx
	cltq
	leaq	(%rsi,%rcx,8), %rcx
	leaq	(%r11,%rax,8), %rax
	vmovss	4(%rax), %xmm5
	vmovss	(%rcx), %xmm7
	vmovss	(%rax), %xmm6
	vmulss	%xmm5, %xmm7, %xmm1
	vmovss	4(%rcx), %xmm4
	vfmadd231ss	%xmm6, %xmm7, %xmm0
	vfmadd231ss	%xmm6, %xmm4, %xmm1
	vfnmadd231ss	%xmm4, %xmm5, %xmm0
	vaddss	%xmm1, %xmm3, %xmm3
.L120:
	vmovss	%xmm0, (%r9)
	vmovss	%xmm3, 4(%r9)
	addq	$8, %r9
	addl	196(%rsp), %edx
	cmpq	1128(%rsp), %r9
	jne	.L121
	incl	-28(%rsp)
	addl	40(%rsp), %r13d
	addl	196(%rsp), %ebx
	movl	-28(%rsp), %eax
	cmpl	%eax, 24(%rbp)
	jne	.L86
.L135:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L137:
	.cfi_restore_state
	movl	$0x00000000, 616(%rsp)
	movl	$0x00000000, 232(%rsp)
	movl	$0x00000000, 648(%rsp)
	movl	$0x00000000, 264(%rsp)
	movl	$0x00000000, 680(%rsp)
	movl	$0x00000000, 296(%rsp)
	movl	$0x00000000, 552(%rsp)
	movl	$0x00000000, 328(%rsp)
	movl	$0x00000000, 520(%rsp)
	movl	$0x00000000, 360(%rsp)
	movl	$0x00000000, 488(%rsp)
	movl	$0x00000000, 392(%rsp)
	movl	$0x00000000, 456(%rsp)
	movl	$0x00000000, 424(%rsp)
	movl	$0x00000000, 712(%rsp)
	movl	$0x00000000, 744(%rsp)
	movl	$0x00000000, 776(%rsp)
	movl	$0x00000000, 808(%rsp)
	movl	$0x00000000, 840(%rsp)
	movl	$0x00000000, 872(%rsp)
	movl	$0x00000000, 904(%rsp)
	movl	$0x00000000, 936(%rsp)
	movl	$0x00000000, 968(%rsp)
	movl	$0x00000000, 1000(%rsp)
	movl	$0x00000000, 1032(%rsp)
	movl	$0x00000000, 1064(%rsp)
	movl	$0x00000000, 1096(%rsp)
	movl	$0x00000000, 1128(%rsp)
	movl	$0x00000000, 1160(%rsp)
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L138:
	vxorps	%xmm9, %xmm9, %xmm9
	vmovaps	%xmm9, %xmm7
	vmovaps	%xmm9, %xmm2
	vmovaps	%xmm9, %xmm1
	jmp	.L110
.L123:
	vxorps	%xmm9, %xmm9, %xmm9
	vmovaps	%xmm9, %xmm7
	vmovaps	%xmm9, %xmm2
	vmovaps	%xmm9, %xmm1
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L104
.L124:
	xorl	%ecx, %ecx
	vmovaps	%xmm2, %xmm0
	vmovaps	%xmm2, %xmm3
	xorl	%eax, %eax
	jmp	.L113
	.cfi_endproc
.LFE10927:
	.size	_Z19mul_mt_internal_c32P7ComplexIfvES1_S1_iiiii, .-_Z19mul_mt_internal_c32P7ComplexIfvES1_S1_iiiii
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev:
.LFB12533:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE12533:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev:
.LFB12535:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE(%rip), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rax, (%rdi)
	movq	%rdi, %rbp
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbp, %rdi
	movl	$72, %esi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE12535:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED2Ev:
.LFB12501:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE12501:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED0Ev:
.LFB12503:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE(%rip), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rax, (%rdi)
	movq	%rdi, %rbp
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbp, %rdi
	movl	$48, %esi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE12503:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED0Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev:
.LFB12505:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE12505:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev:
.LFB12507:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE(%rip), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rax, (%rdi)
	movq	%rdi, %rbp
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbp, %rdi
	movl	$64, %esi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE12507:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev:
.LFB12509:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE12509:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev:
.LFB12511:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE(%rip), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rax, (%rdi)
	movq	%rdi, %rbp
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbp, %rdi
	movl	$72, %esi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE12511:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev:
.LFB12513:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE12513:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev:
.LFB12515:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE(%rip), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rax, (%rdi)
	movq	%rdi, %rbp
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbp, %rdi
	movl	$64, %esi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE12515:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev:
.LFB12517:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE12517:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev:
.LFB12519:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE(%rip), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rax, (%rdi)
	movq	%rdi, %rbp
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbp, %rdi
	movl	$72, %esi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE12519:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev:
.LFB12521:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE12521:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev:
.LFB12523:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE(%rip), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rax, (%rdi)
	movq	%rdi, %rbp
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbp, %rdi
	movl	$64, %esi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE12523:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev:
.LFB12525:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE12525:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev:
.LFB12527:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE(%rip), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rax, (%rdi)
	movq	%rdi, %rbp
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbp, %rdi
	movl	$72, %esi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE12527:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev:
.LFB12529:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE12529:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev:
.LFB12531:
	.cfi_startproc
	endbr64
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE(%rip), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rax, (%rdi)
	movq	%rdi, %rbp
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbp, %rdi
	movl	$64, %esi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE12531:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev
	.text
	.p2align 4
	.globl	_Z19mul_mt_internal_f64PdS_S_iiiii
	.type	_Z19mul_mt_internal_f64PdS_S_iiiii, @function
_Z19mul_mt_internal_f64PdS_S_iiiii:
.LFB10944:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rdi, %r15
	pushq	%r14
	.cfi_offset 14, -32
	movq	%rsi, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$744, %rsp
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdx, 64(%rsp)
	movl	%r8d, 388(%rsp)
	movl	%r9d, 48(%rsp)
	movl	24(%rbp), %eax
	movl	24(%rbp), %ebx
	subl	16(%rbp), %eax
	andl	$3, %eax
	subl	%eax, %ebx
	movl	%ebx, -20(%rsp)
	cmpl	16(%rbp), %ebx
	jle	.L173
	movl	%r9d, %esi
	sall	$6, %esi
	movl	%esi, -72(%rsp)
	movl	%r8d, %esi
	sall	$6, %esi
	movl	%esi, -24(%rsp)
	movl	%r9d, %esi
	imull	16(%rbp), %esi
	movl	%r9d, %eax
	andl	$-4, %eax
	movl	%esi, -64(%rsp)
	movl	16(%rbp), %esi
	movl	%eax, %ebx
	movl	%eax, 52(%rsp)
	leal	0(,%r9,4), %eax
	leal	1(%rsi), %edx
	movl	%eax, 16(%rsp)
	movl	%r9d, %eax
	imull	%edx, %eax
	movl	%r9d, %edi
	movl	%r8d, %r11d
	movl	%eax, -60(%rsp)
	movl	16(%rbp), %eax
	andl	$-16, %r11d
	leal	2(%rax), %ecx
	movl	%r9d, %eax
	imull	%ecx, %eax
	movl	%r11d, 356(%rsp)
	movl	$0, -28(%rsp)
	movl	%eax, -56(%rsp)
	movl	16(%rbp), %eax
	movl	$0, -32(%rsp)
	addl	$3, %eax
	imull	%eax, %edi
	movl	%edi, -52(%rsp)
	leal	0(,%r8,4), %edi
	movl	%edi, 336(%rsp)
	movl	%r8d, %edi
	imull	%edi, %eax
	imull	%edi, %edx
	imull	16(%rbp), %r8d
	movl	%eax, -36(%rsp)
	leal	(%rdi,%rdi), %eax
	movl	%eax, 24(%rsp)
	leal	-1(%r11), %eax
	shrl	$4, %eax
	salq	$4, %rax
	movq	%rax, 128(%rsp)
	movl	%ebx, %eax
	imull	%edi, %eax
	movl	%edx, -44(%rsp)
	movl	%edi, %edx
	movl	%eax, 12(%rsp)
	leal	-1(%rdi), %eax
	movl	%eax, 124(%rsp)
	movl	%edi, %eax
	shrl	$2, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	andl	$-4, %edx
	imull	%edi, %ecx
	movq	%rax, 104(%rsp)
	leal	-1(%r9), %eax
	movl	%edx, 120(%rsp)
	subl	%ebx, %eax
	movslq	%ebx, %rdx
	addq	%rdx, %rax
	movl	%r8d, -48(%rsp)
	movl	%ecx, -40(%rsp)
	movq	%rdx, -8(%rsp)
	movq	%rax, -16(%rsp)
.L172:
	movl	16(%rbp), %eax
	addl	$64, 16(%rbp)
	movl	-20(%rsp), %ebx
	movl	%eax, -68(%rsp)
	addl	$63, %eax
	cmpl	%eax, %ebx
	cmovg	16(%rbp), %ebx
	movl	52(%rsp), %r9d
	movl	%ebx, 36(%rsp)
	testl	%r9d, %r9d
	jle	.L195
	movl	-32(%rsp), %eax
	movl	-64(%rsp), %ebx
	movq	$0, 40(%rsp)
	addl	%eax, %ebx
	movl	%ebx, -104(%rsp)
	movl	-60(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -100(%rsp)
	movl	-56(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -96(%rsp)
	movl	-52(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -92(%rsp)
	movl	-28(%rsp), %eax
	movl	-48(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -88(%rsp)
	movl	-44(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -84(%rsp)
	movl	-40(%rsp), %ebx
	addl	%eax, %ebx
	movl	%ebx, -80(%rsp)
	movl	-36(%rsp), %ebx
	addl	%eax, %ebx
	movl	388(%rsp), %eax
	movl	%ebx, -76(%rsp)
	movl	%eax, 32(%rsp)
.L194:
	movq	40(%rsp), %rbx
	movl	52(%rsp), %esi
	movl	%ebx, %eax
	leal	63(%rbx), %edx
	addl	$64, %eax
	cmpl	%edx, %esi
	cmovle	%esi, %eax
	movl	-68(%rsp), %esi
	movl	%eax, 28(%rsp)
	cmpl	%esi, 36(%rsp)
	jle	.L175
	subl	%ebx, %eax
	decl	%eax
	shrl	$2, %eax
	salq	$2, %rax
	movq	%rax, (%rsp)
	movl	-76(%rsp), %eax
	movl	24(%rsp), %edx
	movl	%eax, 100(%rsp)
	movl	-80(%rsp), %eax
	addl	32(%rsp), %edx
	movl	%eax, 384(%rsp)
	movl	-84(%rsp), %eax
	movl	%ebx, 20(%rsp)
	movl	%eax, 96(%rsp)
	movl	-88(%rsp), %eax
	movl	%edx, 8(%rsp)
	movl	%eax, 92(%rsp)
	movl	-92(%rsp), %eax
	movl	%esi, 88(%rsp)
	movl	%eax, 84(%rsp)
	movl	-96(%rsp), %eax
	movq	%r15, 56(%rsp)
	movl	%eax, 80(%rsp)
	movl	-100(%rsp), %eax
	movq	%r14, 152(%rsp)
	movl	%eax, 76(%rsp)
	movl	-104(%rsp), %eax
	movl	%eax, 72(%rsp)
	leaq	128(%r14), %rax
	movq	%rax, 112(%rsp)
	.p2align 4,,10
	.p2align 3
.L176:
	movl	20(%rsp), %ebx
	cmpl	%ebx, 28(%rsp)
	jle	.L180
	movq	40(%rsp), %rsi
	movslq	72(%rsp), %rcx
	movq	64(%rsp), %rdi
	leaq	(%rsi,%rcx), %rax
	leaq	(%rdi,%rax,8), %rbx
	movslq	76(%rsp), %r12
	movslq	80(%rsp), %rdx
	movslq	84(%rsp), %rax
	addq	%rsi, %rdx
	addq	%rsi, %rax
	addq	%rsi, %r12
	leaq	(%rdi,%rdx,8), %r11
	leaq	(%rdi,%rax,8), %r15
	movq	%rdi, %rdx
	leaq	(%rdi,%r12,8), %r12
	movl	32(%rsp), %edi
	movl	24(%rsp), %r14d
	movl	%edi, %eax
	subl	388(%rsp), %eax
	addl	%eax, %r14d
	movl	%eax, 340(%rsp)
	movq	(%rsp), %rax
	movl	%r14d, 348(%rsp)
	addq	%rsi, %rax
	addq	%rcx, %rax
	leaq	32(%rdx,%rax,8), %rax
	movq	56(%rsp), %rsi
	movq	%rax, 144(%rsp)
	movslq	92(%rsp), %rax
	movl	%edi, 344(%rsp)
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, 376(%rsp)
	movslq	96(%rsp), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, 368(%rsp)
	movslq	384(%rsp), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, 136(%rsp)
	movslq	100(%rsp), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, 360(%rsp)
	movl	8(%rsp), %eax
	movl	%eax, 352(%rsp)
	.p2align 4,,10
	.p2align 3
.L179:
	movl	356(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L224
	movq	152(%rsp), %rsi
	movslq	344(%rsp), %rcx
	movslq	340(%rsp), %rdx
	leaq	(%rsi,%rcx,8), %r10
	movslq	348(%rsp), %rcx
	leaq	(%rsi,%rdx,8), %rax
	leaq	(%rsi,%rcx,8), %r9
	movslq	352(%rsp), %rcx
	addq	128(%rsp), %rdx
	leaq	(%rsi,%rcx,8), %r8
	movq	112(%rsp), %rsi
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	(%rsi,%rdx,8), %r13
	movq	360(%rsp), %rdi
	movq	136(%rsp), %rsi
	movq	368(%rsp), %rcx
	movq	376(%rsp), %rdx
	vmovapd	%ymm1, 712(%rsp)
	vmovapd	%ymm1, %ymm2
	vmovapd	%ymm1, %ymm3
	vmovapd	%ymm1, %ymm7
	vmovapd	%ymm1, 392(%rsp)
	vmovapd	%ymm1, 424(%rsp)
	vmovapd	%ymm1, 456(%rsp)
	vmovapd	%ymm1, 488(%rsp)
	vmovapd	%ymm1, 520(%rsp)
	vmovapd	%ymm1, 552(%rsp)
	vmovapd	%ymm1, 584(%rsp)
	vmovapd	%ymm1, 616(%rsp)
	vmovapd	%ymm1, 648(%rsp)
	vmovapd	%ymm1, 680(%rsp)
	vmovapd	%ymm1, %ymm10
	vmovapd	%ymm1, %ymm11
	.p2align 4,,10
	.p2align 3
.L177:
	vmovupd	(%r9), %ymm1
	vmovupd	(%rdx), %ymm0
	vmovapd	680(%rsp), %ymm6
	vmovupd	32(%rdx), %ymm9
	vfmadd231pd	%ymm1, %ymm0, %ymm6
	vmovupd	(%r10), %ymm4
	vmovupd	(%r8), %ymm13
	vfmadd231pd	(%rax), %ymm0, %ymm11
	vfmadd231pd	%ymm4, %ymm0, %ymm10
	vfmadd231pd	32(%r9), %ymm9, %ymm6
	vfmadd213pd	648(%rsp), %ymm13, %ymm0
	vmovupd	32(%r8), %ymm12
	vmovupd	64(%rdx), %ymm5
	vfmadd231pd	32(%rax), %ymm9, %ymm11
	vfmadd231pd	32(%r10), %ymm9, %ymm10
	vfmadd231pd	64(%r9), %ymm5, %ymm6
	vfmadd231pd	%ymm12, %ymm9, %ymm0
	vmovupd	96(%rdx), %ymm8
	vfmadd231pd	64(%rax), %ymm5, %ymm11
	vfmadd231pd	64(%r10), %ymm5, %ymm10
	vfmadd231pd	96(%r9), %ymm8, %ymm6
	vfmadd132pd	64(%r8), %ymm0, %ymm5
	vmovapd	616(%rsp), %ymm9
	vmovupd	(%rcx), %ymm0
	vfmadd231pd	96(%rax), %ymm8, %ymm11
	vfmadd231pd	96(%r10), %ymm8, %ymm10
	vmovapd	%ymm6, 680(%rsp)
	vfmadd132pd	96(%r8), %ymm5, %ymm8
	vmovapd	552(%rsp), %ymm6
	vfmadd231pd	(%rax), %ymm0, %ymm9
	vfmadd231pd	%ymm1, %ymm0, %ymm6
	vmovupd	32(%rcx), %ymm15
	vmovapd	%ymm8, 648(%rsp)
	vmovapd	584(%rsp), %ymm8
	vmovupd	64(%rcx), %ymm5
	vmovupd	96(%rcx), %ymm14
	vfmadd231pd	%ymm4, %ymm0, %ymm8
	vfmadd213pd	520(%rsp), %ymm13, %ymm0
	vfmadd231pd	32(%rax), %ymm15, %ymm9
	vfmadd231pd	32(%r9), %ymm15, %ymm6
	subq	$-128, %rax
	vfmadd231pd	32(%r10), %ymm15, %ymm8
	vfmadd231pd	%ymm12, %ymm15, %ymm0
	vfmadd231pd	-64(%rax), %ymm5, %ymm9
	vfmadd231pd	64(%r9), %ymm5, %ymm6
	vmovupd	32(%rsi), %ymm15
	vfmadd231pd	64(%r10), %ymm5, %ymm8
	vfmadd132pd	64(%r8), %ymm0, %ymm5
	vfmadd231pd	-32(%rax), %ymm14, %ymm9
	vfmadd231pd	96(%r9), %ymm14, %ymm6
	vmovupd	(%rsi), %ymm0
	vfmadd231pd	96(%r10), %ymm14, %ymm8
	vfmadd132pd	96(%r8), %ymm5, %ymm14
	vmovapd	%ymm9, 616(%rsp)
	vmovapd	%ymm6, 552(%rsp)
	vmovapd	488(%rsp), %ymm9
	vmovapd	424(%rsp), %ymm6
	vfmadd231pd	-128(%rax), %ymm0, %ymm9
	vfmadd231pd	%ymm1, %ymm0, %ymm6
	vmovapd	%ymm8, 584(%rsp)
	vmovapd	456(%rsp), %ymm8
	vmovupd	64(%rsi), %ymm5
	vfmadd231pd	%ymm4, %ymm0, %ymm8
	vfmadd231pd	32(%r9), %ymm15, %ymm6
	vfmadd231pd	-96(%rax), %ymm15, %ymm9
	vfmadd213pd	392(%rsp), %ymm13, %ymm0
	vmovapd	%ymm14, 520(%rsp)
	vfmadd231pd	32(%r10), %ymm15, %ymm8
	vfmadd231pd	64(%r9), %ymm5, %ymm6
	vfmadd231pd	-64(%rax), %ymm5, %ymm9
	vfmadd231pd	%ymm12, %ymm15, %ymm0
	vmovupd	96(%rsi), %ymm14
	vfmadd231pd	64(%r10), %ymm5, %ymm8
	subq	$-128, %r9
	subq	$-128, %r10
	vfmadd132pd	64(%r8), %ymm0, %ymm5
	vfmadd231pd	-32(%rax), %ymm14, %ymm9
	vfmadd231pd	-32(%r9), %ymm14, %ymm6
	vfmadd231pd	-32(%r10), %ymm14, %ymm8
	vmovupd	64(%rdi), %ymm0
	vfmadd132pd	96(%r8), %ymm5, %ymm14
	vmovupd	32(%rdi), %ymm5
	vmovapd	%ymm6, 424(%rsp)
	vmovupd	(%rdi), %ymm6
	vmovapd	%ymm8, 456(%rsp)
	vfmadd231pd	-128(%rax), %ymm6, %ymm7
	vfmadd132pd	%ymm6, %ymm3, %ymm4
	vfmadd132pd	%ymm6, %ymm2, %ymm1
	vfmadd213pd	712(%rsp), %ymm13, %ymm6
	vmovupd	96(%rdi), %ymm8
	vfmadd231pd	-96(%rax), %ymm5, %ymm7
	vmovapd	%ymm4, %ymm3
	vfmadd231pd	-96(%r10), %ymm5, %ymm3
	vfmadd231pd	-96(%r9), %ymm5, %ymm1
	vfmadd132pd	%ymm12, %ymm6, %ymm5
	vmovapd	%ymm7, %ymm2
	vfmadd231pd	-64(%rax), %ymm0, %ymm2
	vfmadd231pd	-64(%r10), %ymm0, %ymm3
	vfmadd231pd	-64(%r9), %ymm0, %ymm1
	vfmadd132pd	64(%r8), %ymm5, %ymm0
	vmovapd	%ymm9, 488(%rsp)
	vmovapd	%ymm2, %ymm7
	vfmadd231pd	-32(%rax), %ymm8, %ymm7
	vfmadd231pd	-32(%r9), %ymm8, %ymm1
	vfmadd231pd	-32(%r10), %ymm8, %ymm3
	vfmadd132pd	96(%r8), %ymm0, %ymm8
	vmovapd	%ymm14, 392(%rsp)
	subq	$-128, %r8
	vmovapd	%ymm1, %ymm2
	subq	$-128, %rdx
	vmovapd	%ymm8, 712(%rsp)
	subq	$-128, %rcx
	subq	$-128, %rsi
	subq	$-128, %rdi
	cmpq	%rax, %r13
	jne	.L177
	vhaddpd	%xmm14, %xmm14, %xmm1
	vmovapd	424(%rsp), %ymm4
	vextractf128	$0x1, %ymm14, %xmm0
	vmovq	%xmm1, %rax
	vextractf128	$0x1, %ymm7, %xmm1
	vmovlpd	%xmm1, 328(%rsp)
	vunpckhpd	%xmm1, %xmm1, %xmm12
	vextractf128	$0x1, %ymm3, %xmm1
	vmovhpd	%xmm1, 320(%rsp)
	vmovlpd	%xmm1, 312(%rsp)
	vextractf128	$0x1, %ymm2, %xmm1
	vhaddpd	%xmm9, %xmm9, %xmm5
	vmovhpd	%xmm1, 304(%rsp)
	vmovlpd	%xmm1, 296(%rsp)
	vextractf128	$0x1, %ymm8, %xmm1
	vmovlpd	%xmm0, 392(%rsp)
	vmovlpd	%xmm1, 288(%rsp)
	vmovhpd	%xmm0, 280(%rsp)
	vunpckhpd	%xmm1, %xmm1, %xmm15
	vextractf128	$0x1, %ymm4, %xmm0
	vhaddpd	%xmm4, %xmm4, %xmm1
	vmovapd	456(%rsp), %ymm4
	vmovlpd	%xmm0, 424(%rsp)
	vmovhpd	%xmm0, 272(%rsp)
	vmovq	%xmm5, %rdx
	vextractf128	$0x1, %ymm4, %xmm0
	vmovapd	520(%rsp), %ymm5
	vmovapd	552(%rsp), %ymm6
	vmovlpd	%xmm0, 456(%rsp)
	vmovhpd	%xmm0, 264(%rsp)
	vextractf128	$0x1, %ymm9, %xmm0
	vmovlpd	%xmm0, 488(%rsp)
	vmovhpd	%xmm0, 256(%rsp)
	vextractf128	$0x1, %ymm5, %xmm0
	vmovlpd	%xmm0, 520(%rsp)
	vmovhpd	%xmm0, 248(%rsp)
	vextractf128	$0x1, %ymm6, %xmm0
	vmovlpd	%xmm0, 552(%rsp)
	vmovhpd	%xmm0, 240(%rsp)
	vmovapd	584(%rsp), %ymm0
	vmovapd	616(%rsp), %ymm14
	vhaddpd	%xmm4, %xmm4, %xmm13
	vhaddpd	%xmm5, %xmm5, %xmm4
	vhaddpd	%xmm6, %xmm6, %xmm5
	vhaddpd	%xmm0, %xmm0, %xmm6
	vextractf128	$0x1, %ymm0, %xmm0
	vmovlpd	%xmm0, 584(%rsp)
	vmovhpd	%xmm0, 232(%rsp)
	vhaddpd	%xmm14, %xmm14, %xmm0
	vhaddpd	%xmm7, %xmm7, %xmm7
	vhaddpd	%xmm2, %xmm2, %xmm2
	vmovq	%xmm0, %rcx
	vextractf128	$0x1, %ymm14, %xmm0
	vmovlpd	%xmm0, 616(%rsp)
	vmovhpd	%xmm0, 224(%rsp)
	vmovapd	648(%rsp), %ymm0
	vhaddpd	%xmm0, %xmm0, %xmm8
	vextractf128	$0x1, %ymm0, %xmm0
	vmovlpd	%xmm0, 648(%rsp)
	vmovhpd	%xmm0, 216(%rsp)
	vmovapd	680(%rsp), %ymm0
	vhaddpd	%xmm0, %xmm0, %xmm9
	vextractf128	$0x1, %ymm0, %xmm0
	vmovlpd	%xmm0, 680(%rsp)
	vmovhpd	%xmm0, 208(%rsp)
	vhaddpd	%xmm10, %xmm10, %xmm0
	vmovapd	712(%rsp), %xmm14
	vmovsd	%xmm7, 168(%rsp)
	vmovq	%xmm0, %rsi
	vextractf128	$0x1, %ymm10, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm10
	vmovhpd	%xmm0, 200(%rsp)
	vhaddpd	%xmm11, %xmm11, %xmm0
	vmovsd	%xmm2, 160(%rsp)
	vmovq	%xmm0, %rdi
	vextractf128	$0x1, %ymm11, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm11
	vmovhpd	%xmm0, 192(%rsp)
	vhaddpd	%xmm3, %xmm3, %xmm0
	vhaddpd	%xmm14, %xmm14, %xmm3
	vmovsd	%xmm0, 184(%rsp)
	vmovsd	%xmm3, 176(%rsp)
.L184:
	vmovq	%rdi, %xmm7
	vaddsd	%xmm11, %xmm7, %xmm7
	vmovq	%rsi, %xmm3
	movl	356(%rsp), %esi
	vmovsd	%xmm7, 712(%rsp)
	vaddsd	%xmm10, %xmm3, %xmm7
	vmovq	%rcx, %xmm3
	vaddsd	680(%rsp), %xmm9, %xmm9
	vmovq	%xmm7, %r14
	vaddsd	616(%rsp), %xmm3, %xmm7
	vaddsd	648(%rsp), %xmm8, %xmm8
	vaddsd	584(%rsp), %xmm6, %xmm6
	vmovq	%xmm7, %r10
	vmovq	%rdx, %xmm7
	vaddsd	488(%rsp), %xmm7, %xmm3
	vmovsd	320(%rsp), %xmm7
	vaddsd	552(%rsp), %xmm5, %xmm5
	vmovq	%xmm3, %r8
	vmovq	%rax, %xmm3
	vaddsd	392(%rsp), %xmm3, %xmm2
	vaddsd	312(%rsp), %xmm7, %xmm3
	vmovsd	304(%rsp), %xmm7
	vaddsd	520(%rsp), %xmm4, %xmm4
	vmovq	%xmm3, %r13
	vaddsd	296(%rsp), %xmm7, %xmm3
	vaddsd	456(%rsp), %xmm13, %xmm0
	vaddsd	424(%rsp), %xmm1, %xmm1
	vmovsd	%xmm3, %xmm3, %xmm14
	vaddsd	288(%rsp), %xmm15, %xmm3
	vaddsd	328(%rsp), %xmm12, %xmm12
	vmovq	%xmm2, %r9
	vmovsd	%xmm3, %xmm3, %xmm15
	cmpl	%esi, 388(%rsp)
	jle	.L182
	movq	152(%rsp), %rcx
	movslq	340(%rsp), %rdx
	movq	%r10, 552(%rsp)
	leaq	(%rcx,%rdx,8), %rdi
	movslq	344(%rsp), %rdx
	movslq	356(%rsp), %rax
	leaq	(%rcx,%rdx,8), %rsi
	movslq	348(%rsp), %rdx
	movq	%rsi, %r10
	leaq	(%rcx,%rdx,8), %rdx
	movq	%rdx, 680(%rsp)
	movslq	352(%rsp), %rdx
	vmovsd	%xmm4, 648(%rsp)
	leaq	(%rcx,%rdx,8), %rdx
	movq	680(%rsp), %rsi
	vmovsd	%xmm5, 616(%rsp)
	vmovsd	%xmm2, 584(%rsp)
	movq	%rdx, %r9
	.p2align 4,,10
	.p2align 3
.L181:
	movq	376(%rsp), %rcx
	vmovsd	(%rdi,%rax,8), %xmm7
	vmovsd	(%rcx,%rax,8), %xmm11
	vmovsd	%xmm7, %xmm7, %xmm13
	vfmadd213sd	(%rbx), %xmm11, %xmm13
	vmovsd	(%r10,%rax,8), %xmm5
	movq	368(%rsp), %rcx
	movq	360(%rsp), %rdx
	vmovsd	(%rsi,%rax,8), %xmm4
	vmovsd	(%rdx,%rax,8), %xmm2
	vmovsd	(%r9,%rax,8), %xmm3
	vmovsd	(%rcx,%rax,8), %xmm10
	vmovsd	%xmm13, (%rbx)
	vmovsd	%xmm5, %xmm5, %xmm13
	vfmadd213sd	8(%rbx), %xmm11, %xmm13
	incq	%rax
	vmovsd	%xmm13, 8(%rbx)
	vmovsd	%xmm4, %xmm4, %xmm13
	vfmadd213sd	16(%rbx), %xmm11, %xmm13
	vfmadd213sd	24(%rbx), %xmm3, %xmm11
	vmovsd	%xmm13, 16(%rbx)
	vmovsd	%xmm11, 24(%rbx)
	vmovsd	%xmm7, %xmm7, %xmm11
	vfmadd213sd	(%r12), %xmm10, %xmm11
	vmovsd	%xmm11, (%r12)
	vmovsd	%xmm5, %xmm5, %xmm11
	vfmadd213sd	8(%r12), %xmm10, %xmm11
	vmovsd	%xmm11, 8(%r12)
	vmovsd	%xmm4, %xmm4, %xmm11
	vfmadd213sd	16(%r12), %xmm10, %xmm11
	vfmadd213sd	24(%r12), %xmm3, %xmm10
	vmovsd	%xmm11, 16(%r12)
	vmovsd	%xmm10, 24(%r12)
	vmovsd	%xmm7, %xmm7, %xmm10
	vfmadd213sd	(%r11), %xmm2, %xmm10
	vmovsd	%xmm10, (%r11)
	vmovsd	%xmm5, %xmm5, %xmm10
	vfmadd213sd	8(%r11), %xmm2, %xmm10
	vmovsd	%xmm10, 8(%r11)
	vmovsd	%xmm4, %xmm4, %xmm10
	vfmadd213sd	16(%r11), %xmm2, %xmm10
	vmovsd	%xmm10, 16(%r11)
	vmovsd	%xmm3, %xmm3, %xmm10
	vfmadd213sd	24(%r11), %xmm2, %xmm10
	vmovsd	%xmm10, 24(%r11)
	vfmadd213sd	(%r15), %xmm2, %xmm7
	vfmadd213sd	8(%r15), %xmm2, %xmm5
	vfmadd213sd	16(%r15), %xmm2, %xmm4
	vfmadd213sd	24(%r15), %xmm2, %xmm3
	vmovsd	%xmm7, (%r15)
	vmovsd	%xmm5, 8(%r15)
	vmovsd	%xmm4, 16(%r15)
	vmovsd	%xmm3, 24(%r15)
	cmpl	%eax, 388(%rsp)
	jg	.L181
	vmovsd	648(%rsp), %xmm4
	vmovsd	616(%rsp), %xmm5
	movq	584(%rsp), %r9
	movq	552(%rsp), %r10
.L182:
	vmovsd	208(%rsp), %xmm3
	vmovsd	200(%rsp), %xmm7
	vaddsd	16(%rbx), %xmm3, %xmm10
	vaddsd	8(%rbx), %xmm7, %xmm11
	vmovsd	192(%rsp), %xmm2
	vmovsd	216(%rsp), %xmm7
	vaddsd	(%rbx), %xmm2, %xmm13
	vaddsd	%xmm9, %xmm10, %xmm10
	vaddsd	24(%rbx), %xmm7, %xmm9
	vmovq	%r14, %xmm2
	vaddsd	712(%rsp), %xmm13, %xmm13
	vaddsd	%xmm2, %xmm11, %xmm11
	vaddsd	%xmm8, %xmm9, %xmm9
	vmovsd	232(%rsp), %xmm7
	vmovsd	%xmm13, (%rbx)
	vmovsd	%xmm11, 8(%rbx)
	vmovsd	%xmm10, 16(%rbx)
	vmovsd	%xmm9, 24(%rbx)
	vmovsd	224(%rsp), %xmm2
	vaddsd	8(%r12), %xmm7, %xmm7
	vaddsd	(%r12), %xmm2, %xmm8
	vmovsd	240(%rsp), %xmm2
	vaddsd	%xmm6, %xmm7, %xmm7
	vmovq	%r10, %xmm3
	vaddsd	16(%r12), %xmm2, %xmm6
	vaddsd	%xmm3, %xmm8, %xmm8
	vmovsd	248(%rsp), %xmm3
	vaddsd	%xmm5, %xmm6, %xmm6
	vaddsd	24(%r12), %xmm3, %xmm5
	vmovsd	%xmm7, 8(%r12)
	vmovsd	%xmm8, (%r12)
	vaddsd	%xmm4, %xmm5, %xmm5
	vmovsd	256(%rsp), %xmm4
	vmovsd	%xmm6, 16(%r12)
	vmovsd	%xmm5, 24(%r12)
	vaddsd	(%r11), %xmm4, %xmm4
	vmovq	%r8, %xmm7
	addq	$32, %rbx
	vaddsd	%xmm7, %xmm4, %xmm4
	addq	$32, %r12
	addq	$32, %r11
	vmovsd	%xmm4, -32(%r11)
	vmovsd	264(%rsp), %xmm4
	addq	$32, %r15
	vaddsd	-24(%r11), %xmm4, %xmm4
	vaddsd	%xmm0, %xmm4, %xmm0
	vmovsd	272(%rsp), %xmm4
	vmovsd	%xmm0, -24(%r11)
	vaddsd	-16(%r11), %xmm4, %xmm0
	movl	336(%rsp), %eax
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	280(%rsp), %xmm1
	addl	%eax, 340(%rsp)
	vmovsd	%xmm0, -16(%r11)
	vaddsd	-8(%r11), %xmm1, %xmm0
	vmovq	%r9, %xmm1
	addl	%eax, 344(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	168(%rsp), %xmm1
	addl	%eax, 348(%rsp)
	vmovsd	%xmm0, -8(%r11)
	vaddsd	-32(%r15), %xmm1, %xmm0
	vmovsd	184(%rsp), %xmm1
	addl	%eax, 352(%rsp)
	vaddsd	%xmm12, %xmm0, %xmm0
	vmovsd	%xmm0, -32(%r15)
	vaddsd	-24(%r15), %xmm1, %xmm0
	vmovq	%r13, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	160(%rsp), %xmm1
	vmovsd	%xmm0, -24(%r15)
	vaddsd	-16(%r15), %xmm1, %xmm0
	vmovsd	176(%rsp), %xmm1
	vaddsd	%xmm14, %xmm0, %xmm0
	vmovsd	%xmm0, -16(%r15)
	vaddsd	-8(%r15), %xmm1, %xmm0
	vaddsd	%xmm15, %xmm0, %xmm0
	vmovsd	%xmm0, -8(%r15)
	cmpq	%rbx, 144(%rsp)
	jne	.L179
.L180:
	movl	48(%rsp), %ebx
	cmpl	%ebx, 52(%rsp)
	jge	.L185
	movslq	72(%rsp), %rdi
	movq	-8(%rsp), %rax
	movq	64(%rsp), %rbx
	addq	%rdi, %rax
	leaq	(%rbx,%rax,8), %rcx
	movq	-16(%rsp), %rax
	movslq	96(%rsp), %rdx
	addq	%rdi, %rax
	leaq	8(%rbx,%rax,8), %rax
	movq	56(%rsp), %rbx
	movq	%rdx, 616(%rsp)
	leaq	(%rbx,%rdx,8), %r10
	movslq	384(%rsp), %rdx
	movq	%rax, 552(%rsp)
	leaq	(%rbx,%rdx,8), %r9
	movq	%rdx, 648(%rsp)
	movslq	100(%rsp), %rdx
	movslq	76(%rsp), %r12
	movslq	84(%rsp), %rax
	leaq	(%rbx,%rdx,8), %r8
	movq	%rdx, 680(%rsp)
	movslq	80(%rsp), %rdx
	movslq	92(%rsp), %r15
	subq	%rdi, %r12
	subq	%rdi, %rax
	subq	%rdi, %rdx
	movq	%r12, 488(%rsp)
	movq	%rax, 456(%rsp)
	leaq	(%rbx,%r15,8), %r11
	movq	%rdx, 520(%rsp)
	movq	%r15, 584(%rsp)
	movq	%rbx, %rdx
	movl	12(%rsp), %esi
	movl	96(%rsp), %r13d
	movl	100(%rsp), %r15d
	movl	92(%rsp), %r14d
	movq	152(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L186:
	movl	388(%rsp), %edi
	testl	%edi, %edi
	jle	.L225
	cmpl	$2, 124(%rsp)
	jbe	.L206
	vxorpd	%xmm1, %xmm1, %xmm1
	movslq	%esi, %rax
	movq	104(%rsp), %r12
	leaq	(%rbx,%rax,8), %rdi
	vmovapd	%ymm1, %ymm4
	xorl	%eax, %eax
	vmovapd	%ymm1, %ymm3
	vmovapd	%ymm1, %ymm2
	.p2align 4,,10
	.p2align 3
.L188:
	vmovupd	(%rdi,%rax), %ymm0
	vfmadd231pd	(%r11,%rax), %ymm0, %ymm2
	vfmadd231pd	(%r10,%rax), %ymm0, %ymm3
	vfmadd231pd	(%r9,%rax), %ymm0, %ymm4
	vfmadd231pd	(%r8,%rax), %ymm0, %ymm1
	addq	$32, %rax
	cmpq	%r12, %rax
	jne	.L188
	vextractf128	$0x1, %ymm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	movl	120(%rsp), %eax
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm1
	vextractf128	$0x1, %ymm4, %xmm0
	vaddpd	%xmm4, %xmm0, %xmm0
	movl	%eax, %edi
	vunpckhpd	%xmm0, %xmm0, %xmm4
	vaddpd	%xmm0, %xmm4, %xmm4
	vextractf128	$0x1, %ymm3, %xmm0
	vaddpd	%xmm3, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm3
	vaddpd	%xmm0, %xmm3, %xmm3
	vextractf128	$0x1, %ymm2, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm2
	cmpl	%eax, 388(%rsp)
	je	.L193
.L187:
	movl	388(%rsp), %r12d
	subl	%edi, %r12d
	movl	%r12d, 712(%rsp)
	cmpl	$1, %r12d
	je	.L190
	movslq	%esi, %r12
	addq	%rdi, %r12
	vmovupd	(%rbx,%r12,8), %xmm0
	movq	584(%rsp), %r12
	addq	%rdi, %r12
	vmulpd	(%rdx,%r12,8), %xmm0, %xmm6
	movq	616(%rsp), %r12
	addq	%rdi, %r12
	vmulpd	(%rdx,%r12,8), %xmm0, %xmm7
	movq	648(%rsp), %r12
	addq	%rdi, %r12
	addq	680(%rsp), %rdi
	vmulpd	(%rdx,%r12,8), %xmm0, %xmm8
	vmulpd	(%rdx,%rdi,8), %xmm0, %xmm0
	movl	712(%rsp), %r12d
	movl	%r12d, %edi
	andl	$-2, %edi
	vunpckhpd	%xmm0, %xmm0, %xmm5
	vaddpd	%xmm0, %xmm5, %xmm0
	addl	%edi, %eax
	vaddsd	%xmm0, %xmm1, %xmm1
	vunpckhpd	%xmm8, %xmm8, %xmm0
	vaddpd	%xmm8, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm4, %xmm4
	vunpckhpd	%xmm7, %xmm7, %xmm0
	vaddpd	%xmm7, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm3, %xmm3
	vunpckhpd	%xmm6, %xmm6, %xmm0
	vaddpd	%xmm6, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r12d, %edi
	je	.L193
.L190:
	leal	(%rsi,%rax), %edi
	movslq	%edi, %rdi
	vmovsd	(%rbx,%rdi,8), %xmm0
	leal	(%r14,%rax), %edi
	movslq	%edi, %rdi
	vfmadd231sd	(%rdx,%rdi,8), %xmm0, %xmm2
	leal	0(%r13,%rax), %edi
	movslq	%edi, %rdi
	vfmadd231sd	(%rdx,%rdi,8), %xmm0, %xmm3
	movl	384(%rsp), %edi
	addl	%eax, %edi
	addl	%r15d, %eax
	movslq	%edi, %rdi
	cltq
	vfmadd231sd	(%rdx,%rdi,8), %xmm0, %xmm4
	vfmadd231sd	(%rdx,%rax,8), %xmm0, %xmm1
.L193:
	vaddsd	(%rcx), %xmm2, %xmm2
	movq	488(%rsp), %rax
	addl	388(%rsp), %esi
	vmovsd	%xmm2, (%rcx)
	vaddsd	(%rcx,%rax,8), %xmm3, %xmm3
	vmovsd	%xmm3, (%rcx,%rax,8)
	movq	520(%rsp), %rax
	vaddsd	(%rcx,%rax,8), %xmm4, %xmm4
	vmovsd	%xmm4, (%rcx,%rax,8)
	movq	456(%rsp), %rax
	vaddsd	(%rcx,%rax,8), %xmm1, %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	addq	$8, %rcx
	cmpq	%rcx, 552(%rsp)
	jne	.L186
.L185:
	addl	$4, 88(%rsp)
	movl	16(%rsp), %eax
	addl	%eax, 72(%rsp)
	addl	%eax, 76(%rsp)
	addl	%eax, 80(%rsp)
	addl	%eax, 84(%rsp)
	movl	88(%rsp), %ebx
	movl	336(%rsp), %eax
	addl	%eax, 92(%rsp)
	addl	%eax, 96(%rsp)
	addl	%eax, 384(%rsp)
	addl	%eax, 100(%rsp)
	cmpl	%ebx, 36(%rsp)
	jg	.L176
	movq	56(%rsp), %r15
	movq	152(%rsp), %r14
.L175:
	addq	$64, 40(%rsp)
	movl	-24(%rsp), %ebx
	addl	%ebx, 32(%rsp)
	movq	40(%rsp), %rax
	cmpl	%eax, 52(%rsp)
	jg	.L194
.L195:
	movl	-72(%rsp), %ebx
	movl	-20(%rsp), %eax
	addl	%ebx, -32(%rsp)
	movl	-24(%rsp), %ebx
	addl	%ebx, -28(%rsp)
	cmpl	16(%rbp), %eax
	jg	.L172
.L173:
	movl	-20(%rsp), %eax
	cmpl	24(%rbp), %eax
	jge	.L222
	movl	48(%rsp), %edx
	testl	%edx, %edx
	jle	.L222
	movl	388(%rsp), %esi
	movl	%edx, %r13d
	imull	%eax, %r13d
	imull	%esi, %eax
	movl	%eax, %ebx
	leal	-1(%rsi), %eax
	movl	%eax, 680(%rsp)
	movl	%esi, %eax
	shrl	$2, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, %r12
	movq	64(%rsp), %rax
	andl	$-4, %esi
	addq	$8, %rax
	movq	%rax, 616(%rsp)
	leal	-1(%rdx), %eax
	movq	%rax, 648(%rsp)
	movl	%esi, %r11d
.L169:
	movq	64(%rsp), %rsi
	movslq	%r13d, %rax
	leaq	(%rsi,%rax,8), %r9
	movq	616(%rsp), %rsi
	addq	648(%rsp), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, 712(%rsp)
	movslq	%ebx, %r10
	leaq	(%r15,%r10,8), %rsi
	xorl	%ecx, %ecx
.L204:
	movl	388(%rsp), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	testl	%eax, %eax
	jle	.L203
	cmpl	$2, 680(%rsp)
	jbe	.L207
	movslq	%ecx, %rax
	leaq	(%r14,%rax,8), %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
.L197:
	vmovupd	(%rdx,%rax), %ymm4
	vfmadd231pd	(%rsi,%rax), %ymm4, %ymm0
	addq	$32, %rax
	cmpq	%rax, %r12
	jne	.L197
	vextractf128	$0x1, %ymm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	cmpl	%r11d, 388(%rsp)
	je	.L203
	movl	%r11d, %edx
	movl	%r11d, %eax
.L196:
	movl	388(%rsp), %r8d
	subl	%edx, %r8d
	cmpl	$1, %r8d
	je	.L199
	movslq	%ecx, %rdi
	addq	%rdx, %rdi
	addq	%r10, %rdx
	vmovupd	(%r15,%rdx,8), %xmm2
	movl	%r8d, %edx
	vmulpd	(%r14,%rdi,8), %xmm2, %xmm2
	andl	$-2, %edx
	addl	%edx, %eax
	vunpckhpd	%xmm2, %xmm2, %xmm1
	vaddpd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%r8d, %edx
	je	.L203
.L199:
	leal	(%rcx,%rax), %edx
	movslq	%edx, %rdx
	vmovsd	(%r14,%rdx,8), %xmm4
	addl	%ebx, %eax
	cltq
	vfmadd231sd	(%r15,%rax,8), %xmm4, %xmm0
.L203:
	vmovsd	%xmm0, (%r9)
	addq	$8, %r9
	addl	388(%rsp), %ecx
	cmpq	712(%rsp), %r9
	jne	.L204
	incl	-20(%rsp)
	addl	48(%rsp), %r13d
	addl	388(%rsp), %ebx
	movl	-20(%rsp), %eax
	cmpl	%eax, 24(%rbp)
	jne	.L169
.L222:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L224:
	.cfi_restore_state
	vxorpd	%xmm11, %xmm11, %xmm11
	movq	$0x000000000, 160(%rsp)
	movq	$0x000000000, 168(%rsp)
	movq	$0x000000000, 176(%rsp)
	movq	$0x000000000, 184(%rsp)
	movq	$0x000000000, 192(%rsp)
	vmovq	%xmm11, %rdi
	vmovsd	%xmm11, 200(%rsp)
	vmovsd	%xmm11, %xmm11, %xmm10
	vmovq	%xmm11, %rsi
	vmovsd	%xmm11, 208(%rsp)
	vmovsd	%xmm11, 680(%rsp)
	vmovsd	%xmm11, %xmm11, %xmm9
	vmovsd	%xmm11, 216(%rsp)
	vmovsd	%xmm11, 648(%rsp)
	vmovsd	%xmm11, %xmm11, %xmm8
	vmovsd	%xmm11, 224(%rsp)
	vmovsd	%xmm11, 616(%rsp)
	vmovq	%xmm11, %rcx
	vmovsd	%xmm11, 232(%rsp)
	vmovsd	%xmm11, 584(%rsp)
	vmovsd	%xmm11, %xmm11, %xmm6
	vmovsd	%xmm11, 240(%rsp)
	vmovsd	%xmm11, 552(%rsp)
	vmovsd	%xmm11, %xmm11, %xmm5
	vmovsd	%xmm11, 248(%rsp)
	vmovsd	%xmm11, 520(%rsp)
	vmovsd	%xmm11, %xmm11, %xmm4
	vmovsd	%xmm11, 256(%rsp)
	vmovsd	%xmm11, 488(%rsp)
	vmovq	%xmm11, %rdx
	vmovsd	%xmm11, 264(%rsp)
	vmovsd	%xmm11, 456(%rsp)
	vmovsd	%xmm11, %xmm11, %xmm13
	vmovsd	%xmm11, 272(%rsp)
	vmovsd	%xmm11, 424(%rsp)
	vmovsd	%xmm11, %xmm11, %xmm1
	vmovsd	%xmm11, 280(%rsp)
	vmovsd	%xmm11, 288(%rsp)
	vmovsd	%xmm11, %xmm11, %xmm15
	vmovsd	%xmm11, 296(%rsp)
	vmovsd	%xmm11, 304(%rsp)
	vmovsd	%xmm11, 312(%rsp)
	vmovsd	%xmm11, 320(%rsp)
	vmovsd	%xmm11, 328(%rsp)
	vmovsd	%xmm11, %xmm11, %xmm12
	vmovsd	%xmm11, 392(%rsp)
	vmovq	%xmm11, %rax
	jmp	.L184
	.p2align 4,,10
	.p2align 3
.L225:
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm4
	vmovsd	%xmm1, %xmm1, %xmm3
	vmovsd	%xmm1, %xmm1, %xmm2
	jmp	.L193
.L206:
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%edi, %edi
	xorl	%eax, %eax
	vmovsd	%xmm1, %xmm1, %xmm4
	vmovsd	%xmm1, %xmm1, %xmm3
	vmovsd	%xmm1, %xmm1, %xmm2
	jmp	.L187
.L207:
	xorl	%edx, %edx
	xorl	%eax, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	jmp	.L196
	.cfi_endproc
.LFE10944:
	.size	_Z19mul_mt_internal_f64PdS_S_iiiii, .-_Z19mul_mt_internal_f64PdS_S_iiiii
	.p2align 4
	.globl	_Z19mul_mt_f32_internalPfS_S_iiiii
	.type	_Z19mul_mt_f32_internalPfS_S_iiiii, @function
_Z19mul_mt_f32_internalPfS_S_iiiii:
.LFB10947:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rdi, %r15
	pushq	%r14
	.cfi_offset 14, -32
	movl	%r8d, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$840, %rsp
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, 144(%rsp)
	movq	%rdx, 64(%rsp)
	movl	%r9d, 56(%rsp)
	movl	24(%rbp), %eax
	movl	24(%rbp), %edi
	subl	16(%rbp), %eax
	andl	$3, %eax
	subl	%eax, %edi
	movl	%edi, -20(%rsp)
	cmpl	16(%rbp), %edi
	jle	.L233
	movl	%r9d, %esi
	sall	$7, %esi
	movl	%esi, -72(%rsp)
	movl	%r8d, %esi
	sall	$7, %esi
	movl	%esi, -24(%rsp)
	movl	%r9d, %esi
	imull	16(%rbp), %esi
	leal	0(,%r9,4), %eax
	movl	%eax, 24(%rsp)
	movl	%esi, -64(%rsp)
	movl	16(%rbp), %esi
	movl	%r9d, %eax
	leal	1(%rsi), %edx
	movl	%r9d, %esi
	imull	%edx, %esi
	movl	%r9d, %ebx
	movl	%r8d, %r11d
	movl	%esi, -60(%rsp)
	movl	16(%rbp), %esi
	andl	$-32, %r11d
	leal	2(%rsi), %ecx
	imull	%ecx, %eax
	movl	%r9d, %edi
	andl	$-4, %edi
	movl	%eax, -56(%rsp)
	movl	16(%rbp), %eax
	imull	%r8d, %edx
	addl	$3, %eax
	imull	%eax, %ebx
	imull	%r8d, %eax
	imull	%r8d, %ecx
	movl	%ebx, -52(%rsp)
	movl	%eax, -36(%rsp)
	leal	(%r8,%r8), %eax
	movl	%eax, 32(%rsp)
	leal	-1(%r11), %eax
	shrl	$5, %eax
	salq	$5, %rax
	movq	%rax, 112(%rsp)
	movl	%edi, %eax
	imull	%r8d, %eax
	leal	0(,%r8,4), %ebx
	movl	%ebx, 152(%rsp)
	movl	%eax, 8(%rsp)
	leal	-1(%r8), %eax
	movl	%eax, 120(%rsp)
	movl	%r8d, %eax
	shrl	$3, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, (%rsp)
	movl	16(%rbp), %ebx
	movl	%r8d, %eax
	andl	$-8, %eax
	imull	%r8d, %ebx
	movl	%eax, 100(%rsp)
	leal	-1(%r9), %eax
	movl	%edx, -44(%rsp)
	subl	%edi, %eax
	movslq	%edi, %rdx
	addq	%rdx, %rax
	movl	%edi, 60(%rsp)
	movl	%r11d, 544(%rsp)
	movl	%ebx, -48(%rsp)
	movl	%ecx, -40(%rsp)
	movl	$0, -28(%rsp)
	movl	$0, -32(%rsp)
	movq	%rdx, -8(%rsp)
	movq	%rax, -16(%rsp)
	movl	%r8d, 548(%rsp)
.L232:
	movl	16(%rbp), %eax
	subl	$-128, 16(%rbp)
	movl	-20(%rsp), %edi
	movl	%eax, -68(%rsp)
	addl	$127, %eax
	cmpl	%eax, %edi
	cmovg	16(%rbp), %edi
	movl	60(%rsp), %edx
	movl	%edi, 44(%rsp)
	testl	%edx, %edx
	jle	.L255
	movl	-32(%rsp), %eax
	movl	-64(%rsp), %edi
	movq	$0, 48(%rsp)
	addl	%eax, %edi
	movl	%edi, -104(%rsp)
	movl	-60(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -100(%rsp)
	movl	-56(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -96(%rsp)
	movl	-52(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -92(%rsp)
	movl	-28(%rsp), %eax
	movl	-48(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -88(%rsp)
	movl	-44(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -84(%rsp)
	movl	-40(%rsp), %edi
	addl	%eax, %edi
	movl	%edi, -80(%rsp)
	movl	-36(%rsp), %edi
	addl	%eax, %edi
	movl	548(%rsp), %eax
	movl	%edi, -76(%rsp)
	movl	%eax, 40(%rsp)
.L254:
	movq	48(%rsp), %rdi
	movl	60(%rsp), %esi
	movl	%edi, %eax
	leal	127(%rdi), %edx
	subl	$-128, %eax
	cmpl	%edx, %esi
	cmovle	%esi, %eax
	movl	-68(%rsp), %esi
	movl	%eax, 36(%rsp)
	cmpl	%esi, 44(%rsp)
	jle	.L235
	subl	%edi, %eax
	decl	%eax
	shrl	$2, %eax
	salq	$2, %rax
	movq	%rax, 16(%rsp)
	movl	-76(%rsp), %eax
	movl	32(%rsp), %edx
	movl	%eax, 164(%rsp)
	movl	-80(%rsp), %eax
	addl	40(%rsp), %edx
	movl	%eax, 160(%rsp)
	movl	-84(%rsp), %eax
	movl	%edi, 28(%rsp)
	movl	%eax, 156(%rsp)
	movl	-88(%rsp), %eax
	movl	%edx, 12(%rsp)
	movl	%eax, 124(%rsp)
	movl	-92(%rsp), %eax
	movl	%esi, 96(%rsp)
	movl	%eax, 84(%rsp)
	movl	-96(%rsp), %eax
	movq	%r15, 88(%rsp)
	movl	%eax, 80(%rsp)
	movl	-100(%rsp), %eax
	movl	%eax, 76(%rsp)
	movl	-104(%rsp), %eax
	movl	%eax, 72(%rsp)
	movq	144(%rsp), %rax
	subq	$-128, %rax
	movq	%rax, 104(%rsp)
	.p2align 4,,10
	.p2align 3
.L236:
	movl	28(%rsp), %edi
	cmpl	%edi, 36(%rsp)
	jle	.L240
	movq	48(%rsp), %rsi
	movslq	72(%rsp), %rcx
	movq	64(%rsp), %rdi
	movslq	76(%rsp), %rbx
	leaq	(%rsi,%rcx), %rax
	movslq	80(%rsp), %rdx
	leaq	(%rdi,%rax,4), %r12
	leaq	(%rbx,%rsi), %rax
	addq	%rsi, %rdx
	leaq	(%rdi,%rax,4), %rbx
	movslq	84(%rsp), %rax
	leaq	(%rdi,%rdx,4), %r15
	movl	40(%rsp), %edx
	addq	%rsi, %rax
	movl	32(%rsp), %r14d
	leaq	(%rdi,%rax,4), %r11
	movl	%edx, %eax
	subl	548(%rsp), %eax
	addl	%eax, %r14d
	movl	%eax, 504(%rsp)
	movq	16(%rsp), %rax
	movl	%r14d, 512(%rsp)
	addq	%rsi, %rax
	addq	%rcx, %rax
	leaq	16(%rdi,%rax,4), %rax
	movq	88(%rsp), %rsi
	movq	%rax, 136(%rsp)
	movslq	124(%rsp), %rax
	movl	%edx, 508(%rsp)
	leaq	(%rsi,%rax,4), %rax
	movq	%rax, 520(%rsp)
	movslq	156(%rsp), %rax
	leaq	(%rsi,%rax,4), %rax
	movq	%rax, 528(%rsp)
	movslq	160(%rsp), %rax
	leaq	(%rsi,%rax,4), %rax
	movq	%rax, 128(%rsp)
	movslq	164(%rsp), %rax
	leaq	(%rsi,%rax,4), %rax
	movq	%rax, 536(%rsp)
	movl	12(%rsp), %eax
	movl	%eax, 516(%rsp)
	.p2align 4,,10
	.p2align 3
.L239:
	movl	544(%rsp), %eax
	testl	%eax, %eax
	jle	.L278
	movq	144(%rsp), %rsi
	movslq	508(%rsp), %rcx
	movslq	504(%rsp), %rdx
	leaq	(%rsi,%rcx,4), %r10
	movslq	512(%rsp), %rcx
	leaq	(%rsi,%rdx,4), %rax
	leaq	(%rsi,%rcx,4), %r9
	movslq	516(%rsp), %rcx
	addq	112(%rsp), %rdx
	leaq	(%rsi,%rcx,4), %r8
	movq	104(%rsp), %rsi
	vxorps	%xmm3, %xmm3, %xmm3
	leaq	(%rsi,%rdx,4), %r13
	movq	536(%rsp), %rdi
	movq	128(%rsp), %rsi
	movq	528(%rsp), %rcx
	movq	520(%rsp), %rdx
	vmovaps	%ymm3, %ymm4
	vmovaps	%ymm3, %ymm5
	vmovaps	%ymm3, %ymm6
	vmovaps	%ymm3, 552(%rsp)
	vmovaps	%ymm3, 584(%rsp)
	vmovaps	%ymm3, 616(%rsp)
	vmovaps	%ymm3, 648(%rsp)
	vmovaps	%ymm3, 680(%rsp)
	vmovaps	%ymm3, 712(%rsp)
	vmovaps	%ymm3, 744(%rsp)
	vmovaps	%ymm3, 776(%rsp)
	vmovaps	%ymm3, 808(%rsp)
	vmovaps	%ymm3, %ymm9
	vmovaps	%ymm3, %ymm11
	vmovaps	%ymm3, %ymm10
	.p2align 4,,10
	.p2align 3
.L237:
	vmovups	(%r9), %ymm1
	vmovups	(%r8), %ymm13
	vmovups	(%rdx), %ymm0
	vmovups	32(%rdx), %ymm8
	vfmadd231ps	(%rax), %ymm0, %ymm10
	vfmadd231ps	(%r10), %ymm0, %ymm11
	vfmadd231ps	%ymm1, %ymm0, %ymm9
	vfmadd213ps	808(%rsp), %ymm13, %ymm0
	vmovups	64(%rdx), %ymm2
	vfmadd231ps	32(%rax), %ymm8, %ymm10
	vfmadd231ps	32(%r10), %ymm8, %ymm11
	vfmadd231ps	32(%r9), %ymm8, %ymm9
	vfmadd231ps	32(%r8), %ymm8, %ymm0
	vmovups	96(%rdx), %ymm7
	vfmadd231ps	64(%rax), %ymm2, %ymm10
	vfmadd231ps	64(%r10), %ymm2, %ymm11
	vfmadd231ps	64(%r9), %ymm2, %ymm9
	vfmadd132ps	64(%r8), %ymm0, %ymm2
	vmovaps	776(%rsp), %ymm12
	vfmadd231ps	96(%rax), %ymm7, %ymm10
	vfmadd231ps	96(%r10), %ymm7, %ymm11
	vfmadd231ps	96(%r9), %ymm7, %ymm9
	vfmadd132ps	96(%r8), %ymm2, %ymm7
	vmovups	(%rcx), %ymm0
	vmovaps	744(%rsp), %ymm8
	vfmadd231ps	(%rax), %ymm0, %ymm12
	vfmadd231ps	(%r10), %ymm0, %ymm8
	vmovaps	%ymm7, 808(%rsp)
	vmovaps	712(%rsp), %ymm7
	vmovups	32(%rcx), %ymm15
	vfmadd231ps	%ymm1, %ymm0, %ymm7
	vmovups	64(%rcx), %ymm2
	vmovups	96(%rcx), %ymm14
	vfmadd213ps	680(%rsp), %ymm13, %ymm0
	vfmadd231ps	32(%rax), %ymm15, %ymm12
	vfmadd231ps	32(%r10), %ymm15, %ymm8
	vfmadd231ps	32(%r9), %ymm15, %ymm7
	subq	$-128, %rax
	vfmadd231ps	32(%r8), %ymm15, %ymm0
	vfmadd231ps	-64(%rax), %ymm2, %ymm12
	vfmadd231ps	64(%r10), %ymm2, %ymm8
	vfmadd231ps	64(%r9), %ymm2, %ymm7
	vmovups	32(%rsi), %ymm15
	vfmadd132ps	64(%r8), %ymm0, %ymm2
	vfmadd231ps	-32(%rax), %ymm14, %ymm12
	vfmadd231ps	96(%r10), %ymm14, %ymm8
	vfmadd231ps	96(%r9), %ymm14, %ymm7
	vmovups	(%rsi), %ymm0
	vfmadd132ps	96(%r8), %ymm2, %ymm14
	vmovaps	%ymm12, 776(%rsp)
	vmovaps	%ymm8, 744(%rsp)
	vmovaps	648(%rsp), %ymm12
	vmovaps	616(%rsp), %ymm8
	vmovaps	%ymm7, 712(%rsp)
	vmovaps	584(%rsp), %ymm7
	vfmadd231ps	(%r10), %ymm0, %ymm8
	vfmadd231ps	-128(%rax), %ymm0, %ymm12
	vfmadd231ps	%ymm1, %ymm0, %ymm7
	vfmadd213ps	552(%rsp), %ymm13, %ymm0
	vmovups	64(%rsi), %ymm2
	vfmadd231ps	32(%r10), %ymm15, %ymm8
	vfmadd231ps	-96(%rax), %ymm15, %ymm12
	vfmadd231ps	32(%r9), %ymm15, %ymm7
	vfmadd231ps	32(%r8), %ymm15, %ymm0
	vmovaps	%ymm14, 680(%rsp)
	vfmadd231ps	64(%r10), %ymm2, %ymm8
	vmovups	96(%rsi), %ymm14
	vfmadd231ps	-64(%rax), %ymm2, %ymm12
	vfmadd231ps	64(%r9), %ymm2, %ymm7
	vfmadd132ps	64(%r8), %ymm0, %ymm2
	vfmadd231ps	96(%r10), %ymm14, %ymm8
	vmovups	64(%rdi), %ymm0
	vfmadd231ps	-32(%rax), %ymm14, %ymm12
	vfmadd231ps	96(%r9), %ymm14, %ymm7
	vfmadd132ps	96(%r8), %ymm2, %ymm14
	vmovups	32(%rdi), %ymm2
	vmovaps	%ymm8, 616(%rsp)
	vmovups	96(%rdi), %ymm8
	vmovaps	%ymm7, 584(%rsp)
	vmovups	(%rdi), %ymm7
	vmovaps	%ymm12, 648(%rsp)
	vfmadd231ps	-128(%rax), %ymm7, %ymm6
	vfmadd231ps	(%r10), %ymm7, %ymm5
	vfmadd132ps	%ymm7, %ymm4, %ymm1
	vfmadd132ps	%ymm13, %ymm3, %ymm7
	vmovaps	%ymm14, 552(%rsp)
	vfmadd231ps	-96(%rax), %ymm2, %ymm6
	vfmadd231ps	32(%r10), %ymm2, %ymm5
	vfmadd231ps	32(%r9), %ymm2, %ymm1
	vfmadd132ps	32(%r8), %ymm7, %ymm2
	subq	$-128, %r10
	vmovaps	%ymm6, %ymm3
	vfmadd231ps	-64(%rax), %ymm0, %ymm3
	vmovaps	%ymm5, %ymm4
	vfmadd231ps	-64(%r10), %ymm0, %ymm4
	vfmadd231ps	64(%r9), %ymm0, %ymm1
	vfmadd132ps	64(%r8), %ymm2, %ymm0
	vmovaps	%ymm3, %ymm6
	vmovaps	%ymm8, %ymm3
	vmovaps	%ymm4, %ymm5
	vmovaps	%ymm1, %ymm4
	vfmadd231ps	96(%r9), %ymm8, %ymm4
	vfmadd132ps	96(%r8), %ymm0, %ymm3
	vfmadd231ps	-32(%rax), %ymm8, %ymm6
	vfmadd231ps	-32(%r10), %ymm8, %ymm5
	subq	$-128, %r9
	subq	$-128, %r8
	subq	$-128, %rdx
	subq	$-128, %rcx
	subq	$-128, %rsi
	subq	$-128, %rdi
	cmpq	%rax, %r13
	jne	.L237
	vshufps	$85, %xmm5, %xmm5, %xmm2
	vaddss	%xmm5, %xmm2, %xmm1
	vextractps	$3, %xmm4, 444(%rsp)
	vmovaps	%xmm4, %xmm2
	vmovd	%xmm1, %r9d
	vextractf128	$0x1, %ymm4, %xmm1
	vmovss	%xmm1, 448(%rsp)
	vextractps	$3, %xmm1, 456(%rsp)
	vextractps	$2, %xmm1, 464(%rsp)
	vextractps	$1, %xmm1, 452(%rsp)
	vextractf128	$0x1, %ymm3, %xmm1
	vmovss	%xmm1, 424(%rsp)
	vextractps	$2, %xmm4, 440(%rsp)
	vextractps	$3, %xmm1, 436(%rsp)
	vextractps	$2, %xmm1, 432(%rsp)
	vextractps	$1, %xmm1, 428(%rsp)
	vextractps	$3, %xmm3, 420(%rsp)
	vmovaps	%xmm3, %xmm1
	vextractps	$2, %xmm3, 416(%rsp)
	vshufps	$85, %xmm6, %xmm6, %xmm3
	vaddss	%xmm3, %xmm6, %xmm4
	vextractf128	$0x1, %ymm5, %xmm0
	vshufps	$85, %xmm14, %xmm14, %xmm3
	vmovss	%xmm4, 396(%rsp)
	vaddss	%xmm3, %xmm14, %xmm4
	vmovss	%xmm0, 408(%rsp)
	vextractps	$1, %xmm0, 476(%rsp)
	vextractps	$2, %xmm0, 404(%rsp)
	vextractps	$3, %xmm0, 400(%rsp)
	vextractf128	$0x1, %ymm6, %xmm0
	vmovss	%xmm0, 384(%rsp)
	vextractps	$1, %xmm0, 380(%rsp)
	vextractps	$2, %xmm0, 376(%rsp)
	vextractps	$3, %xmm0, 372(%rsp)
	vextractf128	$0x1, %ymm14, %xmm0
	vmovss	%xmm4, 368(%rsp)
	vmovss	%xmm0, 356(%rsp)
	vextractps	$2, %xmm5, 480(%rsp)
	vextractps	$3, %xmm5, 412(%rsp)
	vextractps	$2, %xmm14, 364(%rsp)
	vextractps	$3, %xmm14, 360(%rsp)
	vextractps	$1, %xmm0, 352(%rsp)
	vextractps	$2, %xmm0, 348(%rsp)
	vextractps	$3, %xmm0, 344(%rsp)
	vextractps	$2, %xmm6, 392(%rsp)
	vextractps	$3, %xmm6, 388(%rsp)
	vmovaps	584(%rsp), %ymm6
	vmovaps	712(%rsp), %ymm7
	vshufps	$85, %xmm6, %xmm6, %xmm3
	vaddss	%xmm3, %xmm6, %xmm4
	vextractf128	$0x1, %ymm6, %xmm0
	vextractps	$2, %xmm6, 336(%rsp)
	vextractps	$3, %xmm6, 332(%rsp)
	vmovaps	616(%rsp), %ymm6
	vmovss	%xmm4, 340(%rsp)
	vshufps	$85, %xmm6, %xmm6, %xmm3
	vaddss	%xmm3, %xmm6, %xmm4
	vshufps	$85, %xmm12, %xmm12, %xmm3
	vmovss	%xmm0, 328(%rsp)
	vmovss	%xmm4, 316(%rsp)
	vaddss	%xmm3, %xmm12, %xmm4
	vextractps	$1, %xmm0, 472(%rsp)
	vextractps	$2, %xmm0, 324(%rsp)
	vextractps	$3, %xmm0, 320(%rsp)
	vextractps	$2, %xmm6, 312(%rsp)
	vextractf128	$0x1, %ymm6, %xmm0
	vextractps	$3, %xmm6, 308(%rsp)
	vmovaps	680(%rsp), %ymm6
	vmovss	%xmm4, 292(%rsp)
	vshufps	$85, %xmm6, %xmm6, %xmm4
	vaddss	%xmm4, %xmm6, %xmm4
	vextractf128	$0x1, %ymm12, %xmm3
	vshufps	$85, %xmm7, %xmm7, %xmm5
	vmovss	%xmm3, 284(%rsp)
	vmovss	%xmm4, 272(%rsp)
	vextractps	$2, %xmm3, 280(%rsp)
	vextractf128	$0x1, %ymm6, %xmm4
	vextractps	$3, %xmm3, 276(%rsp)
	vextractps	$2, %xmm6, 268(%rsp)
	vextractps	$1, %xmm3, %r8d
	vshufps	$255, %xmm6, %xmm6, %xmm3
	vaddss	%xmm5, %xmm7, %xmm6
	vextractf128	$0x1, %ymm7, %xmm5
	vmovss	%xmm0, 304(%rsp)
	vmovss	%xmm4, 264(%rsp)
	vmovss	%xmm6, 712(%rsp)
	vmovss	%xmm5, 244(%rsp)
	vextractps	$1, %xmm0, 468(%rsp)
	vextractps	$2, %xmm0, 300(%rsp)
	vextractps	$3, %xmm0, 296(%rsp)
	vextractps	$2, %xmm12, 288(%rsp)
	vextractps	$1, %xmm4, 260(%rsp)
	vextractps	$2, %xmm4, 256(%rsp)
	vextractps	$3, %xmm4, 252(%rsp)
	vextractps	$2, %xmm7, 248(%rsp)
	vextractps	$1, %xmm5, 240(%rsp)
	vmovaps	744(%rsp), %ymm15
	vextractps	$2, %xmm5, 236(%rsp)
	vshufps	$85, %xmm15, %xmm15, %xmm6
	vaddss	%xmm6, %xmm15, %xmm6
	vextractps	$3, %xmm5, 232(%rsp)
	vextractps	$2, %xmm15, 648(%rsp)
	vmovss	%xmm6, 744(%rsp)
	vshufps	$255, %xmm15, %xmm15, %xmm5
	vextractf128	$0x1, %ymm15, %xmm6
	vmovaps	776(%rsp), %ymm15
	vshufps	$255, %xmm7, %xmm7, %xmm4
	vshufps	$85, %xmm15, %xmm15, %xmm7
	vaddss	%xmm7, %xmm15, %xmm7
	vmovss	%xmm6, 228(%rsp)
	vextractps	$1, %xmm6, 680(%rsp)
	vmovss	%xmm7, 776(%rsp)
	vextractps	$2, %xmm6, 224(%rsp)
	vextractf128	$0x1, %ymm15, %xmm7
	vextractps	$3, %xmm6, 220(%rsp)
	vextractps	$2, %xmm15, 584(%rsp)
	vshufps	$255, %xmm15, %xmm15, %xmm6
	vmovaps	808(%rsp), %ymm15
	vshufps	$85, %xmm9, %xmm9, %xmm13
	vshufps	$85, %xmm15, %xmm15, %xmm8
	vmovss	%xmm7, 216(%rsp)
	vaddss	%xmm8, %xmm15, %xmm14
	vextractps	$1, %xmm7, 616(%rsp)
	vextractf128	$0x1, %ymm15, %xmm8
	vextractps	$2, %xmm7, 212(%rsp)
	vextractps	$3, %xmm7, 208(%rsp)
	vextractps	$2, %xmm15, 500(%rsp)
	vshufps	$255, %xmm15, %xmm15, %xmm7
	vaddss	%xmm13, %xmm9, %xmm15
	vmovss	%xmm8, 204(%rsp)
	vextractps	$1, %xmm8, 552(%rsp)
	vextractps	$2, %xmm8, 200(%rsp)
	vextractps	$3, %xmm8, 196(%rsp)
	vextractps	$2, %xmm9, 192(%rsp)
	vshufps	$255, %xmm9, %xmm9, %xmm8
	vextractf128	$0x1, %ymm9, %xmm9
	vextractf128	$0x1, %ymm10, %xmm13
	vmovss	%xmm9, 188(%rsp)
	vextractps	$1, %xmm9, %edx
	vextractps	$2, %xmm9, %ecx
	vextractps	$3, %xmm9, 184(%rsp)
	vextractf128	$0x1, %ymm11, %xmm9
	vmovss	%xmm14, 808(%rsp)
	vmovss	%xmm15, 492(%rsp)
	vextractps	$3, %xmm11, %eax
	vextractps	$1, %xmm9, %edi
	vextractps	$2, %xmm9, %esi
	vextractps	$3, %xmm10, %r10d
	vextractps	$1, %xmm13, %r13d
	vextractps	$2, %xmm13, %r14d
	vshufps	$255, %xmm12, %xmm12, %xmm0
	vextractps	$3, %xmm9, 180(%rsp)
	vshufps	$85, %xmm11, %xmm11, %xmm12
	vextractps	$3, %xmm13, 176(%rsp)
	vaddss	%xmm12, %xmm11, %xmm14
	vunpckhps	%xmm11, %xmm11, %xmm12
	vmovaps	%xmm9, %xmm11
	vshufps	$85, %xmm10, %xmm10, %xmm9
	vaddss	%xmm9, %xmm10, %xmm15
	vunpckhps	%xmm10, %xmm10, %xmm9
	vmovaps	%xmm13, %xmm10
	vshufps	$85, %xmm1, %xmm1, %xmm13
	vaddss	%xmm1, %xmm13, %xmm1
	vmovss	%xmm1, 172(%rsp)
	vshufps	$85, %xmm2, %xmm2, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	vmovss	%xmm1, 168(%rsp)
.L244:
	vmovd	%r14d, %xmm2
	vmovd	%r13d, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	vmovd	%esi, %xmm2
	vaddss	%xmm9, %xmm15, %xmm15
	vmovss	%xmm1, 484(%rsp)
	vmovd	%r10d, %xmm1
	vaddss	%xmm10, %xmm1, %xmm13
	vmovd	%edi, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	vmovd	%ecx, %xmm2
	vaddss	188(%rsp), %xmm8, %xmm8
	vmovss	%xmm1, 488(%rsp)
	vmovd	%eax, %xmm1
	vaddss	%xmm11, %xmm1, %xmm9
	vmovd	%edx, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	vaddss	204(%rsp), %xmm7, %xmm7
	vaddss	216(%rsp), %xmm6, %xmm6
	vmovss	%xmm1, 496(%rsp)
	vmovss	492(%rsp), %xmm1
	vaddss	228(%rsp), %xmm5, %xmm5
	vaddss	192(%rsp), %xmm1, %xmm1
	vaddss	%xmm13, %xmm15, %xmm13
	vaddss	%xmm12, %xmm14, %xmm14
	vaddss	%xmm8, %xmm1, %xmm1
	vaddss	%xmm9, %xmm14, %xmm14
	vmovss	%xmm1, 492(%rsp)
	vmovss	552(%rsp), %xmm1
	vaddss	200(%rsp), %xmm1, %xmm1
	vmovss	%xmm1, 552(%rsp)
	vmovss	808(%rsp), %xmm1
	vaddss	500(%rsp), %xmm1, %xmm1
	vaddss	%xmm7, %xmm1, %xmm1
	vmovss	%xmm1, 500(%rsp)
	vmovss	616(%rsp), %xmm1
	vaddss	212(%rsp), %xmm1, %xmm1
	vmovss	%xmm1, 616(%rsp)
	vmovss	776(%rsp), %xmm1
	vaddss	584(%rsp), %xmm1, %xmm1
	vaddss	%xmm6, %xmm1, %xmm6
	vmovss	%xmm6, 584(%rsp)
	vmovss	680(%rsp), %xmm6
	vaddss	224(%rsp), %xmm6, %xmm6
	vmovss	%xmm6, 680(%rsp)
	vmovss	744(%rsp), %xmm6
	vaddss	648(%rsp), %xmm6, %xmm1
	vaddss	%xmm5, %xmm1, %xmm5
	vmovss	%xmm5, 648(%rsp)
	vmovss	240(%rsp), %xmm5
	vaddss	236(%rsp), %xmm5, %xmm5
	vmovss	%xmm5, 744(%rsp)
	vmovss	712(%rsp), %xmm5
	vaddss	248(%rsp), %xmm5, %xmm1
	vaddss	244(%rsp), %xmm4, %xmm4
	vaddss	264(%rsp), %xmm3, %xmm3
	vaddss	284(%rsp), %xmm0, %xmm0
	vaddss	%xmm4, %xmm1, %xmm5
	vmovss	%xmm5, 712(%rsp)
	vmovss	260(%rsp), %xmm5
	vaddss	256(%rsp), %xmm5, %xmm5
	vmovss	%xmm5, 808(%rsp)
	vmovss	272(%rsp), %xmm5
	vaddss	268(%rsp), %xmm5, %xmm1
	vaddss	%xmm3, %xmm1, %xmm5
	vmovss	472(%rsp), %xmm3
	vmovss	%xmm5, 776(%rsp)
	vmovd	%r8d, %xmm5
	vaddss	280(%rsp), %xmm5, %xmm5
	vmovd	%xmm5, %r8d
	vmovss	292(%rsp), %xmm5
	vaddss	288(%rsp), %xmm5, %xmm1
	vaddss	%xmm0, %xmm1, %xmm6
	vmovaps	%xmm6, %xmm15
	vmovss	468(%rsp), %xmm6
	vaddss	300(%rsp), %xmm6, %xmm5
	vmovss	316(%rsp), %xmm6
	vaddss	312(%rsp), %xmm6, %xmm9
	vmovss	308(%rsp), %xmm6
	vmovss	%xmm5, 468(%rsp)
	vaddss	304(%rsp), %xmm6, %xmm0
	vmovss	332(%rsp), %xmm5
	vaddss	324(%rsp), %xmm3, %xmm6
	vaddss	%xmm0, %xmm9, %xmm9
	vaddss	328(%rsp), %xmm5, %xmm0
	vmovss	352(%rsp), %xmm5
	vmovss	%xmm6, 472(%rsp)
	vaddss	348(%rsp), %xmm5, %xmm3
	vmovss	340(%rsp), %xmm6
	vmovd	%xmm3, %r14d
	vmovss	368(%rsp), %xmm3
	vaddss	336(%rsp), %xmm6, %xmm7
	vaddss	364(%rsp), %xmm3, %xmm6
	vmovss	360(%rsp), %xmm3
	vmovss	380(%rsp), %xmm5
	vaddss	%xmm0, %xmm7, %xmm7
	vaddss	356(%rsp), %xmm3, %xmm0
	vaddss	376(%rsp), %xmm5, %xmm3
	vmovss	396(%rsp), %xmm5
	vaddss	%xmm0, %xmm6, %xmm6
	vaddss	392(%rsp), %xmm5, %xmm4
	vmovd	%xmm3, %r10d
	vmovss	388(%rsp), %xmm5
	vmovss	476(%rsp), %xmm3
	vaddss	384(%rsp), %xmm5, %xmm0
	vaddss	404(%rsp), %xmm3, %xmm5
	vmovd	%r9d, %xmm3
	vaddss	480(%rsp), %xmm3, %xmm1
	vmovss	412(%rsp), %xmm3
	vaddss	%xmm0, %xmm4, %xmm4
	vaddss	408(%rsp), %xmm3, %xmm0
	vmovss	%xmm5, 476(%rsp)
	movl	544(%rsp), %edi
	vaddss	%xmm0, %xmm1, %xmm3
	vmovss	%xmm3, 480(%rsp)
	vmovss	444(%rsp), %xmm3
	vaddss	440(%rsp), %xmm3, %xmm5
	vmovss	452(%rsp), %xmm3
	vmovd	%xmm5, %r13d
	vaddss	448(%rsp), %xmm3, %xmm8
	vmovss	420(%rsp), %xmm5
	vmovss	456(%rsp), %xmm3
	vaddss	464(%rsp), %xmm3, %xmm0
	vaddss	416(%rsp), %xmm5, %xmm3
	vmovss	428(%rsp), %xmm5
	vaddss	%xmm0, %xmm8, %xmm8
	vmovd	%xmm3, %r9d
	vmovss	436(%rsp), %xmm3
	vaddss	424(%rsp), %xmm5, %xmm5
	vaddss	432(%rsp), %xmm3, %xmm0
	vaddss	%xmm0, %xmm5, %xmm5
	cmpl	%edi, 548(%rsp)
	jle	.L242
	movq	144(%rsp), %rcx
	movslq	504(%rsp), %rdx
	movl	%r8d, 452(%rsp)
	leaq	(%rcx,%rdx,4), %rdi
	movslq	508(%rsp), %rdx
	movslq	544(%rsp), %rax
	leaq	(%rcx,%rdx,4), %rsi
	movslq	512(%rsp), %rdx
	vmovss	%xmm13, 464(%rsp)
	leaq	(%rcx,%rdx,4), %rdx
	movq	%rdx, 456(%rsp)
	movslq	516(%rsp), %rdx
	movq	456(%rsp), %r8
	leaq	(%rcx,%rdx,4), %rdx
	.p2align 4,,10
	.p2align 3
.L241:
	movq	520(%rsp), %rcx
	vmovss	(%rdi,%rax,4), %xmm10
	vmovss	(%rcx,%rax,4), %xmm12
	vmovaps	%xmm10, %xmm13
	vfmadd213ss	(%r12), %xmm12, %xmm13
	movq	528(%rsp), %rcx
	vmovss	(%rsi,%rax,4), %xmm3
	vmovss	(%rcx,%rax,4), %xmm11
	movq	536(%rsp), %rcx
	vmovss	(%r8,%rax,4), %xmm2
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	(%rdx,%rax,4), %xmm1
	vmovss	%xmm13, (%r12)
	vmovaps	%xmm3, %xmm13
	vfmadd213ss	4(%r12), %xmm12, %xmm13
	incq	%rax
	vmovss	%xmm13, 4(%r12)
	vmovaps	%xmm2, %xmm13
	vfmadd213ss	8(%r12), %xmm12, %xmm13
	vfmadd213ss	12(%r12), %xmm1, %xmm12
	vmovss	%xmm13, 8(%r12)
	vmovss	%xmm12, 12(%r12)
	vmovaps	%xmm10, %xmm12
	vfmadd213ss	(%rbx), %xmm11, %xmm12
	vmovss	%xmm12, (%rbx)
	vmovaps	%xmm3, %xmm12
	vfmadd213ss	4(%rbx), %xmm11, %xmm12
	vmovss	%xmm12, 4(%rbx)
	vmovaps	%xmm2, %xmm12
	vfmadd213ss	8(%rbx), %xmm11, %xmm12
	vfmadd213ss	12(%rbx), %xmm1, %xmm11
	vmovss	%xmm12, 8(%rbx)
	vmovss	%xmm11, 12(%rbx)
	vmovaps	%xmm10, %xmm11
	vfmadd213ss	(%r15), %xmm0, %xmm11
	vmovss	%xmm11, (%r15)
	vmovaps	%xmm3, %xmm11
	vfmadd213ss	4(%r15), %xmm0, %xmm11
	vmovss	%xmm11, 4(%r15)
	vmovaps	%xmm2, %xmm11
	vfmadd213ss	8(%r15), %xmm0, %xmm11
	vmovss	%xmm11, 8(%r15)
	vmovaps	%xmm1, %xmm11
	vfmadd213ss	12(%r15), %xmm0, %xmm11
	vmovss	%xmm11, 12(%r15)
	vfmadd213ss	(%r11), %xmm0, %xmm10
	vfmadd213ss	4(%r11), %xmm0, %xmm3
	vfmadd213ss	8(%r11), %xmm0, %xmm2
	vfmadd213ss	12(%r11), %xmm0, %xmm1
	vmovss	%xmm10, (%r11)
	vmovss	%xmm3, 4(%r11)
	vmovss	%xmm2, 8(%r11)
	vmovss	%xmm1, 12(%r11)
	cmpl	%eax, 548(%rsp)
	jg	.L241
	vmovss	464(%rsp), %xmm13
	movl	452(%rsp), %r8d
.L242:
	vmovss	176(%rsp), %xmm3
	vmovss	232(%rsp), %xmm1
	vaddss	(%r12), %xmm3, %xmm0
	vmovss	180(%rsp), %xmm3
	addq	$16, %r12
	vaddss	484(%rsp), %xmm0, %xmm0
	addq	$16, %rbx
	addq	$16, %r15
	vaddss	%xmm13, %xmm0, %xmm0
	addq	$16, %r11
	vmovss	%xmm0, -16(%r12)
	vaddss	-12(%r12), %xmm3, %xmm0
	vmovss	184(%rsp), %xmm3
	vaddss	488(%rsp), %xmm0, %xmm0
	vaddss	%xmm14, %xmm0, %xmm0
	vmovss	%xmm0, -12(%r12)
	vaddss	-8(%r12), %xmm3, %xmm0
	vmovss	196(%rsp), %xmm3
	vaddss	496(%rsp), %xmm0, %xmm0
	vaddss	492(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -8(%r12)
	vaddss	-4(%r12), %xmm3, %xmm0
	vmovss	208(%rsp), %xmm3
	vaddss	552(%rsp), %xmm0, %xmm0
	vaddss	500(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -4(%r12)
	vaddss	-16(%rbx), %xmm3, %xmm0
	vmovss	220(%rsp), %xmm3
	vaddss	616(%rsp), %xmm0, %xmm0
	vaddss	584(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -16(%rbx)
	vaddss	-12(%rbx), %xmm3, %xmm0
	vaddss	680(%rsp), %xmm0, %xmm0
	vaddss	648(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -12(%rbx)
	vaddss	-8(%rbx), %xmm1, %xmm0
	vaddss	744(%rsp), %xmm0, %xmm0
	vaddss	712(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -8(%rbx)
	vmovss	252(%rsp), %xmm3
	vmovss	276(%rsp), %xmm1
	vaddss	-4(%rbx), %xmm3, %xmm0
	vmovd	%r8d, %xmm3
	vaddss	808(%rsp), %xmm0, %xmm0
	vaddss	776(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rbx)
	vaddss	-16(%r15), %xmm1, %xmm0
	vmovd	%r14d, %xmm1
	vaddss	%xmm3, %xmm0, %xmm0
	vmovss	296(%rsp), %xmm3
	vaddss	%xmm15, %xmm0, %xmm0
	vmovss	%xmm0, -16(%r15)
	vaddss	-12(%r15), %xmm3, %xmm0
	vmovss	320(%rsp), %xmm3
	vaddss	468(%rsp), %xmm0, %xmm0
	vaddss	%xmm9, %xmm0, %xmm0
	vmovss	%xmm0, -12(%r15)
	vaddss	-8(%r15), %xmm3, %xmm0
	vmovss	344(%rsp), %xmm3
	vaddss	472(%rsp), %xmm0, %xmm0
	vaddss	%xmm7, %xmm0, %xmm0
	vmovss	%xmm0, -8(%r15)
	vaddss	-4(%r15), %xmm3, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm6, %xmm0, %xmm0
	vmovss	372(%rsp), %xmm6
	vmovss	%xmm0, -4(%r15)
	vaddss	-16(%r11), %xmm6, %xmm0
	vmovd	%r10d, %xmm6
	vaddss	%xmm6, %xmm0, %xmm0
	vmovss	400(%rsp), %xmm6
	vaddss	%xmm4, %xmm0, %xmm0
	vmovd	%r13d, %xmm4
	vmovss	%xmm0, -16(%r11)
	vaddss	-12(%r11), %xmm6, %xmm0
	vmovss	168(%rsp), %xmm6
	vaddss	476(%rsp), %xmm0, %xmm0
	vaddss	480(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -12(%r11)
	vaddss	-8(%r11), %xmm6, %xmm0
	vmovss	172(%rsp), %xmm6
	vaddss	%xmm4, %xmm0, %xmm0
	vmovd	%r9d, %xmm4
	vaddss	%xmm8, %xmm0, %xmm0
	vmovss	%xmm0, -8(%r11)
	vaddss	-4(%r11), %xmm6, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm5, %xmm0, %xmm0
	vmovss	%xmm0, -4(%r11)
	movl	152(%rsp), %eax
	addl	%eax, 504(%rsp)
	addl	%eax, 508(%rsp)
	addl	%eax, 512(%rsp)
	addl	%eax, 516(%rsp)
	cmpq	%r12, 136(%rsp)
	jne	.L239
.L240:
	movl	56(%rsp), %edi
	cmpl	%edi, 60(%rsp)
	jge	.L245
	movslq	72(%rsp), %rdi
	movq	-8(%rsp), %rax
	movq	64(%rsp), %rsi
	addq	%rdi, %rax
	leaq	(%rsi,%rax,4), %rcx
	movq	-16(%rsp), %rax
	movslq	156(%rsp), %rdx
	addq	%rdi, %rax
	leaq	4(%rsi,%rax,4), %rax
	movq	%rax, 680(%rsp)
	movq	88(%rsp), %rax
	movslq	124(%rsp), %r15
	movslq	160(%rsp), %rsi
	leaq	(%rax,%rdx,4), %r10
	movq	%rdx, 744(%rsp)
	movslq	164(%rsp), %rdx
	leaq	(%rax,%r15,4), %r11
	leaq	(%rax,%rsi,4), %r9
	leaq	(%rax,%rdx,4), %r8
	movslq	84(%rsp), %rax
	movq	%rdx, 808(%rsp)
	movslq	76(%rsp), %rbx
	movslq	80(%rsp), %rdx
	movq	%rax, %r14
	subq	%rdi, %rbx
	subq	%rdi, %rdx
	subq	%rdi, %r14
	movq	%rbx, 648(%rsp)
	movq	%rdx, 616(%rsp)
	movq	%r14, 584(%rsp)
	movq	%rsi, 776(%rsp)
	movq	%r15, 712(%rsp)
	movl	8(%rsp), %esi
	movq	(%rsp), %r12
	movq	88(%rsp), %rdi
	movq	144(%rsp), %r15
	movl	548(%rsp), %r13d
	.p2align 4,,10
	.p2align 3
.L246:
	testl	%r13d, %r13d
	jle	.L279
	cmpl	$6, 120(%rsp)
	jbe	.L266
	vxorps	%xmm4, %xmm4, %xmm4
	movslq	%esi, %rax
	leaq	(%r15,%rax,4), %rdx
	vmovaps	%ymm4, %ymm3
	xorl	%eax, %eax
	vmovaps	%ymm4, %ymm2
	vmovaps	%ymm4, %ymm1
	.p2align 4,,10
	.p2align 3
.L248:
	vmovups	(%rdx,%rax), %ymm0
	vfmadd231ps	(%r11,%rax), %ymm0, %ymm1
	vfmadd231ps	(%r10,%rax), %ymm0, %ymm2
	vfmadd231ps	(%r9,%rax), %ymm0, %ymm3
	vfmadd231ps	(%r8,%rax), %ymm0, %ymm4
	addq	$32, %rax
	cmpq	%r12, %rax
	jne	.L248
	vextractf128	$0x1, %ymm4, %xmm0
	vaddps	%xmm4, %xmm0, %xmm0
	movl	100(%rsp), %edx
	vmovhlps	%xmm0, %xmm0, %xmm4
	vaddps	%xmm0, %xmm4, %xmm4
	movl	%edx, %eax
	vshufps	$85, %xmm4, %xmm4, %xmm0
	vaddps	%xmm4, %xmm0, %xmm0
	vextractf128	$0x1, %ymm3, %xmm4
	vaddps	%xmm3, %xmm4, %xmm3
	vmovhlps	%xmm3, %xmm3, %xmm4
	vaddps	%xmm3, %xmm4, %xmm4
	vshufps	$85, %xmm4, %xmm4, %xmm3
	vaddps	%xmm4, %xmm3, %xmm3
	vextractf128	$0x1, %ymm2, %xmm4
	vaddps	%xmm2, %xmm4, %xmm2
	vmovhlps	%xmm2, %xmm2, %xmm4
	vaddps	%xmm2, %xmm4, %xmm4
	vshufps	$85, %xmm4, %xmm4, %xmm2
	vaddps	%xmm4, %xmm2, %xmm2
	vextractf128	$0x1, %ymm1, %xmm4
	vaddps	%xmm1, %xmm4, %xmm1
	vmovhlps	%xmm1, %xmm1, %xmm4
	vaddps	%xmm1, %xmm4, %xmm4
	vshufps	$85, %xmm4, %xmm4, %xmm1
	vaddps	%xmm4, %xmm1, %xmm1
	cmpl	%eax, %r13d
	je	.L253
.L247:
	movl	%r13d, %r14d
	subl	%eax, %r14d
	leal	-1(%r14), %ebx
	cmpl	$2, %ebx
	jbe	.L250
	movslq	%esi, %rbx
	addq	%rax, %rbx
	vmovups	(%r15,%rbx,4), %xmm4
	movq	712(%rsp), %rbx
	addq	%rax, %rbx
	vmulps	(%rdi,%rbx,4), %xmm4, %xmm6
	movq	744(%rsp), %rbx
	addq	%rax, %rbx
	vmulps	(%rdi,%rbx,4), %xmm4, %xmm7
	movq	776(%rsp), %rbx
	addq	%rax, %rbx
	addq	808(%rsp), %rax
	vmulps	(%rdi,%rbx,4), %xmm4, %xmm8
	vmulps	(%rdi,%rax,4), %xmm4, %xmm4
	movl	%r14d, %eax
	andl	$-4, %eax
	addl	%eax, %edx
	vmovhlps	%xmm4, %xmm4, %xmm5
	vaddps	%xmm4, %xmm5, %xmm5
	vshufps	$85, %xmm5, %xmm5, %xmm4
	vaddps	%xmm5, %xmm4, %xmm4
	vmovhlps	%xmm8, %xmm8, %xmm5
	vaddps	%xmm8, %xmm5, %xmm5
	vaddss	%xmm4, %xmm0, %xmm0
	vshufps	$85, %xmm5, %xmm5, %xmm4
	vaddps	%xmm5, %xmm4, %xmm4
	vmovhlps	%xmm7, %xmm7, %xmm5
	vaddps	%xmm7, %xmm5, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$85, %xmm5, %xmm5, %xmm4
	vaddps	%xmm5, %xmm4, %xmm4
	vmovhlps	%xmm6, %xmm6, %xmm5
	vaddps	%xmm6, %xmm5, %xmm5
	vaddss	%xmm4, %xmm2, %xmm2
	vshufps	$85, %xmm5, %xmm5, %xmm4
	vaddps	%xmm5, %xmm4, %xmm4
	vaddss	%xmm4, %xmm1, %xmm1
	cmpl	%r14d, %eax
	je	.L253
.L250:
	movl	124(%rsp), %r14d
	leal	(%rsi,%rdx), %eax
	cltq
	vmovss	(%r15,%rax,4), %xmm4
	leal	(%r14,%rdx), %eax
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm1
	movl	156(%rsp), %eax
	movl	160(%rsp), %ebx
	addl	%edx, %eax
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm2
	leal	(%rbx,%rdx), %eax
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm3
	movl	164(%rsp), %eax
	addl	%edx, %eax
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm0
	leal	1(%rdx), %eax
	cmpl	%r13d, %eax
	jge	.L253
	leal	(%rsi,%rax), %ebx
	movslq	%ebx, %rbx
	vmovss	(%r15,%rbx,4), %xmm4
	leal	(%r14,%rax), %ebx
	movslq	%ebx, %rbx
	vfmadd231ss	(%rdi,%rbx,4), %xmm4, %xmm1
	movl	156(%rsp), %ebx
	addl	$2, %edx
	addl	%eax, %ebx
	movslq	%ebx, %rbx
	vfmadd231ss	(%rdi,%rbx,4), %xmm4, %xmm2
	movl	160(%rsp), %ebx
	addl	%eax, %ebx
	addl	164(%rsp), %eax
	movslq	%ebx, %rbx
	cltq
	vfmadd231ss	(%rdi,%rbx,4), %xmm4, %xmm3
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm0
	cmpl	%edx, %r13d
	jle	.L253
	leal	(%rsi,%rdx), %eax
	cltq
	vmovss	(%r15,%rax,4), %xmm4
	movl	156(%rsp), %ebx
	leal	(%r14,%rdx), %eax
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm1
	leal	(%rbx,%rdx), %eax
	movl	160(%rsp), %ebx
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm2
	leal	(%rbx,%rdx), %eax
	addl	164(%rsp), %edx
	cltq
	movslq	%edx, %rdx
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm3
	vfmadd231ss	(%rdi,%rdx,4), %xmm4, %xmm0
.L253:
	vaddss	(%rcx), %xmm1, %xmm1
	movq	648(%rsp), %rax
	addl	%r13d, %esi
	vmovss	%xmm1, (%rcx)
	vaddss	(%rcx,%rax,4), %xmm2, %xmm2
	vmovss	%xmm2, (%rcx,%rax,4)
	movq	616(%rsp), %rax
	vaddss	(%rcx,%rax,4), %xmm3, %xmm3
	vmovss	%xmm3, (%rcx,%rax,4)
	movq	584(%rsp), %rax
	vaddss	(%rcx,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	addq	$4, %rcx
	cmpq	680(%rsp), %rcx
	jne	.L246
.L245:
	addl	$4, 96(%rsp)
	movl	24(%rsp), %eax
	addl	%eax, 72(%rsp)
	addl	%eax, 76(%rsp)
	addl	%eax, 80(%rsp)
	addl	%eax, 84(%rsp)
	movl	96(%rsp), %edi
	movl	152(%rsp), %eax
	addl	%eax, 124(%rsp)
	addl	%eax, 156(%rsp)
	addl	%eax, 160(%rsp)
	addl	%eax, 164(%rsp)
	cmpl	%edi, 44(%rsp)
	jg	.L236
	movq	88(%rsp), %r15
.L235:
	subq	$-128, 48(%rsp)
	movl	-24(%rsp), %edi
	addl	%edi, 40(%rsp)
	movq	48(%rsp), %rax
	cmpl	%eax, 60(%rsp)
	jg	.L254
.L255:
	movl	-72(%rsp), %edi
	movl	-20(%rsp), %eax
	addl	%edi, -32(%rsp)
	movl	-24(%rsp), %edi
	addl	%edi, -28(%rsp)
	cmpl	16(%rbp), %eax
	jg	.L232
	movl	548(%rsp), %r14d
.L233:
	movl	-20(%rsp), %eax
	cmpl	24(%rbp), %eax
	jge	.L276
	movl	56(%rsp), %edi
	testl	%edi, %edi
	jle	.L276
	movl	%edi, %r13d
	imull	%eax, %r13d
	imull	%r14d, %eax
	movl	%r14d, %r11d
	andl	$-8, %r11d
	movl	%eax, %ebx
	leal	-1(%r14), %eax
	movl	%eax, 776(%rsp)
	movl	%r14d, %eax
	shrl	$3, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, %r12
	movq	64(%rsp), %rax
	addq	$4, %rax
	movq	%rax, 712(%rsp)
	leal	-1(%rdi), %eax
	movq	%rax, 744(%rsp)
.L229:
	movq	64(%rsp), %rdi
	movslq	%r13d, %rax
	leaq	(%rdi,%rax,4), %r9
	movq	712(%rsp), %rdi
	addq	744(%rsp), %rax
	leaq	(%rdi,%rax,4), %rax
	movq	%rax, 808(%rsp)
	movslq	%ebx, %r10
	leaq	(%r15,%r10,4), %rsi
	xorl	%ecx, %ecx
.L264:
	vxorps	%xmm0, %xmm0, %xmm0
	testl	%r14d, %r14d
	jle	.L263
	cmpl	$6, 776(%rsp)
	jbe	.L267
	movq	144(%rsp), %rdi
	movslq	%ecx, %rax
	leaq	(%rdi,%rax,4), %rdx
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
.L257:
	vmovups	(%rdx,%rax), %ymm6
	vfmadd231ps	(%rsi,%rax), %ymm6, %ymm0
	addq	$32, %rax
	cmpq	%r12, %rax
	jne	.L257
	vextractf128	$0x1, %ymm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	cmpl	%r11d, %r14d
	je	.L263
	movl	%r11d, %edx
	movl	%r11d, %eax
.L256:
	movl	%r14d, %r8d
	subl	%edx, %r8d
	leal	-1(%r8), %edi
	cmpl	$2, %edi
	jbe	.L259
	movslq	%ecx, %rdi
	addq	%rdx, %rdi
	addq	%r10, %rdx
	vmovups	(%r15,%rdx,4), %xmm1
	movq	144(%rsp), %rdx
	vmulps	(%rdx,%rdi,4), %xmm1, %xmm1
	movl	%r8d, %edx
	andl	$-4, %edx
	addl	%edx, %eax
	vmovhlps	%xmm1, %xmm1, %xmm2
	vaddps	%xmm1, %xmm2, %xmm2
	vshufps	$85, %xmm2, %xmm2, %xmm1
	vaddps	%xmm2, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	cmpl	%r8d, %edx
	je	.L263
.L259:
	leal	(%rbx,%rax), %edi
	movslq	%edi, %rdi
	movq	144(%rsp), %r8
	vmovss	(%r15,%rdi,4), %xmm6
	leal	(%rcx,%rax), %edx
	movslq	%edx, %rdx
	vfmadd231ss	(%r8,%rdx,4), %xmm6, %xmm0
	leal	1(%rax), %edx
	cmpl	%edx, %r14d
	jle	.L263
	leal	(%rcx,%rdx), %edi
	movslq	%edi, %rdi
	vmovss	(%r8,%rdi,4), %xmm6
	addl	%ebx, %edx
	movslq	%edx, %rdx
	addl	$2, %eax
	vfmadd231ss	(%r15,%rdx,4), %xmm6, %xmm0
	cmpl	%eax, %r14d
	jle	.L263
	leal	(%rcx,%rax), %edx
	movslq	%edx, %rdx
	vmovss	(%r8,%rdx,4), %xmm6
	addl	%ebx, %eax
	cltq
	vfmadd231ss	(%r15,%rax,4), %xmm6, %xmm0
.L263:
	vmovss	%xmm0, (%r9)
	addq	$4, %r9
	addl	%r14d, %ecx
	cmpq	808(%rsp), %r9
	jne	.L264
	incl	-20(%rsp)
	addl	56(%rsp), %r13d
	addl	%r14d, %ebx
	movl	-20(%rsp), %eax
	cmpl	%eax, 24(%rbp)
	jne	.L229
.L276:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L278:
	.cfi_restore_state
	vxorps	%xmm10, %xmm10, %xmm10
	movl	$0x00000000, 168(%rsp)
	movl	$0x00000000, 172(%rsp)
	movl	$0x00000000, 176(%rsp)
	vmovss	%xmm10, 180(%rsp)
	vmovss	%xmm10, 184(%rsp)
	vmovss	%xmm10, 188(%rsp)
	vmovss	%xmm10, 192(%rsp)
	vmovss	%xmm10, 492(%rsp)
	vmovss	%xmm10, 196(%rsp)
	vmovss	%xmm10, 200(%rsp)
	vmovss	%xmm10, 552(%rsp)
	vmovss	%xmm10, 204(%rsp)
	vmovss	%xmm10, 500(%rsp)
	vmovss	%xmm10, 808(%rsp)
	vmovss	%xmm10, 208(%rsp)
	vmovss	%xmm10, 212(%rsp)
	vmovss	%xmm10, 616(%rsp)
	vmovss	%xmm10, 216(%rsp)
	vmovss	%xmm10, 584(%rsp)
	vmovss	%xmm10, 776(%rsp)
	vmovss	%xmm10, 220(%rsp)
	vmovss	%xmm10, 224(%rsp)
	vmovss	%xmm10, 680(%rsp)
	vmovss	%xmm10, 228(%rsp)
	vmovss	%xmm10, 648(%rsp)
	vmovss	%xmm10, 744(%rsp)
	vmovss	%xmm10, 232(%rsp)
	vmovss	%xmm10, 236(%rsp)
	vmovss	%xmm10, 240(%rsp)
	vmovss	%xmm10, 244(%rsp)
	vmovss	%xmm10, 248(%rsp)
	vmovss	%xmm10, 712(%rsp)
	xorl	%r14d, %r14d
	vmovss	%xmm10, 252(%rsp)
	xorl	%r13d, %r13d
	vmovss	%xmm10, 256(%rsp)
	vmovss	%xmm10, 260(%rsp)
	vmovss	%xmm10, 264(%rsp)
	vmovss	%xmm10, 268(%rsp)
	vmovss	%xmm10, 272(%rsp)
	vmovss	%xmm10, 276(%rsp)
	vmovss	%xmm10, 280(%rsp)
	vmovss	%xmm10, 284(%rsp)
	vmovss	%xmm10, 288(%rsp)
	vmovss	%xmm10, 292(%rsp)
	vmovss	%xmm10, 296(%rsp)
	vmovss	%xmm10, 300(%rsp)
	vmovss	%xmm10, 468(%rsp)
	vmovss	%xmm10, 304(%rsp)
	vmovss	%xmm10, 308(%rsp)
	vmovss	%xmm10, 312(%rsp)
	vmovss	%xmm10, 316(%rsp)
	vmovss	%xmm10, 320(%rsp)
	vmovss	%xmm10, 324(%rsp)
	vmovss	%xmm10, 472(%rsp)
	vmovss	%xmm10, 328(%rsp)
	vmovss	%xmm10, 332(%rsp)
	vmovss	%xmm10, 336(%rsp)
	vmovss	%xmm10, 340(%rsp)
	vmovss	%xmm10, 344(%rsp)
	vmovss	%xmm10, 348(%rsp)
	vmovss	%xmm10, 352(%rsp)
	vmovss	%xmm10, 356(%rsp)
	vmovss	%xmm10, 360(%rsp)
	vmovss	%xmm10, 364(%rsp)
	vmovss	%xmm10, 368(%rsp)
	vmovss	%xmm10, 372(%rsp)
	vmovd	%xmm10, %r10d
	vmovss	%xmm10, 376(%rsp)
	vmovaps	%xmm10, %xmm9
	vmovaps	%xmm10, %xmm15
	vmovd	%xmm10, %esi
	vmovd	%xmm10, %edi
	vmovaps	%xmm10, %xmm11
	vmovd	%xmm10, %eax
	vmovaps	%xmm10, %xmm12
	vmovaps	%xmm10, %xmm14
	vmovd	%xmm10, %ecx
	vmovd	%xmm10, %edx
	vmovaps	%xmm10, %xmm8
	vmovaps	%xmm10, %xmm7
	vmovaps	%xmm10, %xmm6
	vmovaps	%xmm10, %xmm5
	vmovaps	%xmm10, %xmm4
	vmovaps	%xmm10, %xmm3
	vmovd	%xmm10, %r8d
	vmovaps	%xmm10, %xmm0
	vmovss	%xmm10, 380(%rsp)
	vmovss	%xmm10, 384(%rsp)
	vmovss	%xmm10, 388(%rsp)
	vmovss	%xmm10, 392(%rsp)
	vmovss	%xmm10, 396(%rsp)
	vmovss	%xmm10, 400(%rsp)
	vmovss	%xmm10, 404(%rsp)
	vmovss	%xmm10, 476(%rsp)
	vmovss	%xmm10, 408(%rsp)
	vmovss	%xmm10, 412(%rsp)
	vmovss	%xmm10, 480(%rsp)
	vmovss	%xmm10, 416(%rsp)
	vmovss	%xmm10, 420(%rsp)
	vmovss	%xmm10, 424(%rsp)
	vmovss	%xmm10, 428(%rsp)
	vmovss	%xmm10, 432(%rsp)
	vmovss	%xmm10, 436(%rsp)
	vmovss	%xmm10, 440(%rsp)
	vmovss	%xmm10, 444(%rsp)
	vmovss	%xmm10, 448(%rsp)
	vmovss	%xmm10, 452(%rsp)
	vmovss	%xmm10, 464(%rsp)
	vmovss	%xmm10, 456(%rsp)
	vmovd	%xmm10, %r9d
	jmp	.L244
	.p2align 4,,10
	.p2align 3
.L279:
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm0, %xmm2
	vmovaps	%xmm0, %xmm1
	jmp	.L253
.L266:
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	xorl	%edx, %edx
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm0, %xmm2
	vmovaps	%xmm0, %xmm1
	jmp	.L247
.L267:
	xorl	%edx, %edx
	xorl	%eax, %eax
	vxorps	%xmm0, %xmm0, %xmm0
	jmp	.L256
	.cfi_endproc
.LFE10947:
	.size	_Z19mul_mt_f32_internalPfS_S_iiiii, .-_Z19mul_mt_f32_internalPfS_S_iiiii
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB3:
	.text
.LHOTB3:
	.align 2
	.p2align 4
	.type	_ZNSt6vectorImSaImEEC2ESt16initializer_listImERKS0_.constprop.0, @function
_ZNSt6vectorImSaImEEC2ESt16initializer_listImERKS0_.constprop.0:
.LFB12820:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA12820
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movl	$16, %edi
.LEHB0:
	call	_Znwm@PLT
.LEHE0:
	vmovdqu	0(%rbp), %xmm0
	leaq	16(%rax), %rdx
	vmovdqu	%xmm0, (%rax)
	movq	%rax, (%rbx)
	movq	%rdx, 16(%rbx)
	movq	%rdx, 8(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L283:
	.cfi_restore_state
	endbr64
	movq	%rax, %rbp
	jmp	.L281
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA12820:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE12820-.LLSDACSB12820
.LLSDACSB12820:
	.uleb128 .LEHB0-.LFB12820
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L283-.LFB12820
	.uleb128 0
.LLSDACSE12820:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC12820
	.type	_ZNSt6vectorImSaImEEC2ESt16initializer_listImERKS0_.constprop.0.cold, @function
_ZNSt6vectorImSaImEEC2ESt16initializer_listImERKS0_.constprop.0.cold:
.LFSB12820:
.L281:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movq	(%rbx), %rdi
	movq	16(%rbx), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L288
	vzeroupper
	call	_ZdlPvm@PLT
.L282:
	movq	%rbp, %rdi
.LEHB1:
	call	_Unwind_Resume@PLT
.LEHE1:
.L288:
	vzeroupper
	jmp	.L282
	.cfi_endproc
.LFE12820:
	.section	.gcc_except_table
.LLSDAC12820:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC12820-.LLSDACSBC12820
.LLSDACSBC12820:
	.uleb128 .LEHB1-.LCOLDB3
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSEC12820:
	.section	.text.unlikely
	.text
	.size	_ZNSt6vectorImSaImEEC2ESt16initializer_listImERKS0_.constprop.0, .-_ZNSt6vectorImSaImEEC2ESt16initializer_listImERKS0_.constprop.0
	.section	.text.unlikely
	.size	_ZNSt6vectorImSaImEEC2ESt16initializer_listImERKS0_.constprop.0.cold, .-_ZNSt6vectorImSaImEEC2ESt16initializer_listImERKS0_.constprop.0.cold
.LCOLDE3:
	.text
.LHOTE3:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"vector::_M_realloc_insert"
	.text
	.align 2
	.p2align 4
	.type	_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJS0_EEERS0_DpOT_.isra.0, @function
_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJS0_EEERS0_DpOT_.isra.0:
.LFB12824:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	8(%rdi), %rbx
	movq	16(%rdi), %rdi
	cmpq	%rdi, %rbx
	je	.L292
	movq	$0, (%rbx)
	addq	$8, %rbx
	movq	(%rsi), %rax
	movq	$0, (%rsi)
	movq	%rax, -8(%rbx)
	movq	%rbx, 8(%rbp)
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L292:
	.cfi_restore_state
	movq	0(%rbp), %r12
	movq	%rbx, %r14
	subq	%r12, %r14
	movq	%r14, %rax
	sarq	$3, %rax
	movabsq	$1152921504606846975, %rdx
	cmpq	%rdx, %rax
	je	.L311
	testq	%rax, %rax
	movl	$1, %edx
	cmovne	%rax, %rdx
	addq	%rdx, %rax
	jc	.L296
	testq	%rax, %rax
	jne	.L312
	movl	$8, %eax
	xorl	%r13d, %r13d
	xorl	%r8d, %r8d
.L298:
	movq	(%rsi), %rdx
	movq	$0, (%rsi)
	movq	%rdx, (%r8,%r14)
	cmpq	%r12, %rbx
	je	.L299
	subq	%r12, %rbx
	addq	%r8, %rbx
	movq	%r12, %rdx
	movq	%r8, %rax
	.p2align 4,,10
	.p2align 3
.L300:
	movq	(%rdx), %rcx
	addq	$8, %rax
	movq	%rcx, -8(%rax)
	addq	$8, %rdx
	cmpq	%rbx, %rax
	jne	.L300
	addq	$8, %rax
.L299:
	vmovq	%r8, %xmm1
	vpinsrq	$1, %rax, %xmm1, %xmm0
	testq	%r12, %r12
	je	.L301
	subq	%r12, %rdi
	movq	%rdi, %rsi
	movq	%r12, %rdi
	vmovdqa	%xmm0, (%rsp)
	call	_ZdlPvm@PLT
	vmovdqa	(%rsp), %xmm0
.L301:
	movq	%r13, 16(%rbp)
	vmovdqu	%xmm0, 0(%rbp)
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L312:
	.cfi_restore_state
	movabsq	$1152921504606846975, %rdx
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
	leaq	0(,%rax,8), %r13
.L297:
	movq	%r13, %rdi
	movq	%rsi, (%rsp)
	call	_Znwm@PLT
	movq	%rax, %r8
	addq	%rax, %r13
	movq	16(%rbp), %rdi
	movq	(%rsp), %rsi
	leaq	8(%rax), %rax
	jmp	.L298
.L296:
	movabsq	$9223372036854775800, %r13
	jmp	.L297
.L311:
	leaq	.LC4(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE12824:
	.size	_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJS0_EEERS0_DpOT_.isra.0, .-_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJS0_EEERS0_DpOT_.isra.0
	.section	.text._ZNSt7__cxx119to_stringEm,"axG",@progbits,_ZNSt7__cxx119to_stringEm,comdat
	.p2align 4
	.weak	_ZNSt7__cxx119to_stringEm
	.type	_ZNSt7__cxx119to_stringEm, @function
_ZNSt7__cxx119to_stringEm:
.LFB1874:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpq	$9, %rsi
	jbe	.L314
	cmpq	$99, %rsi
	jbe	.L330
	cmpq	$999, %rsi
	jbe	.L331
	cmpq	$9999, %rsi
	jbe	.L332
	movq	%rsi, %rdx
	movabsq	$3777893186295716171, %rdi
	movl	$1, %esi
	jmp	.L318
	.p2align 4,,10
	.p2align 3
.L335:
	cmpq	$999999, %rcx
	jbe	.L338
	cmpq	$9999999, %rcx
	jbe	.L339
	cmpq	$99999999, %rcx
	jbe	.L340
.L318:
	movq	%rdx, %rax
	movq	%rdx, %rcx
	mulq	%rdi
	movl	%esi, %eax
	addl	$4, %esi
	shrq	$11, %rdx
	cmpq	$99999, %rcx
	ja	.L335
.L323:
	leaq	16(%r12), %rax
	movq	%rax, (%r12)
	xorl	%edx, %edx
	movq	%r12, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEmc@PLT
	movl	8(%r12), %eax
	movq	(%r12), %rsi
	leal	-1(%rax), %ecx
.L329:
	leaq	_ZZNSt8__detail18__to_chars_10_implImEEvPcjT_E8__digits(%rip), %rdi
	movabsq	$2951479051793528259, %r9
	.p2align 4,,10
	.p2align 3
.L326:
	movq	%rbx, %rdx
	shrq	$2, %rdx
	movq	%rdx, %rax
	mulq	%r9
	movq	%rbx, %rax
	shrq	$2, %rdx
	imulq	$100, %rdx, %r8
	subq	%r8, %rax
	movzbl	1(%rdi,%rax,2), %r10d
	movq	%rbx, %r8
	movzbl	(%rdi,%rax,2), %eax
	movq	%rdx, %rbx
	movl	%ecx, %edx
	movb	%r10b, (%rsi,%rdx)
	leal	-1(%rcx), %edx
	movb	%al, (%rsi,%rdx)
	subl	$2, %ecx
	cmpq	$9999, %r8
	ja	.L326
	cmpq	$999, %r8
	ja	.L321
.L327:
	addl	$48, %ebx
	movb	%bl, (%rsi)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L338:
	.cfi_restore_state
	leal	5(%rax), %esi
.L315:
	leaq	16(%r12), %rax
	movq	%rax, (%r12)
	movq	%r12, %rdi
	xorl	%edx, %edx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEmc@PLT
	movq	(%r12), %rsi
	leaq	_ZZNSt8__detail18__to_chars_10_implImEEvPcjT_E8__digits(%rip), %rdi
	cmpq	$99, %rbx
	ja	.L341
.L321:
	movzbl	1(%rdi,%rbx,2), %eax
	movzbl	(%rdi,%rbx,2), %ebx
	movb	%al, 1(%rsi)
	movb	%bl, (%rsi)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L339:
	.cfi_restore_state
	leal	6(%rax), %esi
	jmp	.L323
	.p2align 4,,10
	.p2align 3
.L340:
	leal	7(%rax), %esi
	jmp	.L323
	.p2align 4,,10
	.p2align 3
.L341:
	movl	8(%r12), %eax
	leal	-1(%rax), %ecx
	jmp	.L329
.L314:
	leaq	16(%rdi), %rax
	movq	%rax, (%rdi)
	movl	$1, %esi
	xorl	%edx, %edx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEmc@PLT
	movq	(%r12), %rsi
	jmp	.L327
.L330:
	movl	$2, %esi
	jmp	.L315
.L332:
	movl	$4, %esi
	jmp	.L323
.L331:
	movl	$3, %esi
	jmp	.L323
	.cfi_endproc
.LFE1874:
	.size	_ZNSt7__cxx119to_stringEm, .-_ZNSt7__cxx119to_stringEm
	.text
	.p2align 4
	.globl	_Z12dft_subarrayP7ComplexIdvEiiS1_
	.type	_Z12dft_subarrayP7ComplexIdvEiiS1_, @function
_Z12dft_subarrayP7ComplexIdvEiiS1_:
.LFB10482:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	movl	%edx, %eax
	subl	%esi, %eax
	pushq	%rbp
	movslq	%eax, %r8
	andl	$7, %eax
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movl	%edx, %r15d
	pushq	%r14
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movslq	%esi, %r14
	pushq	%r13
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%rcx, %r13
	movl	%edx, %ecx
	pushq	%r12
	subl	%eax, %ecx
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rdi, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movslq	%ecx, %rbx
	subq	$608, %rsp
	cmpq	%rbx, %r14
	jnb	.L356
	movq	%r14, %rax
	salq	$4, %rax
	addq	%rdi, %rax
	movq	%r14, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L344:
	vmovupd	(%rax), %ymm1
	addq	$8, %rdx
	vaddpd	32(%rax), %ymm1, %ymm0
	vmovupd	64(%rax), %ymm1
	subq	$-128, %rax
	vaddpd	-32(%rax), %ymm1, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm2
	cmpq	%rbx, %rdx
	jb	.L344
	vextractf128	$0x1, %ymm2, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vunpckhpd	%xmm2, %xmm2, %xmm4
	vaddsd	%xmm4, %xmm1, %xmm4
	vaddsd	%xmm2, %xmm0, %xmm3
	vzeroupper
.L343:
	vmovupd	0(%r13), %xmm0
	vmovsd	0(%r13), %xmm2
	vmovsd	8(%r13), %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm6
	cmpl	%ecx, %r15d
	jle	.L357
	leal	-1(%r15), %edx
	subl	%ecx, %edx
	movq	%rbx, %rax
	addq	%rbx, %rdx
	salq	$4, %rax
	salq	$4, %rdx
	addq	%r12, %rax
	leaq	16(%r12,%rdx), %rdx
	.p2align 4,,10
	.p2align 3
.L346:
	vaddpd	(%rax), %xmm0, %xmm0
	vaddsd	(%rax), %xmm2, %xmm2
	vaddsd	8(%rax), %xmm1, %xmm1
	addq	$16, %rax
	vmovupd	%xmm0, 0(%r13)
	cmpq	%rax, %rdx
	jne	.L346
.L345:
	vaddsd	%xmm2, %xmm3, %xmm3
	vaddsd	%xmm1, %xmm4, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm3, 0(%r13)
	vmovsd	%xmm1, 8(%r13)
	leaq	-56(%rbp), %rdi
	leaq	-64(%rbp), %rsi
	testq	%r8, %r8
	js	.L347
	vcvtsi2sdq	%r8, %xmm0, %xmm0
.L348:
	vmovsd	.LC6(%rip), %xmm1
	movq	%r8, -112(%rbp)
	vdivsd	%xmm0, %xmm1, %xmm0
	movl	%ecx, -144(%rbp)
	call	sincos@PLT
	vmovsd	-56(%rbp), %xmm2
	vmovsd	-64(%rbp), %xmm5
	vmulsd	%xmm2, %xmm2, %xmm1
	vaddsd	%xmm5, %xmm5, %xmm0
	vxorpd	.LC7(%rip), %xmm2, %xmm3
	vmovsd	%xmm2, -616(%rbp)
	vmulsd	%xmm3, %xmm0, %xmm0
	vfmsub231sd	%xmm5, %xmm5, %xmm1
	movq	-112(%rbp), %r8
	vmovsd	%xmm5, -648(%rbp)
	vmovsd	%xmm3, -624(%rbp)
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm2, %xmm2
	vfmsub132sd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm2, -632(%rbp)
	vmovsd	%xmm1, -640(%rbp)
	cmpq	$1, %r8
	jbe	.L365
	movq	%r14, %rax
	salq	$4, %rax
	leaq	(%r12,%rax), %rdi
	movq	%rbx, %rax
	movl	-144(%rbp), %ecx
	salq	$4, %rax
	leaq	(%r12,%rax), %rsi
	leal	-1(%r15), %eax
	subl	%ecx, %eax
	addq	%rbx, %rax
	salq	$4, %rax
	leaq	16(%r12,%rax), %r12
	movq	%rsi, %rax
	leaq	16(%r13), %r11
	vmovsd	%xmm3, -448(%rbp)
	movq	%r8, %rsi
	movq	%rdi, %r9
	vmovsd	%xmm5, -72(%rbp)
	movl	$1, %r13d
	movl	%ecx, %edi
	movq	%rax, %r8
	vmovsd	%xmm5, %xmm5, %xmm3
	.p2align 4,,10
	.p2align 3
.L353:
	vmovsd	-648(%rbp), %xmm2
	vmovsd	-448(%rbp), %xmm11
	vmovsd	-624(%rbp), %xmm9
	vmulsd	%xmm11, %xmm2, %xmm0
	vmovsd	-616(%rbp), %xmm4
	vmovsd	%xmm2, %xmm2, %xmm7
	vmovsd	%xmm2, %xmm2, %xmm6
	vmovsd	%xmm0, %xmm0, %xmm5
	vmulsd	%xmm9, %xmm11, %xmm0
	vfnmadd231sd	%xmm3, %xmm4, %xmm5
	vfmsub132sd	%xmm3, %xmm0, %xmm7
	vfnmadd231sd	%xmm2, %xmm3, %xmm0
	vmulsd	%xmm5, %xmm2, %xmm1
	vmovsd	%xmm5, %xmm5, %xmm15
	vmovsd	%xmm5, -600(%rbp)
	vmovsd	%xmm7, -440(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm10
	vmulsd	%xmm9, %xmm5, %xmm0
	vfmadd132sd	%xmm4, %xmm1, %xmm10
	vfmsub132sd	%xmm7, %xmm0, %xmm6
	vfnmadd231sd	%xmm2, %xmm7, %xmm0
	vmulsd	%xmm10, %xmm2, %xmm1
	vmovsd	%xmm10, -464(%rbp)
	vmovsd	%xmm6, -80(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm14
	vmulsd	%xmm9, %xmm10, %xmm0
	vfmadd132sd	%xmm4, %xmm1, %xmm14
	vmovsd	%xmm3, %xmm3, %xmm9
	vmovq	.LC8(%rip), %xmm1
	vunpcklpd	%xmm11, %xmm3, %xmm3
	vmovsd	%xmm0, %xmm0, %xmm13
	vfmsub231sd	%xmm6, %xmm2, %xmm13
	vmovq	.LC8(%rip), %xmm2
	vmulsd	%xmm11, %xmm9, %xmm4
	vinsertf128	$0x1, %xmm3, %ymm2, %ymm3
	vunpcklpd	%xmm5, %xmm7, %xmm2
	vmovq	.LC8(%rip), %xmm5
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm2
	vunpcklpd	%xmm14, %xmm13, %xmm0
	vunpcklpd	%xmm10, %xmm6, %xmm1
	vinsertf128	$0x1, %xmm1, %ymm5, %ymm1
	vinsertf128	$0x1, %xmm0, %ymm5, %ymm0
	vmulsd	%xmm11, %xmm11, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vmovsd	%xmm14, -608(%rbp)
	vmovsd	%xmm13, -456(%rbp)
	vfmsub231sd	%xmm9, %xmm9, %xmm5
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm15, %xmm15, %xmm5
	vmovapd	%xmm4, %xmm9
	vmulsd	%xmm15, %xmm7, %xmm4
	vinsertf128	$1, %xmm9, %ymm9, %ymm9
	vmovapd	%ymm9, -304(%rbp)
	vfmsub231sd	%xmm7, %xmm7, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmovapd	%xmm4, %xmm7
	vmulsd	%xmm10, %xmm10, %xmm4
	vaddsd	%xmm6, %xmm6, %xmm5
	vinsertf128	$1, %xmm7, %ymm7, %ymm7
	vmovapd	%ymm7, -112(%rbp)
	vmulsd	%xmm10, %xmm5, %xmm5
	vfmsub231sd	%xmm6, %xmm6, %xmm4
	vunpcklpd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm14, %xmm14, %xmm5
	vmovapd	%xmm4, %xmm6
	vmulsd	%xmm14, %xmm13, %xmm4
	vinsertf128	$1, %xmm6, %ymm6, %ymm6
	vmovapd	%ymm6, -144(%rbp)
	vfmsub231sd	%xmm13, %xmm13, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmovapd	%xmm4, %xmm5
	vinsertf128	$1, %xmm5, %ymm5, %ymm5
	vmovapd	%ymm5, -176(%rbp)
	cmpq	%rbx, %r14
	jnb	.L358
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	%ymm4, -432(%rbp)
	vmovapd	%ymm4, -400(%rbp)
	vmovapd	%ymm4, -368(%rbp)
	vmovapd	%ymm4, -336(%rbp)
	vpermilpd	$5, %ymm7, %ymm7
	vpermilpd	$5, %ymm9, %ymm4
	vpermilpd	$5, %ymm6, %ymm6
	movq	%r9, %rax
	movq	%r14, %rdx
	vmovapd	%ymm4, -208(%rbp)
	vmovapd	%ymm7, -240(%rbp)
	vmovapd	%ymm6, -272(%rbp)
	vpermilpd	$5, %ymm5, %ymm15
	.p2align 4,,10
	.p2align 3
.L351:
	vmovupd	(%rax), %ymm5
	vpermilpd	$5, %ymm3, %ymm4
	vmulpd	%ymm5, %ymm3, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vmovapd	-304(%rbp), %ymm14
	vmovapd	-112(%rbp), %ymm8
	vmovapd	-240(%rbp), %ymm13
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	addq	$8, %rdx
	subq	$-128, %rax
	vblendpd	$10, %ymm4, %ymm6, %ymm6
	vpermilpd	$5, %ymm2, %ymm4
	vmovapd	%ymm6, -496(%rbp)
	vmulpd	%ymm5, %ymm4, %ymm4
	vmulpd	%ymm5, %ymm2, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm4, %ymm6, %ymm7
	vpermilpd	$5, %ymm1, %ymm4
	vmulpd	%ymm5, %ymm1, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vmovapd	%ymm7, -528(%rbp)
	vmovapd	-208(%rbp), %ymm7
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm6, %ymm4
	vmovapd	%ymm4, -560(%rbp)
	vpermilpd	$5, %ymm0, %ymm4
	vmulpd	%ymm5, %ymm0, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm6, %ymm5
	vmulpd	%ymm14, %ymm3, %ymm6
	vmulpd	%ymm7, %ymm3, %ymm3
	vmulpd	-144(%rbp), %ymm1, %ymm4
	vmulpd	-272(%rbp), %ymm1, %ymm1
	vmovapd	%ymm5, -592(%rbp)
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm3, %ymm6, %ymm6
	vmulpd	-176(%rbp), %ymm0, %ymm3
	vmulpd	%ymm0, %ymm15, %ymm0
	vblendpd	$10, %ymm1, %ymm4, %ymm4
	vmovupd	-96(%rax), %ymm1
	vmulpd	%ymm8, %ymm2, %ymm5
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmulpd	%ymm13, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm6, %ymm12
	vblendpd	$10, %ymm0, %ymm3, %ymm3
	vpermilpd	$5, %ymm6, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhaddpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm5, %ymm5, %ymm5
	vhsubpd	%ymm12, %ymm12, %ymm12
	vmulpd	%ymm1, %ymm4, %ymm10
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm2, %ymm5, %ymm5
	vmulpd	%ymm1, %ymm5, %ymm11
	vblendpd	$10, %ymm0, %ymm12, %ymm12
	vpermilpd	$5, %ymm5, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhsubpd	%ymm10, %ymm10, %ymm10
	vhsubpd	%ymm11, %ymm11, %ymm11
	vmulpd	%ymm14, %ymm6, %ymm2
	vmulpd	%ymm7, %ymm6, %ymm6
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmulpd	%ymm1, %ymm3, %ymm9
	vaddpd	-496(%rbp), %ymm12, %ymm12
	vblendpd	$10, %ymm0, %ymm11, %ymm11
	vpermilpd	$5, %ymm4, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm9, %ymm9, %ymm9
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm6, %ymm2, %ymm2
	vblendpd	$10, %ymm0, %ymm10, %ymm10
	vpermilpd	$5, %ymm3, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vmulpd	%ymm8, %ymm5, %ymm1
	vmulpd	-176(%rbp), %ymm3, %ymm8
	vmulpd	%ymm3, %ymm15, %ymm3
	vmulpd	%ymm13, %ymm5, %ymm5
	vmovupd	-64(%rax), %ymm13
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm8, %ymm8, %ymm8
	vhaddpd	%ymm3, %ymm3, %ymm3
	vmulpd	%ymm13, %ymm2, %ymm7
	vhaddpd	%ymm5, %ymm5, %ymm5
	vblendpd	$10, %ymm3, %ymm8, %ymm8
	vpermilpd	$5, %ymm2, %ymm3
	vmulpd	%ymm13, %ymm3, %ymm3
	vhaddpd	%ymm0, %ymm0, %ymm0
	vhsubpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm5, %ymm1, %ymm1
	vblendpd	$10, %ymm0, %ymm9, %ymm9
	vhaddpd	%ymm3, %ymm3, %ymm3
	vmulpd	-144(%rbp), %ymm4, %ymm0
	vmulpd	-272(%rbp), %ymm4, %ymm4
	vblendpd	$10, %ymm3, %ymm7, %ymm7
	vpermilpd	$5, %ymm1, %ymm3
	vmulpd	%ymm13, %ymm1, %ymm6
	vmulpd	%ymm13, %ymm3, %ymm3
	vhaddpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm13, %ymm0, %ymm5
	vblendpd	$10, %ymm3, %ymm6, %ymm6
	vpermilpd	$5, %ymm0, %ymm3
	vmulpd	%ymm13, %ymm3, %ymm3
	vmulpd	%ymm13, %ymm8, %ymm4
	vhsubpd	%ymm5, %ymm5, %ymm5
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm3, %ymm5, %ymm5
	vpermilpd	$5, %ymm8, %ymm3
	vmulpd	%ymm13, %ymm3, %ymm3
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm3, %ymm4, %ymm4
	vmulpd	%ymm14, %ymm2, %ymm3
	vmulpd	-208(%rbp), %ymm2, %ymm2
	vmovupd	-32(%rax), %ymm14
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm2, %ymm2, %ymm2
	vblendpd	$10, %ymm2, %ymm3, %ymm3
	vmulpd	-112(%rbp), %ymm1, %ymm2
	vmulpd	-240(%rbp), %ymm1, %ymm1
	vmulpd	%ymm14, %ymm3, %ymm13
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm13, %ymm13, %ymm13
	vblendpd	$10, %ymm1, %ymm2, %ymm2
	vmulpd	-144(%rbp), %ymm0, %ymm1
	vmulpd	-272(%rbp), %ymm0, %ymm0
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm0, %ymm1, %ymm1
	vmulpd	-176(%rbp), %ymm8, %ymm0
	vmulpd	%ymm8, %ymm15, %ymm8
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm8, %ymm0, %ymm0
	vpermilpd	$5, %ymm3, %ymm8
	vmulpd	%ymm14, %ymm8, %ymm8
	vhaddpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm8, %ymm13, %ymm8
	vaddpd	%ymm8, %ymm7, %ymm7
	vmulpd	%ymm14, %ymm2, %ymm8
	vaddpd	%ymm7, %ymm12, %ymm12
	vpermilpd	$5, %ymm2, %ymm7
	vmulpd	%ymm14, %ymm7, %ymm7
	vhsubpd	%ymm8, %ymm8, %ymm8
	vaddpd	-336(%rbp), %ymm12, %ymm12
	vhaddpd	%ymm7, %ymm7, %ymm7
	vmovapd	%ymm12, -336(%rbp)
	vblendpd	$10, %ymm7, %ymm8, %ymm7
	vaddpd	%ymm7, %ymm6, %ymm6
	vaddpd	-528(%rbp), %ymm11, %ymm8
	vmulpd	%ymm14, %ymm1, %ymm7
	vaddpd	%ymm6, %ymm8, %ymm8
	vpermilpd	$5, %ymm1, %ymm6
	vmulpd	%ymm14, %ymm6, %ymm6
	vhsubpd	%ymm7, %ymm7, %ymm7
	vaddpd	-368(%rbp), %ymm8, %ymm12
	vhaddpd	%ymm6, %ymm6, %ymm6
	vmovapd	%ymm12, -368(%rbp)
	vblendpd	$10, %ymm6, %ymm7, %ymm6
	vaddpd	%ymm6, %ymm5, %ymm5
	vaddpd	-560(%rbp), %ymm10, %ymm7
	vpermilpd	$5, %ymm0, %ymm6
	vmulpd	%ymm14, %ymm6, %ymm6
	vaddpd	%ymm5, %ymm7, %ymm7
	vmulpd	%ymm14, %ymm0, %ymm5
	vaddpd	-400(%rbp), %ymm7, %ymm11
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm5, %ymm5, %ymm5
	vmovapd	%ymm11, -400(%rbp)
	vblendpd	$10, %ymm6, %ymm5, %ymm5
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	-592(%rbp), %ymm9, %ymm6
	vmulpd	-208(%rbp), %ymm3, %ymm5
	vaddpd	%ymm4, %ymm6, %ymm6
	vmulpd	-304(%rbp), %ymm3, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm3
	vmulpd	-240(%rbp), %ymm2, %ymm5
	vaddpd	-432(%rbp), %ymm6, %ymm10
	vhsubpd	%ymm4, %ymm4, %ymm4
	vmovapd	%ymm10, -432(%rbp)
	vblendpd	$10, %ymm3, %ymm4, %ymm3
	vmulpd	-112(%rbp), %ymm2, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm2
	vmulpd	-272(%rbp), %ymm1, %ymm5
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm2, %ymm4, %ymm2
	vmulpd	-144(%rbp), %ymm1, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm1
	vmulpd	%ymm0, %ymm15, %ymm5
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm1, %ymm4, %ymm1
	vmulpd	-176(%rbp), %ymm0, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm0
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm0, %ymm4, %ymm0
	cmpq	%rbx, %rdx
	jb	.L351
	vmovapd	-336(%rbp), %ymm6
	vmovapd	%xmm0, %xmm5
	vmovapd	%xmm6, %xmm4
	vmovsd	%xmm0, %xmm0, %xmm9
	vextractf128	$0x1, %ymm6, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm7
	vaddsd	%xmm4, %xmm0, %xmm0
	vunpckhpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm6, %xmm7, %xmm6
	vmovsd	%xmm0, -112(%rbp)
	vextractf128	$0x1, %ymm12, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm7
	vaddsd	%xmm12, %xmm0, %xmm0
	vmovq	%xmm6, %rcx
	vunpckhpd	%xmm12, %xmm12, %xmm6
	vaddsd	%xmm6, %xmm7, %xmm6
	vmovsd	%xmm0, -144(%rbp)
	vextractf128	$0x1, %ymm11, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm7
	vaddsd	%xmm11, %xmm0, %xmm0
	vmovq	%xmm6, %r10
	vunpckhpd	%xmm11, %xmm11, %xmm6
	vextractf128	$0x1, %ymm10, %xmm4
	vaddsd	%xmm6, %xmm7, %xmm6
	vmovq	%xmm0, %rdx
	vaddsd	%xmm10, %xmm4, %xmm0
	vunpckhpd	%xmm4, %xmm4, %xmm14
	vmovsd	%xmm6, -176(%rbp)
	vunpckhpd	%xmm10, %xmm10, %xmm6
	vaddsd	%xmm6, %xmm14, %xmm14
	vmovsd	%xmm0, -208(%rbp)
	vunpckhpd	%xmm1, %xmm1, %xmm4
	vunpckhpd	%xmm5, %xmm5, %xmm0
	vunpckhpd	%xmm2, %xmm2, %xmm6
	vunpckhpd	%xmm3, %xmm3, %xmm5
.L350:
	cmpl	%edi, %r15d
	jle	.L355
	vmovsd	8(%r11), %xmm13
	vmovsd	56(%r11), %xmm10
	vmovsd	40(%r11), %xmm11
	vmovsd	24(%r11), %xmm12
	vmovsd	%xmm13, %xmm13, %xmm7
	vmovsd	-608(%rbp), %xmm15
	vmovsd	%xmm2, %xmm2, %xmm13
	vmovsd	%xmm10, %xmm10, %xmm2
	movq	%rcx, -240(%rbp)
	vmovsd	%xmm14, -272(%rbp)
	movq	%rsi, %rcx
	vmovsd	%xmm3, %xmm3, %xmm14
	vmovsd	%xmm11, %xmm11, %xmm10
	movq	%r8, %rax
	vmovsd	%xmm2, %xmm2, %xmm11
	movq	%r14, %rsi
	vmovsd	%xmm12, %xmm12, %xmm3
	vmovsd	%xmm7, %xmm7, %xmm2
	.p2align 4,,10
	.p2align 3
.L352:
	vmovsd	8(%rax), %xmm7
	vmovsd	(%rax), %xmm8
	vmulsd	%xmm14, %xmm7, %xmm12
	addq	$16, %rax
	vfmadd231sd	%xmm5, %xmm8, %xmm12
	vfmadd213sd	(%r11), %xmm14, %xmm8
	vaddsd	%xmm12, %xmm2, %xmm2
	vfnmadd132sd	%xmm5, %xmm8, %xmm7
	vmovsd	-448(%rbp), %xmm12
	vmovsd	%xmm2, 8(%r11)
	vmulsd	%xmm12, %xmm5, %xmm8
	vmovsd	%xmm7, (%r11)
	vmovsd	%xmm14, %xmm14, %xmm7
	vmulsd	%xmm12, %xmm7, %xmm7
	vfmsub132sd	-72(%rbp), %xmm8, %xmm14
	vmovsd	-16(%rax), %xmm8
	vfmadd132sd	-72(%rbp), %xmm7, %xmm5
	vmovsd	-8(%rax), %xmm7
	vmulsd	%xmm13, %xmm7, %xmm12
	vfmadd231sd	%xmm6, %xmm8, %xmm12
	vfmadd213sd	16(%r11), %xmm13, %xmm8
	vaddsd	%xmm12, %xmm3, %xmm3
	vfnmadd132sd	%xmm6, %xmm8, %xmm7
	vmovsd	-600(%rbp), %xmm12
	vmovsd	%xmm3, 24(%r11)
	vmulsd	%xmm12, %xmm6, %xmm8
	vmovsd	%xmm7, 16(%r11)
	vmovsd	%xmm13, %xmm13, %xmm7
	vmulsd	%xmm12, %xmm7, %xmm7
	vfmsub132sd	-440(%rbp), %xmm8, %xmm13
	vmovsd	-16(%rax), %xmm8
	vfmadd132sd	-440(%rbp), %xmm7, %xmm6
	vmovsd	-8(%rax), %xmm7
	vmulsd	%xmm1, %xmm7, %xmm12
	vfmadd231sd	%xmm4, %xmm8, %xmm12
	vfmadd213sd	32(%r11), %xmm1, %xmm8
	vaddsd	%xmm12, %xmm10, %xmm10
	vfnmadd132sd	%xmm4, %xmm8, %xmm7
	vmovsd	-464(%rbp), %xmm12
	vmovsd	%xmm10, 40(%r11)
	vmulsd	%xmm12, %xmm4, %xmm8
	vmovsd	%xmm7, 32(%r11)
	vmovsd	%xmm1, %xmm1, %xmm7
	vmulsd	%xmm12, %xmm7, %xmm7
	vfmsub132sd	-80(%rbp), %xmm8, %xmm1
	vmovsd	-16(%rax), %xmm8
	vfmadd132sd	-80(%rbp), %xmm7, %xmm4
	vmovsd	-8(%rax), %xmm7
	vmulsd	%xmm9, %xmm7, %xmm12
	vfmadd231sd	%xmm0, %xmm8, %xmm12
	vfmadd213sd	48(%r11), %xmm9, %xmm8
	vaddsd	%xmm12, %xmm11, %xmm11
	vfnmadd132sd	%xmm0, %xmm8, %xmm7
	vmulsd	%xmm0, %xmm15, %xmm8
	vmovsd	-456(%rbp), %xmm12
	vmovsd	%xmm11, 56(%r11)
	vmovsd	%xmm7, 48(%r11)
	vmovsd	%xmm9, %xmm9, %xmm7
	vmulsd	%xmm7, %xmm15, %xmm7
	vfmsub132sd	%xmm12, %xmm8, %xmm9
	vfmadd132sd	%xmm12, %xmm7, %xmm0
	cmpq	%r12, %rax
	jne	.L352
	movq	%rsi, %r14
	vmovsd	-272(%rbp), %xmm14
	movq	%rcx, %rsi
	movq	-240(%rbp), %rcx
.L355:
	vmovsd	-448(%rbp), %xmm2
	vmovsd	-632(%rbp), %xmm1
	vmovsd	-72(%rbp), %xmm3
	vmulsd	%xmm2, %xmm1, %xmm0
	vmulsd	%xmm1, %xmm3, %xmm1
	vmovsd	-640(%rbp), %xmm5
	vaddsd	56(%r11), %xmm14, %xmm14
	addq	$4, %r13
	vfmsub231sd	%xmm3, %xmm5, %xmm0
	vfmadd132sd	%xmm5, %xmm1, %xmm2
	vmovsd	%xmm14, 56(%r11)
	addq	$64, %r11
	vmovsd	%xmm2, -448(%rbp)
	vmovsd	-112(%rbp), %xmm2
	vaddsd	-64(%r11), %xmm2, %xmm1
	vmovq	%rcx, %xmm2
	vmovsd	%xmm1, -64(%r11)
	vaddsd	-56(%r11), %xmm2, %xmm1
	vmovsd	-144(%rbp), %xmm2
	vmovsd	%xmm1, -56(%r11)
	vaddsd	-48(%r11), %xmm2, %xmm1
	vmovq	%r10, %xmm2
	vmovsd	%xmm1, -48(%r11)
	vaddsd	-40(%r11), %xmm2, %xmm1
	vmovq	%rdx, %xmm2
	vmovsd	%xmm1, -40(%r11)
	vaddsd	-32(%r11), %xmm2, %xmm1
	vmovsd	-176(%rbp), %xmm2
	vmovsd	%xmm1, -32(%r11)
	vaddsd	-24(%r11), %xmm2, %xmm1
	vmovsd	-208(%rbp), %xmm2
	vaddsd	-16(%r11), %xmm2, %xmm15
	vmovsd	%xmm1, -24(%r11)
	vmovsd	%xmm15, -16(%r11)
	cmpq	%r13, %rsi
	jbe	.L367
	vmovsd	%xmm0, -72(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm3
	jmp	.L353
	.p2align 4,,10
	.p2align 3
.L367:
	vzeroupper
.L365:
	addq	$608, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L358:
	.cfi_restore_state
	vmovsd	.LC5(%rip), %xmm3
	vxorpd	%xmm5, %xmm5, %xmm5
	vmovsd	%xmm3, %xmm3, %xmm2
	vmovsd	%xmm5, %xmm5, %xmm6
	vmovsd	%xmm3, %xmm3, %xmm1
	vmovsd	%xmm5, %xmm5, %xmm4
	vmovsd	%xmm5, %xmm5, %xmm0
	vmovsd	%xmm5, -208(%rbp)
	vmovsd	%xmm5, %xmm5, %xmm14
	vmovq	%xmm5, %rdx
	vmovsd	%xmm5, -176(%rbp)
	vmovsd	%xmm5, -144(%rbp)
	vmovq	%xmm5, %r10
	vmovsd	%xmm5, -112(%rbp)
	vmovq	%xmm5, %rcx
	vmovsd	%xmm3, %xmm3, %xmm9
	jmp	.L350
.L347:
	movq	%r8, %rax
	movq	%r8, %rdx
	shrq	%rax
	andl	$1, %edx
	orq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L348
.L357:
	vmovsd	%xmm6, %xmm6, %xmm1
	vmovsd	%xmm0, %xmm0, %xmm2
	jmp	.L345
.L356:
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovsd	%xmm3, %xmm3, %xmm4
	jmp	.L343
	.cfi_endproc
.LFE10482:
	.size	_Z12dft_subarrayP7ComplexIdvEiiS1_, .-_Z12dft_subarrayP7ComplexIdvEiiS1_
	.p2align 4
	.globl	_Z20dft_subarray_inplaceP7ComplexIdvEii
	.type	_Z20dft_subarray_inplaceP7ComplexIdvEii, @function
_Z20dft_subarray_inplaceP7ComplexIdvEii:
.LFB10489:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movl	%edx, %r13d
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%esi, %r12d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	subq	$672, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -680(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	movl	%edx, %eax
	movq	%rsp, %rdx
	subl	%esi, %eax
	movl	%eax, -692(%rbp)
	cltq
	movq	%rax, -688(%rbp)
	salq	$4, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	subq	%rcx, %rdx
	movq	%rax, -712(%rbp)
	cmpq	%rdx, %rsp
	je	.L370
.L419:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rdx, %rsp
	jne	.L419
.L370:
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	jne	.L420
.L371:
	movl	$3, %eax
	shrx	%rax, %rsp, %r8
	movl	-692(%rbp), %eax
	movq	%rsp, -704(%rbp)
	testl	%eax, %eax
	jle	.L378
	cmpl	$1, -692(%rbp)
	je	.L401
	movq	-688(%rbp), %rdx
	movq	%rsp, %rbx
	shrq	%rdx
	salq	$5, %rdx
	movq	%rbx, %rax
	addq	%rbx, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L376:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L376
	movq	-688(%rbp), %rbx
	movq	%rbx, %rdx
	andq	$-2, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	addq	-704(%rbp), %rax
	cmpq	%rdx, %rbx
	je	.L378
.L375:
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%xmm0, (%rax)
.L378:
	movl	-692(%rbp), %esi
	movl	%r13d, %r9d
	andl	$7, %esi
	subl	%esi, %r9d
	movslq	%r12d, %r14
	movslq	%r9d, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	cmpq	%rbx, %r14
	jnb	.L374
	movq	%r14, %rax
	salq	$4, %rax
	addq	-680(%rbp), %rax
	movq	%r14, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L380:
	vmovupd	(%rax), %ymm7
	addq	$8, %rdx
	vaddpd	32(%rax), %ymm7, %ymm0
	vmovupd	64(%rax), %ymm7
	subq	$-128, %rax
	vaddpd	-32(%rax), %ymm7, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm2
	cmpq	%rbx, %rdx
	jb	.L380
	vextractf128	$0x1, %ymm2, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vunpckhpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vunpcklpd	%xmm1, %xmm0, %xmm1
.L374:
	vmovupd	0(,%r8,8), %xmm2
	vunpckhpd	%xmm2, %xmm2, %xmm3
	cmpl	%r9d, %r13d
	jle	.L381
	cmpl	$1, %esi
	je	.L402
	movslq	%r13d, %rdi
	movslq	%esi, %r10
	movq	%rdi, %rdx
	subq	%r10, %rdx
	movl	%esi, %eax
	shrl	%eax
	salq	$4, %rdx
	leal	-1(%rax), %ecx
	addq	-680(%rbp), %rdx
	vunpcklpd	%xmm3, %xmm2, %xmm0
	salq	$5, %rcx
	leaq	32(%rdx), %rax
	vmovapd	%xmm0, %xmm0
	addq	%rax, %rcx
	jmp	.L383
	.p2align 4,,10
	.p2align 3
.L421:
	addq	$32, %rax
.L383:
	vaddpd	(%rdx), %ymm0, %ymm0
	movq	%rax, %rdx
	cmpq	%rax, %rcx
	jne	.L421
	movl	%esi, %eax
	vextractf128	$0x1, %ymm0, %xmm2
	andl	$-2, %eax
	andl	$-7, %esi
	vaddpd	%xmm0, %xmm2, %xmm2
	je	.L381
.L382:
	subq	%r10, %rdi
	movq	-680(%rbp), %rcx
	addq	%rdi, %rax
	salq	$4, %rax
	vaddpd	(%rcx,%rax), %xmm2, %xmm2
.L381:
	vaddpd	%xmm2, %xmm1, %xmm0
	movq	-688(%rbp), %rax
	vxorps	%xmm3, %xmm3, %xmm3
	vmovupd	%xmm0, 0(,%r8,8)
	leaq	-72(%rbp), %rdi
	leaq	-80(%rbp), %rsi
	testq	%rax, %rax
	js	.L385
	vcvtsi2sdq	%rax, %xmm3, %xmm3
.L386:
	vmovsd	.LC6(%rip), %xmm0
	movl	%r9d, -112(%rbp)
	vdivsd	%xmm3, %xmm0, %xmm0
	vzeroupper
	call	sincos@PLT
	vmovsd	-72(%rbp), %xmm2
	vmovsd	-80(%rbp), %xmm7
	vmulsd	%xmm2, %xmm2, %xmm1
	vaddsd	%xmm7, %xmm7, %xmm0
	vxorpd	.LC7(%rip), %xmm2, %xmm5
	vmovsd	%xmm2, -648(%rbp)
	vmulsd	%xmm5, %xmm0, %xmm0
	vfmsub231sd	%xmm7, %xmm7, %xmm1
	movl	-692(%rbp), %eax
	movq	-688(%rbp), %r10
	decl	%eax
	movl	%eax, %ecx
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm0, %xmm0, %xmm0
	andl	$3, %eax
	andl	$3, %ecx
	subq	%rax, %r10
	vaddsd	%xmm2, %xmm2, %xmm2
	vfmsub132sd	%xmm1, %xmm0, %xmm1
	movl	%ecx, -696(%rbp)
	vmovsd	%xmm7, -640(%rbp)
	vmovsd	%xmm5, -632(%rbp)
	vmovsd	%xmm2, -656(%rbp)
	vmovsd	%xmm1, -664(%rbp)
	cmpq	$1, %r10
	jbe	.L403
	movq	-704(%rbp), %rax
	movq	-680(%rbp), %rcx
	leaq	16(%rax), %r15
	movq	%r14, %rax
	movl	-112(%rbp), %r9d
	salq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	movl	%r9d, %eax
	subl	%r12d, %eax
	decl	%eax
	shrl	$3, %eax
	leaq	(%r14,%rax,8), %rax
	salq	$4, %rax
	leaq	128(%rcx,%rax), %r11
	movq	%rbx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, -672(%rbp)
	leal	-1(%r13), %eax
	subl	%r9d, %eax
	addq	%rbx, %rax
	salq	$4, %rax
	leaq	16(%rcx,%rax), %r8
	movl	$1, %edi
	movq	%r14, -720(%rbp)
	movq	%rdi, %rbx
	vmovsd	%xmm5, -336(%rbp)
	movq	%r8, %rdi
	vmovsd	%xmm7, -312(%rbp)
	movl	%r13d, %r8d
	movq	%rsi, %r14
	movl	%r12d, %r13d
	vmovsd	%xmm7, %xmm7, %xmm10
	movq	%r11, %r12
	movl	%r9d, %r11d
	.p2align 4,,10
	.p2align 3
.L392:
	vmovsd	-640(%rbp), %xmm2
	vmovsd	-336(%rbp), %xmm15
	vmovsd	-632(%rbp), %xmm14
	vmulsd	%xmm15, %xmm2, %xmm0
	vmovsd	-648(%rbp), %xmm4
	vmovsd	%xmm2, %xmm2, %xmm6
	vmovsd	%xmm2, %xmm2, %xmm7
	vunpcklpd	%xmm15, %xmm10, %xmm3
	vmovsd	%xmm0, %xmm0, %xmm5
	vmulsd	%xmm14, %xmm15, %xmm0
	vfnmadd231sd	%xmm10, %xmm4, %xmm5
	vfmsub132sd	%xmm10, %xmm0, %xmm6
	vfnmadd231sd	%xmm2, %xmm10, %xmm0
	vmulsd	%xmm5, %xmm2, %xmm1
	vmovsd	%xmm5, -624(%rbp)
	vmovsd	%xmm6, -328(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm12
	vmulsd	%xmm14, %xmm5, %xmm0
	vfmadd132sd	%xmm4, %xmm1, %xmm12
	vfmsub132sd	%xmm6, %xmm0, %xmm7
	vfnmadd231sd	%xmm2, %xmm6, %xmm0
	vmulsd	%xmm12, %xmm2, %xmm1
	vmovsd	%xmm12, -616(%rbp)
	vmovsd	%xmm7, -320(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm13
	vmulsd	%xmm14, %xmm12, %xmm0
	vfmadd132sd	%xmm4, %xmm1, %xmm13
	vmovq	.LC8(%rip), %xmm1
	vmovsd	%xmm15, %xmm15, %xmm14
	vmovsd	%xmm5, %xmm5, %xmm15
	vmovsd	%xmm0, %xmm0, %xmm11
	vfmsub231sd	%xmm7, %xmm2, %xmm11
	vmovq	.LC8(%rip), %xmm2
	vmulsd	%xmm14, %xmm10, %xmm4
	vinsertf128	$0x1, %xmm3, %ymm2, %ymm3
	vunpcklpd	%xmm5, %xmm6, %xmm2
	vmovq	.LC8(%rip), %xmm5
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm2
	vunpcklpd	%xmm13, %xmm11, %xmm0
	vunpcklpd	%xmm12, %xmm7, %xmm1
	vinsertf128	$0x1, %xmm1, %ymm5, %ymm1
	vinsertf128	$0x1, %xmm0, %ymm5, %ymm0
	vmulsd	%xmm14, %xmm14, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vmovsd	%xmm13, -600(%rbp)
	vmovsd	%xmm11, -608(%rbp)
	vfmsub231sd	%xmm10, %xmm10, %xmm5
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm15, %xmm15, %xmm5
	vmovapd	%xmm4, %xmm10
	vmulsd	%xmm15, %xmm6, %xmm4
	vinsertf128	$1, %xmm10, %ymm10, %ymm10
	vmovapd	%ymm10, -304(%rbp)
	vfmsub231sd	%xmm6, %xmm6, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmovapd	%xmm4, %xmm6
	vmulsd	%xmm12, %xmm12, %xmm4
	vaddsd	%xmm7, %xmm7, %xmm5
	vinsertf128	$1, %xmm6, %ymm6, %ymm6
	vmovapd	%ymm6, -112(%rbp)
	vmulsd	%xmm12, %xmm5, %xmm5
	vfmsub231sd	%xmm7, %xmm7, %xmm4
	vunpcklpd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm13, %xmm13, %xmm5
	vmovapd	%xmm4, %xmm7
	vmulsd	%xmm13, %xmm11, %xmm4
	vinsertf128	$1, %xmm7, %ymm7, %ymm7
	vmovapd	%ymm7, -144(%rbp)
	vfmsub231sd	%xmm11, %xmm11, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmovapd	%xmm4, %xmm5
	vinsertf128	$1, %xmm5, %ymm5, %ymm5
	vmovapd	%ymm5, -176(%rbp)
	cmpl	%r11d, %r13d
	jge	.L404
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	%ymm4, -464(%rbp)
	vmovapd	%ymm4, -432(%rbp)
	vmovapd	%ymm4, -400(%rbp)
	vmovapd	%ymm4, -368(%rbp)
	vpermilpd	$5, %ymm6, %ymm6
	vpermilpd	$5, %ymm10, %ymm4
	vpermilpd	$5, %ymm7, %ymm7
	movq	%r14, %rax
	vmovapd	%ymm4, -208(%rbp)
	vmovapd	%ymm6, -240(%rbp)
	vmovapd	%ymm7, -272(%rbp)
	vpermilpd	$5, %ymm5, %ymm15
	.p2align 4,,10
	.p2align 3
.L389:
	vmovupd	(%rax), %ymm5
	vpermilpd	$5, %ymm3, %ymm4
	vmulpd	%ymm5, %ymm3, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vmovapd	-304(%rbp), %ymm14
	vmovapd	-112(%rbp), %ymm8
	vmovapd	-240(%rbp), %ymm13
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	subq	$-128, %rax
	vblendpd	$10, %ymm4, %ymm6, %ymm7
	vpermilpd	$5, %ymm2, %ymm4
	vmulpd	%ymm5, %ymm2, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vmovapd	%ymm7, -496(%rbp)
	vmovapd	-208(%rbp), %ymm7
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm6, %ymm6
	vpermilpd	$5, %ymm1, %ymm4
	vmovapd	%ymm6, -528(%rbp)
	vmulpd	%ymm5, %ymm4, %ymm4
	vmulpd	%ymm5, %ymm1, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm4, %ymm6, %ymm4
	vmovapd	%ymm4, -560(%rbp)
	vpermilpd	$5, %ymm0, %ymm4
	vmulpd	%ymm5, %ymm0, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm6, %ymm5
	vmulpd	%ymm14, %ymm3, %ymm6
	vmulpd	%ymm7, %ymm3, %ymm3
	vmulpd	-144(%rbp), %ymm1, %ymm4
	vmulpd	-272(%rbp), %ymm1, %ymm1
	vmovapd	%ymm5, -592(%rbp)
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm3, %ymm6, %ymm6
	vmulpd	-176(%rbp), %ymm0, %ymm3
	vmulpd	%ymm0, %ymm15, %ymm0
	vblendpd	$10, %ymm1, %ymm4, %ymm4
	vmovupd	-96(%rax), %ymm1
	vmulpd	%ymm8, %ymm2, %ymm5
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmulpd	%ymm13, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm6, %ymm12
	vblendpd	$10, %ymm0, %ymm3, %ymm3
	vpermilpd	$5, %ymm6, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhaddpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm5, %ymm5, %ymm5
	vhsubpd	%ymm12, %ymm12, %ymm12
	vmulpd	%ymm1, %ymm4, %ymm10
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm2, %ymm5, %ymm5
	vmulpd	%ymm1, %ymm5, %ymm11
	vblendpd	$10, %ymm0, %ymm12, %ymm12
	vpermilpd	$5, %ymm5, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhsubpd	%ymm10, %ymm10, %ymm10
	vhsubpd	%ymm11, %ymm11, %ymm11
	vmulpd	%ymm14, %ymm6, %ymm2
	vmulpd	%ymm7, %ymm6, %ymm6
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmulpd	%ymm1, %ymm3, %ymm9
	vaddpd	-496(%rbp), %ymm12, %ymm12
	vblendpd	$10, %ymm0, %ymm11, %ymm11
	vpermilpd	$5, %ymm4, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm9, %ymm9, %ymm9
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm6, %ymm2, %ymm2
	vblendpd	$10, %ymm0, %ymm10, %ymm10
	vpermilpd	$5, %ymm3, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vmulpd	%ymm8, %ymm5, %ymm1
	vmulpd	-176(%rbp), %ymm3, %ymm8
	vmulpd	%ymm3, %ymm15, %ymm3
	vmulpd	%ymm13, %ymm5, %ymm5
	vmovupd	-64(%rax), %ymm13
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm8, %ymm8, %ymm8
	vhaddpd	%ymm3, %ymm3, %ymm3
	vmulpd	%ymm2, %ymm13, %ymm7
	vhaddpd	%ymm5, %ymm5, %ymm5
	vblendpd	$10, %ymm3, %ymm8, %ymm8
	vpermilpd	$5, %ymm2, %ymm3
	vmulpd	%ymm3, %ymm13, %ymm3
	vhaddpd	%ymm0, %ymm0, %ymm0
	vhsubpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm5, %ymm1, %ymm1
	vblendpd	$10, %ymm0, %ymm9, %ymm9
	vhaddpd	%ymm3, %ymm3, %ymm3
	vmulpd	-144(%rbp), %ymm4, %ymm0
	vmulpd	-272(%rbp), %ymm4, %ymm4
	vblendpd	$10, %ymm3, %ymm7, %ymm7
	vpermilpd	$5, %ymm1, %ymm3
	vmulpd	%ymm1, %ymm13, %ymm6
	vmulpd	%ymm3, %ymm13, %ymm3
	vhaddpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm13, %ymm5
	vblendpd	$10, %ymm3, %ymm6, %ymm6
	vpermilpd	$5, %ymm0, %ymm3
	vmulpd	%ymm3, %ymm13, %ymm3
	vmulpd	%ymm8, %ymm13, %ymm4
	vhsubpd	%ymm5, %ymm5, %ymm5
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm3, %ymm5, %ymm5
	vpermilpd	$5, %ymm8, %ymm3
	vmulpd	%ymm3, %ymm13, %ymm3
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm3, %ymm4, %ymm4
	vmulpd	%ymm14, %ymm2, %ymm3
	vmulpd	-208(%rbp), %ymm2, %ymm2
	vmovupd	-32(%rax), %ymm14
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm2, %ymm2, %ymm2
	vblendpd	$10, %ymm2, %ymm3, %ymm3
	vmulpd	-112(%rbp), %ymm1, %ymm2
	vmulpd	-240(%rbp), %ymm1, %ymm1
	vmulpd	%ymm14, %ymm3, %ymm13
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm13, %ymm13, %ymm13
	vblendpd	$10, %ymm1, %ymm2, %ymm2
	vmulpd	-144(%rbp), %ymm0, %ymm1
	vmulpd	-272(%rbp), %ymm0, %ymm0
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm0, %ymm1, %ymm1
	vmulpd	-176(%rbp), %ymm8, %ymm0
	vmulpd	%ymm8, %ymm15, %ymm8
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm8, %ymm0, %ymm0
	vpermilpd	$5, %ymm3, %ymm8
	vmulpd	%ymm14, %ymm8, %ymm8
	vhaddpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm8, %ymm13, %ymm8
	vaddpd	%ymm8, %ymm7, %ymm7
	vmulpd	%ymm14, %ymm2, %ymm8
	vaddpd	%ymm7, %ymm12, %ymm12
	vaddpd	-368(%rbp), %ymm12, %ymm7
	vhsubpd	%ymm8, %ymm8, %ymm8
	vmovapd	%ymm7, -368(%rbp)
	vpermilpd	$5, %ymm2, %ymm7
	vmulpd	%ymm14, %ymm7, %ymm7
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm8, %ymm7
	vaddpd	%ymm7, %ymm6, %ymm6
	vaddpd	-528(%rbp), %ymm11, %ymm8
	vmulpd	%ymm14, %ymm1, %ymm7
	vaddpd	%ymm6, %ymm8, %ymm8
	vpermilpd	$5, %ymm1, %ymm6
	vmulpd	%ymm14, %ymm6, %ymm6
	vhsubpd	%ymm7, %ymm7, %ymm7
	vaddpd	-400(%rbp), %ymm8, %ymm11
	vhaddpd	%ymm6, %ymm6, %ymm6
	vmovapd	%ymm11, -400(%rbp)
	vblendpd	$10, %ymm6, %ymm7, %ymm6
	vaddpd	%ymm6, %ymm5, %ymm5
	vaddpd	-560(%rbp), %ymm10, %ymm7
	vpermilpd	$5, %ymm0, %ymm6
	vmulpd	%ymm14, %ymm6, %ymm6
	vaddpd	%ymm5, %ymm7, %ymm7
	vmulpd	%ymm14, %ymm0, %ymm5
	vaddpd	-432(%rbp), %ymm7, %ymm11
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm5, %ymm5, %ymm5
	vmovapd	%ymm11, -432(%rbp)
	vblendpd	$10, %ymm6, %ymm5, %ymm5
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	-592(%rbp), %ymm9, %ymm6
	vmulpd	-208(%rbp), %ymm3, %ymm5
	vaddpd	%ymm4, %ymm6, %ymm6
	vmulpd	-304(%rbp), %ymm3, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm3
	vmulpd	-240(%rbp), %ymm2, %ymm5
	vaddpd	-464(%rbp), %ymm6, %ymm9
	vhsubpd	%ymm4, %ymm4, %ymm4
	vmovapd	%ymm9, -464(%rbp)
	vblendpd	$10, %ymm3, %ymm4, %ymm3
	vmulpd	-112(%rbp), %ymm2, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm2
	vmulpd	-272(%rbp), %ymm1, %ymm5
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm2, %ymm4, %ymm2
	vmulpd	-144(%rbp), %ymm1, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm1
	vmulpd	%ymm0, %ymm15, %ymm5
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm1, %ymm4, %ymm1
	vmulpd	-176(%rbp), %ymm0, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm0
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm0, %ymm4, %ymm0
	cmpq	%r12, %rax
	jne	.L389
	vmovapd	-368(%rbp), %ymm15
	vmovsd	%xmm0, %xmm0, %xmm4
	vextractf128	$0x1, %ymm15, %xmm8
	vunpckhpd	%xmm8, %xmm8, %xmm11
	vunpckhpd	%xmm15, %xmm15, %xmm10
	vmovapd	%xmm15, %xmm9
	vaddsd	%xmm10, %xmm11, %xmm15
	vunpckhpd	%xmm3, %xmm3, %xmm5
	vunpckhpd	%xmm1, %xmm1, %xmm6
	vmovsd	%xmm15, -176(%rbp)
	vaddsd	%xmm9, %xmm8, %xmm15
	vunpckhpd	%xmm2, %xmm2, %xmm7
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm15, -208(%rbp)
	vmovapd	-400(%rbp), %ymm15
	vextractf128	$0x1, %ymm15, %xmm8
	vunpckhpd	%xmm8, %xmm8, %xmm11
	vunpckhpd	%xmm15, %xmm15, %xmm10
	vmovapd	%xmm15, %xmm9
	vaddsd	%xmm10, %xmm11, %xmm15
	vmovsd	%xmm15, -240(%rbp)
	vaddsd	%xmm9, %xmm8, %xmm15
	vmovsd	%xmm15, -272(%rbp)
	vmovapd	-432(%rbp), %ymm15
	vextractf128	$0x1, %ymm15, %xmm10
	vunpckhpd	%xmm10, %xmm10, %xmm9
	vunpckhpd	%xmm15, %xmm15, %xmm8
	vmovapd	%xmm15, %xmm11
	vaddsd	%xmm8, %xmm9, %xmm15
	vmovsd	%xmm15, -304(%rbp)
	vaddsd	%xmm11, %xmm10, %xmm15
	vmovsd	%xmm15, -368(%rbp)
	vmovapd	-464(%rbp), %ymm15
	vextractf128	$0x1, %ymm15, %xmm11
	vunpckhpd	%xmm15, %xmm15, %xmm9
	vunpckhpd	%xmm11, %xmm11, %xmm8
	vmovapd	%xmm15, %xmm10
	vaddsd	%xmm8, %xmm9, %xmm15
	vmovsd	%xmm15, -400(%rbp)
	vaddsd	%xmm10, %xmm11, %xmm15
	vmovsd	%xmm15, -432(%rbp)
.L388:
	vmovsd	(%r15), %xmm13
	vmovsd	%xmm13, %xmm13, %xmm8
	cmpl	%r11d, %r8d
	jle	.L390
	movq	8(%r15), %rcx
	vmovsd	32(%r15), %xmm14
	vmovsd	16(%r15), %xmm9
	vmovsd	40(%r15), %xmm8
	movq	24(%r15), %rsi
	vmovsd	48(%r15), %xmm15
	movq	56(%r15), %rdx
	movq	-672(%rbp), %rax
	movq	%rcx, -144(%rbp)
	vmovsd	%xmm13, -112(%rbp)
	movq	%r14, %rcx
	vmovsd	%xmm14, %xmm14, %xmm13
	movq	%r12, %r14
	vmovsd	%xmm9, %xmm9, %xmm12
	movq	%rbx, %r12
	vmovsd	%xmm8, %xmm8, %xmm14
	movq	%r15, %rbx
	.p2align 4,,10
	.p2align 3
.L391:
	vmovsd	8(%rax), %xmm10
	vmovsd	(%rax), %xmm11
	vmulsd	%xmm3, %xmm10, %xmm8
	addq	$16, %rax
	vfmadd231sd	%xmm5, %xmm11, %xmm8
	vmovq	%xmm8, %r9
	vmulsd	%xmm5, %xmm10, %xmm8
	vfmsub231sd	%xmm3, %xmm11, %xmm8
	vaddsd	-112(%rbp), %xmm8, %xmm9
	vmovq	%r9, %xmm8
	vmovq	%xmm3, %r9
	vmovsd	%xmm9, -112(%rbp)
	vaddsd	-144(%rbp), %xmm8, %xmm9
	vmovsd	-336(%rbp), %xmm8
	vmovsd	%xmm9, -144(%rbp)
	vmulsd	%xmm8, %xmm5, %xmm9
	vfmsub132sd	-312(%rbp), %xmm9, %xmm3
	vmovq	%r9, %xmm9
	vmulsd	%xmm8, %xmm9, %xmm9
	vfmadd132sd	-312(%rbp), %xmm9, %xmm5
	vmulsd	%xmm2, %xmm10, %xmm9
	vmovsd	%xmm9, %xmm9, %xmm8
	vfmadd231sd	%xmm7, %xmm11, %xmm8
	vmulsd	%xmm7, %xmm10, %xmm9
	vmovq	%xmm8, %r9
	vmovsd	%xmm9, %xmm9, %xmm8
	vfmsub231sd	%xmm2, %xmm11, %xmm8
	vmovq	%rsi, %xmm9
	vaddsd	%xmm8, %xmm12, %xmm12
	vmovq	%r9, %xmm8
	vaddsd	%xmm8, %xmm9, %xmm9
	vmovsd	-624(%rbp), %xmm8
	vmovq	%xmm2, %r9
	vmovq	%xmm9, %rsi
	vmulsd	%xmm8, %xmm7, %xmm9
	vfmsub132sd	-328(%rbp), %xmm9, %xmm2
	vmovq	%r9, %xmm9
	vmulsd	%xmm8, %xmm9, %xmm9
	vfmadd132sd	-328(%rbp), %xmm9, %xmm7
	vmulsd	%xmm1, %xmm10, %xmm9
	vmovsd	%xmm9, %xmm9, %xmm8
	vfmadd231sd	%xmm6, %xmm11, %xmm8
	vmulsd	%xmm6, %xmm10, %xmm9
	vmovq	%xmm8, %r9
	vmovsd	%xmm9, %xmm9, %xmm8
	vfmsub231sd	%xmm1, %xmm11, %xmm8
	vmovq	%r9, %xmm9
	vaddsd	%xmm9, %xmm14, %xmm14
	vmovq	%xmm1, %r9
	vaddsd	%xmm8, %xmm13, %xmm13
	vmovsd	-616(%rbp), %xmm8
	vmulsd	%xmm8, %xmm6, %xmm9
	vfmsub132sd	-320(%rbp), %xmm9, %xmm1
	vmovq	%r9, %xmm9
	vmulsd	%xmm8, %xmm9, %xmm9
	vfmadd132sd	-320(%rbp), %xmm9, %xmm6
	vmulsd	%xmm4, %xmm10, %xmm9
	vmulsd	%xmm0, %xmm10, %xmm10
	vmovsd	%xmm9, %xmm9, %xmm8
	vfmsub231sd	%xmm4, %xmm11, %xmm10
	vfmadd231sd	%xmm0, %xmm11, %xmm8
	vmovsd	-608(%rbp), %xmm9
	vaddsd	%xmm10, %xmm15, %xmm15
	vmovq	%rdx, %xmm10
	vaddsd	%xmm8, %xmm10, %xmm11
	vmovsd	-600(%rbp), %xmm8
	vmovsd	%xmm4, %xmm4, %xmm10
	vmulsd	%xmm8, %xmm10, %xmm10
	vmovq	%xmm11, %rdx
	vmulsd	%xmm8, %xmm0, %xmm11
	vfmadd132sd	%xmm9, %xmm10, %xmm0
	vfmsub132sd	%xmm9, %xmm11, %xmm4
	cmpq	%rax, %rdi
	jne	.L391
	movq	%rbx, %r15
	movq	%r12, %rbx
	movq	%r14, %r12
	movq	%rcx, %r14
	movq	-144(%rbp), %rcx
	vmovsd	%xmm14, %xmm14, %xmm7
	vmovq	%rsi, %xmm2
	vmovsd	%xmm13, %xmm13, %xmm14
	vmovsd	-112(%rbp), %xmm13
	vunpcklpd	%xmm2, %xmm12, %xmm9
	vmovq	%rcx, %xmm2
	vunpcklpd	%xmm2, %xmm13, %xmm13
	vmovsd	%xmm7, %xmm7, %xmm8
	vinsertf128	$0x1, %xmm9, %ymm13, %ymm13
	vmovq	%rdx, %xmm7
	vunpcklpd	%xmm8, %xmm14, %xmm14
	vmovupd	%ymm13, (%r15)
	vunpcklpd	%xmm7, %xmm15, %xmm15
	vinsertf128	$0x1, %xmm15, %ymm14, %ymm14
	vmovsd	(%r15), %xmm8
	vmovupd	%ymm14, 32(%r15)
.L390:
	vmovsd	-656(%rbp), %xmm2
	vmovsd	-336(%rbp), %xmm7
	vmovsd	-664(%rbp), %xmm5
	vmulsd	%xmm7, %xmm2, %xmm0
	vmovsd	-312(%rbp), %xmm1
	vaddsd	-208(%rbp), %xmm8, %xmm8
	addq	$4, %rbx
	addq	$64, %r15
	vfmsub231sd	%xmm1, %xmm5, %xmm0
	vmulsd	%xmm2, %xmm1, %xmm1
	vmovsd	-272(%rbp), %xmm2
	vmovsd	%xmm8, -64(%r15)
	vaddsd	-48(%r15), %xmm2, %xmm8
	vmovsd	-368(%rbp), %xmm2
	vfmadd132sd	%xmm5, %xmm1, %xmm7
	vmovsd	%xmm8, -48(%r15)
	vmovsd	%xmm7, -336(%rbp)
	vmovsd	-176(%rbp), %xmm7
	vaddsd	-56(%r15), %xmm7, %xmm1
	vmovsd	-240(%rbp), %xmm7
	vmovsd	%xmm1, -56(%r15)
	vaddsd	-40(%r15), %xmm7, %xmm1
	vmovsd	-304(%rbp), %xmm7
	vmovsd	%xmm1, -40(%r15)
	vaddsd	-32(%r15), %xmm2, %xmm1
	vmovsd	-432(%rbp), %xmm2
	vmovsd	%xmm1, -32(%r15)
	vaddsd	-24(%r15), %xmm7, %xmm1
	vmovsd	-400(%rbp), %xmm7
	vmovsd	%xmm1, -24(%r15)
	vaddsd	-16(%r15), %xmm2, %xmm1
	vmovsd	%xmm1, -16(%r15)
	vaddsd	-8(%r15), %xmm7, %xmm1
	vmovsd	%xmm1, -8(%r15)
	cmpq	%rbx, %r10
	jbe	.L422
	vmovsd	%xmm0, -312(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm10
	jmp	.L392
	.p2align 4,,10
	.p2align 3
.L404:
	vmovsd	.LC5(%rip), %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -432(%rbp)
	vmovsd	%xmm0, -400(%rbp)
	vmovsd	%xmm0, -368(%rbp)
	vmovsd	%xmm0, -304(%rbp)
	vmovsd	%xmm0, -272(%rbp)
	vmovsd	%xmm0, -240(%rbp)
	vmovsd	%xmm0, -208(%rbp)
	vmovsd	%xmm0, -176(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm7
	vmovsd	%xmm2, %xmm2, %xmm1
	vmovsd	%xmm0, %xmm0, %xmm6
	vmovsd	%xmm2, %xmm2, %xmm4
	vmovsd	%xmm2, %xmm2, %xmm3
	vmovsd	%xmm0, %xmm0, %xmm5
	jmp	.L388
	.p2align 4,,10
	.p2align 3
.L422:
	movq	-720(%rbp), %r14
	movl	%r13d, %r12d
	movl	%r8d, %r13d
	vzeroupper
.L387:
	movl	-692(%rbp), %ecx
	subl	-696(%rbp), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, -688(%rbp)
	jbe	.L393
	movq	-704(%rbp), %rax
	movq	-712(%rbp), %r8
	movslq	%r13d, %rsi
	salq	$4, %rcx
	addq	%rax, %rcx
	addq	%rax, %r8
	movq	%r14, %rdi
	movq	-680(%rbp), %rax
	movq	%rsi, %rdx
	salq	$4, %rdi
	salq	$4, %rdx
	vmovsd	-632(%rbp), %xmm9
	vmovsd	-640(%rbp), %xmm10
	vmovsd	-336(%rbp), %xmm6
	addq	%rax, %rdi
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L394:
	cmpq	%rsi, %r14
	jnb	.L397
	vmovsd	(%rcx), %xmm8
	vmovsd	8(%rcx), %xmm7
	vmovsd	.LC5(%rip), %xmm1
	movq	%rdi, %rax
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L395:
	vmovsd	8(%rax), %xmm4
	vmovsd	(%rax), %xmm3
	vmulsd	%xmm1, %xmm4, %xmm5
	vmulsd	%xmm2, %xmm4, %xmm4
	addq	$16, %rax
	vfmadd231sd	%xmm2, %xmm3, %xmm5
	vfmsub132sd	%xmm1, %xmm4, %xmm3
	vmulsd	%xmm2, %xmm6, %xmm4
	vaddsd	%xmm5, %xmm7, %xmm7
	vaddsd	%xmm3, %xmm8, %xmm8
	vmovsd	%xmm1, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm6, %xmm3
	vfmsub132sd	%xmm0, %xmm4, %xmm1
	vfmadd132sd	%xmm0, %xmm3, %xmm2
	cmpq	%rdx, %rax
	jne	.L395
	vmovsd	%xmm8, (%rcx)
	vmovsd	%xmm7, 8(%rcx)
.L397:
	vmulsd	%xmm6, %xmm9, %xmm1
	addq	$16, %rcx
	vfmsub231sd	%xmm0, %xmm10, %xmm1
	vmulsd	%xmm0, %xmm9, %xmm0
	vfmadd132sd	%xmm10, %xmm0, %xmm6
	cmpq	%rcx, %r8
	je	.L393
	vmovsd	%xmm1, %xmm1, %xmm0
	jmp	.L394
	.p2align 4,,10
	.p2align 3
.L393:
	cmpl	%r12d, %r13d
	jle	.L368
	movq	-680(%rbp), %rdi
	movq	%r14, %rax
	salq	$4, %rax
	addq	%rax, %rdi
	movl	%r13d, %eax
	subl	%r12d, %eax
	leal	-1(%rax), %edx
	incq	%rdx
	movq	-704(%rbp), %rsi
	salq	$4, %rdx
	call	memcpy@PLT
.L368:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L423
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L385:
	.cfi_restore_state
	movq	%rax, %rcx
	andl	$1, %ecx
	shrq	%rax
	orq	%rcx, %rax
	vcvtsi2sdq	%rax, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm3, %xmm3
	jmp	.L386
.L420:
	orq	$0, -8(%rsp,%rax)
	jmp	.L371
.L403:
	vmovsd	%xmm7, %xmm7, %xmm0
	vmovsd	%xmm5, -336(%rbp)
	jmp	.L387
.L402:
	xorl	%eax, %eax
	movslq	%r13d, %rdi
	movl	$1, %r10d
	jmp	.L382
.L401:
	movq	%rsp, %rax
	jmp	.L375
.L423:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE10489:
	.size	_Z20dft_subarray_inplaceP7ComplexIdvEii, .-_Z20dft_subarray_inplaceP7ComplexIdvEii
	.p2align 4
	.globl	_Z6fft_b2P7ComplexIdvEi
	.type	_Z6fft_b2P7ComplexIdvEi, @function
_Z6fft_b2P7ComplexIdvEi:
.LFB10490:
	.cfi_startproc
	endbr64
	movslq	%esi, %rsi
	testq	%rsi, %rsi
	je	.L431
	decq	%rsi
	shrq	$3, %rsi
	salq	$7, %rsi
	vmovapd	.LC9(%rip), %ymm4
	leaq	128(%rdi,%rsi), %rax
	.p2align 4,,10
	.p2align 3
.L426:
	vmovupd	(%rdi), %ymm3
	vmovupd	32(%rdi), %ymm2
	vpermpd	$238, %ymm3, %ymm5
	vpermpd	$68, %ymm3, %ymm3
	vfmadd231pd	%ymm4, %ymm5, %ymm3
	vmovupd	64(%rdi), %ymm1
	vmovupd	96(%rdi), %ymm0
	subq	$-128, %rdi
	vmovupd	%ymm3, -128(%rdi)
	vpermpd	$238, %ymm2, %ymm3
	vpermpd	$68, %ymm2, %ymm2
	vfmadd231pd	%ymm4, %ymm3, %ymm2
	vmovupd	%ymm2, -96(%rdi)
	vpermpd	$238, %ymm1, %ymm2
	vpermpd	$68, %ymm1, %ymm1
	vfmadd231pd	%ymm4, %ymm2, %ymm1
	vmovupd	%ymm1, -64(%rdi)
	vpermpd	$238, %ymm0, %ymm1
	vpermpd	$68, %ymm0, %ymm0
	vfmadd231pd	%ymm4, %ymm1, %ymm0
	vmovupd	%ymm0, -32(%rdi)
	cmpq	%rax, %rdi
	jne	.L426
	vzeroupper
.L431:
	ret
	.cfi_endproc
.LFE10490:
	.size	_Z6fft_b2P7ComplexIdvEi, .-_Z6fft_b2P7ComplexIdvEi
	.p2align 4
	.globl	_Z6fft_b4P7ComplexIdvEi
	.type	_Z6fft_b4P7ComplexIdvEi, @function
_Z6fft_b4P7ComplexIdvEi:
.LFB10491:
	.cfi_startproc
	endbr64
	movslq	%esi, %rsi
	testq	%rsi, %rsi
	je	.L439
	vmovapd	.LC10(%rip), %ymm2
	xorl	%eax, %eax
	vpermilpd	$5, %ymm2, %ymm3
	.p2align 4,,10
	.p2align 3
.L434:
	vmovupd	32(%rdi), %ymm1
	vmovupd	(%rdi), %ymm4
	vmulpd	%ymm2, %ymm1, %ymm0
	vmulpd	%ymm1, %ymm3, %ymm1
	addq	$16, %rax
	addq	$256, %rdi
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm0, %ymm0
	vaddpd	%ymm4, %ymm0, %ymm1
	vsubpd	%ymm0, %ymm4, %ymm4
	vmovupd	%ymm1, -256(%rdi)
	vmovupd	-160(%rdi), %ymm1
	vmovupd	%ymm4, -224(%rdi)
	vmulpd	%ymm2, %ymm1, %ymm0
	vmulpd	%ymm3, %ymm1, %ymm1
	vmovupd	-192(%rdi), %ymm4
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm0, %ymm0
	vaddpd	%ymm4, %ymm0, %ymm1
	vsubpd	%ymm0, %ymm4, %ymm4
	vmovupd	%ymm1, -192(%rdi)
	vmovupd	-96(%rdi), %ymm1
	vmovupd	%ymm4, -160(%rdi)
	vmulpd	%ymm2, %ymm1, %ymm0
	vmulpd	%ymm3, %ymm1, %ymm1
	vmovupd	-128(%rdi), %ymm4
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm0, %ymm0
	vaddpd	%ymm4, %ymm0, %ymm1
	vsubpd	%ymm0, %ymm4, %ymm4
	vmovupd	%ymm1, -128(%rdi)
	vmovupd	-32(%rdi), %ymm1
	vmovupd	%ymm4, -96(%rdi)
	vmulpd	%ymm2, %ymm1, %ymm0
	vmulpd	%ymm3, %ymm1, %ymm1
	vmovupd	-64(%rdi), %ymm4
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm1
	vsubpd	%ymm0, %ymm4, %ymm4
	vmovupd	%ymm1, -64(%rdi)
	vmovupd	%ymm4, -32(%rdi)
	cmpq	%rsi, %rax
	jb	.L434
	vzeroupper
.L439:
	ret
	.cfi_endproc
.LFE10491:
	.size	_Z6fft_b4P7ComplexIdvEi, .-_Z6fft_b4P7ComplexIdvEi
	.p2align 4
	.globl	_Z7fft_oddP7ComplexIdvEii
	.type	_Z7fft_oddP7ComplexIdvEii, @function
_Z7fft_oddP7ComplexIdvEii:
.LFB10492:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%edx, %r12d
	movl	%r12d, %r13d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	sarl	%r13d
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%esi, %ebx
	subq	$192, %rsp
	vmovsd	.LC6(%rip), %xmm1
	movq	%rdi, -112(%rbp)
	vdivsd	%xmm0, %xmm1, %xmm0
	movl	%esi, -68(%rbp)
	leaq	-56(%rbp), %rdi
	leaq	-64(%rbp), %rsi
	call	sincos@PLT
	vmovsd	-64(%rbp), %xmm6
	vmovsd	-56(%rbp), %xmm0
	vaddsd	%xmm6, %xmm6, %xmm3
	vxorpd	.LC7(%rip), %xmm0, %xmm7
	vmulsd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm7, %xmm3, %xmm3
	vmovsd	%xmm6, -184(%rbp)
	vmovsd	%xmm7, -80(%rbp)
	vfmsub231sd	%xmm6, %xmm6, %xmm0
	vmulsd	%xmm3, %xmm3, %xmm1
	vmulsd	%xmm0, %xmm3, %xmm2
	vfmsub231sd	%xmm0, %xmm0, %xmm1
	vunpcklpd	%xmm3, %xmm0, %xmm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vaddsd	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm4
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm4, %xmm4, %xmm4
	vfmsub132sd	%xmm1, %xmm2, %xmm1
	vunpcklpd	%xmm4, %xmm1, %xmm12
	vinsertf128	$1, %xmm12, %ymm12, %ymm12
	testl	%ebx, %ebx
	jle	.L455
	vmovq	.LC8(%rip), %xmm2
	vunpcklpd	%xmm7, %xmm6, %xmm1
	vinsertf128	$0x1, %xmm1, %ymm2, %ymm6
	vpermilpd	$5, %ymm0, %ymm1
	vmulpd	%ymm6, %ymm0, %ymm2
	vmulpd	%ymm6, %ymm1, %ymm3
	vmovapd	%ymm6, -240(%rbp)
	movl	%r13d, %r11d
	movq	-112(%rbp), %r8
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm3, %ymm3, %ymm3
	andl	$-8, %r11d
	leal	-1(%r13), %eax
	vblendpd	$10, %ymm3, %ymm2, %ymm6
	vmulpd	%ymm6, %ymm0, %ymm2
	vmulpd	%ymm6, %ymm1, %ymm3
	vmovapd	%ymm6, -112(%rbp)
	movslq	%r11d, %r14
	subl	%r11d, %eax
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm3, %ymm3, %ymm3
	addq	%r14, %rax
	salq	$4, %rax
	vblendpd	$10, %ymm3, %ymm2, %ymm6
	vmulpd	%ymm6, %ymm0, %ymm0
	vmulpd	%ymm6, %ymm1, %ymm1
	leaq	16(%r8,%rax), %rdi
	leal	-1(%r11), %eax
	shrl	$3, %eax
	salq	$3, %rax
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm1, %ymm1, %ymm1
	movq	%rax, -192(%rbp)
	leaq	128(%r8), %rax
	movslq	%r12d, %r15
	movq	%rax, -200(%rbp)
	movq	%r15, %rbx
	movslq	%r13d, %rcx
	vmovapd	%ymm6, -144(%rbp)
	vblendpd	$10, %ymm1, %ymm0, %ymm6
	salq	$4, %rbx
	salq	$4, %rcx
	salq	$4, %r14
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	vmovapd	%ymm6, -176(%rbp)
	.p2align 4,,10
	.p2align 3
.L445:
	vmovapd	-112(%rbp), %ymm1
	vmovapd	-144(%rbp), %ymm2
	vmovapd	-176(%rbp), %ymm3
	testl	%r11d, %r11d
	jle	.L449
	movq	-192(%rbp), %rax
	vmovapd	-240(%rbp), %ymm0
	leaq	(%r10,%rax), %rsi
	salq	$4, %rsi
	leaq	(%rcx,%r8), %rdx
	addq	-200(%rbp), %rsi
	movq	%r8, %rax
	vpermilpd	$5, %ymm12, %ymm13
	.p2align 4,,10
	.p2align 3
.L443:
	vmovupd	(%rdx), %ymm15
	vpermilpd	$5, %ymm0, %ymm5
	vmulpd	%ymm0, %ymm15, %ymm6
	vmulpd	%ymm15, %ymm5, %ymm5
	vmovupd	32(%rdx), %ymm4
	vpermilpd	$5, %ymm1, %ymm15
	vmovupd	64(%rdx), %ymm14
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm5, %ymm5, %ymm5
	vmovupd	96(%rdx), %ymm7
	vmovupd	(%rax), %ymm11
	vblendpd	$10, %ymm5, %ymm6, %ymm6
	vmulpd	%ymm1, %ymm4, %ymm5
	vmulpd	%ymm15, %ymm4, %ymm4
	vpermilpd	$5, %ymm2, %ymm15
	vmovupd	32(%rax), %ymm10
	vmovupd	64(%rax), %ymm9
	vhsubpd	%ymm5, %ymm5, %ymm5
	vhaddpd	%ymm4, %ymm4, %ymm4
	vmovupd	96(%rax), %ymm8
	subq	$-128, %rax
	vblendpd	$10, %ymm4, %ymm5, %ymm5
	vmulpd	%ymm2, %ymm14, %ymm4
	vmulpd	%ymm15, %ymm14, %ymm14
	vpermilpd	$5, %ymm3, %ymm15
	subq	$-128, %rdx
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm14, %ymm14, %ymm14
	vblendpd	$10, %ymm14, %ymm4, %ymm4
	vmulpd	%ymm3, %ymm7, %ymm14
	vmulpd	%ymm15, %ymm7, %ymm7
	vhsubpd	%ymm14, %ymm14, %ymm14
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm14, %ymm14
	vaddpd	%ymm11, %ymm6, %ymm7
	vsubpd	%ymm6, %ymm11, %ymm11
	vmovupd	%ymm7, -128(%rax)
	vaddpd	%ymm5, %ymm10, %ymm7
	vsubpd	%ymm5, %ymm10, %ymm10
	vmovupd	%ymm7, -96(%rax)
	vaddpd	%ymm4, %ymm9, %ymm7
	vsubpd	%ymm4, %ymm9, %ymm9
	vmulpd	%ymm0, %ymm12, %ymm4
	vmulpd	%ymm0, %ymm13, %ymm0
	vmovupd	%ymm7, -64(%rax)
	vaddpd	%ymm14, %ymm8, %ymm7
	vsubpd	%ymm14, %ymm8, %ymm8
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmovupd	%ymm7, -32(%rax)
	vmovupd	%ymm11, -128(%rdx)
	vblendpd	$10, %ymm0, %ymm4, %ymm0
	vmulpd	%ymm1, %ymm12, %ymm4
	vmulpd	%ymm1, %ymm13, %ymm1
	vmovupd	%ymm10, -96(%rdx)
	vmovupd	%ymm9, -64(%rdx)
	vmovupd	%ymm8, -32(%rdx)
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm4, %ymm1
	vmulpd	%ymm2, %ymm12, %ymm4
	vmulpd	%ymm2, %ymm13, %ymm2
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm2, %ymm2, %ymm2
	vblendpd	$10, %ymm2, %ymm4, %ymm2
	vmulpd	%ymm3, %ymm12, %ymm4
	vmulpd	%ymm3, %ymm13, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm3, %ymm4, %ymm3
	cmpq	%rax, %rsi
	jne	.L443
	vunpckhpd	%xmm0, %xmm0, %xmm3
.L442:
	leaq	(%r14,%r8), %rax
	cmpl	%r11d, %r13d
	jle	.L448
	vmovsd	-80(%rbp), %xmm6
	vmovsd	-184(%rbp), %xmm7
	.p2align 4,,10
	.p2align 3
.L447:
	vmovsd	(%rax,%rcx), %xmm1
	vmovsd	(%rax), %xmm9
	vmovsd	%xmm1, %xmm1, %xmm8
	vmovsd	8(%rax,%rcx), %xmm2
	vfmadd132sd	%xmm0, %xmm9, %xmm8
	vmulsd	%xmm0, %xmm2, %xmm5
	vmovsd	8(%rax), %xmm4
	addq	$16, %rax
	vfnmadd231sd	%xmm3, %xmm2, %xmm8
	vfmadd132sd	%xmm3, %xmm9, %xmm2
	vfmadd231sd	%xmm3, %xmm1, %xmm5
	vmovsd	%xmm8, -16(%rax)
	vfnmadd132sd	%xmm0, %xmm2, %xmm1
	vaddsd	%xmm4, %xmm5, %xmm10
	vsubsd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm3, %xmm6, %xmm2
	vmovsd	%xmm10, -8(%rax)
	vunpcklpd	%xmm4, %xmm1, %xmm1
	vmovupd	%xmm1, -16(%rax,%rcx)
	vmovsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm6, %xmm1
	vfmsub132sd	%xmm7, %xmm2, %xmm0
	vfmadd132sd	%xmm7, %xmm1, %xmm3
	cmpq	%rdi, %rax
	jne	.L447
.L448:
	addl	%r12d, %r9d
	addq	%rbx, %rdi
	addq	%rbx, %r8
	addq	%r15, %r10
	cmpl	%r9d, -68(%rbp)
	jg	.L445
.L455:
	vzeroupper
	addq	$192, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L449:
	.cfi_restore_state
	vmovsd	.LC5(%rip), %xmm0
	vxorpd	%xmm3, %xmm3, %xmm3
	jmp	.L442
	.cfi_endproc
.LFE10492:
	.size	_Z7fft_oddP7ComplexIdvEii, .-_Z7fft_oddP7ComplexIdvEii
	.p2align 4
	.globl	_Z11fft_inplaceP7ComplexIdvEii
	.type	_Z11fft_inplaceP7ComplexIdvEii, @function
_Z11fft_inplaceP7ComplexIdvEii:
.LFB10494:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leal	(%rdx,%rdx), %ebx
	cmpl	%esi, %ebx
	jg	.L466
	movq	%rdi, %r12
	movl	%esi, %ebp
	jmp	.L463
	.p2align 4,,10
	.p2align 3
.L468:
	movl	%ebx, %edx
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	_Z7fft_oddP7ComplexIdvEii
.L462:
	addl	%ebx, %ebx
	cmpl	%ebx, %ebp
	jl	.L466
.L463:
	cmpl	$2, %ebx
	je	.L459
	cmpl	$4, %ebx
	jne	.L468
	movl	%ebp, %esi
	movq	%r12, %rdi
	addl	%ebx, %ebx
	call	_Z6fft_b4P7ComplexIdvEi
	cmpl	%ebx, %ebp
	jge	.L463
.L466:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L459:
	.cfi_restore_state
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	_Z6fft_b2P7ComplexIdvEi
	jmp	.L462
	.cfi_endproc
.LFE10494:
	.size	_Z11fft_inplaceP7ComplexIdvEii, .-_Z11fft_inplaceP7ComplexIdvEii
	.section	.rodata.str1.1
.LC12:
	.string	"here\n"
	.text
	.p2align 4
	.globl	_Z13idft_subarrayP7ComplexIdvEiiS1_
	.type	_Z13idft_subarrayP7ComplexIdvEiiS1_, @function
_Z13idft_subarrayP7ComplexIdvEiiS1_:
.LFB10504:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movl	%edx, %r15d
	pushq	%r14
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movslq	%esi, %r14
	leaq	.LC12(%rip), %rsi
	pushq	%r13
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%rcx, %r13
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rdi, %r12
	leaq	_ZSt4cout(%rip), %rdi
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edx, %ebx
	subl	%r14d, %ebx
	movslq	%ebx, %r8
	subq	$608, %rsp
	movl	$5, %edx
	andl	$7, %ebx
	movq	%r8, -112(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r15d, %ecx
	subl	%ebx, %ecx
	movslq	%ecx, %rbx
	cmpq	%rbx, %r14
	movq	-112(%rbp), %r8
	jnb	.L483
	movq	%r14, %rax
	salq	$4, %rax
	addq	%r12, %rax
	movq	%r14, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L471:
	vmovupd	(%rax), %ymm1
	addq	$8, %rdx
	vaddpd	32(%rax), %ymm1, %ymm0
	vmovupd	64(%rax), %ymm1
	subq	$-128, %rax
	vaddpd	-32(%rax), %ymm1, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm2
	cmpq	%rbx, %rdx
	jb	.L471
	vextractf128	$0x1, %ymm2, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vunpckhpd	%xmm2, %xmm2, %xmm4
	vaddsd	%xmm4, %xmm1, %xmm4
	vaddsd	%xmm2, %xmm0, %xmm3
	vzeroupper
.L470:
	vmovupd	0(%r13), %xmm0
	vmovsd	0(%r13), %xmm2
	vmovsd	8(%r13), %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm6
	cmpl	%ecx, %r15d
	jle	.L484
	leal	-1(%r15), %edx
	subl	%ecx, %edx
	movq	%rbx, %rax
	addq	%rbx, %rdx
	salq	$4, %rax
	salq	$4, %rdx
	addq	%r12, %rax
	leaq	16(%r12,%rdx), %rdx
	.p2align 4,,10
	.p2align 3
.L473:
	vaddpd	(%rax), %xmm0, %xmm0
	vaddsd	(%rax), %xmm2, %xmm2
	vaddsd	8(%rax), %xmm1, %xmm1
	addq	$16, %rax
	vmovupd	%xmm0, 0(%r13)
	cmpq	%rax, %rdx
	jne	.L473
.L472:
	vaddsd	%xmm2, %xmm3, %xmm3
	vaddsd	%xmm1, %xmm4, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm3, 0(%r13)
	vmovsd	%xmm1, 8(%r13)
	leaq	-56(%rbp), %rdi
	leaq	-64(%rbp), %rsi
	testq	%r8, %r8
	js	.L474
	vcvtsi2sdq	%r8, %xmm0, %xmm0
.L475:
	vmovsd	.LC6(%rip), %xmm1
	movq	%r8, -112(%rbp)
	vdivsd	%xmm0, %xmm1, %xmm0
	movl	%ecx, -144(%rbp)
	call	sincos@PLT
	vmovsd	-56(%rbp), %xmm3
	vmovsd	-64(%rbp), %xmm5
	vmulsd	%xmm3, %xmm3, %xmm1
	vmulsd	%xmm5, %xmm3, %xmm0
	movq	-112(%rbp), %r8
	vmovsd	%xmm5, -640(%rbp)
	vmovsd	%xmm3, -616(%rbp)
	vfmsub231sd	%xmm5, %xmm5, %xmm1
	vaddsd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm2, %xmm2
	vfmsub132sd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm2, -624(%rbp)
	vmovsd	%xmm1, -632(%rbp)
	cmpq	$1, %r8
	jbe	.L492
	movq	%r14, %rax
	salq	$4, %rax
	leaq	(%r12,%rax), %rdi
	movq	%rbx, %rax
	movl	-144(%rbp), %ecx
	salq	$4, %rax
	leaq	(%r12,%rax), %rsi
	leal	-1(%r15), %eax
	subl	%ecx, %eax
	addq	%rbx, %rax
	salq	$4, %rax
	leaq	16(%r12,%rax), %r12
	movq	%rdi, %rax
	leaq	16(%r13), %r11
	movq	%rsi, %rdi
	vmovsd	%xmm5, -72(%rbp)
	movl	%ecx, %esi
	vmovsd	%xmm3, -448(%rbp)
	movq	%r8, %rcx
	movl	$1, %r13d
	movq	%rax, %r8
	vmovsd	%xmm5, %xmm5, %xmm4
	.p2align 4,,10
	.p2align 3
.L480:
	vmovsd	-640(%rbp), %xmm1
	vmovsd	-448(%rbp), %xmm3
	vmovsd	-616(%rbp), %xmm5
	vmulsd	%xmm3, %xmm1, %xmm0
	vmovq	.LC8(%rip), %xmm9
	vmovsd	%xmm0, %xmm0, %xmm2
	vfmadd231sd	%xmm4, %xmm5, %xmm2
	vmulsd	%xmm3, %xmm5, %xmm0
	vmovsd	%xmm2, %xmm2, %xmm6
	vmovsd	%xmm0, %xmm0, %xmm7
	vmulsd	%xmm2, %xmm1, %xmm0
	vfmsub231sd	%xmm1, %xmm4, %xmm7
	vmovsd	%xmm2, -600(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm15
	vfmadd231sd	%xmm5, %xmm7, %xmm15
	vmulsd	%xmm2, %xmm5, %xmm0
	vunpcklpd	%xmm2, %xmm7, %xmm2
	vmovsd	%xmm7, -608(%rbp)
	vmovsd	%xmm15, -464(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm10
	vmulsd	%xmm15, %xmm1, %xmm0
	vfmsub231sd	%xmm1, %xmm7, %xmm10
	vmovsd	%xmm0, %xmm0, %xmm11
	vmulsd	%xmm15, %xmm5, %xmm0
	vfmadd231sd	%xmm5, %xmm10, %xmm11
	vmovsd	%xmm3, %xmm3, %xmm5
	vunpcklpd	%xmm3, %xmm4, %xmm3
	vmovsd	%xmm10, -440(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm13
	vfmsub231sd	%xmm1, %xmm10, %xmm13
	vmovq	.LC8(%rip), %xmm1
	vmovq	.LC8(%rip), %xmm0
	vinsertf128	$0x1, %xmm3, %ymm1, %ymm3
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm2
	vunpcklpd	%xmm15, %xmm10, %xmm1
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm1
	vunpcklpd	%xmm11, %xmm13, %xmm0
	vinsertf128	$0x1, %xmm0, %ymm9, %ymm0
	vmovsd	%xmm4, %xmm4, %xmm9
	vmulsd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm5, %xmm5, %xmm5
	vmovsd	%xmm11, -456(%rbp)
	vmovsd	%xmm13, -80(%rbp)
	vaddsd	%xmm4, %xmm4, %xmm4
	vfmsub231sd	%xmm9, %xmm9, %xmm5
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm6, %xmm6, %xmm5
	vmovapd	%xmm4, %xmm9
	vmulsd	%xmm6, %xmm7, %xmm4
	vinsertf128	$1, %xmm9, %ymm9, %ymm9
	vmovapd	%ymm9, -304(%rbp)
	vfmsub231sd	%xmm7, %xmm7, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm15, %xmm15, %xmm5
	vmovapd	%xmm4, %xmm6
	vmulsd	%xmm15, %xmm10, %xmm4
	vinsertf128	$1, %xmm6, %ymm6, %ymm6
	vmovapd	%ymm6, -112(%rbp)
	vfmsub231sd	%xmm10, %xmm10, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm11, %xmm11, %xmm5
	vmovapd	%xmm4, %xmm7
	vmulsd	%xmm11, %xmm13, %xmm4
	vinsertf128	$1, %xmm7, %ymm7, %ymm7
	vmovapd	%ymm7, -144(%rbp)
	vfmsub231sd	%xmm13, %xmm13, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmovapd	%xmm4, %xmm5
	vinsertf128	$1, %xmm5, %ymm5, %ymm5
	vmovapd	%ymm5, -176(%rbp)
	cmpq	%rbx, %r14
	jnb	.L485
	vxorpd	%xmm4, %xmm4, %xmm4
	vpermilpd	$5, %ymm6, %ymm6
	vmovapd	%ymm4, -432(%rbp)
	vmovapd	%ymm4, -400(%rbp)
	vmovapd	%ymm4, -368(%rbp)
	vmovapd	%ymm4, -336(%rbp)
	vmovapd	%ymm6, -240(%rbp)
	vpermilpd	$5, %ymm9, %ymm4
	vpermilpd	$5, %ymm7, %ymm6
	movq	%r8, %rax
	movq	%r14, %rdx
	vmovapd	%ymm4, -208(%rbp)
	vmovapd	%ymm6, -272(%rbp)
	vpermilpd	$5, %ymm5, %ymm15
	.p2align 4,,10
	.p2align 3
.L478:
	vmovupd	(%rax), %ymm5
	vpermilpd	$5, %ymm3, %ymm4
	vmulpd	%ymm5, %ymm3, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vmovapd	-304(%rbp), %ymm14
	vmovapd	-112(%rbp), %ymm8
	vmovapd	-240(%rbp), %ymm13
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	addq	$8, %rdx
	subq	$-128, %rax
	vblendpd	$10, %ymm4, %ymm6, %ymm6
	vpermilpd	$5, %ymm2, %ymm4
	vmovapd	%ymm6, -496(%rbp)
	vmulpd	%ymm5, %ymm4, %ymm4
	vmulpd	%ymm5, %ymm2, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm4, %ymm6, %ymm7
	vpermilpd	$5, %ymm1, %ymm4
	vmulpd	%ymm5, %ymm1, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vmovapd	%ymm7, -528(%rbp)
	vmovapd	-208(%rbp), %ymm7
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm6, %ymm4
	vmovapd	%ymm4, -560(%rbp)
	vpermilpd	$5, %ymm0, %ymm4
	vmulpd	%ymm5, %ymm0, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm6, %ymm5
	vmulpd	%ymm14, %ymm3, %ymm6
	vmulpd	%ymm7, %ymm3, %ymm3
	vmulpd	-144(%rbp), %ymm1, %ymm4
	vmulpd	-272(%rbp), %ymm1, %ymm1
	vmovapd	%ymm5, -592(%rbp)
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm3, %ymm6, %ymm6
	vmulpd	-176(%rbp), %ymm0, %ymm3
	vmulpd	%ymm0, %ymm15, %ymm0
	vblendpd	$10, %ymm1, %ymm4, %ymm4
	vmovupd	-96(%rax), %ymm1
	vmulpd	%ymm8, %ymm2, %ymm5
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmulpd	%ymm13, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm6, %ymm12
	vblendpd	$10, %ymm0, %ymm3, %ymm3
	vpermilpd	$5, %ymm6, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhaddpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm5, %ymm5, %ymm5
	vhsubpd	%ymm12, %ymm12, %ymm12
	vmulpd	%ymm1, %ymm4, %ymm10
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm2, %ymm5, %ymm5
	vmulpd	%ymm1, %ymm5, %ymm11
	vblendpd	$10, %ymm0, %ymm12, %ymm12
	vpermilpd	$5, %ymm5, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhsubpd	%ymm10, %ymm10, %ymm10
	vhsubpd	%ymm11, %ymm11, %ymm11
	vmulpd	%ymm14, %ymm6, %ymm2
	vmulpd	%ymm7, %ymm6, %ymm6
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmulpd	%ymm1, %ymm3, %ymm9
	vaddpd	-496(%rbp), %ymm12, %ymm12
	vblendpd	$10, %ymm0, %ymm11, %ymm11
	vpermilpd	$5, %ymm4, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm9, %ymm9, %ymm9
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm6, %ymm2, %ymm2
	vblendpd	$10, %ymm0, %ymm10, %ymm10
	vpermilpd	$5, %ymm3, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vmulpd	%ymm8, %ymm5, %ymm1
	vmulpd	-176(%rbp), %ymm3, %ymm8
	vmulpd	%ymm3, %ymm15, %ymm3
	vmulpd	%ymm13, %ymm5, %ymm5
	vmovupd	-64(%rax), %ymm13
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm8, %ymm8, %ymm8
	vhaddpd	%ymm3, %ymm3, %ymm3
	vmulpd	%ymm13, %ymm2, %ymm7
	vhaddpd	%ymm5, %ymm5, %ymm5
	vblendpd	$10, %ymm3, %ymm8, %ymm8
	vpermilpd	$5, %ymm2, %ymm3
	vmulpd	%ymm13, %ymm3, %ymm3
	vhaddpd	%ymm0, %ymm0, %ymm0
	vhsubpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm5, %ymm1, %ymm1
	vblendpd	$10, %ymm0, %ymm9, %ymm9
	vhaddpd	%ymm3, %ymm3, %ymm3
	vmulpd	-144(%rbp), %ymm4, %ymm0
	vmulpd	-272(%rbp), %ymm4, %ymm4
	vblendpd	$10, %ymm3, %ymm7, %ymm7
	vpermilpd	$5, %ymm1, %ymm3
	vmulpd	%ymm13, %ymm1, %ymm6
	vmulpd	%ymm13, %ymm3, %ymm3
	vhaddpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm13, %ymm0, %ymm5
	vblendpd	$10, %ymm3, %ymm6, %ymm6
	vpermilpd	$5, %ymm0, %ymm3
	vmulpd	%ymm13, %ymm3, %ymm3
	vmulpd	%ymm13, %ymm8, %ymm4
	vhsubpd	%ymm5, %ymm5, %ymm5
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm3, %ymm5, %ymm5
	vpermilpd	$5, %ymm8, %ymm3
	vmulpd	%ymm13, %ymm3, %ymm3
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm3, %ymm4, %ymm4
	vmulpd	%ymm14, %ymm2, %ymm3
	vmulpd	-208(%rbp), %ymm2, %ymm2
	vmovupd	-32(%rax), %ymm14
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm2, %ymm2, %ymm2
	vblendpd	$10, %ymm2, %ymm3, %ymm3
	vmulpd	-112(%rbp), %ymm1, %ymm2
	vmulpd	-240(%rbp), %ymm1, %ymm1
	vmulpd	%ymm14, %ymm3, %ymm13
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm13, %ymm13, %ymm13
	vblendpd	$10, %ymm1, %ymm2, %ymm2
	vmulpd	-144(%rbp), %ymm0, %ymm1
	vmulpd	-272(%rbp), %ymm0, %ymm0
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm0, %ymm1, %ymm1
	vmulpd	-176(%rbp), %ymm8, %ymm0
	vmulpd	%ymm8, %ymm15, %ymm8
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm8, %ymm0, %ymm0
	vpermilpd	$5, %ymm3, %ymm8
	vmulpd	%ymm14, %ymm8, %ymm8
	vhaddpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm8, %ymm13, %ymm8
	vaddpd	%ymm8, %ymm7, %ymm7
	vmulpd	%ymm14, %ymm2, %ymm8
	vaddpd	%ymm7, %ymm12, %ymm12
	vpermilpd	$5, %ymm2, %ymm7
	vmulpd	%ymm14, %ymm7, %ymm7
	vhsubpd	%ymm8, %ymm8, %ymm8
	vaddpd	-336(%rbp), %ymm12, %ymm12
	vhaddpd	%ymm7, %ymm7, %ymm7
	vmovapd	%ymm12, -336(%rbp)
	vblendpd	$10, %ymm7, %ymm8, %ymm7
	vaddpd	%ymm7, %ymm6, %ymm6
	vaddpd	-528(%rbp), %ymm11, %ymm8
	vmulpd	%ymm14, %ymm1, %ymm7
	vaddpd	%ymm6, %ymm8, %ymm8
	vpermilpd	$5, %ymm1, %ymm6
	vmulpd	%ymm14, %ymm6, %ymm6
	vhsubpd	%ymm7, %ymm7, %ymm7
	vaddpd	-368(%rbp), %ymm8, %ymm12
	vhaddpd	%ymm6, %ymm6, %ymm6
	vmovapd	%ymm12, -368(%rbp)
	vblendpd	$10, %ymm6, %ymm7, %ymm6
	vaddpd	%ymm6, %ymm5, %ymm5
	vaddpd	-560(%rbp), %ymm10, %ymm7
	vpermilpd	$5, %ymm0, %ymm6
	vmulpd	%ymm14, %ymm6, %ymm6
	vaddpd	%ymm5, %ymm7, %ymm7
	vmulpd	%ymm14, %ymm0, %ymm5
	vaddpd	-400(%rbp), %ymm7, %ymm11
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm5, %ymm5, %ymm5
	vmovapd	%ymm11, -400(%rbp)
	vblendpd	$10, %ymm6, %ymm5, %ymm5
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	-592(%rbp), %ymm9, %ymm6
	vmulpd	-208(%rbp), %ymm3, %ymm5
	vaddpd	%ymm4, %ymm6, %ymm6
	vmulpd	-304(%rbp), %ymm3, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm3
	vmulpd	-240(%rbp), %ymm2, %ymm5
	vaddpd	-432(%rbp), %ymm6, %ymm10
	vhsubpd	%ymm4, %ymm4, %ymm4
	vmovapd	%ymm10, -432(%rbp)
	vblendpd	$10, %ymm3, %ymm4, %ymm3
	vmulpd	-112(%rbp), %ymm2, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm2
	vmulpd	-272(%rbp), %ymm1, %ymm5
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm2, %ymm4, %ymm2
	vmulpd	-144(%rbp), %ymm1, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm1
	vmulpd	%ymm0, %ymm15, %ymm5
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm1, %ymm4, %ymm1
	vmulpd	-176(%rbp), %ymm0, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm0
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm0, %ymm4, %ymm0
	cmpq	%rbx, %rdx
	jb	.L478
	vmovapd	-336(%rbp), %ymm6
	vmovapd	%xmm0, %xmm5
	vmovapd	%xmm6, %xmm4
	vmovsd	%xmm0, %xmm0, %xmm9
	vextractf128	$0x1, %ymm6, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm7
	vunpckhpd	%xmm6, %xmm6, %xmm6
	vaddsd	%xmm4, %xmm0, %xmm0
	vaddsd	%xmm6, %xmm7, %xmm6
	vunpckhpd	%xmm5, %xmm5, %xmm4
	vmovq	%xmm0, %r9
	vextractf128	$0x1, %ymm12, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm7
	vmovq	%xmm6, %r10
	vaddsd	%xmm12, %xmm0, %xmm0
	vunpckhpd	%xmm12, %xmm12, %xmm6
	vaddsd	%xmm6, %xmm7, %xmm6
	vmovsd	%xmm0, -144(%rbp)
	vextractf128	$0x1, %ymm11, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm7
	vmovsd	%xmm6, -112(%rbp)
	vaddsd	%xmm11, %xmm0, %xmm0
	vunpckhpd	%xmm11, %xmm11, %xmm6
	vaddsd	%xmm6, %xmm7, %xmm6
	vmovsd	%xmm0, -208(%rbp)
	vextractf128	$0x1, %ymm10, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm7
	vmovsd	%xmm6, -176(%rbp)
	vunpckhpd	%xmm10, %xmm10, %xmm6
	vaddsd	%xmm6, %xmm7, %xmm6
	vaddsd	%xmm10, %xmm0, %xmm15
	vunpckhpd	%xmm1, %xmm1, %xmm5
	vmovq	%xmm6, %rdx
	vunpckhpd	%xmm3, %xmm3, %xmm0
	vunpckhpd	%xmm2, %xmm2, %xmm6
.L477:
	cmpl	%esi, %r15d
	jle	.L482
	vmovsd	8(%r11), %xmm14
	vmovsd	24(%r11), %xmm13
	vmovsd	40(%r11), %xmm12
	vmovsd	%xmm14, %xmm14, %xmm7
	vmovsd	%xmm15, -272(%rbp)
	vmovsd	56(%r11), %xmm11
	vmovsd	%xmm3, %xmm3, %xmm15
	vmovsd	%xmm13, %xmm13, %xmm3
	vmovsd	-608(%rbp), %xmm13
	movl	%esi, -240(%rbp)
	vmovsd	%xmm2, %xmm2, %xmm14
	movq	%rdi, %rax
	movq	%r14, %rsi
	vmovsd	%xmm12, %xmm12, %xmm10
	vmovsd	%xmm7, %xmm7, %xmm2
	.p2align 4,,10
	.p2align 3
.L479:
	vmovsd	8(%rax), %xmm7
	vmovsd	(%rax), %xmm8
	vmulsd	%xmm15, %xmm7, %xmm12
	addq	$16, %rax
	vfmadd231sd	%xmm0, %xmm8, %xmm12
	vfmadd213sd	(%r11), %xmm15, %xmm8
	vaddsd	%xmm12, %xmm2, %xmm2
	vfnmadd132sd	%xmm0, %xmm8, %xmm7
	vmovsd	-448(%rbp), %xmm12
	vmovsd	%xmm2, 8(%r11)
	vmulsd	%xmm12, %xmm0, %xmm8
	vmovsd	%xmm7, (%r11)
	vmovsd	%xmm15, %xmm15, %xmm7
	vmulsd	%xmm12, %xmm7, %xmm7
	vfmsub132sd	-72(%rbp), %xmm8, %xmm15
	vmovsd	-16(%rax), %xmm8
	vfmadd132sd	-72(%rbp), %xmm7, %xmm0
	vmovsd	-8(%rax), %xmm7
	vmulsd	%xmm14, %xmm7, %xmm12
	vfmadd231sd	%xmm6, %xmm8, %xmm12
	vfmadd213sd	16(%r11), %xmm14, %xmm8
	vaddsd	%xmm12, %xmm3, %xmm3
	vfnmadd132sd	%xmm6, %xmm8, %xmm7
	vmovsd	-600(%rbp), %xmm12
	vmovsd	%xmm3, 24(%r11)
	vmulsd	%xmm12, %xmm6, %xmm8
	vmovsd	%xmm7, 16(%r11)
	vmovsd	%xmm14, %xmm14, %xmm7
	vmulsd	%xmm12, %xmm7, %xmm7
	vfmsub132sd	%xmm13, %xmm8, %xmm14
	vmovsd	-16(%rax), %xmm8
	vfmadd132sd	%xmm13, %xmm7, %xmm6
	vmovsd	-8(%rax), %xmm7
	vmulsd	%xmm1, %xmm7, %xmm12
	vfmadd231sd	%xmm5, %xmm8, %xmm12
	vfmadd213sd	32(%r11), %xmm1, %xmm8
	vaddsd	%xmm12, %xmm10, %xmm10
	vfnmadd132sd	%xmm5, %xmm8, %xmm7
	vmovsd	-464(%rbp), %xmm12
	vmovsd	%xmm10, 40(%r11)
	vmulsd	%xmm12, %xmm5, %xmm8
	vmovsd	%xmm7, 32(%r11)
	vmovsd	%xmm1, %xmm1, %xmm7
	vmulsd	%xmm12, %xmm7, %xmm7
	vfmsub132sd	-440(%rbp), %xmm8, %xmm1
	vmovsd	-16(%rax), %xmm8
	vfmadd132sd	-440(%rbp), %xmm7, %xmm5
	vmovsd	-8(%rax), %xmm7
	vmulsd	%xmm9, %xmm7, %xmm12
	vfmadd231sd	%xmm4, %xmm8, %xmm12
	vfmadd213sd	48(%r11), %xmm9, %xmm8
	vaddsd	%xmm12, %xmm11, %xmm11
	vfnmadd132sd	%xmm4, %xmm8, %xmm7
	vmovsd	-456(%rbp), %xmm12
	vmovsd	%xmm11, 56(%r11)
	vmulsd	%xmm12, %xmm4, %xmm8
	vmovsd	%xmm7, 48(%r11)
	vmovsd	%xmm9, %xmm9, %xmm7
	vmulsd	%xmm12, %xmm7, %xmm7
	vfmsub132sd	-80(%rbp), %xmm8, %xmm9
	vfmadd132sd	-80(%rbp), %xmm7, %xmm4
	cmpq	%r12, %rax
	jne	.L479
	movq	%rsi, %r14
	vmovsd	-272(%rbp), %xmm15
	movl	-240(%rbp), %esi
.L482:
	vmovsd	-624(%rbp), %xmm5
	vmovsd	-72(%rbp), %xmm6
	vmovsd	-448(%rbp), %xmm2
	vmulsd	%xmm5, %xmm6, %xmm0
	vmovsd	-632(%rbp), %xmm3
	vmulsd	%xmm2, %xmm5, %xmm1
	vaddsd	48(%r11), %xmm15, %xmm15
	addq	$4, %r13
	vfmadd132sd	%xmm3, %xmm0, %xmm2
	vmovsd	%xmm15, 48(%r11)
	vfmsub231sd	%xmm6, %xmm3, %xmm1
	addq	$64, %r11
	vmovsd	%xmm2, -448(%rbp)
	vmovq	%r9, %xmm2
	vaddsd	-64(%r11), %xmm2, %xmm0
	vmovq	%r10, %xmm2
	vmovsd	%xmm0, -64(%r11)
	vaddsd	-56(%r11), %xmm2, %xmm0
	vmovsd	-144(%rbp), %xmm2
	vmovsd	%xmm0, -56(%r11)
	vaddsd	-48(%r11), %xmm2, %xmm0
	vmovsd	-112(%rbp), %xmm2
	vmovsd	%xmm0, -48(%r11)
	vaddsd	-40(%r11), %xmm2, %xmm0
	vmovsd	-208(%rbp), %xmm2
	vmovsd	%xmm0, -40(%r11)
	vaddsd	-32(%r11), %xmm2, %xmm0
	vmovsd	-176(%rbp), %xmm2
	vmovsd	%xmm0, -32(%r11)
	vaddsd	-24(%r11), %xmm2, %xmm0
	vmovq	%rdx, %xmm2
	vmovsd	%xmm0, -24(%r11)
	vaddsd	-8(%r11), %xmm2, %xmm0
	vmovsd	%xmm0, -8(%r11)
	cmpq	%r13, %rcx
	jbe	.L494
	vmovsd	%xmm1, -72(%rbp)
	vmovsd	%xmm1, %xmm1, %xmm4
	jmp	.L480
	.p2align 4,,10
	.p2align 3
.L494:
	vzeroupper
.L492:
	addq	$608, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L485:
	.cfi_restore_state
	vmovsd	.LC5(%rip), %xmm3
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm3, %xmm3, %xmm2
	vmovsd	%xmm0, %xmm0, %xmm6
	vmovsd	%xmm3, %xmm3, %xmm1
	vmovsd	%xmm0, %xmm0, %xmm5
	vmovsd	%xmm0, %xmm0, %xmm4
	vmovsd	%xmm0, %xmm0, %xmm15
	vmovq	%xmm0, %rdx
	vmovsd	%xmm0, -208(%rbp)
	vmovsd	%xmm0, -176(%rbp)
	vmovsd	%xmm0, -144(%rbp)
	vmovsd	%xmm0, -112(%rbp)
	vmovq	%xmm0, %r9
	vmovq	%xmm0, %r10
	vmovsd	%xmm3, %xmm3, %xmm9
	jmp	.L477
.L474:
	movq	%r8, %rax
	movq	%r8, %rdx
	shrq	%rax
	andl	$1, %edx
	orq	%rdx, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	jmp	.L475
.L484:
	vmovsd	%xmm6, %xmm6, %xmm1
	vmovsd	%xmm0, %xmm0, %xmm2
	jmp	.L472
.L483:
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovsd	%xmm3, %xmm3, %xmm4
	jmp	.L470
	.cfi_endproc
.LFE10504:
	.size	_Z13idft_subarrayP7ComplexIdvEiiS1_, .-_Z13idft_subarrayP7ComplexIdvEiiS1_
	.p2align 4
	.globl	_Z33idft_subarray_inplace_without_divP7ComplexIdvEii
	.type	_Z33idft_subarray_inplace_without_divP7ComplexIdvEii, @function
_Z33idft_subarray_inplace_without_divP7ComplexIdvEii:
.LFB10505:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%rdi, %r13
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%edx, %r12d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	subq	$672, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%esi, -680(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	movl	%edx, %eax
	movq	%rsp, %rdx
	subl	%esi, %eax
	movl	%eax, -676(%rbp)
	cltq
	movq	%rax, -672(%rbp)
	salq	$4, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	subq	%rcx, %rdx
	movq	%rax, -704(%rbp)
	cmpq	%rdx, %rsp
	je	.L497
.L546:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rdx, %rsp
	jne	.L546
.L497:
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	jne	.L547
.L498:
	movl	$3, %eax
	shrx	%rax, %rsp, %r8
	movl	-676(%rbp), %eax
	movq	%rsp, -688(%rbp)
	testl	%eax, %eax
	jle	.L505
	cmpl	$1, -676(%rbp)
	je	.L528
	movq	-672(%rbp), %rdx
	movq	%rsp, %rbx
	shrq	%rdx
	salq	$5, %rdx
	movq	%rbx, %rax
	addq	%rbx, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L503:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L503
	movq	-672(%rbp), %rsi
	movq	%rsi, %rdx
	andq	$-2, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	addq	-688(%rbp), %rax
	cmpq	%rdx, %rsi
	je	.L505
.L502:
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%xmm0, (%rax)
.L505:
	movl	-676(%rbp), %esi
	movl	%r12d, %r11d
	andl	$7, %esi
	subl	%esi, %r11d
	movslq	-680(%rbp), %rbx
	movslq	%r11d, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	cmpq	%r14, %rbx
	jnb	.L501
	movq	%rbx, %rax
	salq	$4, %rax
	addq	%r13, %rax
	movq	%rbx, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L507:
	vmovupd	(%rax), %ymm1
	addq	$8, %rdx
	vaddpd	32(%rax), %ymm1, %ymm0
	vmovupd	64(%rax), %ymm1
	subq	$-128, %rax
	vaddpd	-32(%rax), %ymm1, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm2
	cmpq	%r14, %rdx
	jb	.L507
	vextractf128	$0x1, %ymm2, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vunpckhpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vunpcklpd	%xmm1, %xmm0, %xmm1
.L501:
	vmovupd	0(,%r8,8), %xmm2
	vunpckhpd	%xmm2, %xmm2, %xmm3
	cmpl	%r11d, %r12d
	jle	.L508
	cmpl	$1, %esi
	je	.L529
	movslq	%r12d, %rdi
	movslq	%esi, %r9
	movq	%rdi, %rdx
	subq	%r9, %rdx
	movl	%esi, %eax
	shrl	%eax
	salq	$4, %rdx
	leal	-1(%rax), %ecx
	addq	%r13, %rdx
	vunpcklpd	%xmm3, %xmm2, %xmm0
	salq	$5, %rcx
	leaq	32(%rdx), %rax
	vmovapd	%xmm0, %xmm0
	addq	%rax, %rcx
	jmp	.L510
	.p2align 4,,10
	.p2align 3
.L548:
	addq	$32, %rax
.L510:
	vaddpd	(%rdx), %ymm0, %ymm0
	movq	%rax, %rdx
	cmpq	%rax, %rcx
	jne	.L548
	movl	%esi, %eax
	vextractf128	$0x1, %ymm0, %xmm2
	andl	$-2, %eax
	andl	$-7, %esi
	vaddpd	%xmm0, %xmm2, %xmm2
	je	.L508
.L509:
	subq	%r9, %rdi
	addq	%rdi, %rax
	salq	$4, %rax
	vaddpd	0(%r13,%rax), %xmm2, %xmm2
.L508:
	vaddpd	%xmm2, %xmm1, %xmm0
	movq	-672(%rbp), %rax
	vxorps	%xmm3, %xmm3, %xmm3
	vmovupd	%xmm0, 0(,%r8,8)
	leaq	-72(%rbp), %rdi
	leaq	-80(%rbp), %rsi
	testq	%rax, %rax
	js	.L512
	vcvtsi2sdq	%rax, %xmm3, %xmm3
.L513:
	vmovsd	.LC6(%rip), %xmm0
	movl	%r11d, -112(%rbp)
	vdivsd	%xmm3, %xmm0, %xmm0
	vzeroupper
	call	sincos@PLT
	vmovsd	-72(%rbp), %xmm3
	vmovsd	-80(%rbp), %xmm5
	vmulsd	%xmm3, %xmm3, %xmm1
	vmulsd	%xmm5, %xmm3, %xmm0
	movl	-676(%rbp), %eax
	movq	-672(%rbp), %r9
	decl	%eax
	vfmsub231sd	%xmm5, %xmm5, %xmm1
	vaddsd	%xmm0, %xmm0, %xmm0
	movl	%eax, %esi
	andl	$3, %eax
	andl	$3, %esi
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm0, %xmm0, %xmm0
	subq	%rax, %r9
	movl	%esi, -692(%rbp)
	vmovsd	%xmm5, -640(%rbp)
	vaddsd	%xmm2, %xmm2, %xmm2
	vfmsub132sd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm3, -632(%rbp)
	vmovsd	%xmm2, -648(%rbp)
	vmovsd	%xmm1, -656(%rbp)
	cmpq	$1, %r9
	jbe	.L530
	movq	-688(%rbp), %rax
	movl	-112(%rbp), %r11d
	leaq	16(%rax), %r15
	movq	%rbx, %rax
	salq	$4, %rax
	addq	%r13, %rax
	movq	%rax, -664(%rbp)
	movq	%r14, %rax
	salq	$4, %rax
	leaq	0(%r13,%rax), %rsi
	leal	-1(%r12), %eax
	subl	%r11d, %eax
	addq	%r14, %rax
	salq	$4, %rax
	leaq	16(%r13,%rax), %r8
	movl	$1, %edi
	movq	%r13, -712(%rbp)
	movl	%r12d, %r10d
	vmovsd	%xmm3, -336(%rbp)
	movq	%r14, %r12
	vmovsd	%xmm5, -312(%rbp)
	movq	%r8, %r14
	movq	%rsi, %r13
	movq	%rdi, %r8
	vmovsd	%xmm5, %xmm5, %xmm4
	movq	%rbx, %rdi
	movl	%r11d, %ebx
	movq	%r9, %r11
	.p2align 4,,10
	.p2align 3
.L519:
	vmovsd	-640(%rbp), %xmm1
	vmovsd	-336(%rbp), %xmm3
	vmovsd	-632(%rbp), %xmm5
	vmulsd	%xmm3, %xmm1, %xmm0
	vmovq	.LC8(%rip), %xmm11
	vmovsd	%xmm0, %xmm0, %xmm2
	vfmadd231sd	%xmm4, %xmm5, %xmm2
	vmulsd	%xmm3, %xmm5, %xmm0
	vmovsd	%xmm2, %xmm2, %xmm6
	vmovsd	%xmm0, %xmm0, %xmm7
	vmulsd	%xmm2, %xmm1, %xmm0
	vfmsub231sd	%xmm1, %xmm4, %xmm7
	vmovsd	%xmm2, -624(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm15
	vfmadd231sd	%xmm5, %xmm7, %xmm15
	vmulsd	%xmm2, %xmm5, %xmm0
	vunpcklpd	%xmm2, %xmm7, %xmm2
	vmovsd	%xmm7, -328(%rbp)
	vmovsd	%xmm15, -616(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm12
	vmulsd	%xmm15, %xmm1, %xmm0
	vfmsub231sd	%xmm1, %xmm7, %xmm12
	vmovsd	%xmm0, %xmm0, %xmm10
	vmulsd	%xmm15, %xmm5, %xmm0
	vfmadd231sd	%xmm5, %xmm12, %xmm10
	vmovsd	%xmm3, %xmm3, %xmm5
	vunpcklpd	%xmm3, %xmm4, %xmm3
	vmovsd	%xmm12, -320(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm9
	vfmsub231sd	%xmm1, %xmm12, %xmm9
	vmovq	.LC8(%rip), %xmm1
	vmovq	.LC8(%rip), %xmm0
	vinsertf128	$0x1, %xmm3, %ymm1, %ymm3
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm2
	vunpcklpd	%xmm15, %xmm12, %xmm1
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm1
	vunpcklpd	%xmm10, %xmm9, %xmm0
	vinsertf128	$0x1, %xmm0, %ymm11, %ymm0
	vmovsd	%xmm4, %xmm4, %xmm11
	vmulsd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm5, %xmm5, %xmm5
	vmovsd	%xmm10, -600(%rbp)
	vmovsd	%xmm9, -608(%rbp)
	vaddsd	%xmm4, %xmm4, %xmm4
	vfmsub231sd	%xmm11, %xmm11, %xmm5
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm6, %xmm6, %xmm5
	vmovapd	%xmm4, %xmm11
	vmulsd	%xmm6, %xmm7, %xmm4
	vinsertf128	$1, %xmm11, %ymm11, %ymm11
	vmovapd	%ymm11, -304(%rbp)
	vfmsub231sd	%xmm7, %xmm7, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm15, %xmm15, %xmm5
	vmovapd	%xmm4, %xmm6
	vmulsd	%xmm15, %xmm12, %xmm4
	vinsertf128	$1, %xmm6, %ymm6, %ymm6
	vmovapd	%ymm6, -112(%rbp)
	vfmsub231sd	%xmm12, %xmm12, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm10, %xmm10, %xmm5
	vmovapd	%xmm4, %xmm7
	vmulsd	%xmm10, %xmm9, %xmm4
	vinsertf128	$1, %xmm7, %ymm7, %ymm7
	vmovapd	%ymm7, -144(%rbp)
	vfmsub231sd	%xmm9, %xmm9, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm4, %xmm5, %xmm4
	vmovapd	%xmm4, %xmm5
	vinsertf128	$1, %xmm5, %ymm5, %ymm5
	vmovapd	%ymm5, -176(%rbp)
	cmpq	%r12, %rdi
	jnb	.L531
	vxorpd	%xmm4, %xmm4, %xmm4
	vpermilpd	$5, %ymm6, %ymm6
	vmovapd	%ymm4, -464(%rbp)
	vmovapd	%ymm4, -432(%rbp)
	vmovapd	%ymm4, -400(%rbp)
	vmovapd	%ymm4, -368(%rbp)
	vmovapd	%ymm6, -240(%rbp)
	vpermilpd	$5, %ymm11, %ymm4
	vpermilpd	$5, %ymm7, %ymm6
	movq	-664(%rbp), %rax
	movq	%rdi, %rdx
	vmovapd	%ymm4, -208(%rbp)
	vmovapd	%ymm6, -272(%rbp)
	vpermilpd	$5, %ymm5, %ymm15
	.p2align 4,,10
	.p2align 3
.L516:
	vmovupd	(%rax), %ymm5
	vpermilpd	$5, %ymm3, %ymm4
	vmulpd	%ymm5, %ymm3, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vmovapd	-304(%rbp), %ymm14
	vmovapd	-112(%rbp), %ymm11
	vmovapd	-240(%rbp), %ymm13
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	addq	$8, %rdx
	subq	$-128, %rax
	vblendpd	$10, %ymm4, %ymm6, %ymm6
	vpermilpd	$5, %ymm2, %ymm4
	vmovapd	%ymm6, -496(%rbp)
	vmulpd	%ymm5, %ymm4, %ymm4
	vmulpd	%ymm5, %ymm2, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm4, %ymm6, %ymm4
	vmovapd	%ymm4, -528(%rbp)
	vpermilpd	$5, %ymm1, %ymm4
	vmulpd	%ymm5, %ymm1, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm6, %ymm7
	vpermilpd	$5, %ymm0, %ymm4
	vmulpd	%ymm5, %ymm0, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vmovapd	%ymm7, -560(%rbp)
	vmovapd	-208(%rbp), %ymm7
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm6, %ymm5
	vmulpd	%ymm14, %ymm3, %ymm6
	vmulpd	%ymm7, %ymm3, %ymm3
	vmulpd	-144(%rbp), %ymm1, %ymm4
	vmulpd	-272(%rbp), %ymm1, %ymm1
	vmovapd	%ymm5, -592(%rbp)
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm3, %ymm6, %ymm6
	vmulpd	-176(%rbp), %ymm0, %ymm3
	vmulpd	%ymm0, %ymm15, %ymm0
	vblendpd	$10, %ymm1, %ymm4, %ymm4
	vmovupd	-96(%rax), %ymm1
	vmulpd	%ymm11, %ymm2, %ymm5
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmulpd	%ymm13, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm6, %ymm12
	vblendpd	$10, %ymm0, %ymm3, %ymm3
	vpermilpd	$5, %ymm6, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhaddpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm5, %ymm5, %ymm5
	vhsubpd	%ymm12, %ymm12, %ymm12
	vmulpd	%ymm1, %ymm4, %ymm9
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm2, %ymm5, %ymm5
	vmulpd	%ymm1, %ymm5, %ymm10
	vblendpd	$10, %ymm0, %ymm12, %ymm12
	vpermilpd	$5, %ymm5, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhsubpd	%ymm9, %ymm9, %ymm9
	vhsubpd	%ymm10, %ymm10, %ymm10
	vmulpd	%ymm14, %ymm6, %ymm2
	vmulpd	%ymm7, %ymm6, %ymm6
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmulpd	%ymm1, %ymm3, %ymm8
	vmulpd	-176(%rbp), %ymm3, %ymm7
	vblendpd	$10, %ymm0, %ymm10, %ymm10
	vpermilpd	$5, %ymm4, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhsubpd	%ymm7, %ymm7, %ymm7
	vhsubpd	%ymm8, %ymm8, %ymm8
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm6, %ymm2, %ymm2
	vaddpd	-496(%rbp), %ymm12, %ymm12
	vblendpd	$10, %ymm0, %ymm9, %ymm9
	vpermilpd	$5, %ymm3, %ymm0
	vmulpd	%ymm3, %ymm15, %ymm3
	vmulpd	%ymm1, %ymm0, %ymm0
	vmulpd	%ymm11, %ymm5, %ymm1
	vmulpd	%ymm13, %ymm5, %ymm5
	vmovupd	-64(%rax), %ymm13
	vhaddpd	%ymm3, %ymm3, %ymm3
	vmulpd	%ymm2, %ymm13, %ymm6
	vhsubpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm3, %ymm7, %ymm7
	vpermilpd	$5, %ymm2, %ymm3
	vmulpd	%ymm3, %ymm13, %ymm3
	vhaddpd	%ymm5, %ymm5, %ymm5
	vhaddpd	%ymm0, %ymm0, %ymm0
	vhsubpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm5, %ymm1, %ymm1
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm0, %ymm8, %ymm8
	vmulpd	-144(%rbp), %ymm4, %ymm0
	vblendpd	$10, %ymm3, %ymm6, %ymm6
	vmulpd	-272(%rbp), %ymm4, %ymm4
	vpermilpd	$5, %ymm1, %ymm3
	vmulpd	%ymm1, %ymm13, %ymm11
	vmulpd	%ymm3, %ymm13, %ymm3
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm4, %ymm4, %ymm4
	vhsubpd	%ymm11, %ymm11, %ymm11
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm4, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm13, %ymm5
	vblendpd	$10, %ymm3, %ymm11, %ymm11
	vpermilpd	$5, %ymm0, %ymm3
	vmulpd	%ymm3, %ymm13, %ymm3
	vmulpd	%ymm7, %ymm13, %ymm4
	vhsubpd	%ymm5, %ymm5, %ymm5
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm3, %ymm5, %ymm5
	vpermilpd	$5, %ymm7, %ymm3
	vmulpd	%ymm3, %ymm13, %ymm3
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm3, %ymm4, %ymm4
	vmulpd	%ymm14, %ymm2, %ymm3
	vmulpd	-208(%rbp), %ymm2, %ymm2
	vmovupd	-32(%rax), %ymm14
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm2, %ymm2, %ymm2
	vblendpd	$10, %ymm2, %ymm3, %ymm3
	vmulpd	-112(%rbp), %ymm1, %ymm2
	vmulpd	-240(%rbp), %ymm1, %ymm1
	vmulpd	%ymm14, %ymm3, %ymm13
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm1, %ymm1, %ymm1
	vhsubpd	%ymm13, %ymm13, %ymm13
	vblendpd	$10, %ymm1, %ymm2, %ymm2
	vmulpd	-144(%rbp), %ymm0, %ymm1
	vmulpd	-272(%rbp), %ymm0, %ymm0
	vhsubpd	%ymm1, %ymm1, %ymm1
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm0, %ymm1, %ymm1
	vmulpd	-176(%rbp), %ymm7, %ymm0
	vmulpd	%ymm7, %ymm15, %ymm7
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm0, %ymm0
	vpermilpd	$5, %ymm3, %ymm7
	vmulpd	%ymm14, %ymm7, %ymm7
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm13, %ymm7
	vaddpd	%ymm7, %ymm6, %ymm6
	vpermilpd	$5, %ymm2, %ymm7
	vmulpd	%ymm14, %ymm7, %ymm7
	vaddpd	%ymm6, %ymm12, %ymm12
	vaddpd	-368(%rbp), %ymm12, %ymm6
	vhaddpd	%ymm7, %ymm7, %ymm7
	vmovapd	%ymm6, -368(%rbp)
	vmulpd	%ymm14, %ymm2, %ymm6
	vhsubpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm7, %ymm6, %ymm6
	vaddpd	%ymm6, %ymm11, %ymm6
	vaddpd	-528(%rbp), %ymm10, %ymm7
	vaddpd	%ymm7, %ymm6, %ymm6
	vmulpd	%ymm14, %ymm1, %ymm7
	vaddpd	-400(%rbp), %ymm6, %ymm10
	vpermilpd	$5, %ymm1, %ymm6
	vmulpd	%ymm14, %ymm6, %ymm6
	vhsubpd	%ymm7, %ymm7, %ymm7
	vmovapd	%ymm10, -400(%rbp)
	vhaddpd	%ymm6, %ymm6, %ymm6
	vblendpd	$10, %ymm6, %ymm7, %ymm6
	vaddpd	%ymm6, %ymm5, %ymm5
	vaddpd	-560(%rbp), %ymm9, %ymm7
	vpermilpd	$5, %ymm0, %ymm6
	vmulpd	%ymm14, %ymm6, %ymm6
	vaddpd	%ymm5, %ymm7, %ymm7
	vmulpd	%ymm14, %ymm0, %ymm5
	vaddpd	-432(%rbp), %ymm7, %ymm10
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm5, %ymm5, %ymm5
	vmovapd	%ymm10, -432(%rbp)
	vblendpd	$10, %ymm6, %ymm5, %ymm5
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	-592(%rbp), %ymm8, %ymm6
	vmulpd	-208(%rbp), %ymm3, %ymm5
	vaddpd	%ymm4, %ymm6, %ymm6
	vmulpd	-304(%rbp), %ymm3, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm3
	vmulpd	-240(%rbp), %ymm2, %ymm5
	vaddpd	-464(%rbp), %ymm6, %ymm8
	vhsubpd	%ymm4, %ymm4, %ymm4
	vmovapd	%ymm8, -464(%rbp)
	vblendpd	$10, %ymm3, %ymm4, %ymm3
	vmulpd	-112(%rbp), %ymm2, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm2
	vmulpd	-272(%rbp), %ymm1, %ymm5
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm2, %ymm4, %ymm2
	vmulpd	-144(%rbp), %ymm1, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm1
	vmulpd	%ymm0, %ymm15, %ymm5
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm1, %ymm4, %ymm1
	vmulpd	-176(%rbp), %ymm0, %ymm4
	vhaddpd	%ymm5, %ymm5, %ymm0
	vhsubpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm0, %ymm4, %ymm0
	cmpq	%r12, %rdx
	jb	.L516
	vmovapd	-368(%rbp), %ymm15
	vmovsd	%xmm1, %xmm1, %xmm4
	vextractf128	$0x1, %ymm15, %xmm7
	vunpckhpd	%xmm7, %xmm7, %xmm10
	vunpckhpd	%xmm15, %xmm15, %xmm9
	vmovapd	%xmm15, %xmm8
	vaddsd	%xmm9, %xmm10, %xmm15
	vaddsd	%xmm8, %xmm7, %xmm7
	vunpckhpd	%xmm2, %xmm2, %xmm5
	vmovsd	%xmm15, -240(%rbp)
	vmovapd	-400(%rbp), %ymm15
	vmovsd	%xmm7, -272(%rbp)
	vmovapd	%xmm15, %xmm8
	vextractf128	$0x1, %ymm15, %xmm7
	vunpckhpd	%xmm7, %xmm7, %xmm10
	vaddsd	%xmm8, %xmm7, %xmm7
	vunpckhpd	%xmm15, %xmm15, %xmm9
	vaddsd	%xmm9, %xmm10, %xmm15
	vmovsd	%xmm7, -368(%rbp)
	vmovapd	-432(%rbp), %ymm7
	vunpckhpd	%xmm3, %xmm3, %xmm6
	vextractf128	$0x1, %ymm7, %xmm9
	vunpckhpd	%xmm9, %xmm9, %xmm8
	vmovapd	%xmm7, %xmm10
	vunpckhpd	%xmm7, %xmm7, %xmm7
	vaddsd	%xmm7, %xmm8, %xmm7
	vmovsd	%xmm15, -304(%rbp)
	vunpckhpd	%xmm0, %xmm0, %xmm11
	vmovsd	%xmm7, -400(%rbp)
	vaddsd	%xmm9, %xmm10, %xmm7
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm7, -432(%rbp)
	vmovapd	-464(%rbp), %ymm7
	vextractf128	$0x1, %ymm7, %xmm9
	vmovapd	%xmm7, %xmm10
	vunpckhpd	%xmm9, %xmm9, %xmm8
	vunpckhpd	%xmm7, %xmm7, %xmm7
	vaddsd	%xmm7, %xmm8, %xmm7
	vmovsd	%xmm7, -464(%rbp)
	vaddsd	%xmm10, %xmm9, %xmm7
	vmovsd	%xmm7, -496(%rbp)
.L515:
	vmovsd	(%r15), %xmm13
	vmovsd	%xmm13, %xmm13, %xmm7
	cmpl	%ebx, %r10d
	jle	.L517
	movq	8(%r15), %rcx
	movq	24(%r15), %rsi
	vmovsd	48(%r15), %xmm15
	movq	56(%r15), %rdx
	vmovsd	16(%r15), %xmm8
	vmovsd	40(%r15), %xmm7
	vmovsd	32(%r15), %xmm14
	movq	%rcx, -112(%rbp)
	vmovsd	%xmm15, -176(%rbp)
	vmovsd	%xmm13, -208(%rbp)
	vmovq	%rdx, %xmm15
	vmovq	%rsi, %xmm13
	movq	%r11, %rdx
	movq	%r13, %rax
	vmovsd	%xmm8, %xmm8, %xmm12
	vmovsd	%xmm7, -144(%rbp)
	movq	%rdi, %rcx
	movl	%ebx, %esi
	movq	%r12, %r9
	movq	%r15, %r11
	.p2align 4,,10
	.p2align 3
.L518:
	vmovsd	8(%rax), %xmm9
	vmovsd	(%rax), %xmm10
	vmulsd	%xmm3, %xmm9, %xmm7
	addq	$16, %rax
	vfmadd231sd	%xmm6, %xmm10, %xmm7
	vmovq	%xmm7, %rdi
	vmulsd	%xmm6, %xmm9, %xmm7
	vfmsub231sd	%xmm3, %xmm10, %xmm7
	vaddsd	-208(%rbp), %xmm7, %xmm7
	vmovsd	%xmm7, -208(%rbp)
	vmovq	%rdi, %xmm7
	vaddsd	-112(%rbp), %xmm7, %xmm7
	vmovq	%xmm3, %rdi
	vmovsd	%xmm7, -112(%rbp)
	vmovsd	-336(%rbp), %xmm7
	vmulsd	%xmm7, %xmm6, %xmm8
	vfmsub132sd	-312(%rbp), %xmm8, %xmm3
	vmovq	%rdi, %xmm8
	vmulsd	%xmm7, %xmm8, %xmm8
	vmulsd	%xmm2, %xmm9, %xmm7
	vfmadd132sd	-312(%rbp), %xmm8, %xmm6
	vfmadd231sd	%xmm5, %xmm10, %xmm7
	vmovq	%xmm7, %rdi
	vmulsd	%xmm5, %xmm9, %xmm7
	vfmsub231sd	%xmm2, %xmm10, %xmm7
	vaddsd	%xmm7, %xmm12, %xmm12
	vmovq	%rdi, %xmm7
	vaddsd	%xmm7, %xmm13, %xmm13
	vmovsd	-624(%rbp), %xmm7
	vmovq	%xmm2, %rdi
	vmulsd	%xmm7, %xmm5, %xmm8
	vfmsub132sd	-328(%rbp), %xmm8, %xmm2
	vmovq	%rdi, %xmm8
	vmulsd	%xmm7, %xmm8, %xmm8
	vmulsd	%xmm4, %xmm9, %xmm7
	vfmadd132sd	-328(%rbp), %xmm8, %xmm5
	vfmadd231sd	%xmm1, %xmm10, %xmm7
	vmovq	%xmm7, %rdi
	vmulsd	%xmm1, %xmm9, %xmm7
	vfmsub231sd	%xmm4, %xmm10, %xmm7
	vaddsd	%xmm7, %xmm14, %xmm14
	vmovq	%rdi, %xmm7
	vaddsd	-144(%rbp), %xmm7, %xmm7
	vmovq	%xmm4, %rdi
	vmovsd	%xmm7, -144(%rbp)
	vmovsd	-616(%rbp), %xmm7
	vmulsd	%xmm7, %xmm1, %xmm8
	vfmsub132sd	-320(%rbp), %xmm8, %xmm4
	vmovq	%rdi, %xmm8
	vmulsd	%xmm7, %xmm8, %xmm8
	vmulsd	%xmm0, %xmm9, %xmm7
	vmulsd	%xmm11, %xmm9, %xmm9
	vfmadd132sd	-320(%rbp), %xmm8, %xmm1
	vfmadd231sd	%xmm11, %xmm10, %xmm7
	vfmsub231sd	%xmm0, %xmm10, %xmm9
	vmovsd	-608(%rbp), %xmm8
	vmovq	%xmm7, %rdi
	vaddsd	-176(%rbp), %xmm9, %xmm7
	vmovsd	%xmm0, %xmm0, %xmm9
	vmovsd	%xmm7, -176(%rbp)
	vmovq	%rdi, %xmm7
	vaddsd	%xmm7, %xmm15, %xmm15
	vmovsd	-600(%rbp), %xmm7
	vmulsd	%xmm7, %xmm11, %xmm10
	vmulsd	%xmm7, %xmm9, %xmm9
	vfmsub132sd	%xmm8, %xmm10, %xmm0
	vfmadd132sd	%xmm8, %xmm9, %xmm11
	cmpq	%rax, %r14
	jne	.L518
	movq	%rcx, %rdi
	movl	%esi, %ebx
	movq	-112(%rbp), %rcx
	vmovq	%xmm13, %rsi
	vmovq	%rsi, %xmm2
	vmovsd	-208(%rbp), %xmm13
	vunpcklpd	%xmm2, %xmm12, %xmm8
	vmovq	%rcx, %xmm2
	movq	%r11, %r15
	vmovsd	-144(%rbp), %xmm7
	vunpcklpd	%xmm2, %xmm13, %xmm13
	movq	%rdx, %r11
	vmovq	%xmm15, %rdx
	vmovsd	-176(%rbp), %xmm15
	vinsertf128	$0x1, %xmm8, %ymm13, %ymm13
	vmovq	%rdx, %xmm2
	vunpcklpd	%xmm7, %xmm14, %xmm14
	vmovupd	%ymm13, (%r15)
	vunpcklpd	%xmm2, %xmm15, %xmm15
	vinsertf128	$0x1, %xmm15, %ymm14, %ymm14
	vmovsd	(%r15), %xmm7
	movq	%r9, %r12
	vmovupd	%ymm14, 32(%r15)
.L517:
	vmovsd	-336(%rbp), %xmm2
	vmovsd	-648(%rbp), %xmm1
	vmovsd	-312(%rbp), %xmm3
	vmulsd	%xmm2, %xmm1, %xmm0
	vmulsd	%xmm1, %xmm3, %xmm1
	vmovsd	-656(%rbp), %xmm5
	vaddsd	-272(%rbp), %xmm7, %xmm7
	addq	$4, %r8
	vfmsub231sd	%xmm3, %xmm5, %xmm0
	vfmadd132sd	%xmm5, %xmm1, %xmm2
	vmovsd	%xmm7, (%r15)
	addq	$64, %r15
	vmovsd	%xmm2, -336(%rbp)
	vmovsd	-240(%rbp), %xmm2
	vaddsd	-56(%r15), %xmm2, %xmm1
	vmovsd	-368(%rbp), %xmm2
	vaddsd	-48(%r15), %xmm2, %xmm7
	vmovsd	-304(%rbp), %xmm2
	vmovsd	%xmm1, -56(%r15)
	vaddsd	-40(%r15), %xmm2, %xmm1
	vmovsd	-432(%rbp), %xmm2
	vmovsd	%xmm7, -48(%r15)
	vmovsd	%xmm1, -40(%r15)
	vaddsd	-32(%r15), %xmm2, %xmm1
	vmovsd	-400(%rbp), %xmm2
	vmovsd	%xmm1, -32(%r15)
	vaddsd	-24(%r15), %xmm2, %xmm1
	vmovsd	-496(%rbp), %xmm2
	vmovsd	%xmm1, -24(%r15)
	vaddsd	-16(%r15), %xmm2, %xmm1
	vmovsd	-464(%rbp), %xmm2
	vmovsd	%xmm1, -16(%r15)
	vaddsd	-8(%r15), %xmm2, %xmm1
	vmovsd	%xmm1, -8(%r15)
	cmpq	%r11, %r8
	jnb	.L549
	vmovsd	%xmm0, -312(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm4
	jmp	.L519
	.p2align 4,,10
	.p2align 3
.L531:
	vmovsd	.LC5(%rip), %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm11
	vmovsd	%xmm1, -496(%rbp)
	vmovsd	%xmm1, -464(%rbp)
	vmovsd	%xmm1, -432(%rbp)
	vmovsd	%xmm1, -400(%rbp)
	vmovsd	%xmm1, -368(%rbp)
	vmovsd	%xmm1, -304(%rbp)
	vmovsd	%xmm1, -272(%rbp)
	vmovsd	%xmm1, -240(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm3
	vmovsd	%xmm1, %xmm1, %xmm6
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	%xmm1, %xmm1, %xmm5
	vmovsd	%xmm0, %xmm0, %xmm4
	jmp	.L515
	.p2align 4,,10
	.p2align 3
.L549:
	movq	-712(%rbp), %r13
	movq	%rdi, %rbx
	movl	%r10d, %r12d
	vzeroupper
.L514:
	movl	-676(%rbp), %ecx
	subl	-692(%rbp), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, -672(%rbp)
	jbe	.L526
	movslq	%r12d, %rsi
	movq	-688(%rbp), %rax
	movq	-704(%rbp), %r8
	movq	%rbx, %rdi
	movq	%rsi, %rdx
	salq	$4, %rcx
	salq	$4, %rdi
	salq	$4, %rdx
	vmovsd	-632(%rbp), %xmm9
	vmovsd	-640(%rbp), %xmm10
	vmovsd	-336(%rbp), %xmm8
	addq	%rax, %rcx
	addq	%rax, %r8
	addq	%r13, %rdi
	addq	%r13, %rdx
	vxorpd	%xmm7, %xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L525:
	vmovupd	%xmm7, (%rcx)
	cmpq	%rsi, %rbx
	jnb	.L523
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	.LC5(%rip), %xmm1
	movq	%rdi, %rax
	vmovsd	%xmm6, %xmm6, %xmm11
	vmovsd	%xmm6, %xmm6, %xmm2
	.p2align 4,,10
	.p2align 3
.L524:
	vmovsd	8(%rax), %xmm4
	vmovsd	(%rax), %xmm3
	vmulsd	%xmm1, %xmm4, %xmm5
	vmulsd	%xmm2, %xmm4, %xmm4
	addq	$16, %rax
	vfmadd231sd	%xmm2, %xmm3, %xmm5
	vfmsub132sd	%xmm1, %xmm4, %xmm3
	vmulsd	%xmm2, %xmm8, %xmm4
	vaddsd	%xmm5, %xmm6, %xmm6
	vaddsd	%xmm3, %xmm11, %xmm11
	vmovsd	%xmm1, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm8, %xmm3
	vfmsub132sd	%xmm0, %xmm4, %xmm1
	vfmadd132sd	%xmm0, %xmm3, %xmm2
	cmpq	%rdx, %rax
	jne	.L524
	vmovsd	%xmm11, (%rcx)
	vmovsd	%xmm6, 8(%rcx)
.L523:
	vmulsd	%xmm8, %xmm9, %xmm1
	addq	$16, %rcx
	vfmsub231sd	%xmm0, %xmm10, %xmm1
	vmulsd	%xmm0, %xmm9, %xmm0
	vfmadd132sd	%xmm10, %xmm0, %xmm8
	cmpq	%r8, %rcx
	je	.L526
	vmovsd	%xmm1, %xmm1, %xmm0
	jmp	.L525
	.p2align 4,,10
	.p2align 3
.L526:
	cmpl	-680(%rbp), %r12d
	jle	.L495
	movq	%rbx, %rax
	salq	$4, %rax
	leaq	0(%r13,%rax), %rdi
	movl	%r12d, %eax
	subl	-680(%rbp), %eax
	leal	-1(%rax), %edx
	incq	%rdx
	movq	-688(%rbp), %rsi
	salq	$4, %rdx
	call	memcpy@PLT
.L495:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L550
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L512:
	.cfi_restore_state
	movq	%rax, %rcx
	andl	$1, %ecx
	shrq	%rax
	orq	%rcx, %rax
	vcvtsi2sdq	%rax, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm3, %xmm3
	jmp	.L513
.L547:
	orq	$0, -8(%rsp,%rax)
	jmp	.L498
.L530:
	vmovsd	%xmm5, %xmm5, %xmm0
	vmovsd	%xmm3, -336(%rbp)
	jmp	.L514
.L529:
	xorl	%eax, %eax
	movslq	%r12d, %rdi
	movl	$1, %r9d
	jmp	.L509
.L528:
	movq	%rsp, %rax
	jmp	.L502
.L550:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE10505:
	.size	_Z33idft_subarray_inplace_without_divP7ComplexIdvEii, .-_Z33idft_subarray_inplace_without_divP7ComplexIdvEii
	.p2align 4
	.globl	_Z21idft_subarray_inplaceP7ComplexIdvEii
	.type	_Z21idft_subarray_inplaceP7ComplexIdvEii, @function
_Z21idft_subarray_inplaceP7ComplexIdvEii:
.LFB10507:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_offset 12, -32
	movl	%edx, %r12d
	pushq	%rbx
	.cfi_offset 3, -40
	movslq	%esi, %rbx
	movl	%ebx, %esi
	andq	$-32, %rsp
	call	_Z33idft_subarray_inplace_without_divP7ComplexIdvEii
	cmpl	%r12d, %ebx
	jge	.L562
	movl	%r12d, %edx
	subl	%ebx, %edx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	vmovsd	.LC5(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm1
	cmpl	$1, %edx
	je	.L558
	movq	%rbx, %rcx
	movl	%edx, %eax
	shrl	%eax
	salq	$4, %rcx
	leal	-1(%rax), %esi
	addq	%r13, %rcx
	salq	$5, %rsi
	leaq	32(%rcx), %rax
	vbroadcastsd	%xmm1, %ymm2
	addq	%rax, %rsi
	jmp	.L554
	.p2align 4,,10
	.p2align 3
.L564:
	addq	$32, %rax
.L554:
	vmulpd	(%rcx), %ymm2, %ymm0
	vmovupd	%ymm0, (%rcx)
	movq	%rax, %rcx
	cmpq	%rsi, %rax
	jne	.L564
	movl	%edx, %eax
	andl	$-2, %eax
	andl	$1, %edx
	je	.L565
	vzeroupper
.L553:
	addq	%rax, %rbx
	salq	$4, %rbx
	addq	%rbx, %r13
	vmovddup	%xmm1, %xmm1
	vmulpd	0(%r13), %xmm1, %xmm1
	vmovupd	%xmm1, 0(%r13)
.L562:
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L565:
	.cfi_restore_state
	vzeroupper
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L558:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L553
	.cfi_endproc
.LFE10507:
	.size	_Z21idft_subarray_inplaceP7ComplexIdvEii, .-_Z21idft_subarray_inplaceP7ComplexIdvEii
	.p2align 4
	.globl	_Z7ifft_b2P7ComplexIdvEi
	.type	_Z7ifft_b2P7ComplexIdvEi, @function
_Z7ifft_b2P7ComplexIdvEi:
.LFB12819:
	.cfi_startproc
	endbr64
	jmp	_Z6fft_b2P7ComplexIdvEi
	.cfi_endproc
.LFE12819:
	.size	_Z7ifft_b2P7ComplexIdvEi, .-_Z7ifft_b2P7ComplexIdvEi
	.p2align 4
	.globl	_Z7ifft_b4P7ComplexIdvEi
	.type	_Z7ifft_b4P7ComplexIdvEi, @function
_Z7ifft_b4P7ComplexIdvEi:
.LFB10509:
	.cfi_startproc
	endbr64
	movslq	%esi, %rsi
	testq	%rsi, %rsi
	je	.L574
	vmovapd	.LC13(%rip), %ymm2
	xorl	%eax, %eax
	vpermilpd	$5, %ymm2, %ymm3
	.p2align 4,,10
	.p2align 3
.L569:
	vmovupd	32(%rdi), %ymm1
	vmovupd	(%rdi), %ymm4
	vmulpd	%ymm2, %ymm1, %ymm0
	vmulpd	%ymm1, %ymm3, %ymm1
	addq	$16, %rax
	addq	$256, %rdi
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm0, %ymm0
	vaddpd	%ymm4, %ymm0, %ymm1
	vsubpd	%ymm0, %ymm4, %ymm4
	vmovupd	%ymm1, -256(%rdi)
	vmovupd	-160(%rdi), %ymm1
	vmovupd	%ymm4, -224(%rdi)
	vmulpd	%ymm2, %ymm1, %ymm0
	vmulpd	%ymm3, %ymm1, %ymm1
	vmovupd	-192(%rdi), %ymm4
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm0, %ymm0
	vaddpd	%ymm4, %ymm0, %ymm1
	vsubpd	%ymm0, %ymm4, %ymm4
	vmovupd	%ymm1, -192(%rdi)
	vmovupd	-96(%rdi), %ymm1
	vmovupd	%ymm4, -160(%rdi)
	vmulpd	%ymm2, %ymm1, %ymm0
	vmulpd	%ymm3, %ymm1, %ymm1
	vmovupd	-128(%rdi), %ymm4
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm0, %ymm0
	vaddpd	%ymm4, %ymm0, %ymm1
	vsubpd	%ymm0, %ymm4, %ymm4
	vmovupd	%ymm1, -128(%rdi)
	vmovupd	-32(%rdi), %ymm1
	vmovupd	%ymm4, -96(%rdi)
	vmulpd	%ymm2, %ymm1, %ymm0
	vmulpd	%ymm3, %ymm1, %ymm1
	vmovupd	-64(%rdi), %ymm4
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm1
	vsubpd	%ymm0, %ymm4, %ymm4
	vmovupd	%ymm1, -64(%rdi)
	vmovupd	%ymm4, -32(%rdi)
	cmpq	%rsi, %rax
	jb	.L569
	vzeroupper
.L574:
	ret
	.cfi_endproc
.LFE10509:
	.size	_Z7ifft_b4P7ComplexIdvEi, .-_Z7ifft_b4P7ComplexIdvEi
	.p2align 4
	.globl	_Z8ifft_oddP7ComplexIdvEii
	.type	_Z8ifft_oddP7ComplexIdvEii, @function
_Z8ifft_oddP7ComplexIdvEii:
.LFB10511:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%edx, %r12d
	movl	%r12d, %r13d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	sarl	%r13d
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%esi, %ebx
	subq	$192, %rsp
	vmovsd	.LC6(%rip), %xmm1
	movq	%rdi, -112(%rbp)
	vdivsd	%xmm0, %xmm1, %xmm0
	movl	%esi, -68(%rbp)
	leaq	-56(%rbp), %rdi
	leaq	-64(%rbp), %rsi
	call	sincos@PLT
	vmovsd	-64(%rbp), %xmm6
	vmovsd	-56(%rbp), %xmm7
	vmovsd	%xmm6, -80(%rbp)
	vmulsd	%xmm6, %xmm7, %xmm3
	vmulsd	%xmm7, %xmm7, %xmm1
	vmovsd	%xmm7, -184(%rbp)
	vaddsd	%xmm3, %xmm3, %xmm3
	vfmsub231sd	%xmm6, %xmm6, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm0
	vmulsd	%xmm1, %xmm3, %xmm2
	vfmsub231sd	%xmm1, %xmm1, %xmm0
	vaddsd	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm4
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm4, %xmm4, %xmm4
	vfmsub132sd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm12
	vunpcklpd	%xmm4, %xmm12, %xmm12
	vunpcklpd	%xmm3, %xmm1, %xmm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vinsertf128	$1, %xmm12, %ymm12, %ymm12
	testl	%ebx, %ebx
	jle	.L590
	vmovq	.LC8(%rip), %xmm2
	vunpcklpd	%xmm7, %xmm6, %xmm1
	vinsertf128	$0x1, %xmm1, %ymm2, %ymm6
	vpermilpd	$5, %ymm0, %ymm1
	vmulpd	%ymm6, %ymm0, %ymm2
	vmulpd	%ymm6, %ymm1, %ymm3
	vmovapd	%ymm6, -240(%rbp)
	movl	%r13d, %r11d
	movq	-112(%rbp), %r8
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm3, %ymm3, %ymm3
	andl	$-8, %r11d
	leal	-1(%r13), %eax
	vblendpd	$10, %ymm3, %ymm2, %ymm6
	vmulpd	%ymm6, %ymm0, %ymm2
	vmulpd	%ymm6, %ymm1, %ymm3
	vmovapd	%ymm6, -112(%rbp)
	movslq	%r11d, %r14
	subl	%r11d, %eax
	vhsubpd	%ymm2, %ymm2, %ymm2
	vhaddpd	%ymm3, %ymm3, %ymm3
	addq	%r14, %rax
	salq	$4, %rax
	vblendpd	$10, %ymm3, %ymm2, %ymm6
	vmulpd	%ymm6, %ymm0, %ymm0
	vmulpd	%ymm6, %ymm1, %ymm1
	leaq	16(%r8,%rax), %rdi
	leal	-1(%r11), %eax
	shrl	$3, %eax
	salq	$3, %rax
	vhsubpd	%ymm0, %ymm0, %ymm0
	vhaddpd	%ymm1, %ymm1, %ymm1
	movq	%rax, -192(%rbp)
	leaq	128(%r8), %rax
	movslq	%r12d, %r15
	movq	%rax, -200(%rbp)
	movq	%r15, %rbx
	movslq	%r13d, %rcx
	vmovapd	%ymm6, -144(%rbp)
	vblendpd	$10, %ymm1, %ymm0, %ymm6
	salq	$4, %rbx
	salq	$4, %rcx
	salq	$4, %r14
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	vmovapd	%ymm6, -176(%rbp)
	.p2align 4,,10
	.p2align 3
.L580:
	vmovapd	-112(%rbp), %ymm1
	vmovapd	-144(%rbp), %ymm2
	vmovapd	-176(%rbp), %ymm3
	testl	%r11d, %r11d
	jle	.L584
	movq	-192(%rbp), %rax
	vmovapd	-240(%rbp), %ymm0
	leaq	(%r10,%rax), %rsi
	salq	$4, %rsi
	leaq	(%rcx,%r8), %rdx
	addq	-200(%rbp), %rsi
	movq	%r8, %rax
	vpermilpd	$5, %ymm12, %ymm13
	.p2align 4,,10
	.p2align 3
.L578:
	vmovupd	(%rdx), %ymm15
	vpermilpd	$5, %ymm0, %ymm5
	vmulpd	%ymm0, %ymm15, %ymm6
	vmulpd	%ymm15, %ymm5, %ymm5
	vmovupd	32(%rdx), %ymm4
	vpermilpd	$5, %ymm1, %ymm15
	vmovupd	64(%rdx), %ymm14
	vhsubpd	%ymm6, %ymm6, %ymm6
	vhaddpd	%ymm5, %ymm5, %ymm5
	vmovupd	96(%rdx), %ymm7
	vmovupd	(%rax), %ymm11
	vblendpd	$10, %ymm5, %ymm6, %ymm6
	vmulpd	%ymm1, %ymm4, %ymm5
	vmulpd	%ymm15, %ymm4, %ymm4
	vpermilpd	$5, %ymm2, %ymm15
	vmovupd	32(%rax), %ymm10
	vmovupd	64(%rax), %ymm9
	vhsubpd	%ymm5, %ymm5, %ymm5
	vhaddpd	%ymm4, %ymm4, %ymm4
	vmovupd	96(%rax), %ymm8
	subq	$-128, %rax
	vblendpd	$10, %ymm4, %ymm5, %ymm5
	vmulpd	%ymm2, %ymm14, %ymm4
	vmulpd	%ymm15, %ymm14, %ymm14
	vpermilpd	$5, %ymm3, %ymm15
	subq	$-128, %rdx
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm14, %ymm14, %ymm14
	vblendpd	$10, %ymm14, %ymm4, %ymm4
	vmulpd	%ymm3, %ymm7, %ymm14
	vmulpd	%ymm15, %ymm7, %ymm7
	vhsubpd	%ymm14, %ymm14, %ymm14
	vhaddpd	%ymm7, %ymm7, %ymm7
	vblendpd	$10, %ymm7, %ymm14, %ymm14
	vaddpd	%ymm11, %ymm6, %ymm7
	vsubpd	%ymm6, %ymm11, %ymm11
	vmovupd	%ymm7, -128(%rax)
	vaddpd	%ymm5, %ymm10, %ymm7
	vsubpd	%ymm5, %ymm10, %ymm10
	vmovupd	%ymm7, -96(%rax)
	vaddpd	%ymm4, %ymm9, %ymm7
	vsubpd	%ymm4, %ymm9, %ymm9
	vmulpd	%ymm0, %ymm12, %ymm4
	vmulpd	%ymm0, %ymm13, %ymm0
	vmovupd	%ymm7, -64(%rax)
	vaddpd	%ymm14, %ymm8, %ymm7
	vsubpd	%ymm14, %ymm8, %ymm8
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm0, %ymm0, %ymm0
	vmovupd	%ymm7, -32(%rax)
	vmovupd	%ymm11, -128(%rdx)
	vblendpd	$10, %ymm0, %ymm4, %ymm0
	vmulpd	%ymm1, %ymm12, %ymm4
	vmulpd	%ymm1, %ymm13, %ymm1
	vmovupd	%ymm10, -96(%rdx)
	vmovupd	%ymm9, -64(%rdx)
	vmovupd	%ymm8, -32(%rdx)
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm4, %ymm1
	vmulpd	%ymm2, %ymm12, %ymm4
	vmulpd	%ymm2, %ymm13, %ymm2
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm2, %ymm2, %ymm2
	vblendpd	$10, %ymm2, %ymm4, %ymm2
	vmulpd	%ymm3, %ymm12, %ymm4
	vmulpd	%ymm3, %ymm13, %ymm3
	vhsubpd	%ymm4, %ymm4, %ymm4
	vhaddpd	%ymm3, %ymm3, %ymm3
	vblendpd	$10, %ymm3, %ymm4, %ymm3
	cmpq	%rax, %rsi
	jne	.L578
	vunpckhpd	%xmm0, %xmm0, %xmm3
.L577:
	leaq	(%r14,%r8), %rax
	cmpl	%r11d, %r13d
	jle	.L583
	vmovsd	-80(%rbp), %xmm6
	vmovsd	-184(%rbp), %xmm7
	.p2align 4,,10
	.p2align 3
.L582:
	vmovsd	(%rax,%rcx), %xmm1
	vmovsd	(%rax), %xmm9
	vmovsd	%xmm1, %xmm1, %xmm8
	vmovsd	8(%rax,%rcx), %xmm2
	vfmadd132sd	%xmm0, %xmm9, %xmm8
	vmulsd	%xmm0, %xmm2, %xmm5
	vmovsd	8(%rax), %xmm4
	addq	$16, %rax
	vfnmadd231sd	%xmm3, %xmm2, %xmm8
	vfmadd132sd	%xmm3, %xmm9, %xmm2
	vfmadd231sd	%xmm3, %xmm1, %xmm5
	vmovsd	%xmm8, -16(%rax)
	vfnmadd132sd	%xmm0, %xmm2, %xmm1
	vaddsd	%xmm4, %xmm5, %xmm10
	vsubsd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm3, %xmm7, %xmm2
	vmovsd	%xmm10, -8(%rax)
	vunpcklpd	%xmm4, %xmm1, %xmm1
	vmovupd	%xmm1, -16(%rax,%rcx)
	vmovsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm7, %xmm1
	vfmsub132sd	%xmm6, %xmm2, %xmm0
	vfmadd132sd	%xmm6, %xmm1, %xmm3
	cmpq	%rdi, %rax
	jne	.L582
.L583:
	addl	%r12d, %r9d
	addq	%rbx, %rdi
	addq	%rbx, %r8
	addq	%r15, %r10
	cmpl	%r9d, -68(%rbp)
	jg	.L580
.L590:
	vzeroupper
	addq	$192, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L584:
	.cfi_restore_state
	vmovsd	.LC5(%rip), %xmm0
	vxorpd	%xmm3, %xmm3, %xmm3
	jmp	.L577
	.cfi_endproc
.LFE10511:
	.size	_Z8ifft_oddP7ComplexIdvEii, .-_Z8ifft_oddP7ComplexIdvEii
	.p2align 4
	.globl	_Z24ifft_inplace_without_divP7ComplexIdvEii
	.type	_Z24ifft_inplace_without_divP7ComplexIdvEii, @function
_Z24ifft_inplace_without_divP7ComplexIdvEii:
.LFB10512:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leal	(%rdx,%rdx), %ebx
	cmpl	%esi, %ebx
	jg	.L601
	movq	%rdi, %r12
	movl	%esi, %ebp
	jmp	.L598
	.p2align 4,,10
	.p2align 3
.L603:
	movl	%ebx, %edx
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	_Z8ifft_oddP7ComplexIdvEii
.L597:
	addl	%ebx, %ebx
	cmpl	%ebx, %ebp
	jl	.L601
.L598:
	cmpl	$2, %ebx
	je	.L594
	cmpl	$4, %ebx
	jne	.L603
	movl	%ebp, %esi
	movq	%r12, %rdi
	addl	%ebx, %ebx
	call	_Z7ifft_b4P7ComplexIdvEi
	cmpl	%ebx, %ebp
	jge	.L598
.L601:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L594:
	.cfi_restore_state
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	_Z6fft_b2P7ComplexIdvEi
	jmp	.L597
	.cfi_endproc
.LFE10512:
	.size	_Z24ifft_inplace_without_divP7ComplexIdvEii, .-_Z24ifft_inplace_without_divP7ComplexIdvEii
	.p2align 4
	.globl	_Z12ifft_inplaceP7ComplexIdvEii
	.type	_Z12ifft_inplaceP7ComplexIdvEii, @function
_Z12ifft_inplaceP7ComplexIdvEii:
.LFB10513:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_offset 12, -32
	movl	%esi, %r12d
	pushq	%rbx
	.cfi_offset 3, -40
	leal	(%rdx,%rdx), %ebx
	andq	$-32, %rsp
	cmpl	%ebx, %esi
	jge	.L605
	jmp	.L612
	.p2align 4,,10
	.p2align 3
.L625:
	movl	%ebx, %edx
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	_Z8ifft_oddP7ComplexIdvEii
.L611:
	addl	%ebx, %ebx
	cmpl	%ebx, %r12d
	jl	.L612
.L605:
	cmpl	$2, %ebx
	je	.L608
	cmpl	$4, %ebx
	jne	.L625
	movl	%r12d, %esi
	movq	%r13, %rdi
	addl	%ebx, %ebx
	call	_Z7ifft_b4P7ComplexIdvEi
	cmpl	%ebx, %r12d
	jge	.L605
.L612:
	testl	%r12d, %r12d
	jle	.L623
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%r12d, %xmm0, %xmm0
	vmovsd	.LC5(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm1
	cmpl	$1, %r12d
	je	.L617
	movl	%r12d, %edx
	shrl	%edx
	decl	%edx
	salq	$5, %rdx
	vbroadcastsd	%xmm1, %ymm2
	movq	%r13, %rax
	leaq	32(%r13,%rdx), %rdx
	.p2align 4,,10
	.p2align 3
.L614:
	vmulpd	(%rax), %ymm2, %ymm0
	addq	$32, %rax
	vmovupd	%ymm0, -32(%rax)
	cmpq	%rax, %rdx
	jne	.L614
	movl	%r12d, %eax
	andl	$-2, %eax
	andl	$1, %r12d
	je	.L626
	vzeroupper
.L613:
	salq	$4, %rax
	addq	%rax, %r13
	vmovddup	%xmm1, %xmm1
	vmulpd	0(%r13), %xmm1, %xmm1
	vmovupd	%xmm1, 0(%r13)
.L623:
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L608:
	.cfi_restore_state
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	_Z6fft_b2P7ComplexIdvEi
	jmp	.L611
	.p2align 4,,10
	.p2align 3
.L626:
	vzeroupper
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L617:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L613
	.cfi_endproc
.LFE10513:
	.size	_Z12ifft_inplaceP7ComplexIdvEii, .-_Z12ifft_inplaceP7ComplexIdvEii
	.p2align 4
	.globl	_Z10mul_st_c32P7ComplexIfvES1_S1_iii
	.type	_Z10mul_st_c32P7ComplexIfvES1_S1_iii, @function
_Z10mul_st_c32P7ComplexIfvES1_S1_iii:
.LFB10924:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$1160, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%ecx, -84(%rsp)
	andl	$-4, %ecx
	movq	%rdi, 16(%rsp)
	movq	%rsi, 152(%rsp)
	movq	%rdx, 24(%rsp)
	movl	%r8d, 164(%rsp)
	movl	%r9d, 12(%rsp)
	movl	%ecx, -60(%rsp)
	jle	.L634
	movl	%r8d, %eax
	andl	$-16, %eax
	movl	%eax, 160(%rsp)
	decl	%eax
	movl	%r9d, %edx
	shrl	$4, %eax
	andl	$-4, %edx
	salq	$4, %rax
	movq	%rax, 72(%rsp)
	movl	%edx, %eax
	imull	%r8d, %eax
	leal	0(,%r9,4), %ecx
	movl	%r8d, %edi
	movl	%eax, -40(%rsp)
	leal	-1(%r8), %eax
	movl	%eax, 80(%rsp)
	movl	%r8d, %eax
	shrl	$3, %eax
	decl	%eax
	incq	%rax
	salq	$6, %rax
	movl	%r9d, %esi
	sall	$6, %esi
	andl	$-8, %edi
	movl	%ecx, -20(%rsp)
	movq	%rax, 56(%rsp)
	leal	(%r9,%r9), %ecx
	leal	-1(%r9), %eax
	movl	%esi, -96(%rsp)
	movl	%ecx, -76(%rsp)
	movl	%edi, 52(%rsp)
	leal	0(,%r8,4), %ecx
	movslq	%edx, %rdi
	movl	%r8d, %esi
	subl	%edx, %eax
	movl	%ecx, 120(%rsp)
	sall	$6, %esi
	leal	(%r8,%r8), %ecx
	addq	%rdi, %rax
	movl	%edx, 8(%rsp)
	movl	%esi, -80(%rsp)
	movl	%ecx, -8(%rsp)
	movl	%r8d, -68(%rsp)
	movl	%r9d, -72(%rsp)
	movl	$0, -64(%rsp)
	movq	%rdi, -48(%rsp)
	movq	%rax, -56(%rsp)
.L633:
	movl	-64(%rsp), %edi
	movl	-60(%rsp), %esi
	movl	%edi, %eax
	addl	$63, %eax
	movl	%edi, -88(%rsp)
	addl	$64, %edi
	cmpl	%eax, %esi
	movl	%esi, %eax
	cmovg	%edi, %eax
	movl	8(%rsp), %esi
	movl	%edi, -64(%rsp)
	movl	%eax, -4(%rsp)
	testl	%esi, %esi
	jle	.L656
	movl	-76(%rsp), %eax
	movq	$0, (%rsp)
	addl	-72(%rsp), %eax
	movl	%eax, -92(%rsp)
	movl	-8(%rsp), %eax
	addl	-68(%rsp), %eax
	movl	%eax, -100(%rsp)
	movl	164(%rsp), %eax
	movl	%eax, -12(%rsp)
.L655:
	movq	(%rsp), %rbx
	movl	8(%rsp), %edi
	leal	63(%rbx), %edx
	movl	%ebx, %eax
	addl	$64, %eax
	cmpl	%edx, %edi
	cmovle	%edi, %eax
	movl	-88(%rsp), %r15d
	movl	%eax, -16(%rsp)
	movl	%eax, %edx
	cmpl	%r15d, -4(%rsp)
	jle	.L636
	movl	-72(%rsp), %edi
	movl	-68(%rsp), %esi
	movl	%edi, %eax
	subl	12(%rsp), %eax
	movl	%eax, 32(%rsp)
	addl	-76(%rsp), %eax
	movl	-8(%rsp), %ecx
	movl	%eax, 40(%rsp)
	movl	%esi, %eax
	subl	164(%rsp), %eax
	movl	%eax, 84(%rsp)
	addl	%ecx, %eax
	movl	%eax, 128(%rsp)
	movl	%edx, %eax
	subl	%ebx, %eax
	decl	%eax
	shrl	$2, %eax
	salq	$2, %rax
	movq	%rax, -32(%rsp)
	movl	-100(%rsp), %eax
	addl	-12(%rsp), %ecx
	movl	%eax, 132(%rsp)
	movl	-92(%rsp), %eax
	movl	%ebx, -24(%rsp)
	movl	%eax, 44(%rsp)
	movq	152(%rsp), %rax
	movl	%ecx, -36(%rsp)
	subq	$-128, %rax
	movl	%esi, 124(%rsp)
	movl	%edi, 36(%rsp)
	movl	%r15d, 48(%rsp)
	movq	%rax, 64(%rsp)
	.p2align 4,,10
	.p2align 3
.L637:
	movl	-24(%rsp), %edi
	cmpl	%edi, -16(%rsp)
	jle	.L641
	movq	(%rsp), %rsi
	movslq	32(%rsp), %rdx
	movq	24(%rsp), %rdi
	leaq	(%rdx,%rsi), %rax
	leaq	(%rdi,%rax,8), %rbx
	movslq	36(%rsp), %rax
	movl	-12(%rsp), %ecx
	addq	%rsi, %rax
	leaq	(%rdi,%rax,8), %r11
	movslq	40(%rsp), %rax
	movl	-8(%rsp), %r15d
	addq	%rsi, %rax
	leaq	(%rdi,%rax,8), %r12
	movslq	44(%rsp), %rax
	movl	%ecx, 140(%rsp)
	addq	%rsi, %rax
	leaq	(%rdi,%rax,8), %r14
	movl	%ecx, %eax
	subl	164(%rsp), %eax
	addl	%eax, %r15d
	movl	%eax, 136(%rsp)
	movq	-32(%rsp), %rax
	movl	%r15d, 144(%rsp)
	addq	%rsi, %rax
	addq	%rdx, %rax
	leaq	32(%rdi,%rax,8), %rax
	movq	16(%rsp), %rsi
	movq	%rax, 96(%rsp)
	movslq	84(%rsp), %rax
	leaq	(%rsi,%rax,8), %r13
	movslq	124(%rsp), %rax
	leaq	(%rsi,%rax,8), %r15
	movslq	128(%rsp), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, 88(%rsp)
	movslq	132(%rsp), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, 112(%rsp)
	movl	-36(%rsp), %eax
	movl	%eax, 148(%rsp)
	.p2align 4,,10
	.p2align 3
.L640:
	movl	160(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L681
	movq	152(%rsp), %rdi
	movslq	140(%rsp), %rcx
	movslq	136(%rsp), %rdx
	leaq	(%rdi,%rcx,8), %r10
	movslq	144(%rsp), %rcx
	leaq	(%rdi,%rdx,8), %rax
	leaq	(%rdi,%rcx,8), %r9
	movslq	148(%rsp), %rcx
	addq	72(%rsp), %rdx
	leaq	(%rdi,%rcx,8), %r8
	movq	64(%rsp), %rdi
	vxorps	%xmm5, %xmm5, %xmm5
	leaq	(%rdi,%rdx,8), %rdi
	movq	%rdi, 1128(%rsp)
	movq	%r11, 104(%rsp)
	movq	112(%rsp), %rdi
	movq	88(%rsp), %rsi
	movq	1128(%rsp), %r11
	movq	%r15, %rcx
	movq	%r13, %rdx
	vmovaps	%ymm5, 552(%rsp)
	vmovaps	%ymm5, 584(%rsp)
	vmovaps	%ymm5, 616(%rsp)
	vmovaps	%ymm5, 648(%rsp)
	vmovaps	%ymm5, 520(%rsp)
	vmovaps	%ymm5, 488(%rsp)
	vmovaps	%ymm5, 456(%rsp)
	vmovaps	%ymm5, 424(%rsp)
	vmovaps	%ymm5, 392(%rsp)
	vmovaps	%ymm5, 360(%rsp)
	vmovaps	%ymm5, 328(%rsp)
	vmovaps	%ymm5, 296(%rsp)
	vmovaps	%ymm5, 264(%rsp)
	vmovaps	%ymm5, 232(%rsp)
	vmovaps	%ymm5, 200(%rsp)
	vmovaps	%ymm5, 168(%rsp)
	.p2align 4,,10
	.p2align 3
.L638:
	vmovups	(%rdx), %ymm1
	vpermilps	$177, (%rax), %ymm3
	vmulps	(%rax), %ymm1, %ymm14
	vmulps	%ymm3, %ymm1, %ymm2
	vpermilps	$177, (%r10), %ymm4
	vmulps	(%r10), %ymm1, %ymm12
	vpermilps	$177, (%r9), %ymm7
	vhsubps	%ymm14, %ymm14, %ymm14
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$177, (%r8), %ymm15
	vpermilps	$80, %ymm14, %ymm14
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm14, %ymm14
	vmulps	%ymm4, %ymm1, %ymm2
	vhsubps	%ymm12, %ymm12, %ymm12
	vmulps	(%r9), %ymm1, %ymm10
	vmulps	(%r8), %ymm1, %ymm8
	vpermilps	$80, %ymm12, %ymm12
	vhaddps	%ymm2, %ymm2, %ymm2
	vmovups	32(%rdx), %ymm5
	vmovaps	%ymm4, 1096(%rsp)
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm12, %ymm12
	vmulps	%ymm7, %ymm1, %ymm2
	vmulps	%ymm15, %ymm1, %ymm1
	vhsubps	%ymm8, %ymm8, %ymm8
	vmulps	32(%rax), %ymm5, %ymm4
	vpermilps	$177, 32(%r10), %ymm9
	vpermilps	$80, %ymm8, %ymm8
	vhaddps	%ymm1, %ymm1, %ymm1
	vmovaps	%ymm3, 1128(%rsp)
	vhsubps	%ymm4, %ymm4, %ymm4
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm8, %ymm8
	vpermilps	$177, 32(%rax), %ymm1
	vpermilps	$80, %ymm4, %ymm4
	vmovaps	%ymm1, 1000(%rsp)
	vmulps	%ymm1, %ymm5, %ymm1
	vmulps	32(%r10), %ymm5, %ymm3
	vhsubps	%ymm10, %ymm10, %ymm10
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$177, 32(%r9), %ymm13
	vhaddps	%ymm1, %ymm1, %ymm1
	vhsubps	%ymm3, %ymm3, %ymm3
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm4, %ymm4
	vmulps	%ymm9, %ymm5, %ymm1
	vpermilps	$80, %ymm10, %ymm10
	vpermilps	$80, %ymm3, %ymm3
	vblendps	$170, %ymm2, %ymm10, %ymm10
	vmulps	32(%r9), %ymm5, %ymm2
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$177, 32(%r8), %ymm11
	vmovups	64(%rdx), %ymm6
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm3, %ymm3
	vmulps	%ymm13, %ymm5, %ymm1
	vhsubps	%ymm2, %ymm2, %ymm2
	vmovaps	%ymm13, 936(%rsp)
	vmulps	64(%rax), %ymm6, %ymm13
	vpermilps	$80, %ymm2, %ymm2
	vhaddps	%ymm1, %ymm1, %ymm1
	vmovups	96(%rdx), %ymm0
	vmovaps	%ymm7, 1064(%rsp)
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm2, %ymm2
	vmulps	32(%r8), %ymm5, %ymm1
	vmulps	%ymm11, %ymm5, %ymm5
	vhsubps	%ymm13, %ymm13, %ymm13
	vmovaps	%ymm15, 1032(%rsp)
	vmovaps	%ymm9, 968(%rsp)
	vhsubps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm5, %ymm5, %ymm5
	vpermilps	$80, %ymm13, %ymm13
	vpermilps	$80, %ymm1, %ymm1
	vpermilps	$80, %ymm5, %ymm5
	vblendps	$170, %ymm5, %ymm1, %ymm1
	vpermilps	$177, 64(%rax), %ymm5
	vmovaps	%ymm11, 904(%rsp)
	vmovaps	%ymm5, 872(%rsp)
	vmulps	%ymm5, %ymm6, %ymm5
	vmulps	64(%r10), %ymm6, %ymm11
	vaddps	%ymm14, %ymm4, %ymm4
	vaddps	%ymm12, %ymm3, %ymm3
	vaddps	%ymm10, %ymm2, %ymm2
	vhaddps	%ymm5, %ymm5, %ymm5
	vhsubps	%ymm11, %ymm11, %ymm11
	vaddps	%ymm8, %ymm1, %ymm1
	vpermilps	$80, %ymm5, %ymm5
	vblendps	$170, %ymm5, %ymm13, %ymm13
	vpermilps	$177, 64(%r10), %ymm5
	vpermilps	$80, %ymm11, %ymm11
	vmovaps	%ymm5, 840(%rsp)
	vmulps	%ymm5, %ymm6, %ymm5
	vmulps	64(%r9), %ymm6, %ymm9
	vpermilps	$177, 64(%r8), %ymm15
	subq	$-128, %rax
	vmovaps	%ymm15, 808(%rsp)
	vhaddps	%ymm5, %ymm5, %ymm5
	vhsubps	%ymm9, %ymm9, %ymm9
	subq	$-128, %r10
	vpermilps	$80, %ymm5, %ymm5
	vblendps	$170, %ymm5, %ymm11, %ymm11
	vpermilps	$177, 64(%r9), %ymm5
	vpermilps	$80, %ymm9, %ymm9
	vmulps	%ymm6, %ymm5, %ymm7
	subq	$-128, %r9
	subq	$-128, %r8
	subq	$-128, %rdx
	subq	$-128, %rcx
	vhaddps	%ymm7, %ymm7, %ymm7
	subq	$-128, %rsi
	subq	$-128, %rdi
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm9, %ymm9
	vmulps	-64(%r8), %ymm6, %ymm7
	vmulps	%ymm15, %ymm6, %ymm6
	vpermilps	$177, -32(%rax), %ymm15
	vmovaps	%ymm15, 776(%rsp)
	vhsubps	%ymm7, %ymm7, %ymm7
	vhaddps	%ymm6, %ymm6, %ymm6
	vmulps	%ymm15, %ymm0, %ymm15
	vpermilps	$80, %ymm7, %ymm7
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm7, %ymm7
	vmulps	-32(%rax), %ymm0, %ymm6
	vhaddps	%ymm15, %ymm15, %ymm15
	vpermilps	$80, %ymm15, %ymm15
	vhsubps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm15, %ymm6, %ymm6
	vaddps	%ymm13, %ymm6, %ymm6
	vaddps	%ymm6, %ymm4, %ymm4
	vaddps	168(%rsp), %ymm4, %ymm14
	vmulps	-32(%r10), %ymm0, %ymm4
	vmovaps	%ymm14, 168(%rsp)
	vpermilps	$177, -32(%r10), %ymm14
	vmulps	%ymm14, %ymm0, %ymm6
	vhsubps	%ymm4, %ymm4, %ymm4
	vmovaps	%ymm14, 744(%rsp)
	vpermilps	$80, %ymm4, %ymm4
	vhaddps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm4, %ymm4
	vaddps	%ymm11, %ymm4, %ymm4
	vmovups	-64(%rcx), %ymm6
	vaddps	%ymm4, %ymm3, %ymm3
	vaddps	200(%rsp), %ymm3, %ymm12
	vmulps	-32(%r9), %ymm0, %ymm3
	vmovaps	%ymm12, 200(%rsp)
	vpermilps	$177, -32(%r9), %ymm12
	vmulps	%ymm12, %ymm0, %ymm4
	vhsubps	%ymm3, %ymm3, %ymm3
	vmovaps	%ymm12, 712(%rsp)
	vpermilps	$80, %ymm3, %ymm3
	vhaddps	%ymm4, %ymm4, %ymm4
	vpermilps	$80, %ymm4, %ymm4
	vblendps	$170, %ymm4, %ymm3, %ymm3
	vaddps	%ymm9, %ymm3, %ymm3
	vaddps	%ymm3, %ymm2, %ymm2
	vaddps	232(%rsp), %ymm2, %ymm10
	vmulps	-32(%r8), %ymm0, %ymm2
	vmovaps	%ymm10, 232(%rsp)
	vpermilps	$177, -32(%r8), %ymm10
	vmulps	%ymm10, %ymm0, %ymm0
	vhsubps	%ymm2, %ymm2, %ymm2
	vmovaps	%ymm10, 680(%rsp)
	vpermilps	$80, %ymm2, %ymm2
	vhaddps	%ymm0, %ymm0, %ymm0
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm2, %ymm2
	vaddps	%ymm7, %ymm2, %ymm2
	vmovups	-32(%rcx), %ymm0
	vmovups	-96(%rcx), %ymm7
	vaddps	%ymm2, %ymm1, %ymm1
	vaddps	264(%rsp), %ymm1, %ymm8
	vmovups	-128(%rcx), %ymm1
	vmovaps	%ymm8, 264(%rsp)
	vmulps	-128(%rax), %ymm1, %ymm14
	vmulps	1128(%rsp), %ymm1, %ymm2
	vmulps	-128(%r10), %ymm1, %ymm12
	vmulps	-128(%r9), %ymm1, %ymm10
	vmulps	-128(%r8), %ymm1, %ymm8
	vhsubps	%ymm14, %ymm14, %ymm14
	vhaddps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm12, %ymm12, %ymm12
	vpermilps	$80, %ymm14, %ymm14
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm14, %ymm14
	vmulps	1096(%rsp), %ymm1, %ymm2
	vpermilps	$80, %ymm12, %ymm12
	vhsubps	%ymm8, %ymm8, %ymm8
	vmulps	-96(%rax), %ymm7, %ymm4
	vmulps	-96(%r10), %ymm7, %ymm3
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm8, %ymm8
	vhsubps	%ymm10, %ymm10, %ymm10
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm12, %ymm12
	vmulps	1064(%rsp), %ymm1, %ymm2
	vmulps	1032(%rsp), %ymm1, %ymm1
	vhsubps	%ymm4, %ymm4, %ymm4
	vhsubps	%ymm3, %ymm3, %ymm3
	vpermilps	$80, %ymm10, %ymm10
	vpermilps	$80, %ymm4, %ymm4
	vhaddps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm3, %ymm3
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm8, %ymm8
	vmulps	1000(%rsp), %ymm7, %ymm1
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm10, %ymm10
	vmulps	-96(%r9), %ymm7, %ymm2
	vmulps	-64(%rax), %ymm6, %ymm13
	vhaddps	%ymm1, %ymm1, %ymm1
	vmulps	-64(%r10), %ymm6, %ymm11
	vmulps	-64(%r9), %ymm6, %ymm9
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm4, %ymm4
	vmulps	968(%rsp), %ymm7, %ymm1
	vhsubps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm13, %ymm13, %ymm13
	vhsubps	%ymm11, %ymm11, %ymm11
	vpermilps	$80, %ymm2, %ymm2
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm13, %ymm13
	vpermilps	$80, %ymm11, %ymm11
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm3, %ymm3
	vmulps	936(%rsp), %ymm7, %ymm1
	vhsubps	%ymm9, %ymm9, %ymm9
	vmulps	776(%rsp), %ymm0, %ymm15
	vaddps	%ymm14, %ymm4, %ymm4
	vpermilps	$80, %ymm9, %ymm9
	vhaddps	%ymm1, %ymm1, %ymm1
	vaddps	%ymm12, %ymm3, %ymm3
	vhaddps	%ymm15, %ymm15, %ymm15
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm2, %ymm2
	vmulps	-96(%r8), %ymm7, %ymm1
	vmulps	904(%rsp), %ymm7, %ymm7
	vpermilps	$80, %ymm15, %ymm15
	vaddps	%ymm10, %ymm2, %ymm2
	vhsubps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm1, %ymm1
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm1, %ymm1
	vmulps	872(%rsp), %ymm6, %ymm7
	vaddps	%ymm8, %ymm1, %ymm1
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm13, %ymm13
	vmulps	840(%rsp), %ymm6, %ymm7
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm11, %ymm11
	vmulps	%ymm5, %ymm6, %ymm7
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm9, %ymm9
	vmulps	-64(%r8), %ymm6, %ymm7
	vmulps	808(%rsp), %ymm6, %ymm6
	vhsubps	%ymm7, %ymm7, %ymm7
	vhaddps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm7, %ymm7
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm7, %ymm7
	vmulps	-32(%rax), %ymm0, %ymm6
	vhsubps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm15, %ymm6, %ymm6
	vaddps	%ymm13, %ymm6, %ymm6
	vaddps	%ymm6, %ymm4, %ymm4
	vaddps	296(%rsp), %ymm4, %ymm6
	vmulps	-32(%r10), %ymm0, %ymm4
	vmovaps	%ymm6, 296(%rsp)
	vmulps	744(%rsp), %ymm0, %ymm6
	vhsubps	%ymm4, %ymm4, %ymm4
	vhaddps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm4, %ymm4
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm4, %ymm4
	vaddps	%ymm11, %ymm4, %ymm4
	vaddps	%ymm4, %ymm3, %ymm3
	vmulps	712(%rsp), %ymm0, %ymm4
	vaddps	328(%rsp), %ymm3, %ymm6
	vmulps	-32(%r9), %ymm0, %ymm3
	vhaddps	%ymm4, %ymm4, %ymm4
	vmovaps	%ymm6, 328(%rsp)
	vhsubps	%ymm3, %ymm3, %ymm3
	vpermilps	$80, %ymm4, %ymm4
	vpermilps	$80, %ymm3, %ymm3
	vblendps	$170, %ymm4, %ymm3, %ymm3
	vaddps	%ymm9, %ymm3, %ymm3
	vaddps	%ymm3, %ymm2, %ymm2
	vaddps	360(%rsp), %ymm2, %ymm6
	vmulps	-32(%r8), %ymm0, %ymm2
	vmulps	680(%rsp), %ymm0, %ymm0
	vmovaps	%ymm6, 360(%rsp)
	vmovups	-64(%rsi), %ymm6
	vhsubps	%ymm2, %ymm2, %ymm2
	vhaddps	%ymm0, %ymm0, %ymm0
	vmulps	-64(%rax), %ymm6, %ymm13
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm2, %ymm2
	vaddps	%ymm7, %ymm2, %ymm2
	vmovups	-96(%rsi), %ymm7
	vhsubps	%ymm13, %ymm13, %ymm13
	vaddps	%ymm2, %ymm1, %ymm1
	vmulps	-96(%rax), %ymm7, %ymm4
	vmulps	-96(%r10), %ymm7, %ymm3
	vaddps	392(%rsp), %ymm1, %ymm8
	vmovups	-128(%rsi), %ymm1
	vpermilps	$80, %ymm13, %ymm13
	vmulps	-128(%rax), %ymm1, %ymm14
	vmulps	1128(%rsp), %ymm1, %ymm2
	vmulps	-128(%r10), %ymm1, %ymm12
	vmulps	-128(%r9), %ymm1, %ymm10
	vmovaps	%ymm8, 392(%rsp)
	vhsubps	%ymm14, %ymm14, %ymm14
	vhaddps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm12, %ymm12, %ymm12
	vpermilps	$80, %ymm14, %ymm14
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm14, %ymm14
	vmulps	1096(%rsp), %ymm1, %ymm2
	vpermilps	$80, %ymm12, %ymm12
	vmulps	-128(%r8), %ymm1, %ymm8
	vhsubps	%ymm4, %ymm4, %ymm4
	vhsubps	%ymm10, %ymm10, %ymm10
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm4, %ymm4
	vhsubps	%ymm8, %ymm8, %ymm8
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm12, %ymm12
	vmulps	1064(%rsp), %ymm1, %ymm2
	vmulps	1032(%rsp), %ymm1, %ymm1
	vpermilps	$80, %ymm8, %ymm8
	vhsubps	%ymm3, %ymm3, %ymm3
	vpermilps	$80, %ymm10, %ymm10
	vhaddps	%ymm2, %ymm2, %ymm2
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm3, %ymm3
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm8, %ymm8
	vmulps	1000(%rsp), %ymm7, %ymm1
	vblendps	$170, %ymm2, %ymm10, %ymm10
	vmulps	-96(%r9), %ymm7, %ymm2
	vmulps	-64(%r10), %ymm6, %ymm11
	vmulps	-64(%r9), %ymm6, %ymm9
	vhaddps	%ymm1, %ymm1, %ymm1
	vmovups	-32(%rsi), %ymm0
	vhsubps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm4, %ymm4
	vmulps	968(%rsp), %ymm7, %ymm1
	vpermilps	$80, %ymm2, %ymm2
	vhsubps	%ymm11, %ymm11, %ymm11
	vhsubps	%ymm9, %ymm9, %ymm9
	vaddps	%ymm14, %ymm4, %ymm4
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm11, %ymm11
	vpermilps	$80, %ymm9, %ymm9
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm3, %ymm3
	vmulps	936(%rsp), %ymm7, %ymm1
	vaddps	%ymm12, %ymm3, %ymm3
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm2, %ymm2
	vmulps	-96(%r8), %ymm7, %ymm1
	vmulps	904(%rsp), %ymm7, %ymm7
	vaddps	%ymm10, %ymm2, %ymm2
	vhsubps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm1, %ymm1
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm1, %ymm1
	vmulps	872(%rsp), %ymm6, %ymm7
	vaddps	%ymm8, %ymm1, %ymm1
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm13, %ymm13
	vmulps	840(%rsp), %ymm6, %ymm7
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm11, %ymm11
	vmulps	%ymm5, %ymm6, %ymm7
	vhaddps	%ymm7, %ymm7, %ymm7
	vpermilps	$80, %ymm7, %ymm7
	vblendps	$170, %ymm7, %ymm9, %ymm9
	vmulps	-64(%r8), %ymm6, %ymm7
	vmulps	808(%rsp), %ymm6, %ymm6
	vmulps	776(%rsp), %ymm0, %ymm15
	vhsubps	%ymm7, %ymm7, %ymm7
	vhaddps	%ymm6, %ymm6, %ymm6
	vhaddps	%ymm15, %ymm15, %ymm15
	vpermilps	$80, %ymm7, %ymm7
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm7, %ymm7
	vmulps	-32(%rax), %ymm0, %ymm6
	vpermilps	$80, %ymm15, %ymm15
	vhsubps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm15, %ymm6, %ymm6
	vaddps	%ymm13, %ymm6, %ymm6
	vmovaps	680(%rsp), %ymm15
	vaddps	%ymm6, %ymm4, %ymm4
	vaddps	424(%rsp), %ymm4, %ymm6
	vmulps	-32(%r10), %ymm0, %ymm4
	vmovaps	%ymm6, 424(%rsp)
	vmulps	744(%rsp), %ymm0, %ymm6
	vhsubps	%ymm4, %ymm4, %ymm4
	vhaddps	%ymm6, %ymm6, %ymm6
	vpermilps	$80, %ymm4, %ymm4
	vpermilps	$80, %ymm6, %ymm6
	vblendps	$170, %ymm6, %ymm4, %ymm4
	vaddps	%ymm11, %ymm4, %ymm4
	vaddps	%ymm4, %ymm3, %ymm3
	vmulps	712(%rsp), %ymm0, %ymm4
	vaddps	456(%rsp), %ymm3, %ymm6
	vmulps	-32(%r9), %ymm0, %ymm3
	vhaddps	%ymm4, %ymm4, %ymm4
	vmovaps	%ymm6, 456(%rsp)
	vhsubps	%ymm3, %ymm3, %ymm3
	vpermilps	$80, %ymm4, %ymm4
	vpermilps	$80, %ymm3, %ymm3
	vblendps	$170, %ymm4, %ymm3, %ymm3
	vaddps	%ymm9, %ymm3, %ymm3
	vmovups	-64(%rdi), %ymm4
	vaddps	%ymm3, %ymm2, %ymm2
	vmovups	-32(%rdi), %ymm3
	vmulps	%ymm5, %ymm4, %ymm5
	vaddps	488(%rsp), %ymm2, %ymm6
	vmulps	-32(%r8), %ymm0, %ymm2
	vmulps	%ymm15, %ymm0, %ymm0
	vmovaps	%ymm6, 488(%rsp)
	vhaddps	%ymm5, %ymm5, %ymm5
	vhsubps	%ymm2, %ymm2, %ymm2
	vhaddps	%ymm0, %ymm0, %ymm0
	vpermilps	$80, %ymm5, %ymm5
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm2, %ymm2
	vaddps	%ymm7, %ymm2, %ymm2
	vaddps	%ymm2, %ymm1, %ymm1
	vmovups	-128(%rdi), %ymm2
	vaddps	520(%rsp), %ymm1, %ymm8
	vmulps	1128(%rsp), %ymm2, %ymm0
	vmulps	-128(%r10), %ymm2, %ymm7
	vmovaps	%ymm8, 520(%rsp)
	vmulps	-128(%rax), %ymm2, %ymm8
	vmulps	-128(%r9), %ymm2, %ymm9
	vhaddps	%ymm0, %ymm0, %ymm0
	vhsubps	%ymm7, %ymm7, %ymm7
	vmovups	-96(%rdi), %ymm1
	vhsubps	%ymm8, %ymm8, %ymm8
	vpermilps	$80, %ymm0, %ymm0
	vpermilps	$80, %ymm7, %ymm7
	vpermilps	$80, %ymm8, %ymm8
	vblendps	$170, %ymm0, %ymm8, %ymm8
	vmulps	1096(%rsp), %ymm2, %ymm0
	vhsubps	%ymm9, %ymm9, %ymm9
	vmulps	-96(%rax), %ymm1, %ymm11
	vmulps	-96(%r10), %ymm1, %ymm10
	vpermilps	$80, %ymm9, %ymm9
	vhaddps	%ymm0, %ymm0, %ymm0
	vhsubps	%ymm11, %ymm11, %ymm11
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm7, %ymm7
	vmulps	1064(%rsp), %ymm2, %ymm0
	vpermilps	$80, %ymm11, %ymm11
	vhsubps	%ymm10, %ymm10, %ymm10
	vhaddps	%ymm0, %ymm0, %ymm0
	vpermilps	$80, %ymm10, %ymm10
	vpermilps	$80, %ymm0, %ymm0
	vblendps	$170, %ymm0, %ymm9, %ymm9
	vmulps	-128(%r8), %ymm2, %ymm0
	vmulps	1032(%rsp), %ymm2, %ymm2
	vhsubps	%ymm0, %ymm0, %ymm0
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm0, %ymm0
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm0, %ymm0
	vmulps	1000(%rsp), %ymm1, %ymm2
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm11, %ymm11
	vmulps	968(%rsp), %ymm1, %ymm2
	vmulps	-96(%r9), %ymm1, %ymm6
	vmulps	-96(%r8), %ymm1, %ymm12
	vmulps	840(%rsp), %ymm4, %ymm14
	vaddps	%ymm8, %ymm11, %ymm11
	vhaddps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm6, %ymm6, %ymm6
	vhsubps	%ymm12, %ymm12, %ymm12
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm10, %ymm10
	vmulps	936(%rsp), %ymm1, %ymm2
	vmulps	904(%rsp), %ymm1, %ymm1
	vpermilps	$80, %ymm6, %ymm6
	vpermilps	$80, %ymm12, %ymm12
	vhaddps	%ymm14, %ymm14, %ymm14
	vhaddps	%ymm2, %ymm2, %ymm2
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm14, %ymm14
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm2, %ymm6, %ymm6
	vblendps	$170, %ymm1, %ymm12, %ymm12
	vmulps	-64(%rax), %ymm4, %ymm2
	vmulps	872(%rsp), %ymm4, %ymm1
	vaddps	%ymm6, %ymm9, %ymm9
	vaddps	%ymm7, %ymm10, %ymm10
	vaddps	%ymm12, %ymm0, %ymm0
	vhsubps	%ymm2, %ymm2, %ymm2
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm2, %ymm2
	vmulps	-64(%r10), %ymm4, %ymm1
	vhsubps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm14, %ymm1, %ymm13
	vmulps	-64(%r9), %ymm4, %ymm1
	vhsubps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm5, %ymm1, %ymm5
	vmulps	-64(%r8), %ymm4, %ymm1
	vmulps	808(%rsp), %ymm4, %ymm4
	vhsubps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm4, %ymm4, %ymm4
	vpermilps	$80, %ymm1, %ymm1
	vpermilps	$80, %ymm4, %ymm4
	vblendps	$170, %ymm4, %ymm1, %ymm14
	vmulps	-32(%rax), %ymm3, %ymm4
	vmulps	776(%rsp), %ymm3, %ymm1
	vhsubps	%ymm4, %ymm4, %ymm4
	vhaddps	%ymm1, %ymm1, %ymm1
	vpermilps	$80, %ymm4, %ymm4
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm1, %ymm4, %ymm4
	vaddps	%ymm4, %ymm2, %ymm2
	vmulps	-32(%r10), %ymm3, %ymm1
	vaddps	%ymm2, %ymm11, %ymm11
	vaddps	648(%rsp), %ymm11, %ymm2
	vhsubps	%ymm1, %ymm1, %ymm1
	vmovaps	%ymm2, 648(%rsp)
	vmulps	744(%rsp), %ymm3, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vhaddps	%ymm2, %ymm2, %ymm2
	vpermilps	$80, %ymm2, %ymm2
	vblendps	$170, %ymm2, %ymm1, %ymm1
	vaddps	%ymm1, %ymm13, %ymm13
	vmulps	712(%rsp), %ymm3, %ymm2
	vmulps	-32(%r9), %ymm3, %ymm1
	vaddps	%ymm13, %ymm10, %ymm10
	vhaddps	%ymm2, %ymm2, %ymm2
	vhsubps	%ymm1, %ymm1, %ymm1
	vaddps	616(%rsp), %ymm10, %ymm7
	vpermilps	$80, %ymm2, %ymm2
	vpermilps	$80, %ymm1, %ymm1
	vblendps	$170, %ymm2, %ymm1, %ymm1
	vaddps	%ymm1, %ymm5, %ymm5
	vmulps	-32(%r8), %ymm3, %ymm1
	vmulps	%ymm15, %ymm3, %ymm3
	vaddps	%ymm5, %ymm9, %ymm9
	vmovaps	%ymm7, 616(%rsp)
	vhsubps	%ymm1, %ymm1, %ymm1
	vhaddps	%ymm3, %ymm3, %ymm3
	vaddps	584(%rsp), %ymm9, %ymm5
	vpermilps	$80, %ymm1, %ymm1
	vpermilps	$80, %ymm3, %ymm3
	vblendps	$170, %ymm3, %ymm1, %ymm1
	vaddps	%ymm1, %ymm14, %ymm14
	vmovaps	%ymm5, 584(%rsp)
	vaddps	%ymm14, %ymm0, %ymm0
	vaddps	552(%rsp), %ymm0, %ymm5
	vmovaps	%ymm5, 552(%rsp)
	cmpq	%rax, %r11
	jne	.L638
	vmovaps	168(%rsp), %xmm0
	movq	104(%rsp), %r11
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 1128(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	200(%rsp), %xmm0
	vmovss	%xmm5, 1096(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 1064(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	232(%rsp), %xmm0
	vmovss	%xmm5, 1032(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vmovaps	%xmm0, %xmm1
	vunpckhps	%xmm0, %xmm0, %xmm0
	vmovss	%xmm5, 1000(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	264(%rsp), %xmm0
	vmovss	%xmm5, 968(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 936(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	296(%rsp), %xmm0
	vmovss	%xmm5, 904(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 872(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	328(%rsp), %xmm0
	vmovss	%xmm5, 840(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 808(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	360(%rsp), %xmm0
	vmovss	%xmm5, 776(%rsp)
	vshufps	$85, %xmm0, %xmm0, %xmm2
	vshufps	$255, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 744(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	392(%rsp), %xmm0
	vmovss	%xmm5, 712(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 680(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	424(%rsp), %xmm0
	vmovss	%xmm5, 392(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 424(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	456(%rsp), %xmm0
	vmovss	%xmm5, 360(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vmovaps	%xmm0, %xmm1
	vunpckhps	%xmm0, %xmm0, %xmm0
	vmovss	%xmm5, 456(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	488(%rsp), %xmm0
	vmovss	%xmm5, 328(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 488(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	520(%rsp), %xmm0
	vmovss	%xmm5, 296(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 520(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	648(%rsp), %xmm0
	vmovss	%xmm5, 264(%rsp)
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vshufps	$85, %xmm7, %xmm7, %xmm2
	vmovss	%xmm5, 648(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vshufps	$255, %xmm7, %xmm7, %xmm1
	vmovaps	584(%rsp), %xmm0
	vmovss	%xmm5, 232(%rsp)
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm7, %xmm7, %xmm1
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vmovss	%xmm5, 616(%rsp)
	vaddss	%xmm7, %xmm1, %xmm5
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 200(%rsp)
	vaddss	%xmm1, %xmm2, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovss	%xmm5, 584(%rsp)
	vaddss	%xmm0, %xmm1, %xmm5
	vmovaps	552(%rsp), %xmm0
	vmovd	%xmm5, %r10d
	vshufps	$85, %xmm0, %xmm0, %xmm1
	vshufps	$255, %xmm0, %xmm0, %xmm15
	vaddss	%xmm1, %xmm15, %xmm5
	vunpckhps	%xmm0, %xmm0, %xmm1
	vmovd	%xmm5, %r9d
	vaddss	%xmm0, %xmm1, %xmm5
	vmovd	%xmm5, %r8d
.L645:
	movl	160(%rsp), %esi
	cmpl	%esi, 164(%rsp)
	jle	.L643
	movq	152(%rsp), %rcx
	movslq	136(%rsp), %rdx
	movslq	160(%rsp), %rax
	leaq	(%rcx,%rdx,8), %rdi
	movslq	140(%rsp), %rdx
	leaq	(%rcx,%rdx,8), %rsi
	movslq	144(%rsp), %rdx
	leaq	(%rcx,%rdx,8), %rdx
	movq	%rdx, 552(%rsp)
	movslq	148(%rsp), %rdx
	leaq	(%rcx,%rdx,8), %rdx
	movq	552(%rsp), %rcx
	movl	%r10d, 552(%rsp)
	movq	112(%rsp), %r10
	.p2align 4,,10
	.p2align 3
.L642:
	vmovss	4(%r13,%rax,8), %xmm6
	vmovss	(%rdi,%rax,8), %xmm13
	vmovss	0(%r13,%rax,8), %xmm7
	vmulss	%xmm6, %xmm13, %xmm14
	vmovss	4(%rdi,%rax,8), %xmm3
	vmovss	(%rsi,%rax,8), %xmm12
	vmovss	(%r10,%rax,8), %xmm8
	vmovss	(%r15,%rax,8), %xmm5
	vfmadd231ss	%xmm3, %xmm7, %xmm14
	vmovss	4(%r15,%rax,8), %xmm4
	vmovss	4(%r10,%rax,8), %xmm9
	vmovss	4(%rsi,%rax,8), %xmm2
	vmovss	(%rcx,%rax,8), %xmm11
	vaddss	4(%rbx), %xmm14, %xmm14
	vmovss	4(%rcx,%rax,8), %xmm1
	vmovss	(%rdx,%rax,8), %xmm10
	vmovss	4(%rdx,%rax,8), %xmm0
	vmovss	%xmm14, 4(%rbx)
	vmulss	%xmm6, %xmm12, %xmm14
	vmovaps	%xmm13, %xmm15
	vfmadd213ss	(%rbx), %xmm7, %xmm15
	incq	%rax
	vfmadd231ss	%xmm7, %xmm2, %xmm14
	vfnmadd231ss	%xmm6, %xmm3, %xmm15
	vaddss	12(%rbx), %xmm14, %xmm14
	vmovss	%xmm15, (%rbx)
	vmovss	%xmm14, 12(%rbx)
	vmulss	%xmm6, %xmm11, %xmm14
	vmovaps	%xmm12, %xmm15
	vfmadd213ss	8(%rbx), %xmm7, %xmm15
	vfmadd231ss	%xmm7, %xmm1, %xmm14
	vfnmadd231ss	%xmm6, %xmm2, %xmm15
	vaddss	20(%rbx), %xmm14, %xmm14
	vmovss	%xmm15, 8(%rbx)
	vmovss	%xmm14, 20(%rbx)
	vmulss	%xmm6, %xmm10, %xmm14
	vmovaps	%xmm7, %xmm15
	vfmadd213ss	16(%rbx), %xmm11, %xmm15
	vfmadd231ss	%xmm0, %xmm7, %xmm14
	vfmadd213ss	24(%rbx), %xmm10, %xmm7
	vfnmadd231ss	%xmm6, %xmm1, %xmm15
	vaddss	28(%rbx), %xmm14, %xmm14
	vfnmadd132ss	%xmm0, %xmm7, %xmm6
	vmovss	%xmm15, 16(%rbx)
	vmovss	%xmm14, 28(%rbx)
	vmovaps	%xmm13, %xmm7
	vmovss	%xmm6, 24(%rbx)
	vfmadd213ss	(%r11), %xmm5, %xmm7
	vmulss	%xmm4, %xmm13, %xmm6
	vfnmadd231ss	%xmm4, %xmm3, %xmm7
	vfmadd231ss	%xmm3, %xmm5, %xmm6
	vmovss	%xmm7, (%r11)
	vaddss	4(%r11), %xmm6, %xmm6
	vmovaps	%xmm12, %xmm7
	vfmadd213ss	8(%r11), %xmm5, %xmm7
	vmovss	%xmm6, 4(%r11)
	vmulss	%xmm4, %xmm12, %xmm6
	vfnmadd231ss	%xmm4, %xmm2, %xmm7
	vfmadd231ss	%xmm5, %xmm2, %xmm6
	vmovss	%xmm7, 8(%r11)
	vmovaps	%xmm5, %xmm7
	vaddss	12(%r11), %xmm6, %xmm6
	vfmadd213ss	16(%r11), %xmm11, %xmm7
	vmovss	%xmm6, 12(%r11)
	vmulss	%xmm4, %xmm11, %xmm6
	vfnmadd231ss	%xmm4, %xmm1, %xmm7
	vfmadd231ss	%xmm5, %xmm1, %xmm6
	vmovss	%xmm7, 16(%r11)
	vaddss	20(%r11), %xmm6, %xmm6
	vmovss	%xmm6, 20(%r11)
	vmulss	%xmm4, %xmm10, %xmm6
	vfmadd231ss	%xmm0, %xmm5, %xmm6
	vfmadd213ss	24(%r11), %xmm10, %xmm5
	vaddss	28(%r11), %xmm6, %xmm6
	vfnmadd132ss	%xmm0, %xmm5, %xmm4
	vmovss	%xmm6, 28(%r11)
	vmovss	%xmm4, 24(%r11)
	vmulss	%xmm9, %xmm13, %xmm4
	vfmadd231ss	%xmm3, %xmm8, %xmm4
	vmulss	%xmm9, %xmm3, %xmm3
	vfmsub231ss	%xmm8, %xmm13, %xmm3
	vaddss	(%r12), %xmm3, %xmm5
	vmovss	%xmm5, (%r12)
	vaddss	4(%r12), %xmm4, %xmm5
	vmovss	%xmm5, 4(%r12)
	vmulss	%xmm9, %xmm12, %xmm5
	vfmadd231ss	%xmm8, %xmm2, %xmm5
	vmulss	%xmm9, %xmm2, %xmm2
	vfmsub231ss	%xmm8, %xmm12, %xmm2
	vaddss	8(%r12), %xmm2, %xmm6
	vmovss	%xmm6, 8(%r12)
	vaddss	12(%r12), %xmm5, %xmm6
	vmovss	%xmm6, 12(%r12)
	vmulss	%xmm9, %xmm11, %xmm6
	vfmadd231ss	%xmm8, %xmm1, %xmm6
	vmulss	%xmm9, %xmm1, %xmm1
	vfmsub231ss	%xmm11, %xmm8, %xmm1
	vaddss	16(%r12), %xmm1, %xmm7
	vmovss	%xmm7, 16(%r12)
	vaddss	20(%r12), %xmm6, %xmm7
	vmovss	%xmm7, 20(%r12)
	vmulss	%xmm9, %xmm10, %xmm7
	vfmadd231ss	%xmm0, %xmm8, %xmm7
	vmulss	%xmm9, %xmm0, %xmm0
	vfmsub231ss	%xmm8, %xmm10, %xmm0
	vaddss	24(%r12), %xmm0, %xmm8
	vmovss	%xmm8, 24(%r12)
	vaddss	28(%r12), %xmm7, %xmm8
	vmovss	%xmm8, 28(%r12)
	vaddss	(%r14), %xmm3, %xmm3
	vmovss	%xmm3, (%r14)
	vaddss	4(%r14), %xmm4, %xmm4
	vaddss	8(%r14), %xmm2, %xmm2
	vaddss	12(%r14), %xmm5, %xmm5
	vaddss	16(%r14), %xmm1, %xmm1
	vaddss	20(%r14), %xmm6, %xmm6
	vaddss	24(%r14), %xmm0, %xmm0
	vaddss	28(%r14), %xmm7, %xmm7
	vmovss	%xmm4, 4(%r14)
	vmovss	%xmm2, 8(%r14)
	vmovss	%xmm5, 12(%r14)
	vmovss	%xmm1, 16(%r14)
	vmovss	%xmm6, 20(%r14)
	vmovss	%xmm0, 24(%r14)
	vmovss	%xmm7, 28(%r14)
	cmpl	%eax, 164(%rsp)
	jg	.L642
	movl	552(%rsp), %r10d
.L643:
	vmovss	1096(%rsp), %xmm5
	addq	$32, %rbx
	vaddss	-32(%rbx), %xmm5, %xmm0
	vmovss	1128(%rsp), %xmm5
	addq	$32, %r11
	vmovss	%xmm0, -32(%rbx)
	vaddss	-28(%rbx), %xmm5, %xmm0
	vmovss	1032(%rsp), %xmm5
	addq	$32, %r12
	vmovss	%xmm0, -28(%rbx)
	vaddss	-24(%rbx), %xmm5, %xmm0
	vmovss	1064(%rsp), %xmm5
	addq	$32, %r14
	vmovss	%xmm0, -24(%rbx)
	vaddss	-20(%rbx), %xmm5, %xmm0
	vmovss	968(%rsp), %xmm5
	vmovss	%xmm0, -20(%rbx)
	vaddss	-16(%rbx), %xmm5, %xmm0
	vmovss	1000(%rsp), %xmm5
	vmovss	%xmm0, -16(%rbx)
	vaddss	-12(%rbx), %xmm5, %xmm0
	vmovss	904(%rsp), %xmm5
	vmovss	%xmm0, -12(%rbx)
	vaddss	-8(%rbx), %xmm5, %xmm0
	vmovss	936(%rsp), %xmm5
	vmovss	%xmm0, -8(%rbx)
	vaddss	-4(%rbx), %xmm5, %xmm0
	vmovss	840(%rsp), %xmm5
	vmovss	%xmm0, -4(%rbx)
	vaddss	-32(%r11), %xmm5, %xmm0
	vmovss	872(%rsp), %xmm5
	vmovss	%xmm0, -32(%r11)
	vaddss	-28(%r11), %xmm5, %xmm0
	vmovss	776(%rsp), %xmm5
	vmovss	%xmm0, -28(%r11)
	vaddss	-24(%r11), %xmm5, %xmm0
	vmovss	%xmm0, -24(%r11)
	vmovss	808(%rsp), %xmm5
	vaddss	-20(%r11), %xmm5, %xmm0
	vmovss	712(%rsp), %xmm5
	vmovss	%xmm0, -20(%r11)
	vaddss	-16(%r11), %xmm5, %xmm0
	vmovss	744(%rsp), %xmm5
	vmovss	%xmm0, -16(%r11)
	vaddss	-12(%r11), %xmm5, %xmm0
	vmovss	392(%rsp), %xmm5
	vmovss	%xmm0, -12(%r11)
	vaddss	-8(%r11), %xmm5, %xmm0
	vmovss	680(%rsp), %xmm5
	vmovss	%xmm0, -8(%r11)
	vaddss	-4(%r11), %xmm5, %xmm0
	vmovss	360(%rsp), %xmm5
	vmovss	%xmm0, -4(%r11)
	vaddss	-32(%r12), %xmm5, %xmm0
	vmovss	424(%rsp), %xmm5
	vmovss	%xmm0, -32(%r12)
	vaddss	-28(%r12), %xmm5, %xmm0
	vmovss	328(%rsp), %xmm5
	vmovss	%xmm0, -28(%r12)
	vaddss	-24(%r12), %xmm5, %xmm0
	vmovss	456(%rsp), %xmm5
	vmovss	%xmm0, -24(%r12)
	vaddss	-20(%r12), %xmm5, %xmm0
	vmovss	296(%rsp), %xmm5
	vmovss	%xmm0, -20(%r12)
	vaddss	-16(%r12), %xmm5, %xmm0
	vmovss	488(%rsp), %xmm5
	vmovss	%xmm0, -16(%r12)
	vaddss	-12(%r12), %xmm5, %xmm0
	vmovss	%xmm0, -12(%r12)
	vmovss	264(%rsp), %xmm5
	movl	120(%rsp), %eax
	vaddss	-8(%r12), %xmm5, %xmm0
	vmovss	520(%rsp), %xmm5
	addl	%eax, 136(%rsp)
	vmovss	%xmm0, -8(%r12)
	vaddss	-4(%r12), %xmm5, %xmm0
	vmovss	232(%rsp), %xmm5
	addl	%eax, 140(%rsp)
	vmovss	%xmm0, -4(%r12)
	vaddss	-32(%r14), %xmm5, %xmm0
	vmovss	648(%rsp), %xmm5
	vmovss	%xmm0, -32(%r14)
	vaddss	-28(%r14), %xmm5, %xmm0
	vmovss	200(%rsp), %xmm5
	vmovss	%xmm0, -28(%r14)
	vaddss	-24(%r14), %xmm5, %xmm0
	vmovss	616(%rsp), %xmm5
	vmovss	%xmm0, -24(%r14)
	vaddss	-20(%r14), %xmm5, %xmm0
	vmovd	%r10d, %xmm5
	vmovss	%xmm0, -20(%r14)
	vaddss	-16(%r14), %xmm5, %xmm0
	vmovss	584(%rsp), %xmm5
	vmovss	%xmm0, -16(%r14)
	vaddss	-12(%r14), %xmm5, %xmm0
	vmovd	%r8d, %xmm5
	vmovss	%xmm0, -12(%r14)
	vaddss	-8(%r14), %xmm5, %xmm0
	vmovd	%r9d, %xmm5
	vaddss	-4(%r14), %xmm5, %xmm15
	vmovss	%xmm0, -8(%r14)
	vmovss	%xmm15, -4(%r14)
	addl	%eax, 144(%rsp)
	addl	%eax, 148(%rsp)
	cmpq	%rbx, 96(%rsp)
	jne	.L640
.L641:
	movl	8(%rsp), %edi
	cmpl	%edi, 12(%rsp)
	jle	.L646
	movq	-48(%rsp), %rsi
	movslq	32(%rsp), %rax
	movq	24(%rsp), %rdi
	addq	%rsi, %rax
	leaq	(%rdi,%rax,8), %r15
	movslq	36(%rsp), %rax
	movq	16(%rsp), %r11
	leaq	(%rax,%rsi), %rdx
	leaq	(%rdi,%rdx,8), %r10
	addq	-56(%rsp), %rax
	movslq	40(%rsp), %rdx
	leaq	8(%rdi,%rax,8), %rax
	addq	%rsi, %rdx
	movq	%rax, 872(%rsp)
	movslq	84(%rsp), %rax
	leaq	(%rdi,%rdx,8), %r13
	movslq	44(%rsp), %rdx
	movq	%rax, 904(%rsp)
	leaq	(%r11,%rax,8), %r8
	movslq	124(%rsp), %rax
	addq	%rsi, %rdx
	leaq	(%rdi,%rdx,8), %r12
	movq	%rax, 936(%rsp)
	leaq	(%r11,%rax,8), %rdi
	movslq	128(%rsp), %rax
	movl	-40(%rsp), %r9d
	movq	%rax, 968(%rsp)
	leaq	(%r11,%rax,8), %rsi
	movslq	132(%rsp), %rax
	movq	%r13, %r14
	leaq	(%r11,%rax,8), %rcx
	movq	%rax, 1000(%rsp)
	movq	%rcx, 1032(%rsp)
	movq	%r15, %r13
	movq	%r12, %r15
	.p2align 4,,10
	.p2align 3
.L647:
	movl	164(%rsp), %edx
	testl	%edx, %edx
	jle	.L682
	cmpl	$6, 80(%rsp)
	jbe	.L667
	movq	152(%rsp), %rdx
	vxorps	%xmm8, %xmm8, %xmm8
	movslq	%r9d, %rax
	movq	56(%rsp), %rbx
	movq	1032(%rsp), %rcx
	leaq	(%rdx,%rax,8), %rdx
	vmovaps	%ymm8, %ymm5
	xorl	%eax, %eax
	vmovaps	%ymm8, %ymm10
	vmovaps	%ymm8, %ymm9
	vmovaps	%ymm8, %ymm7
	vmovaps	%ymm8, %ymm6
	vmovaps	%ymm8, %ymm4
	vmovaps	%ymm8, %ymm3
	.p2align 4,,10
	.p2align 3
.L649:
	vmovups	32(%rdx,%rax), %ymm12
	vmovups	(%rdx,%rax), %ymm2
	vmovups	32(%r8,%rax), %ymm14
	vshufps	$136, %ymm12, %ymm2, %ymm11
	vperm2f128	$3, %ymm11, %ymm11, %ymm1
	vshufps	$221, %ymm12, %ymm2, %ymm2
	vshufps	$68, %ymm1, %ymm11, %ymm0
	vshufps	$238, %ymm1, %ymm11, %ymm1
	vperm2f128	$3, %ymm2, %ymm2, %ymm11
	vinsertf128	$1, %xmm1, %ymm0, %ymm0
	vshufps	$68, %ymm11, %ymm2, %ymm1
	vshufps	$238, %ymm11, %ymm2, %ymm11
	vmovups	(%r8,%rax), %ymm2
	vinsertf128	$1, %xmm11, %ymm1, %ymm1
	vshufps	$136, %ymm14, %ymm2, %ymm13
	vperm2f128	$3, %ymm13, %ymm13, %ymm12
	vshufps	$221, %ymm14, %ymm2, %ymm2
	vshufps	$68, %ymm12, %ymm13, %ymm11
	vshufps	$238, %ymm12, %ymm13, %ymm12
	vperm2f128	$3, %ymm2, %ymm2, %ymm13
	vinsertf128	$1, %xmm12, %ymm11, %ymm11
	vshufps	$68, %ymm13, %ymm2, %ymm12
	vshufps	$238, %ymm13, %ymm2, %ymm13
	vinsertf128	$1, %xmm13, %ymm12, %ymm2
	vmulps	%ymm0, %ymm2, %ymm12
	vmulps	%ymm1, %ymm2, %ymm2
	vmovups	32(%rdi,%rax), %ymm14
	vfmadd231ps	%ymm1, %ymm11, %ymm12
	vfmsub132ps	%ymm0, %ymm2, %ymm11
	vmovups	(%rdi,%rax), %ymm2
	vshufps	$136, %ymm14, %ymm2, %ymm13
	vaddps	%ymm12, %ymm4, %ymm4
	vperm2f128	$3, %ymm13, %ymm13, %ymm12
	vshufps	$221, %ymm14, %ymm2, %ymm2
	vaddps	%ymm11, %ymm3, %ymm3
	vshufps	$68, %ymm12, %ymm13, %ymm11
	vshufps	$238, %ymm12, %ymm13, %ymm12
	vperm2f128	$3, %ymm2, %ymm2, %ymm13
	vinsertf128	$1, %xmm12, %ymm11, %ymm11
	vshufps	$68, %ymm13, %ymm2, %ymm12
	vshufps	$238, %ymm13, %ymm2, %ymm13
	vinsertf128	$1, %xmm13, %ymm12, %ymm2
	vmulps	%ymm0, %ymm2, %ymm12
	vmulps	%ymm1, %ymm2, %ymm2
	vmovups	32(%rsi,%rax), %ymm14
	vfmadd231ps	%ymm1, %ymm11, %ymm12
	vfmsub132ps	%ymm0, %ymm2, %ymm11
	vmovups	(%rsi,%rax), %ymm2
	vshufps	$136, %ymm14, %ymm2, %ymm13
	vaddps	%ymm12, %ymm6, %ymm6
	vperm2f128	$3, %ymm13, %ymm13, %ymm12
	vshufps	$221, %ymm14, %ymm2, %ymm2
	vaddps	%ymm11, %ymm5, %ymm5
	vshufps	$68, %ymm12, %ymm13, %ymm11
	vshufps	$238, %ymm12, %ymm13, %ymm12
	vperm2f128	$3, %ymm2, %ymm2, %ymm13
	vinsertf128	$1, %xmm12, %ymm11, %ymm11
	vshufps	$68, %ymm13, %ymm2, %ymm12
	vshufps	$238, %ymm13, %ymm2, %ymm13
	vinsertf128	$1, %xmm13, %ymm12, %ymm2
	vmulps	%ymm0, %ymm2, %ymm12
	vmulps	%ymm1, %ymm2, %ymm2
	vmovups	32(%rcx,%rax), %ymm14
	vfmadd231ps	%ymm1, %ymm11, %ymm12
	vfmsub132ps	%ymm0, %ymm2, %ymm11
	vmovups	(%rcx,%rax), %ymm2
	addq	$64, %rax
	vshufps	$136, %ymm14, %ymm2, %ymm13
	vaddps	%ymm12, %ymm8, %ymm8
	vperm2f128	$3, %ymm13, %ymm13, %ymm12
	vshufps	$221, %ymm14, %ymm2, %ymm2
	vaddps	%ymm11, %ymm7, %ymm7
	vshufps	$68, %ymm12, %ymm13, %ymm11
	vshufps	$238, %ymm12, %ymm13, %ymm12
	vperm2f128	$3, %ymm2, %ymm2, %ymm13
	vinsertf128	$1, %xmm12, %ymm11, %ymm11
	vshufps	$68, %ymm13, %ymm2, %ymm12
	vshufps	$238, %ymm13, %ymm2, %ymm13
	vinsertf128	$1, %xmm13, %ymm12, %ymm2
	vmulps	%ymm0, %ymm2, %ymm12
	vmulps	%ymm1, %ymm2, %ymm2
	vfmadd231ps	%ymm1, %ymm11, %ymm12
	vfmsub132ps	%ymm0, %ymm2, %ymm11
	vaddps	%ymm12, %ymm10, %ymm10
	vaddps	%ymm11, %ymm9, %ymm9
	cmpq	%rbx, %rax
	jne	.L649
	vextractf128	$0x1, %ymm10, %xmm0
	vaddps	%xmm10, %xmm0, %xmm0
	vextractf128	$0x1, %ymm9, %xmm2
	vaddps	%xmm9, %xmm2, %xmm2
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	movl	52(%rsp), %eax
	movl	164(%rsp), %edx
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vmovhlps	%xmm2, %xmm2, %xmm1
	vaddps	%xmm2, %xmm1, %xmm1
	vextractf128	$0x1, %ymm7, %xmm2
	vaddps	%xmm7, %xmm2, %xmm2
	vshufps	$85, %xmm1, %xmm1, %xmm9
	vaddps	%xmm1, %xmm9, %xmm9
	movq	%rcx, 1032(%rsp)
	vunpcklps	%xmm0, %xmm9, %xmm9
	vextractf128	$0x1, %ymm8, %xmm0
	vaddps	%xmm8, %xmm0, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vmovhlps	%xmm2, %xmm2, %xmm1
	vaddps	%xmm2, %xmm1, %xmm1
	vextractf128	$0x1, %ymm5, %xmm2
	vaddps	%xmm5, %xmm2, %xmm2
	vshufps	$85, %xmm1, %xmm1, %xmm7
	vaddps	%xmm1, %xmm7, %xmm7
	vunpcklps	%xmm0, %xmm7, %xmm7
	vextractf128	$0x1, %ymm6, %xmm0
	vaddps	%xmm6, %xmm0, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vmovhlps	%xmm2, %xmm2, %xmm1
	vaddps	%xmm2, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm2
	vaddps	%xmm1, %xmm2, %xmm2
	vunpcklps	%xmm0, %xmm2, %xmm2
	vextractf128	$0x1, %ymm4, %xmm0
	vaddps	%xmm4, %xmm0, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vextractf128	$0x1, %ymm3, %xmm1
	vaddps	%xmm3, %xmm1, %xmm1
	vmovhlps	%xmm1, %xmm1, %xmm3
	vaddps	%xmm1, %xmm3, %xmm3
	vshufps	$85, %xmm3, %xmm3, %xmm1
	vaddps	%xmm3, %xmm1, %xmm1
	vunpcklps	%xmm0, %xmm1, %xmm1
	cmpl	%edx, %eax
	je	.L654
	movl	%eax, %edx
.L648:
	movl	164(%rsp), %ebx
	subl	%eax, %ebx
	leal	-1(%rbx), %r12d
	movl	%ebx, 1064(%rsp)
	cmpl	$2, %r12d
	jbe	.L651
	movq	152(%rsp), %rcx
	movslq	%r9d, %r12
	addq	%rax, %r12
	leaq	(%rcx,%r12,8), %r12
	movq	904(%rsp), %rcx
	movq	%r12, 1096(%rsp)
	leaq	(%rax,%rcx), %r12
	leaq	(%r11,%r12,8), %rcx
	movq	%rcx, 1128(%rsp)
	movq	1096(%rsp), %rcx
	movq	936(%rsp), %r12
	vmovups	16(%rcx), %xmm0
	vmovups	(%rcx), %xmm14
	movq	1128(%rsp), %rcx
	vshufps	$136, %xmm0, %xmm14, %xmm11
	vmovups	16(%rcx), %xmm4
	vshufps	$221, %xmm0, %xmm14, %xmm14
	vmovups	(%rcx), %xmm0
	addq	%rax, %r12
	vshufps	$136, %xmm4, %xmm0, %xmm3
	vshufps	$221, %xmm4, %xmm0, %xmm0
	vmulps	%xmm11, %xmm0, %xmm4
	vmulps	%xmm14, %xmm0, %xmm0
	leaq	(%r11,%r12,8), %rbx
	vmovups	16(%rbx), %xmm6
	movq	968(%rsp), %r12
	vfmadd231ps	%xmm14, %xmm3, %xmm4
	vfmsub132ps	%xmm11, %xmm0, %xmm3
	vmovups	(%rbx), %xmm0
	addq	%rax, %r12
	vshufps	$136, %xmm6, %xmm0, %xmm5
	vshufps	$221, %xmm6, %xmm0, %xmm0
	vmulps	%xmm11, %xmm0, %xmm6
	vmulps	%xmm14, %xmm0, %xmm0
	leaq	(%r11,%r12,8), %r12
	vmovups	16(%r12), %xmm10
	addq	1000(%rsp), %rax
	vfmadd231ps	%xmm14, %xmm5, %xmm6
	vfmsub132ps	%xmm11, %xmm0, %xmm5
	vmovups	(%r12), %xmm0
	leaq	(%r11,%rax,8), %rax
	vshufps	$136, %xmm10, %xmm0, %xmm8
	vshufps	$221, %xmm10, %xmm0, %xmm0
	vmulps	%xmm11, %xmm0, %xmm10
	vmulps	%xmm14, %xmm0, %xmm0
	vmovups	16(%rax), %xmm12
	movl	1064(%rsp), %ebx
	vfmadd231ps	%xmm14, %xmm8, %xmm10
	vfmsub132ps	%xmm11, %xmm0, %xmm8
	vmovups	(%rax), %xmm0
	movl	%ebx, %eax
	vshufps	$136, %xmm12, %xmm0, %xmm13
	vshufps	$221, %xmm12, %xmm0, %xmm0
	vmulps	%xmm11, %xmm0, %xmm12
	vmulps	%xmm14, %xmm0, %xmm0
	andl	$-4, %eax
	addl	%eax, %edx
	vfmadd231ps	%xmm14, %xmm13, %xmm12
	vfmsub231ps	%xmm11, %xmm13, %xmm0
	vmovhlps	%xmm12, %xmm12, %xmm11
	vaddps	%xmm12, %xmm11, %xmm12
	vshufps	$85, %xmm12, %xmm12, %xmm11
	vaddps	%xmm12, %xmm11, %xmm11
	vmovhlps	%xmm0, %xmm0, %xmm12
	vaddps	%xmm0, %xmm12, %xmm12
	vshufps	$85, %xmm12, %xmm12, %xmm0
	vaddps	%xmm12, %xmm0, %xmm0
	vunpcklps	%xmm11, %xmm0, %xmm0
	vaddps	%xmm0, %xmm9, %xmm9
	vmovhlps	%xmm10, %xmm10, %xmm0
	vaddps	%xmm10, %xmm0, %xmm10
	vshufps	$85, %xmm10, %xmm10, %xmm0
	vaddps	%xmm10, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm10
	vmovhlps	%xmm8, %xmm8, %xmm0
	vaddps	%xmm8, %xmm0, %xmm8
	vshufps	$85, %xmm8, %xmm8, %xmm0
	vaddps	%xmm8, %xmm0, %xmm0
	vunpcklps	%xmm10, %xmm0, %xmm0
	vaddps	%xmm0, %xmm7, %xmm7
	vmovhlps	%xmm6, %xmm6, %xmm0
	vaddps	%xmm6, %xmm0, %xmm6
	vshufps	$85, %xmm6, %xmm6, %xmm0
	vaddps	%xmm6, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm6
	vmovhlps	%xmm5, %xmm5, %xmm0
	vaddps	%xmm5, %xmm0, %xmm5
	vshufps	$85, %xmm5, %xmm5, %xmm0
	vaddps	%xmm5, %xmm0, %xmm0
	vunpcklps	%xmm6, %xmm0, %xmm0
	vaddps	%xmm0, %xmm2, %xmm2
	vmovhlps	%xmm4, %xmm4, %xmm0
	vaddps	%xmm4, %xmm0, %xmm4
	vshufps	$85, %xmm4, %xmm4, %xmm0
	vaddps	%xmm4, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm4
	vmovhlps	%xmm3, %xmm3, %xmm0
	vaddps	%xmm3, %xmm0, %xmm3
	vshufps	$85, %xmm3, %xmm3, %xmm0
	vaddps	%xmm3, %xmm0, %xmm0
	vunpcklps	%xmm4, %xmm0, %xmm0
	vaddps	%xmm0, %xmm1, %xmm1
	cmpl	%ebx, %eax
	je	.L654
.L651:
	movq	152(%rsp), %rcx
	movl	84(%rsp), %r12d
	leal	(%r9,%rdx), %eax
	cltq
	vmovq	(%rcx,%rax,8), %xmm0
	leal	(%r12,%rdx), %eax
	cltq
	vmovq	(%r11,%rax,8), %xmm3
	vshufps	$0xe1, %xmm0, %xmm0, %xmm4
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	movl	124(%rsp), %eax
	movl	128(%rsp), %ebx
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	addl	%edx, %eax
	cltq
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	leal	(%rbx,%rdx), %eax
	cltq
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm1, %xmm1
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	movl	132(%rsp), %eax
	addl	%edx, %eax
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm2, %xmm2
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	cltq
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	leal	1(%rdx), %eax
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm7, %xmm7
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmulps	%xmm4, %xmm3, %xmm3
	vmovaps	%xmm5, %xmm4
	vfmadd132ps	%xmm0, %xmm3, %xmm4
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovss	%xmm5, %xmm4, %xmm4
	vaddps	%xmm4, %xmm9, %xmm9
	cmpl	%eax, 164(%rsp)
	jle	.L654
	leal	(%r9,%rax), %ebx
	movslq	%ebx, %rbx
	vmovq	(%rcx,%rbx,8), %xmm0
	leal	(%r12,%rax), %ebx
	movslq	%ebx, %rbx
	vmovq	(%r11,%rbx,8), %xmm3
	vshufps	$0xe1, %xmm0, %xmm0, %xmm4
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	movl	124(%rsp), %ebx
	addl	$2, %edx
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	addl	%eax, %ebx
	movslq	%ebx, %rbx
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rbx,8), %xmm3
	movl	128(%rsp), %ebx
	addl	%eax, %ebx
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm1, %xmm1
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	movslq	%ebx, %rbx
	addl	132(%rsp), %eax
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	cltq
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rbx,8), %xmm3
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm2, %xmm2
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm7, %xmm7
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmulps	%xmm4, %xmm3, %xmm3
	vmovaps	%xmm5, %xmm4
	vfmadd132ps	%xmm0, %xmm3, %xmm4
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovss	%xmm5, %xmm4, %xmm4
	vaddps	%xmm4, %xmm9, %xmm9
	cmpl	%edx, 164(%rsp)
	jle	.L654
	leal	(%r9,%rdx), %eax
	cltq
	vmovq	(%rcx,%rax,8), %xmm0
	leal	(%r12,%rdx), %eax
	cltq
	vmovq	(%r11,%rax,8), %xmm3
	vshufps	$0xe1, %xmm0, %xmm0, %xmm4
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	movl	124(%rsp), %ebx
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	leal	(%rbx,%rdx), %eax
	cltq
	movl	128(%rsp), %ebx
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	leal	(%rbx,%rdx), %eax
	cltq
	addl	132(%rsp), %edx
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm1, %xmm1
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	movslq	%edx, %rdx
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rax,8), %xmm3
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm2, %xmm2
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmovaps	%xmm5, %xmm6
	vmulps	%xmm4, %xmm3, %xmm3
	vfmadd132ps	%xmm0, %xmm3, %xmm6
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovq	(%r11,%rdx,8), %xmm3
	vmovss	%xmm5, %xmm6, %xmm5
	vaddps	%xmm5, %xmm7, %xmm7
	vmovsldup	%xmm3, %xmm5
	vmovshdup	%xmm3, %xmm3
	vmulps	%xmm4, %xmm3, %xmm3
	vmovaps	%xmm5, %xmm4
	vfmadd132ps	%xmm0, %xmm3, %xmm4
	vfmsub132ps	%xmm0, %xmm3, %xmm5
	vmovss	%xmm5, %xmm4, %xmm4
	vaddps	%xmm4, %xmm9, %xmm9
.L654:
	vmovq	0(%r13), %xmm0
	addq	$8, %r10
	vaddps	%xmm1, %xmm0, %xmm0
	addq	$8, %r13
	addq	$8, %r14
	vmovlps	%xmm0, -8(%r13)
	vmovq	-8(%r10), %xmm0
	addq	$8, %r15
	vaddps	%xmm2, %xmm0, %xmm0
	addl	164(%rsp), %r9d
	vmovlps	%xmm0, -8(%r10)
	vmovq	-8(%r14), %xmm0
	vaddps	%xmm7, %xmm0, %xmm0
	vmovlps	%xmm0, -8(%r14)
	vmovq	-8(%r15), %xmm0
	vaddps	%xmm9, %xmm0, %xmm0
	vmovlps	%xmm0, -8(%r15)
	cmpq	872(%rsp), %r10
	jne	.L647
.L646:
	addl	$4, 48(%rsp)
	movl	-20(%rsp), %eax
	addl	%eax, 32(%rsp)
	addl	%eax, 36(%rsp)
	addl	%eax, 40(%rsp)
	addl	%eax, 44(%rsp)
	movl	48(%rsp), %edi
	movl	120(%rsp), %eax
	addl	%eax, 84(%rsp)
	addl	%eax, 124(%rsp)
	addl	%eax, 128(%rsp)
	addl	%eax, 132(%rsp)
	cmpl	%edi, -4(%rsp)
	jg	.L637
.L636:
	addq	$64, (%rsp)
	movl	-80(%rsp), %edi
	addl	%edi, -12(%rsp)
	movq	(%rsp), %rax
	cmpl	%eax, 8(%rsp)
	jg	.L655
.L656:
	movl	-96(%rsp), %edi
	addl	%edi, -72(%rsp)
	movl	-80(%rsp), %edi
	addl	%edi, -68(%rsp)
	movl	-64(%rsp), %edi
	cmpl	%edi, -60(%rsp)
	jg	.L633
.L634:
	movl	-60(%rsp), %eax
	cmpl	%eax, -84(%rsp)
	jle	.L679
	movl	12(%rsp), %esi
	testl	%esi, %esi
	jle	.L679
	movl	164(%rsp), %edi
	movl	%esi, %r13d
	imull	%eax, %r13d
	imull	%edi, %eax
	leal	-1(%rsi), %r11d
	movq	%r11, 1032(%rsp)
	movl	%eax, %ebx
	leal	-1(%rdi), %eax
	movl	%eax, 1064(%rsp)
	movl	%edi, %eax
	shrl	$2, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, %r12
	movq	24(%rsp), %rax
	andl	$-4, %edi
	movq	152(%rsp), %rsi
	movq	16(%rsp), %r11
	movl	%edi, %r14d
	leaq	8(%rax), %r15
	vxorps	%xmm2, %xmm2, %xmm2
.L630:
	movq	24(%rsp), %rdi
	movslq	%r13d, %rax
	leaq	(%rdi,%rax,8), %r9
	addq	1032(%rsp), %rax
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 1096(%rsp)
	movslq	%ebx, %rax
	movq	%rax, 1128(%rsp)
	leaq	(%r11,%rax,8), %rdi
	xorl	%edx, %edx
.L665:
	movl	164(%rsp), %eax
	vmovaps	%xmm2, %xmm0
	vmovaps	%xmm2, %xmm3
	testl	%eax, %eax
	jle	.L664
	cmpl	$2, 1064(%rsp)
	jbe	.L668
	movslq	%edx, %rax
	leaq	(%rsi,%rax,8), %rcx
	vxorps	%xmm4, %xmm4, %xmm4
	xorl	%eax, %eax
.L658:
	vmovups	(%rcx,%rax), %ymm0
	vmovups	(%rdi,%rax), %ymm1
	vpermilps	$177, %ymm0, %ymm5
	vpermilps	$160, %ymm1, %ymm3
	vpermilps	$245, %ymm1, %ymm1
	vmulps	%ymm5, %ymm1, %ymm1
	vmovaps	%ymm0, %ymm5
	addq	$32, %rax
	vfmadd132ps	%ymm3, %ymm1, %ymm5
	vfmsub132ps	%ymm3, %ymm1, %ymm0
	vblendps	$170, %ymm5, %ymm0, %ymm0
	vaddps	%ymm0, %ymm4, %ymm4
	cmpq	%rax, %r12
	jne	.L658
	vextractf128	$0x1, %ymm4, %xmm3
	vaddps	%xmm4, %xmm3, %xmm3
	vunpckhps	%xmm3, %xmm3, %xmm0
	vshufps	$255, %xmm3, %xmm3, %xmm1
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$85, %xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm1, %xmm3
	cmpl	164(%rsp), %r14d
	je	.L664
	movl	%r14d, %ecx
	movl	%r14d, %eax
.L657:
	movl	164(%rsp), %r10d
	subl	%ecx, %r10d
	cmpl	$1, %r10d
	je	.L660
	movq	1128(%rsp), %r8
	vunpcklps	%xmm3, %xmm0, %xmm0
	addq	%rcx, %r8
	vmovups	(%r11,%r8,8), %xmm3
	movslq	%edx, %r8
	addq	%rcx, %r8
	vmovups	(%rsi,%r8,8), %xmm1
	vpermilps	$160, %xmm3, %xmm4
	vpermilps	$177, %xmm1, %xmm5
	vpermilps	$245, %xmm3, %xmm3
	vmulps	%xmm5, %xmm3, %xmm3
	vmovaps	%xmm1, %xmm5
	vmovq	%xmm0, %xmm0
	movl	%r10d, %ecx
	andl	$-2, %ecx
	vfmadd132ps	%xmm4, %xmm3, %xmm5
	vfmsub132ps	%xmm4, %xmm3, %xmm1
	addl	%ecx, %eax
	vblendps	$10, %xmm5, %xmm1, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vunpckhps	%xmm1, %xmm1, %xmm0
	vshufps	$255, %xmm1, %xmm1, %xmm3
	vaddss	%xmm1, %xmm0, %xmm0
	vshufps	$85, %xmm1, %xmm1, %xmm1
	vaddss	%xmm1, %xmm3, %xmm3
	cmpl	%r10d, %ecx
	je	.L664
.L660:
	leal	(%rdx,%rax), %ecx
	addl	%ebx, %eax
	movslq	%ecx, %rcx
	cltq
	leaq	(%rsi,%rcx,8), %rcx
	leaq	(%r11,%rax,8), %rax
	vmovss	4(%rax), %xmm5
	vmovss	(%rcx), %xmm7
	vmovss	(%rax), %xmm6
	vmulss	%xmm5, %xmm7, %xmm1
	vmovss	4(%rcx), %xmm4
	vfmadd231ss	%xmm6, %xmm7, %xmm0
	vfmadd231ss	%xmm6, %xmm4, %xmm1
	vfnmadd231ss	%xmm4, %xmm5, %xmm0
	vaddss	%xmm1, %xmm3, %xmm3
.L664:
	vmovss	%xmm0, (%r9)
	vmovss	%xmm3, 4(%r9)
	addq	$8, %r9
	addl	164(%rsp), %edx
	cmpq	1096(%rsp), %r9
	jne	.L665
	incl	-60(%rsp)
	addl	12(%rsp), %r13d
	addl	164(%rsp), %ebx
	movl	-60(%rsp), %eax
	cmpl	%eax, -84(%rsp)
	jne	.L630
.L679:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L681:
	.cfi_restore_state
	movl	$0x00000000, 584(%rsp)
	movl	$0x00000000, 200(%rsp)
	movl	$0x00000000, 616(%rsp)
	movl	$0x00000000, 232(%rsp)
	movl	$0x00000000, 648(%rsp)
	movl	$0x00000000, 264(%rsp)
	movl	$0x00000000, 520(%rsp)
	movl	$0x00000000, 296(%rsp)
	movl	$0x00000000, 488(%rsp)
	movl	$0x00000000, 328(%rsp)
	movl	$0x00000000, 456(%rsp)
	movl	$0x00000000, 360(%rsp)
	movl	$0x00000000, 424(%rsp)
	movl	$0x00000000, 392(%rsp)
	movl	$0x00000000, 680(%rsp)
	movl	$0x00000000, 712(%rsp)
	movl	$0x00000000, 744(%rsp)
	movl	$0x00000000, 776(%rsp)
	movl	$0x00000000, 808(%rsp)
	movl	$0x00000000, 840(%rsp)
	movl	$0x00000000, 872(%rsp)
	movl	$0x00000000, 904(%rsp)
	movl	$0x00000000, 936(%rsp)
	movl	$0x00000000, 968(%rsp)
	movl	$0x00000000, 1000(%rsp)
	movl	$0x00000000, 1032(%rsp)
	movl	$0x00000000, 1064(%rsp)
	movl	$0x00000000, 1096(%rsp)
	movl	$0x00000000, 1128(%rsp)
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	jmp	.L645
	.p2align 4,,10
	.p2align 3
.L682:
	vxorps	%xmm9, %xmm9, %xmm9
	vmovaps	%xmm9, %xmm7
	vmovaps	%xmm9, %xmm2
	vmovaps	%xmm9, %xmm1
	jmp	.L654
.L667:
	vxorps	%xmm9, %xmm9, %xmm9
	vmovaps	%xmm9, %xmm7
	vmovaps	%xmm9, %xmm2
	vmovaps	%xmm9, %xmm1
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L648
.L668:
	xorl	%ecx, %ecx
	vmovaps	%xmm2, %xmm0
	vmovaps	%xmm2, %xmm3
	xorl	%eax, %eax
	jmp	.L657
	.cfi_endproc
.LFE10924:
	.size	_Z10mul_st_c32P7ComplexIfvES1_S1_iii, .-_Z10mul_st_c32P7ComplexIfvES1_S1_iii
	.p2align 4
	.globl	_Z10mul_st_c64P7ComplexIdvES1_S1_iii
	.type	_Z10mul_st_c64P7ComplexIdvES1_S1_iii, @function
_Z10mul_st_c64P7ComplexIdvES1_S1_iii:
.LFB10940:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$1064, %rsp
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%ecx, -92(%rsp)
	andl	$-4, %ecx
	movq	%rsi, 160(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%r8d, 228(%rsp)
	movl	%r9d, 20(%rsp)
	movl	%ecx, -40(%rsp)
	jle	.L690
	movl	%r8d, %eax
	andl	$-8, %eax
	movl	%eax, 208(%rsp)
	decl	%eax
	movl	%r9d, %edx
	shrl	$3, %eax
	andl	$-4, %edx
	salq	$3, %rax
	movq	%rax, -32(%rsp)
	movl	%edx, %eax
	imull	%r8d, %eax
	movl	%r9d, %edi
	sall	$6, %edi
	movl	%eax, -16(%rsp)
	leal	-1(%r8), %eax
	movl	%eax, 144(%rsp)
	movl	%r8d, %eax
	shrl	$2, %eax
	decl	%eax
	incq	%rax
	salq	$6, %rax
	movl	%r8d, %ebx
	leal	0(,%r9,4), %esi
	andl	$-4, %ebx
	movl	%edi, -100(%rsp)
	movq	%rax, 64(%rsp)
	movl	%r8d, %edi
	leal	-1(%r9), %eax
	sall	$6, %edi
	movl	%esi, -12(%rsp)
	movl	%ebx, 60(%rsp)
	leal	(%r9,%r9), %esi
	movslq	%edx, %rbx
	subl	%edx, %eax
	movl	%edi, -84(%rsp)
	movl	%esi, -80(%rsp)
	leal	(%r8,%r8), %edi
	leal	0(,%r8,4), %esi
	addq	%rbx, %rax
	movl	%edx, 16(%rsp)
	movl	%edi, -88(%rsp)
	movl	%esi, 148(%rsp)
	movl	%r8d, -72(%rsp)
	movl	%r9d, -76(%rsp)
	movl	$0, -68(%rsp)
	movq	%rbx, -56(%rsp)
	movq	%rax, -64(%rsp)
.L689:
	movl	-68(%rsp), %ebx
	movl	-40(%rsp), %edi
	movl	%ebx, %eax
	addl	$63, %eax
	movl	%ebx, -96(%rsp)
	addl	$64, %ebx
	cmpl	%eax, %edi
	movl	%edi, %eax
	cmovg	%ebx, %eax
	movl	16(%rsp), %edi
	movl	%ebx, -68(%rsp)
	movl	%eax, 4(%rsp)
	testl	%edi, %edi
	jle	.L712
	movl	-80(%rsp), %eax
	movl	-88(%rsp), %ebx
	addl	-76(%rsp), %eax
	movl	%eax, -108(%rsp)
	movl	-72(%rsp), %eax
	movl	%ebx, (%rsp)
	addl	%ebx, %eax
	movl	%eax, -104(%rsp)
	movslq	208(%rsp), %rbx
	movl	144(%rsp), %eax
	movq	$0, 8(%rsp)
	subl	%ebx, %eax
	addq	%rbx, %rax
	movq	%rbx, 128(%rsp)
	movq	%rax, -48(%rsp)
.L711:
	movq	8(%rsp), %r10
	movl	16(%rsp), %ebx
	movl	%r10d, %eax
	leal	63(%r10), %edx
	addl	$64, %eax
	cmpl	%edx, %ebx
	cmovle	%ebx, %eax
	movl	-96(%rsp), %r9d
	movl	%eax, -4(%rsp)
	cmpl	%r9d, 4(%rsp)
	jle	.L692
	movl	-76(%rsp), %ebx
	movl	-80(%rsp), %edx
	movl	%ebx, %edi
	subl	20(%rsp), %edi
	addl	%edi, %edx
	movl	%edi, 40(%rsp)
	subl	%r10d, %eax
	movl	-72(%rsp), %edi
	movl	-88(%rsp), %esi
	decl	%eax
	movl	%edx, 48(%rsp)
	shrl	$2, %eax
	movl	%edi, %edx
	subl	228(%rsp), %edx
	salq	$2, %rax
	movl	%esi, %ecx
	addl	%edx, %ecx
	movq	%rax, -24(%rsp)
	movl	-104(%rsp), %eax
	movl	%ecx, 240(%rsp)
	movl	(%rsp), %ecx
	movl	%eax, 244(%rsp)
	movl	-108(%rsp), %eax
	subl	%esi, %ecx
	movl	%edx, 232(%rsp)
	movl	%r10d, -8(%rsp)
	movl	%ecx, -36(%rsp)
	movl	%edi, 236(%rsp)
	movl	%eax, 52(%rsp)
	movl	%ebx, 44(%rsp)
	movl	%r9d, 56(%rsp)
	movq	%r15, 24(%rsp)
	.p2align 4,,10
	.p2align 3
.L693:
	movl	-8(%rsp), %ebx
	cmpl	%ebx, -4(%rsp)
	jle	.L697
	movq	8(%rsp), %rdi
	movslq	40(%rsp), %rdx
	movq	32(%rsp), %rsi
	leaq	(%rdi,%rdx), %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %r14
	movslq	44(%rsp), %rax
	movl	228(%rsp), %ecx
	addq	%rdi, %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %r13
	movslq	48(%rsp), %rax
	movl	(%rsp), %r15d
	addq	%rdi, %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %rbx
	movslq	52(%rsp), %rax
	movl	%r15d, 224(%rsp)
	addq	%rdi, %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %r11
	movl	%ecx, %eax
	addl	%r15d, %eax
	movl	%eax, 216(%rsp)
	movl	%r15d, %eax
	subl	%ecx, %eax
	movl	%eax, 220(%rsp)
	movq	-24(%rsp), %rax
	movslq	236(%rsp), %rcx
	addq	%rdi, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	64(%rsi,%rax), %rax
	movq	%rax, 136(%rsp)
	movslq	232(%rsp), %rax
	movq	24(%rsp), %rdi
	movq	%rax, %rdx
	salq	$4, %rdx
	leaq	(%rdi,%rdx), %rsi
	movq	%rcx, %r10
	salq	$4, %r10
	movq	%rsi, 120(%rsp)
	movq	%rdi, %rsi
	addq	%r10, %rsi
	movq	%rsi, 80(%rsp)
	movslq	240(%rsp), %rsi
	movq	%r10, 88(%rsp)
	salq	$4, %rsi
	addq	%rdi, %rsi
	movq	%rsi, 96(%rsp)
	movslq	244(%rsp), %rsi
	addq	-32(%rsp), %rcx
	salq	$4, %rsi
	movq	%rsi, %r10
	movq	%rsi, 256(%rsp)
	movq	%rdi, %rsi
	addq	%r10, %rsi
	salq	$4, %rcx
	movq	%rsi, 104(%rsp)
	leaq	128(%rdi,%rcx), %rsi
	movq	%rsi, 112(%rsp)
	movq	128(%rsp), %rsi
	negq	%rdx
	leaq	(%rsi,%rax), %rcx
	addq	-48(%rsp), %rax
	salq	$4, %rax
	leaq	16(%rdi,%rax), %rax
	movq	%rax, 248(%rsp)
	salq	$4, %rcx
	movl	-36(%rsp), %eax
	addq	%rdi, %rcx
	movq	%rcx, 72(%rsp)
	movl	%eax, 212(%rsp)
	movq	%rdx, %r12
	.p2align 4,,10
	.p2align 3
.L696:
	movl	208(%rsp), %esi
	testl	%esi, %esi
	jle	.L736
	movslq	212(%rsp), %rdi
	movslq	220(%rsp), %rsi
	movslq	224(%rsp), %rcx
	movslq	216(%rsp), %rdx
	movq	160(%rsp), %rax
	salq	$4, %rdi
	salq	$4, %rsi
	salq	$4, %rcx
	salq	$4, %rdx
	vxorpd	%xmm5, %xmm5, %xmm5
	addq	%rax, %rdi
	addq	%rax, %rsi
	addq	%rax, %rcx
	addq	%rax, %rdx
	movq	104(%rsp), %r10
	movq	96(%rsp), %r9
	movq	80(%rsp), %rax
	movq	120(%rsp), %r8
	movq	112(%rsp), %r15
	vmovapd	%ymm5, 648(%rsp)
	vmovapd	%ymm5, 680(%rsp)
	vmovapd	%ymm5, 712(%rsp)
	vmovapd	%ymm5, 616(%rsp)
	vmovapd	%ymm5, 552(%rsp)
	vmovapd	%ymm5, 520(%rsp)
	vmovapd	%ymm5, 744(%rsp)
	vmovapd	%ymm5, 584(%rsp)
	vmovapd	%ymm5, 392(%rsp)
	vmovapd	%ymm5, 488(%rsp)
	vmovapd	%ymm5, 456(%rsp)
	vmovapd	%ymm5, 424(%rsp)
	vmovapd	%ymm5, 360(%rsp)
	vmovapd	%ymm5, 328(%rsp)
	vmovapd	%ymm5, 296(%rsp)
	vmovapd	%ymm5, 264(%rsp)
	.p2align 4,,10
	.p2align 3
.L694:
	vmovupd	(%r8), %ymm4
	vpermilpd	$5, (%rdi), %ymm6
	vmulpd	(%rdi), %ymm4, %ymm7
	vmulpd	%ymm6, %ymm4, %ymm3
	vmovupd	32(%r8), %ymm2
	vpermilpd	$5, 32(%rdi), %ymm5
	vmovupd	64(%r8), %ymm1
	vhsubpd	%ymm7, %ymm7, %ymm7
	vhaddpd	%ymm3, %ymm3, %ymm3
	vmovapd	%ymm5, 1000(%rsp)
	vmulpd	%ymm5, %ymm2, %ymm5
	vblendpd	$10, %ymm3, %ymm7, %ymm7
	vmulpd	32(%rdi), %ymm2, %ymm3
	vpermilpd	$5, 64(%rdi), %ymm9
	vmovapd	%ymm6, 1032(%rsp)
	vhaddpd	%ymm5, %ymm5, %ymm5
	vmulpd	64(%rdi), %ymm1, %ymm6
	vhsubpd	%ymm3, %ymm3, %ymm3
	vmovupd	96(%r8), %ymm0
	vpermilpd	$5, 96(%rdi), %ymm10
	vblendpd	$10, %ymm5, %ymm3, %ymm3
	vmulpd	%ymm9, %ymm1, %ymm5
	vhsubpd	%ymm6, %ymm6, %ymm6
	vmulpd	%ymm10, %ymm0, %ymm8
	vaddpd	%ymm7, %ymm3, %ymm3
	vpermilpd	$5, (%rsi), %ymm14
	vhaddpd	%ymm5, %ymm5, %ymm5
	vpermilpd	$5, 64(%rsi), %ymm11
	vhaddpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm5, %ymm6, %ymm6
	vmulpd	96(%rdi), %ymm0, %ymm5
	vpermilpd	$5, 96(%rsi), %ymm12
	vmovapd	%ymm9, 968(%rsp)
	vmovapd	%ymm10, 936(%rsp)
	vmovapd	%ymm14, 840(%rsp)
	vhsubpd	%ymm5, %ymm5, %ymm5
	vmovapd	%ymm11, 776(%rsp)
	vmovapd	%ymm12, 904(%rsp)
	vblendpd	$10, %ymm8, %ymm5, %ymm5
	vaddpd	%ymm6, %ymm5, %ymm5
	vpermilpd	$5, 32(%rsi), %ymm8
	vmulpd	64(%rsi), %ymm1, %ymm6
	vaddpd	%ymm5, %ymm3, %ymm3
	vmulpd	%ymm8, %ymm2, %ymm5
	vmovapd	%ymm8, 808(%rsp)
	vaddpd	264(%rsp), %ymm3, %ymm7
	vmulpd	%ymm14, %ymm4, %ymm3
	vhsubpd	%ymm6, %ymm6, %ymm6
	vmovapd	%ymm7, 264(%rsp)
	vmulpd	(%rsi), %ymm4, %ymm7
	vhaddpd	%ymm5, %ymm5, %ymm5
	vhaddpd	%ymm3, %ymm3, %ymm3
	vmulpd	%ymm12, %ymm0, %ymm8
	subq	$-128, %rax
	vhsubpd	%ymm7, %ymm7, %ymm7
	subq	$-128, %r8
	subq	$-128, %rdi
	vblendpd	$10, %ymm3, %ymm7, %ymm7
	vmulpd	32(%rsi), %ymm2, %ymm3
	vhaddpd	%ymm8, %ymm8, %ymm8
	subq	$-128, %rsi
	subq	$-128, %rcx
	subq	$-128, %rdx
	vhsubpd	%ymm3, %ymm3, %ymm3
	subq	$-128, %r9
	subq	$-128, %r10
	vblendpd	$10, %ymm5, %ymm3, %ymm3
	vmulpd	%ymm11, %ymm1, %ymm5
	vaddpd	%ymm7, %ymm3, %ymm3
	vhaddpd	%ymm5, %ymm5, %ymm5
	vblendpd	$10, %ymm5, %ymm6, %ymm6
	vmulpd	-32(%rsi), %ymm0, %ymm5
	vhsubpd	%ymm5, %ymm5, %ymm5
	vblendpd	$10, %ymm8, %ymm5, %ymm5
	vaddpd	%ymm6, %ymm5, %ymm5
	vaddpd	%ymm5, %ymm3, %ymm3
	vaddpd	296(%rsp), %ymm3, %ymm7
	vmovapd	%ymm7, 296(%rsp)
	vmulpd	-128(%rcx), %ymm4, %ymm7
	vpermilpd	$5, -128(%rcx), %ymm10
	vpermilpd	$5, -96(%rcx), %ymm9
	vmulpd	%ymm4, %ymm10, %ymm3
	vmulpd	%ymm2, %ymm9, %ymm5
	vhsubpd	%ymm7, %ymm7, %ymm7
	vpermilpd	$5, -64(%rcx), %ymm8
	vmulpd	-64(%rcx), %ymm1, %ymm6
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm5, %ymm5, %ymm5
	vpermilpd	$5, -32(%rcx), %ymm13
	vblendpd	$10, %ymm3, %ymm7, %ymm7
	vmulpd	-96(%rcx), %ymm2, %ymm3
	vhsubpd	%ymm6, %ymm6, %ymm6
	vmulpd	%ymm13, %ymm0, %ymm11
	vmovapd	%ymm13, 872(%rsp)
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm5, %ymm3, %ymm3
	vmulpd	%ymm1, %ymm8, %ymm5
	vaddpd	%ymm7, %ymm3, %ymm3
	vhaddpd	%ymm5, %ymm5, %ymm5
	vblendpd	$10, %ymm5, %ymm6, %ymm6
	vmulpd	-32(%rcx), %ymm0, %ymm5
	vhsubpd	%ymm5, %ymm5, %ymm5
	vblendpd	$10, %ymm11, %ymm5, %ymm5
	vaddpd	%ymm6, %ymm5, %ymm5
	vaddpd	%ymm5, %ymm3, %ymm3
	vmulpd	-128(%rdx), %ymm4, %ymm5
	vaddpd	328(%rsp), %ymm3, %ymm7
	vpermilpd	$5, -128(%rdx), %ymm3
	vmulpd	%ymm4, %ymm3, %ymm6
	vhsubpd	%ymm5, %ymm5, %ymm5
	vmovapd	%ymm7, 328(%rsp)
	vhaddpd	%ymm6, %ymm6, %ymm4
	vpermilpd	$5, -96(%rdx), %ymm6
	vblendpd	$10, %ymm4, %ymm5, %ymm4
	vmulpd	%ymm2, %ymm6, %ymm7
	vmulpd	-96(%rdx), %ymm2, %ymm5
	vhaddpd	%ymm7, %ymm7, %ymm2
	vhsubpd	%ymm5, %ymm5, %ymm5
	vmulpd	-64(%rdx), %ymm1, %ymm7
	vblendpd	$10, %ymm2, %ymm5, %ymm2
	vpermilpd	$5, -64(%rdx), %ymm5
	vaddpd	%ymm4, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm5, %ymm11
	vhsubpd	%ymm7, %ymm7, %ymm7
	vhaddpd	%ymm11, %ymm11, %ymm1
	vmulpd	-32(%rdx), %ymm0, %ymm11
	vblendpd	$10, %ymm1, %ymm7, %ymm1
	vpermilpd	$5, -32(%rdx), %ymm7
	vmulpd	%ymm0, %ymm7, %ymm0
	vhsubpd	%ymm11, %ymm11, %ymm11
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm0, %ymm11, %ymm11
	vaddpd	%ymm1, %ymm11, %ymm11
	vmovupd	-64(%rax), %ymm1
	vmovupd	-32(%rax), %ymm0
	vaddpd	%ymm11, %ymm2, %ymm2
	vmulpd	-64(%rdx), %ymm1, %ymm13
	vmulpd	%ymm7, %ymm0, %ymm15
	vaddpd	360(%rsp), %ymm2, %ymm4
	vmovupd	-96(%rax), %ymm2
	vmovapd	%ymm4, 360(%rsp)
	vmovupd	-128(%rax), %ymm4
	vmulpd	%ymm6, %ymm2, %ymm12
	vmulpd	-128(%rdx), %ymm4, %ymm14
	vmulpd	%ymm3, %ymm4, %ymm11
	vhsubpd	%ymm13, %ymm13, %ymm13
	vhaddpd	%ymm15, %ymm15, %ymm15
	vhaddpd	%ymm12, %ymm12, %ymm12
	vhsubpd	%ymm14, %ymm14, %ymm14
	vhaddpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm11, %ymm14, %ymm14
	vmulpd	-96(%rdx), %ymm2, %ymm11
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm12, %ymm11, %ymm11
	vmulpd	%ymm5, %ymm1, %ymm12
	vaddpd	%ymm14, %ymm11, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm12, %ymm13, %ymm13
	vmulpd	-32(%rdx), %ymm0, %ymm12
	vhsubpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm15, %ymm12, %ymm12
	vaddpd	%ymm13, %ymm12, %ymm12
	vaddpd	%ymm12, %ymm11, %ymm11
	vaddpd	392(%rsp), %ymm11, %ymm14
	vmovapd	%ymm14, 392(%rsp)
	vmulpd	-128(%rdi), %ymm4, %ymm14
	vmulpd	1032(%rsp), %ymm4, %ymm11
	vmulpd	1000(%rsp), %ymm2, %ymm12
	vmulpd	-64(%rdi), %ymm1, %ymm13
	vmulpd	936(%rsp), %ymm0, %ymm15
	vhsubpd	%ymm14, %ymm14, %ymm14
	vhaddpd	%ymm11, %ymm11, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm12
	vhsubpd	%ymm13, %ymm13, %ymm13
	vblendpd	$10, %ymm11, %ymm14, %ymm14
	vmulpd	-96(%rdi), %ymm2, %ymm11
	vhaddpd	%ymm15, %ymm15, %ymm15
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm12, %ymm11, %ymm11
	vmulpd	968(%rsp), %ymm1, %ymm12
	vaddpd	%ymm14, %ymm11, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm12, %ymm13, %ymm13
	vmulpd	-32(%rdi), %ymm0, %ymm12
	vhsubpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm15, %ymm12, %ymm12
	vaddpd	%ymm13, %ymm12, %ymm12
	vmulpd	-64(%rsi), %ymm1, %ymm13
	vmulpd	904(%rsp), %ymm0, %ymm15
	vaddpd	%ymm12, %ymm11, %ymm11
	vmulpd	808(%rsp), %ymm2, %ymm12
	vaddpd	424(%rsp), %ymm11, %ymm14
	vmulpd	840(%rsp), %ymm4, %ymm11
	vhsubpd	%ymm13, %ymm13, %ymm13
	vmovapd	%ymm14, 424(%rsp)
	vmulpd	-128(%rsi), %ymm4, %ymm14
	vhaddpd	%ymm12, %ymm12, %ymm12
	vhaddpd	%ymm11, %ymm11, %ymm11
	vhaddpd	%ymm15, %ymm15, %ymm15
	vhsubpd	%ymm14, %ymm14, %ymm14
	vblendpd	$10, %ymm11, %ymm14, %ymm14
	vmulpd	-96(%rsi), %ymm2, %ymm11
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm12, %ymm11, %ymm11
	vmulpd	776(%rsp), %ymm1, %ymm12
	vaddpd	%ymm14, %ymm11, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm12, %ymm13, %ymm13
	vmulpd	-32(%rsi), %ymm0, %ymm12
	vhsubpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm15, %ymm12, %ymm12
	vaddpd	%ymm13, %ymm12, %ymm12
	vmovapd	872(%rsp), %ymm15
	vaddpd	%ymm12, %ymm11, %ymm11
	vmulpd	%ymm10, %ymm4, %ymm12
	vaddpd	456(%rsp), %ymm11, %ymm11
	vmovapd	%ymm11, 456(%rsp)
	vmulpd	-128(%rcx), %ymm4, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm4
	vmulpd	%ymm9, %ymm2, %ymm12
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm4, %ymm11, %ymm4
	vmulpd	-96(%rcx), %ymm2, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm2
	vmulpd	%ymm8, %ymm1, %ymm12
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm2, %ymm11, %ymm2
	vmulpd	-64(%rcx), %ymm1, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm1
	vaddpd	%ymm4, %ymm2, %ymm2
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm1, %ymm11, %ymm1
	vmulpd	-32(%rcx), %ymm0, %ymm11
	vmulpd	%ymm15, %ymm0, %ymm0
	vhsubpd	%ymm11, %ymm11, %ymm11
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm0, %ymm11, %ymm11
	vaddpd	%ymm1, %ymm11, %ymm11
	vmovupd	-64(%r9), %ymm1
	vmovupd	-32(%r9), %ymm0
	vaddpd	%ymm11, %ymm2, %ymm2
	vmulpd	%ymm15, %ymm0, %ymm15
	vaddpd	488(%rsp), %ymm2, %ymm4
	vmovupd	-96(%r9), %ymm2
	vmovapd	%ymm4, 488(%rsp)
	vmovupd	-128(%r9), %ymm4
	vmulpd	%ymm9, %ymm2, %ymm12
	vmulpd	-128(%rcx), %ymm4, %ymm14
	vmulpd	%ymm10, %ymm4, %ymm11
	vhaddpd	%ymm15, %ymm15, %ymm15
	vhaddpd	%ymm12, %ymm12, %ymm12
	vhsubpd	%ymm14, %ymm14, %ymm14
	vhaddpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm11, %ymm14, %ymm14
	vmulpd	-96(%rcx), %ymm2, %ymm11
	vmulpd	-64(%rcx), %ymm1, %ymm13
	vhsubpd	%ymm11, %ymm11, %ymm11
	vhsubpd	%ymm13, %ymm13, %ymm13
	vblendpd	$10, %ymm12, %ymm11, %ymm11
	vmulpd	%ymm8, %ymm1, %ymm12
	vaddpd	%ymm14, %ymm11, %ymm11
	vmulpd	-128(%rdx), %ymm4, %ymm14
	vhaddpd	%ymm12, %ymm12, %ymm12
	vhsubpd	%ymm14, %ymm14, %ymm14
	vblendpd	$10, %ymm12, %ymm13, %ymm13
	vmulpd	-32(%rcx), %ymm0, %ymm12
	vhsubpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm15, %ymm12, %ymm12
	vaddpd	%ymm13, %ymm12, %ymm12
	vmulpd	-64(%rdx), %ymm1, %ymm13
	vmulpd	%ymm7, %ymm0, %ymm15
	vaddpd	%ymm12, %ymm11, %ymm11
	vmulpd	%ymm6, %ymm2, %ymm12
	vaddpd	520(%rsp), %ymm11, %ymm11
	vhsubpd	%ymm13, %ymm13, %ymm13
	vhaddpd	%ymm15, %ymm15, %ymm15
	vmovapd	%ymm11, 520(%rsp)
	vmulpd	%ymm3, %ymm4, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm12
	vhaddpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm11, %ymm14, %ymm14
	vmulpd	-96(%rdx), %ymm2, %ymm11
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm12, %ymm11, %ymm11
	vmulpd	%ymm5, %ymm1, %ymm12
	vaddpd	%ymm14, %ymm11, %ymm11
	vmulpd	-128(%rdi), %ymm4, %ymm14
	vhaddpd	%ymm12, %ymm12, %ymm12
	vhsubpd	%ymm14, %ymm14, %ymm14
	vblendpd	$10, %ymm12, %ymm13, %ymm13
	vmulpd	-32(%rdx), %ymm0, %ymm12
	vhsubpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm15, %ymm12, %ymm12
	vaddpd	%ymm13, %ymm12, %ymm12
	vmulpd	-64(%rdi), %ymm1, %ymm13
	vmulpd	936(%rsp), %ymm0, %ymm15
	vaddpd	%ymm12, %ymm11, %ymm11
	vmulpd	1000(%rsp), %ymm2, %ymm12
	vaddpd	552(%rsp), %ymm11, %ymm11
	vhsubpd	%ymm13, %ymm13, %ymm13
	vhaddpd	%ymm15, %ymm15, %ymm15
	vmovapd	%ymm11, 552(%rsp)
	vmulpd	1032(%rsp), %ymm4, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm12
	vhaddpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm11, %ymm14, %ymm14
	vmulpd	-96(%rdi), %ymm2, %ymm11
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm12, %ymm11, %ymm11
	vmulpd	968(%rsp), %ymm1, %ymm12
	vaddpd	%ymm14, %ymm11, %ymm11
	vmovapd	840(%rsp), %ymm14
	vhaddpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm12, %ymm13, %ymm13
	vmulpd	-32(%rdi), %ymm0, %ymm12
	vhsubpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm15, %ymm12, %ymm12
	vaddpd	%ymm13, %ymm12, %ymm12
	vmovapd	808(%rsp), %ymm13
	vmovapd	776(%rsp), %ymm15
	vaddpd	%ymm12, %ymm11, %ymm11
	vmulpd	%ymm14, %ymm4, %ymm12
	vaddpd	584(%rsp), %ymm11, %ymm11
	vmovapd	%ymm11, 584(%rsp)
	vmulpd	-128(%rsi), %ymm4, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm4
	vmulpd	%ymm13, %ymm2, %ymm12
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm4, %ymm11, %ymm4
	vmulpd	-96(%rsi), %ymm2, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm2
	vmulpd	%ymm15, %ymm1, %ymm12
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm2, %ymm11, %ymm2
	vmulpd	-64(%rsi), %ymm1, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm1
	vaddpd	%ymm2, %ymm4, %ymm4
	vmovupd	-96(%r10), %ymm2
	vhsubpd	%ymm11, %ymm11, %ymm11
	vmulpd	%ymm6, %ymm2, %ymm6
	vblendpd	$10, %ymm1, %ymm11, %ymm1
	vmulpd	-32(%rsi), %ymm0, %ymm11
	vmulpd	904(%rsp), %ymm0, %ymm0
	vhaddpd	%ymm6, %ymm6, %ymm6
	vhsubpd	%ymm11, %ymm11, %ymm11
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm0, %ymm11, %ymm11
	vaddpd	%ymm11, %ymm1, %ymm1
	vmovupd	-128(%r10), %ymm0
	vaddpd	%ymm1, %ymm4, %ymm4
	vmulpd	%ymm14, %ymm0, %ymm11
	vmulpd	%ymm3, %ymm0, %ymm3
	vaddpd	744(%rsp), %ymm4, %ymm4
	vmovapd	%ymm4, 744(%rsp)
	vmovupd	-64(%r10), %ymm1
	vmulpd	-128(%rsi), %ymm0, %ymm12
	vhaddpd	%ymm11, %ymm11, %ymm11
	vmulpd	-96(%rsi), %ymm2, %ymm14
	vmovupd	-32(%r10), %ymm4
	vhaddpd	%ymm3, %ymm3, %ymm3
	vhsubpd	%ymm12, %ymm12, %ymm12
	vmulpd	%ymm5, %ymm1, %ymm5
	vhsubpd	%ymm14, %ymm14, %ymm14
	vblendpd	$10, %ymm11, %ymm12, %ymm12
	vmulpd	%ymm13, %ymm2, %ymm11
	vmulpd	-64(%rsi), %ymm1, %ymm13
	vhaddpd	%ymm5, %ymm5, %ymm5
	vmulpd	%ymm7, %ymm4, %ymm7
	vhaddpd	%ymm11, %ymm11, %ymm11
	vhsubpd	%ymm13, %ymm13, %ymm13
	vblendpd	$10, %ymm11, %ymm14, %ymm14
	vmulpd	%ymm15, %ymm1, %ymm11
	vmulpd	904(%rsp), %ymm4, %ymm15
	vaddpd	%ymm14, %ymm12, %ymm12
	vhaddpd	%ymm7, %ymm7, %ymm7
	vhaddpd	%ymm11, %ymm11, %ymm11
	vhaddpd	%ymm15, %ymm15, %ymm15
	vblendpd	$10, %ymm11, %ymm13, %ymm13
	vmulpd	-32(%rsi), %ymm4, %ymm11
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm15, %ymm11, %ymm11
	vaddpd	%ymm11, %ymm13, %ymm13
	vaddpd	%ymm13, %ymm12, %ymm12
	vaddpd	712(%rsp), %ymm12, %ymm11
	vmulpd	%ymm10, %ymm0, %ymm12
	vmovapd	%ymm11, 712(%rsp)
	vmulpd	-128(%rcx), %ymm0, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm10
	vmulpd	%ymm9, %ymm2, %ymm12
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm10, %ymm11, %ymm10
	vmulpd	-96(%rcx), %ymm2, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm9
	vmulpd	%ymm8, %ymm1, %ymm12
	vhsubpd	%ymm11, %ymm11, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm8
	vblendpd	$10, %ymm9, %ymm11, %ymm9
	vmulpd	-64(%rcx), %ymm1, %ymm11
	vmulpd	872(%rsp), %ymm4, %ymm12
	vaddpd	%ymm9, %ymm10, %ymm10
	vhsubpd	%ymm11, %ymm11, %ymm11
	vhaddpd	%ymm12, %ymm12, %ymm12
	vblendpd	$10, %ymm8, %ymm11, %ymm8
	vmulpd	-32(%rcx), %ymm4, %ymm11
	vhsubpd	%ymm11, %ymm11, %ymm11
	vblendpd	$10, %ymm12, %ymm11, %ymm11
	vaddpd	%ymm11, %ymm8, %ymm8
	vaddpd	%ymm8, %ymm10, %ymm10
	vaddpd	680(%rsp), %ymm10, %ymm8
	vmovapd	%ymm8, 680(%rsp)
	vmulpd	-128(%rdx), %ymm0, %ymm8
	vhsubpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm3, %ymm8, %ymm3
	vmulpd	-96(%rdx), %ymm2, %ymm8
	vhsubpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm6, %ymm8, %ymm6
	vmulpd	-64(%rdx), %ymm1, %ymm8
	vaddpd	%ymm6, %ymm3, %ymm3
	vhsubpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm5, %ymm8, %ymm5
	vmulpd	-32(%rdx), %ymm4, %ymm8
	vhsubpd	%ymm8, %ymm8, %ymm8
	vblendpd	$10, %ymm7, %ymm8, %ymm8
	vaddpd	%ymm8, %ymm5, %ymm5
	vaddpd	%ymm5, %ymm3, %ymm3
	vaddpd	648(%rsp), %ymm3, %ymm7
	vmulpd	-128(%rdi), %ymm0, %ymm3
	vmulpd	1032(%rsp), %ymm0, %ymm0
	vmovapd	%ymm7, 648(%rsp)
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm0, %ymm0, %ymm0
	vblendpd	$10, %ymm0, %ymm3, %ymm0
	vmulpd	-96(%rdi), %ymm2, %ymm3
	vmulpd	1000(%rsp), %ymm2, %ymm2
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm2, %ymm2, %ymm2
	vblendpd	$10, %ymm2, %ymm3, %ymm2
	vmulpd	-64(%rdi), %ymm1, %ymm3
	vmulpd	968(%rsp), %ymm1, %ymm1
	vaddpd	%ymm2, %ymm0, %ymm0
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm1, %ymm1, %ymm1
	vblendpd	$10, %ymm1, %ymm3, %ymm1
	vmulpd	-32(%rdi), %ymm4, %ymm3
	vmulpd	936(%rsp), %ymm4, %ymm4
	vhsubpd	%ymm3, %ymm3, %ymm3
	vhaddpd	%ymm4, %ymm4, %ymm4
	vblendpd	$10, %ymm4, %ymm3, %ymm3
	vaddpd	%ymm3, %ymm1, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddpd	616(%rsp), %ymm0, %ymm4
	vmovapd	%ymm4, 616(%rsp)
	cmpq	%rax, %r15
	jne	.L694
	vmovapd	264(%rsp), %ymm6
	vextractf128	$0x1, %ymm6, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm3
	vunpckhpd	%xmm6, %xmm6, %xmm2
	vaddsd	%xmm2, %xmm3, %xmm7
	vaddsd	%xmm6, %xmm1, %xmm3
	vmovapd	296(%rsp), %ymm6
	vmovsd	%xmm7, 1032(%rsp)
	vextractf128	$0x1, %ymm6, %xmm0
	vunpckhpd	%xmm6, %xmm6, %xmm2
	vmovsd	%xmm3, 1000(%rsp)
	vunpckhpd	%xmm0, %xmm0, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm5
	vmovapd	328(%rsp), %ymm3
	vaddsd	%xmm6, %xmm0, %xmm6
	vextractf128	$0x1, %ymm3, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vmovapd	%xmm3, %xmm1
	vunpckhpd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm4
	vmovapd	360(%rsp), %ymm3
	vaddsd	%xmm0, %xmm1, %xmm7
	vextractf128	$0x1, %ymm3, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vmovapd	%xmm3, %xmm1
	vunpckhpd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm3
	vmovsd	%xmm7, 872(%rsp)
	vmovapd	456(%rsp), %ymm7
	vmovsd	%xmm3, 840(%rsp)
	vmovapd	424(%rsp), %ymm3
	vmovsd	%xmm5, 968(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm5
	vextractf128	$0x1, %ymm3, %xmm0
	vmovapd	%xmm3, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vmovsd	%xmm4, 904(%rsp)
	vunpckhpd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm1, %xmm0, %xmm4
	vextractf128	$0x1, %ymm7, %xmm0
	vmovapd	%xmm7, %xmm1
	vmovsd	%xmm6, 936(%rsp)
	vaddsd	%xmm3, %xmm2, %xmm6
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm7, %xmm7, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm7
	vaddsd	%xmm1, %xmm0, %xmm3
	vmovsd	%xmm6, 776(%rsp)
	vmovsd	%xmm7, 456(%rsp)
	vmovsd	%xmm3, 360(%rsp)
	vmovapd	488(%rsp), %ymm3
	vmovsd	%xmm5, 808(%rsp)
	vmovapd	%xmm3, %xmm0
	vextractf128	$0x1, %ymm3, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm6
	vunpckhpd	%xmm3, %xmm3, %xmm2
	vunpckhpd	%xmm1, %xmm1, %xmm3
	vmovsd	%xmm6, 328(%rsp)
	vmovapd	392(%rsp), %ymm6
	vaddsd	%xmm3, %xmm2, %xmm5
	vextractf128	$0x1, %ymm6, %xmm0
	vaddsd	%xmm6, %xmm0, %xmm7
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm6, %xmm6, %xmm3
	vmovsd	%xmm7, 296(%rsp)
	vmovapd	584(%rsp), %ymm7
	vmovsd	%xmm4, 424(%rsp)
	vaddsd	%xmm3, %xmm2, %xmm4
	vextractf128	$0x1, %ymm7, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm7, %xmm7, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm3
	vmovsd	%xmm4, 392(%rsp)
	vmovapd	744(%rsp), %ymm4
	vmovsd	%xmm5, 488(%rsp)
	vaddsd	%xmm7, %xmm0, %xmm5
	vextractf128	$0x1, %ymm4, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vmovsd	%xmm3, 584(%rsp)
	vunpckhpd	%xmm4, %xmm4, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm6
	vmovapd	520(%rsp), %ymm3
	vaddsd	%xmm0, %xmm4, %xmm4
	vextractf128	$0x1, %ymm3, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vmovapd	%xmm3, %xmm1
	vunpckhpd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm7
	vaddsd	%xmm1, %xmm0, %xmm3
	vmovsd	%xmm5, 264(%rsp)
	vmovsd	%xmm6, 744(%rsp)
	vmovsd	%xmm4, 200(%rsp)
	vmovsd	%xmm7, 520(%rsp)
	vmovsd	%xmm3, 192(%rsp)
	vmovapd	552(%rsp), %ymm6
	vmovapd	616(%rsp), %ymm7
	vextractf128	$0x1, %ymm6, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm6, %xmm6, %xmm3
	vaddsd	%xmm6, %xmm0, %xmm6
	vextractf128	$0x1, %ymm7, %xmm0
	vaddsd	%xmm3, %xmm2, %xmm5
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm7, %xmm7, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm4
	vaddsd	%xmm7, %xmm0, %xmm7
	vmovsd	%xmm5, 552(%rsp)
	vmovsd	%xmm4, 616(%rsp)
	vmovapd	712(%rsp), %ymm4
	vmovsd	%xmm6, 184(%rsp)
	vextractf128	$0x1, %ymm4, %xmm1
	vunpckhpd	%xmm4, %xmm4, %xmm2
	vunpckhpd	%xmm1, %xmm1, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm3
	vaddsd	%xmm4, %xmm1, %xmm5
	vmovsd	%xmm7, 176(%rsp)
	vmovsd	%xmm3, 712(%rsp)
	vmovapd	680(%rsp), %ymm3
	vmovsd	%xmm5, 168(%rsp)
	vextractf128	$0x1, %ymm3, %xmm0
	vmovapd	%xmm3, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vunpckhpd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm6
	vaddsd	%xmm1, %xmm0, %xmm4
	vmovsd	%xmm6, 680(%rsp)
	vmovapd	648(%rsp), %ymm6
	vmovq	%xmm4, %r10
	vextractf128	$0x1, %ymm6, %xmm14
	vunpckhpd	%xmm14, %xmm14, %xmm15
	vunpckhpd	%xmm6, %xmm6, %xmm1
	vaddsd	%xmm1, %xmm15, %xmm7
	vaddsd	%xmm6, %xmm14, %xmm3
	vmovq	%xmm7, %r15
	vmovsd	%xmm3, 648(%rsp)
.L701:
	movl	208(%rsp), %edi
	cmpl	%edi, 228(%rsp)
	jle	.L699
	movslq	216(%rsp), %rcx
	movq	128(%rsp), %rax
	movslq	212(%rsp), %r9
	movslq	220(%rsp), %r8
	movslq	224(%rsp), %rdi
	addq	%rcx, %rax
	salq	$4, %r9
	salq	$4, %r8
	salq	$4, %rdi
	movq	%r10, 152(%rsp)
	salq	$4, %rax
	negq	%rcx
	movq	%r9, %r10
	movq	72(%rsp), %rdx
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	88(%rsp), %rdi
	addq	160(%rsp), %rax
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L698:
	leaq	(%r10,%rax), %rsi
	vmovsd	8(%rdx), %xmm6
	vmovsd	(%rsi,%rcx), %xmm13
	vmovsd	(%rdx), %xmm7
	vmulsd	%xmm6, %xmm13, %xmm15
	vmovsd	8(%rsi,%rcx), %xmm3
	leaq	(%r9,%rax), %rsi
	vmovsd	(%rsi,%rcx), %xmm12
	vmovsd	8(%rsi,%rcx), %xmm2
	vfmadd231sd	%xmm7, %xmm3, %xmm15
	leaq	(%r8,%rax), %rsi
	vmovsd	(%rsi,%rcx), %xmm11
	vmovsd	8(%rsi,%rcx), %xmm1
	leaq	(%rdi,%rdx), %rsi
	vmovsd	(%rsi,%r12), %xmm5
	vmovsd	8(%rsi,%r12), %xmm4
	vaddsd	8(%r14), %xmm15, %xmm15
	movq	256(%rsp), %rsi
	vmovsd	(%rax), %xmm10
	addq	%rdx, %rsi
	vmovsd	(%rsi,%r12), %xmm8
	vmovsd	8(%rsi,%r12), %xmm9
	vmovsd	8(%rax), %xmm0
	vmovsd	%xmm15, 8(%r14)
	vmulsd	%xmm6, %xmm12, %xmm15
	vmovsd	%xmm13, %xmm13, %xmm14
	vfmadd213sd	(%r14), %xmm7, %xmm14
	addq	$16, %rdx
	addq	$16, %rax
	vfmadd231sd	%xmm7, %xmm2, %xmm15
	vfnmadd231sd	%xmm3, %xmm6, %xmm14
	vaddsd	24(%r14), %xmm15, %xmm15
	vmovsd	%xmm14, (%r14)
	vmovsd	%xmm15, 24(%r14)
	vmulsd	%xmm11, %xmm6, %xmm15
	vmovsd	%xmm12, %xmm12, %xmm14
	vfmadd213sd	16(%r14), %xmm7, %xmm14
	vfmadd231sd	%xmm7, %xmm1, %xmm15
	vfnmadd231sd	%xmm6, %xmm2, %xmm14
	vaddsd	40(%r14), %xmm15, %xmm15
	vmovsd	%xmm14, 16(%r14)
	vmovsd	%xmm15, 40(%r14)
	vmulsd	%xmm10, %xmm6, %xmm15
	vmovsd	%xmm11, %xmm11, %xmm14
	vfmadd213sd	32(%r14), %xmm7, %xmm14
	vfmadd231sd	%xmm7, %xmm0, %xmm15
	vfmadd213sd	48(%r14), %xmm10, %xmm7
	vfnmadd231sd	%xmm6, %xmm1, %xmm14
	vaddsd	56(%r14), %xmm15, %xmm15
	vfnmadd132sd	%xmm0, %xmm7, %xmm6
	vmovsd	%xmm14, 32(%r14)
	vmovsd	%xmm15, 56(%r14)
	vmovsd	%xmm13, %xmm13, %xmm7
	vmovsd	%xmm6, 48(%r14)
	vfmadd213sd	0(%r13), %xmm5, %xmm7
	vmulsd	%xmm4, %xmm13, %xmm6
	vfnmadd231sd	%xmm3, %xmm4, %xmm7
	vfmadd231sd	%xmm5, %xmm3, %xmm6
	vmovsd	%xmm7, 0(%r13)
	vaddsd	8(%r13), %xmm6, %xmm6
	vmovsd	%xmm12, %xmm12, %xmm7
	vfmadd213sd	16(%r13), %xmm5, %xmm7
	vmovsd	%xmm6, 8(%r13)
	vmulsd	%xmm4, %xmm12, %xmm6
	vfnmadd231sd	%xmm4, %xmm2, %xmm7
	vfmadd231sd	%xmm5, %xmm2, %xmm6
	vmovsd	%xmm7, 16(%r13)
	vmovsd	%xmm11, %xmm11, %xmm7
	vaddsd	24(%r13), %xmm6, %xmm6
	vfmadd213sd	32(%r13), %xmm5, %xmm7
	vmovsd	%xmm6, 24(%r13)
	vmulsd	%xmm11, %xmm4, %xmm6
	vfnmadd231sd	%xmm4, %xmm1, %xmm7
	vfmadd231sd	%xmm5, %xmm1, %xmm6
	vmovsd	%xmm7, 32(%r13)
	vaddsd	40(%r13), %xmm6, %xmm6
	vmovsd	%xmm6, 40(%r13)
	vmulsd	%xmm10, %xmm4, %xmm6
	vfmadd231sd	%xmm5, %xmm0, %xmm6
	vfmadd213sd	48(%r13), %xmm10, %xmm5
	vaddsd	56(%r13), %xmm6, %xmm6
	vfnmadd132sd	%xmm0, %xmm5, %xmm4
	vmovsd	%xmm6, 56(%r13)
	vmovsd	%xmm4, 48(%r13)
	vmulsd	%xmm9, %xmm13, %xmm4
	vfmadd231sd	%xmm8, %xmm3, %xmm4
	vmulsd	%xmm3, %xmm9, %xmm3
	vfmsub231sd	%xmm8, %xmm13, %xmm3
	vaddsd	(%rbx), %xmm3, %xmm5
	vmovsd	%xmm5, (%rbx)
	vaddsd	8(%rbx), %xmm4, %xmm5
	vmovsd	%xmm5, 8(%rbx)
	vmulsd	%xmm9, %xmm12, %xmm5
	vfmadd231sd	%xmm8, %xmm2, %xmm5
	vmulsd	%xmm9, %xmm2, %xmm2
	vfmsub231sd	%xmm8, %xmm12, %xmm2
	vaddsd	16(%rbx), %xmm2, %xmm6
	vmovsd	%xmm6, 16(%rbx)
	vaddsd	24(%rbx), %xmm5, %xmm6
	vmovsd	%xmm6, 24(%rbx)
	vmulsd	%xmm11, %xmm9, %xmm6
	vfmadd231sd	%xmm8, %xmm1, %xmm6
	vmulsd	%xmm9, %xmm1, %xmm1
	vfmsub231sd	%xmm8, %xmm11, %xmm1
	vaddsd	32(%rbx), %xmm1, %xmm7
	vmovsd	%xmm7, 32(%rbx)
	vaddsd	40(%rbx), %xmm6, %xmm7
	vmovsd	%xmm7, 40(%rbx)
	vmulsd	%xmm10, %xmm9, %xmm7
	vfmadd231sd	%xmm8, %xmm0, %xmm7
	vmulsd	%xmm9, %xmm0, %xmm0
	vfmsub231sd	%xmm8, %xmm10, %xmm0
	vaddsd	48(%rbx), %xmm0, %xmm8
	vmovsd	%xmm8, 48(%rbx)
	vaddsd	56(%rbx), %xmm7, %xmm8
	vmovsd	%xmm8, 56(%rbx)
	vaddsd	(%r11), %xmm3, %xmm3
	vmovsd	%xmm3, (%r11)
	vaddsd	8(%r11), %xmm4, %xmm4
	vaddsd	16(%r11), %xmm2, %xmm2
	vaddsd	24(%r11), %xmm5, %xmm5
	vaddsd	32(%r11), %xmm1, %xmm1
	vaddsd	40(%r11), %xmm6, %xmm6
	vaddsd	48(%r11), %xmm0, %xmm0
	vaddsd	56(%r11), %xmm7, %xmm7
	vmovsd	%xmm4, 8(%r11)
	vmovsd	%xmm2, 16(%r11)
	vmovsd	%xmm5, 24(%r11)
	vmovsd	%xmm1, 32(%r11)
	vmovsd	%xmm6, 40(%r11)
	vmovsd	%xmm0, 48(%r11)
	vmovsd	%xmm7, 56(%r11)
	cmpq	%rdx, 248(%rsp)
	jne	.L698
	movq	152(%rsp), %r10
.L699:
	vmovsd	1000(%rsp), %xmm7
	vmovsd	936(%rsp), %xmm4
	vaddsd	(%r14), %xmm7, %xmm0
	vmovsd	1032(%rsp), %xmm7
	vmovsd	872(%rsp), %xmm3
	vmovsd	%xmm0, (%r14)
	vaddsd	8(%r14), %xmm7, %xmm0
	vmovsd	968(%rsp), %xmm7
	vmovsd	904(%rsp), %xmm6
	vmovsd	%xmm0, 8(%r14)
	vaddsd	16(%r14), %xmm4, %xmm0
	vmovsd	808(%rsp), %xmm4
	vmovsd	840(%rsp), %xmm5
	vmovsd	%xmm0, 16(%r14)
	vaddsd	24(%r14), %xmm7, %xmm0
	vmovsd	424(%rsp), %xmm7
	addq	$64, %r14
	vmovsd	%xmm0, -40(%r14)
	vaddsd	-32(%r14), %xmm3, %xmm0
	vmovsd	776(%rsp), %xmm3
	addq	$64, %r13
	vmovsd	%xmm0, -32(%r14)
	vaddsd	-24(%r14), %xmm6, %xmm0
	vmovsd	360(%rsp), %xmm6
	addq	$64, %rbx
	vmovsd	%xmm0, -24(%r14)
	vaddsd	-16(%r14), %xmm4, %xmm0
	addq	$64, %r11
	vmovsd	%xmm0, -16(%r14)
	vaddsd	-8(%r14), %xmm5, %xmm0
	vmovsd	%xmm0, -8(%r14)
	vaddsd	-64(%r13), %xmm7, %xmm0
	vmovsd	%xmm0, -64(%r13)
	vaddsd	-56(%r13), %xmm3, %xmm0
	vmovsd	%xmm0, -56(%r13)
	vaddsd	-48(%r13), %xmm6, %xmm0
	vmovsd	%xmm0, -48(%r13)
	vmovsd	456(%rsp), %xmm4
	vmovsd	328(%rsp), %xmm5
	vaddsd	-40(%r13), %xmm4, %xmm0
	vmovsd	488(%rsp), %xmm7
	vmovsd	296(%rsp), %xmm3
	vmovsd	%xmm0, -40(%r13)
	vaddsd	-32(%r13), %xmm5, %xmm0
	vmovsd	392(%rsp), %xmm6
	vmovsd	264(%rsp), %xmm4
	vmovsd	%xmm0, -32(%r13)
	vaddsd	-24(%r13), %xmm7, %xmm0
	vmovsd	584(%rsp), %xmm5
	vmovsd	200(%rsp), %xmm7
	vmovsd	%xmm0, -24(%r13)
	vaddsd	-16(%r13), %xmm3, %xmm0
	vmovsd	744(%rsp), %xmm3
	vmovsd	%xmm0, -16(%r13)
	vaddsd	-8(%r13), %xmm6, %xmm0
	vmovsd	192(%rsp), %xmm6
	vmovsd	%xmm0, -8(%r13)
	vaddsd	-64(%rbx), %xmm4, %xmm0
	vmovsd	520(%rsp), %xmm4
	vmovsd	%xmm0, -64(%rbx)
	vaddsd	-56(%rbx), %xmm5, %xmm0
	vmovsd	%xmm0, -56(%rbx)
	vaddsd	-48(%rbx), %xmm7, %xmm0
	vmovsd	%xmm0, -48(%rbx)
	vaddsd	-40(%rbx), %xmm3, %xmm0
	vmovsd	%xmm0, -40(%rbx)
	vaddsd	-32(%rbx), %xmm6, %xmm0
	vmovsd	%xmm0, -32(%rbx)
	vaddsd	-24(%rbx), %xmm4, %xmm0
	vmovsd	%xmm0, -24(%rbx)
	vmovsd	184(%rsp), %xmm5
	vmovsd	552(%rsp), %xmm7
	vaddsd	-16(%rbx), %xmm5, %xmm0
	vmovsd	176(%rsp), %xmm3
	vmovsd	616(%rsp), %xmm6
	vmovsd	%xmm0, -16(%rbx)
	vaddsd	-8(%rbx), %xmm7, %xmm0
	vmovsd	168(%rsp), %xmm4
	vmovsd	712(%rsp), %xmm5
	vmovsd	%xmm0, -8(%rbx)
	vaddsd	-64(%r11), %xmm3, %xmm0
	vmovq	%r10, %xmm7
	vmovsd	680(%rsp), %xmm3
	vmovsd	%xmm0, -64(%r11)
	vaddsd	-56(%r11), %xmm6, %xmm0
	vmovsd	648(%rsp), %xmm6
	movl	148(%rsp), %eax
	vmovsd	%xmm0, -56(%r11)
	vaddsd	-48(%r11), %xmm4, %xmm0
	vmovq	%r15, %xmm4
	vaddsd	-16(%r11), %xmm6, %xmm14
	vmovsd	%xmm0, -48(%r11)
	vaddsd	-40(%r11), %xmm5, %xmm0
	vaddsd	-8(%r11), %xmm4, %xmm15
	vmovsd	%xmm14, -16(%r11)
	vmovsd	%xmm0, -40(%r11)
	vaddsd	-32(%r11), %xmm7, %xmm0
	vmovsd	%xmm15, -8(%r11)
	addl	%eax, 212(%rsp)
	vmovsd	%xmm0, -32(%r11)
	vaddsd	-24(%r11), %xmm3, %xmm0
	vmovsd	%xmm0, -24(%r11)
	addl	%eax, 216(%rsp)
	addl	%eax, 220(%rsp)
	addl	%eax, 224(%rsp)
	cmpq	%r14, 136(%rsp)
	jne	.L696
.L697:
	movl	16(%rsp), %ebx
	cmpl	%ebx, 20(%rsp)
	jle	.L702
	movq	-56(%rsp), %rdi
	movslq	40(%rsp), %rax
	movq	32(%rsp), %rbx
	leaq	(%rax,%rdi), %rdx
	salq	$4, %rdx
	leaq	(%rbx,%rdx), %r13
	movslq	44(%rsp), %rdx
	addq	-64(%rsp), %rax
	addq	%rdi, %rdx
	salq	$4, %rdx
	salq	$4, %rax
	leaq	(%rbx,%rdx), %r15
	leaq	16(%rbx,%rax), %rax
	movslq	48(%rsp), %rdx
	movq	%rax, 776(%rsp)
	movslq	232(%rsp), %rax
	addq	%rdi, %rdx
	salq	$4, %rdx
	movq	%rax, %r9
	movq	%rax, 808(%rsp)
	movslq	236(%rsp), %rax
	leaq	(%rbx,%rdx), %r14
	movslq	52(%rsp), %rdx
	movq	%rax, %r8
	movq	%rax, 840(%rsp)
	movslq	240(%rsp), %rax
	addq	%rdi, %rdx
	movq	%rax, 872(%rsp)
	movq	%rax, %rdi
	salq	$4, %rdx
	movslq	244(%rsp), %rax
	addq	%rbx, %rdx
	movq	%rdx, 1032(%rsp)
	movq	%rax, %rsi
	movq	24(%rsp), %rdx
	movq	%rax, 904(%rsp)
	movq	%r14, 968(%rsp)
	salq	$4, %r9
	salq	$4, %r8
	salq	$4, %rdi
	salq	$4, %rsi
	movl	-16(%rsp), %r12d
	movq	160(%rsp), %r14
	movq	%r15, 1000(%rsp)
	addq	%rdx, %r9
	addq	%rdx, %r8
	addq	%rdx, %rdi
	addq	%rdx, %rsi
	movq	%r13, %r15
	.p2align 4,,10
	.p2align 3
.L703:
	movl	228(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L737
	cmpl	$2, 144(%rsp)
	jbe	.L721
	movslq	%r12d, %rcx
	vxorpd	%xmm8, %xmm8, %xmm8
	salq	$4, %rcx
	movq	64(%rsp), %r10
	addq	%r14, %rcx
	xorl	%eax, %eax
	vmovapd	%ymm8, %ymm5
	vmovapd	%ymm8, %ymm10
	vmovapd	%ymm8, %ymm9
	vmovapd	%ymm8, %ymm7
	vmovapd	%ymm8, %ymm6
	vmovapd	%ymm8, %ymm4
	vmovapd	%ymm8, %ymm3
	.p2align 4,,10
	.p2align 3
.L705:
	vmovupd	(%rcx,%rax), %ymm2
	vunpcklpd	32(%rcx,%rax), %ymm2, %ymm1
	vunpckhpd	32(%rcx,%rax), %ymm2, %ymm0
	vmovupd	(%r9,%rax), %ymm2
	vpermpd	$216, %ymm1, %ymm1
	vunpcklpd	32(%r9,%rax), %ymm2, %ymm11
	vunpckhpd	32(%r9,%rax), %ymm2, %ymm2
	vpermpd	$216, %ymm0, %ymm0
	vpermpd	$216, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm2, %ymm12
	vmulpd	%ymm0, %ymm2, %ymm2
	vpermpd	$216, %ymm11, %ymm11
	vfmadd231pd	%ymm0, %ymm11, %ymm12
	vfmsub132pd	%ymm1, %ymm2, %ymm11
	vmovupd	(%r8,%rax), %ymm2
	vaddpd	%ymm12, %ymm4, %ymm4
	vaddpd	%ymm11, %ymm3, %ymm3
	vunpcklpd	32(%r8,%rax), %ymm2, %ymm11
	vunpckhpd	32(%r8,%rax), %ymm2, %ymm2
	vpermpd	$216, %ymm11, %ymm11
	vpermpd	$216, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm2, %ymm12
	vmulpd	%ymm0, %ymm2, %ymm2
	vfmadd231pd	%ymm0, %ymm11, %ymm12
	vfmsub132pd	%ymm1, %ymm2, %ymm11
	vmovupd	(%rdi,%rax), %ymm2
	vaddpd	%ymm12, %ymm6, %ymm6
	vaddpd	%ymm11, %ymm5, %ymm5
	vunpcklpd	32(%rdi,%rax), %ymm2, %ymm11
	vunpckhpd	32(%rdi,%rax), %ymm2, %ymm2
	vpermpd	$216, %ymm11, %ymm11
	vpermpd	$216, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm2, %ymm12
	vmulpd	%ymm0, %ymm2, %ymm2
	vfmadd231pd	%ymm0, %ymm11, %ymm12
	vfmsub132pd	%ymm1, %ymm2, %ymm11
	vmovupd	(%rsi,%rax), %ymm2
	vaddpd	%ymm12, %ymm8, %ymm8
	vaddpd	%ymm11, %ymm7, %ymm7
	vunpcklpd	32(%rsi,%rax), %ymm2, %ymm11
	vunpckhpd	32(%rsi,%rax), %ymm2, %ymm2
	vpermpd	$216, %ymm11, %ymm11
	vpermpd	$216, %ymm2, %ymm2
	vmulpd	%ymm1, %ymm2, %ymm12
	vmulpd	%ymm0, %ymm2, %ymm2
	addq	$64, %rax
	vfmadd231pd	%ymm0, %ymm11, %ymm12
	vfmsub132pd	%ymm1, %ymm2, %ymm11
	vaddpd	%ymm12, %ymm10, %ymm10
	vaddpd	%ymm11, %ymm9, %ymm9
	cmpq	%r10, %rax
	jne	.L705
	vextractf128	$0x1, %ymm10, %xmm1
	vaddpd	%xmm10, %xmm1, %xmm1
	movl	60(%rsp), %eax
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vextractf128	$0x1, %ymm9, %xmm1
	vaddpd	%xmm9, %xmm1, %xmm1
	movl	%eax, %ecx
	vunpckhpd	%xmm1, %xmm1, %xmm2
	vaddpd	%xmm1, %xmm2, %xmm2
	vextractf128	$0x1, %ymm8, %xmm1
	vaddpd	%xmm8, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm2, %xmm2
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vextractf128	$0x1, %ymm7, %xmm1
	vaddpd	%xmm7, %xmm1, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm7
	vaddpd	%xmm1, %xmm7, %xmm7
	vextractf128	$0x1, %ymm6, %xmm1
	vaddpd	%xmm6, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm7, %xmm7
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vextractf128	$0x1, %ymm5, %xmm1
	vaddpd	%xmm5, %xmm1, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm5
	vaddpd	%xmm1, %xmm5, %xmm5
	vextractf128	$0x1, %ymm4, %xmm1
	vaddpd	%xmm4, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm5, %xmm5
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vextractf128	$0x1, %ymm3, %xmm1
	vaddpd	%xmm3, %xmm1, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm3
	vaddpd	%xmm1, %xmm3, %xmm3
	vunpcklpd	%xmm0, %xmm3, %xmm3
	cmpl	%eax, 228(%rsp)
	je	.L710
.L704:
	movl	228(%rsp), %ebx
	subl	%ecx, %ebx
	movl	%ebx, 936(%rsp)
	cmpl	$1, %ebx
	je	.L707
	movslq	%r12d, %r10
	movq	808(%rsp), %r11
	addq	%rcx, %r10
	salq	$4, %r10
	leaq	(%rcx,%r11), %r13
	addq	%r14, %r10
	vmovupd	16(%r10), %xmm4
	vmovupd	(%r10), %xmm0
	salq	$4, %r13
	addq	%rdx, %r13
	vunpcklpd	%xmm4, %xmm0, %xmm1
	vmovupd	16(%r13), %xmm8
	vunpckhpd	%xmm4, %xmm0, %xmm0
	vmovupd	0(%r13), %xmm4
	movq	840(%rsp), %r11
	vunpcklpd	%xmm8, %xmm4, %xmm6
	vunpckhpd	%xmm8, %xmm4, %xmm4
	vmulpd	%xmm1, %xmm4, %xmm8
	vmulpd	%xmm0, %xmm4, %xmm4
	leaq	(%rcx,%r11), %rbx
	salq	$4, %rbx
	addq	%rdx, %rbx
	vfmadd231pd	%xmm0, %xmm6, %xmm8
	vmovupd	16(%rbx), %xmm9
	vfmsub132pd	%xmm1, %xmm4, %xmm6
	vmovupd	(%rbx), %xmm4
	movq	872(%rsp), %r11
	vunpcklpd	%xmm9, %xmm4, %xmm10
	vunpckhpd	%xmm9, %xmm4, %xmm4
	vmulpd	%xmm1, %xmm4, %xmm9
	vmulpd	%xmm0, %xmm4, %xmm4
	addq	%rcx, %r11
	salq	$4, %r11
	addq	%rdx, %r11
	vfmadd231pd	%xmm0, %xmm10, %xmm9
	vmovupd	16(%r11), %xmm11
	vfmsub132pd	%xmm1, %xmm4, %xmm10
	vmovupd	(%r11), %xmm4
	addq	904(%rsp), %rcx
	vunpcklpd	%xmm11, %xmm4, %xmm12
	vunpckhpd	%xmm11, %xmm4, %xmm4
	vmulpd	%xmm1, %xmm4, %xmm11
	vmulpd	%xmm0, %xmm4, %xmm4
	salq	$4, %rcx
	addq	%rdx, %rcx
	vmovupd	16(%rcx), %xmm14
	vfmadd231pd	%xmm0, %xmm12, %xmm11
	vfmsub132pd	%xmm1, %xmm4, %xmm12
	vmovupd	(%rcx), %xmm4
	movl	936(%rsp), %ebx
	vunpcklpd	%xmm14, %xmm4, %xmm13
	vunpckhpd	%xmm14, %xmm4, %xmm4
	vmulpd	%xmm1, %xmm4, %xmm14
	vmulpd	%xmm0, %xmm4, %xmm4
	movl	%ebx, %ecx
	andl	$-2, %ecx
	addl	%ecx, %eax
	vfmadd231pd	%xmm0, %xmm13, %xmm14
	vfmsub132pd	%xmm1, %xmm4, %xmm13
	vunpckhpd	%xmm14, %xmm14, %xmm0
	vaddpd	%xmm14, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vunpckhpd	%xmm13, %xmm13, %xmm0
	vaddpd	%xmm13, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm2, %xmm2
	vunpckhpd	%xmm11, %xmm11, %xmm0
	vaddpd	%xmm11, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vunpckhpd	%xmm12, %xmm12, %xmm0
	vaddpd	%xmm12, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm7, %xmm7
	vunpckhpd	%xmm9, %xmm9, %xmm0
	vaddpd	%xmm9, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vunpckhpd	%xmm10, %xmm10, %xmm0
	vaddpd	%xmm10, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm5
	vunpckhpd	%xmm8, %xmm8, %xmm0
	vaddpd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vunpckhpd	%xmm6, %xmm6, %xmm0
	vaddpd	%xmm6, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm3
	cmpl	%ebx, %ecx
	je	.L710
.L707:
	leal	(%r12,%rax), %ecx
	movl	232(%rsp), %ebx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	vmovupd	(%r14,%rcx), %xmm0
	leal	(%rbx,%rax), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	vmovupd	(%rdx,%rcx), %xmm1
	vpermilpd	$1, %xmm0, %xmm4
	vpermilpd	$0, %xmm1, %xmm6
	vpermilpd	$3, %xmm1, %xmm1
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovapd	%xmm6, %xmm8
	movl	236(%rsp), %ebx
	leal	(%rbx,%rax), %ecx
	vfmadd132pd	%xmm0, %xmm1, %xmm8
	vfmsub132pd	%xmm0, %xmm1, %xmm6
	movslq	%ecx, %rcx
	salq	$4, %rcx
	movl	240(%rsp), %ebx
	vmovsd	%xmm6, %xmm8, %xmm1
	vaddpd	%xmm1, %xmm3, %xmm3
	vmovupd	(%rdx,%rcx), %xmm1
	leal	(%rbx,%rax), %ecx
	vpermilpd	$0, %xmm1, %xmm6
	vpermilpd	$3, %xmm1, %xmm1
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovapd	%xmm6, %xmm8
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addl	244(%rsp), %eax
	vfmadd132pd	%xmm0, %xmm1, %xmm8
	vfmsub132pd	%xmm0, %xmm1, %xmm6
	cltq
	salq	$4, %rax
	vmovsd	%xmm6, %xmm8, %xmm1
	vaddpd	%xmm1, %xmm5, %xmm5
	vmovupd	(%rdx,%rcx), %xmm1
	vpermilpd	$0, %xmm1, %xmm6
	vpermilpd	$3, %xmm1, %xmm1
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovapd	%xmm6, %xmm8
	vfmadd132pd	%xmm0, %xmm1, %xmm8
	vfmsub132pd	%xmm0, %xmm1, %xmm6
	vmovsd	%xmm6, %xmm8, %xmm1
	vaddpd	%xmm1, %xmm7, %xmm7
	vmovupd	(%rdx,%rax), %xmm1
	vpermilpd	$0, %xmm1, %xmm6
	vpermilpd	$3, %xmm1, %xmm1
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovapd	%xmm6, %xmm4
	vfmadd132pd	%xmm0, %xmm1, %xmm4
	vfmsub132pd	%xmm0, %xmm1, %xmm6
	vmovsd	%xmm6, %xmm4, %xmm0
	vaddpd	%xmm0, %xmm2, %xmm2
.L710:
	vaddpd	(%r15), %xmm3, %xmm3
	movq	1000(%rsp), %rax
	movq	968(%rsp), %rbx
	vmovupd	%xmm3, (%r15)
	vaddpd	(%rax), %xmm5, %xmm5
	movq	1032(%rsp), %rcx
	addq	$16, %rax
	vmovupd	%xmm5, -16(%rax)
	vaddpd	(%rbx), %xmm7, %xmm7
	addq	$16, %rcx
	addq	$16, %rbx
	vmovupd	%xmm7, -16(%rbx)
	vaddpd	-16(%rcx), %xmm2, %xmm2
	addq	$16, %r15
	movq	%rax, 1000(%rsp)
	vmovupd	%xmm2, -16(%rcx)
	movq	%rbx, 968(%rsp)
	movq	%rcx, 1032(%rsp)
	addl	228(%rsp), %r12d
	cmpq	776(%rsp), %r15
	jne	.L703
.L702:
	addl	$4, 56(%rsp)
	movl	-12(%rsp), %eax
	addl	%eax, 40(%rsp)
	addl	%eax, 44(%rsp)
	addl	%eax, 48(%rsp)
	addl	%eax, 52(%rsp)
	movl	56(%rsp), %ebx
	movl	148(%rsp), %eax
	addl	%eax, 232(%rsp)
	addl	%eax, 236(%rsp)
	addl	%eax, 240(%rsp)
	addl	%eax, 244(%rsp)
	cmpl	%ebx, 4(%rsp)
	jg	.L693
	movq	24(%rsp), %r15
.L692:
	addq	$64, 8(%rsp)
	movl	-84(%rsp), %ebx
	addl	%ebx, (%rsp)
	movq	8(%rsp), %rax
	cmpl	%eax, 16(%rsp)
	jg	.L711
.L712:
	movl	-100(%rsp), %ebx
	addl	%ebx, -76(%rsp)
	movl	-84(%rsp), %ebx
	addl	%ebx, -72(%rsp)
	movl	-68(%rsp), %ebx
	cmpl	%ebx, -40(%rsp)
	jg	.L689
.L690:
	movl	-40(%rsp), %eax
	cmpl	%eax, -92(%rsp)
	jle	.L734
	movl	20(%rsp), %edx
	testl	%edx, %edx
	jle	.L734
	movl	228(%rsp), %edi
	movl	%eax, %ebx
	imull	%edi, %eax
	imull	%edx, %ebx
	movl	%eax, %r12d
	movl	%edi, %eax
	shrl	%eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, %r11
	movq	32(%rsp), %rax
	andl	$-2, %edi
	leaq	16(%rax), %r14
	leal	-1(%rdx), %eax
	movq	%rax, 1032(%rsp)
	movl	%edi, %r13d
.L686:
	movq	1032(%rsp), %rdi
	movslq	%ebx, %rax
	movslq	%r12d, %r10
	movq	%rax, %r8
	leaq	(%rdi,%rax), %rsi
	movq	%r10, %rdx
	salq	$4, %r8
	salq	$4, %rsi
	salq	$4, %rdx
	addq	32(%rsp), %r8
	addq	%r14, %rsi
	addq	%r15, %rdx
	xorl	%r9d, %r9d
.L719:
	movl	228(%rsp), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	testl	%eax, %eax
	jle	.L718
	cmpl	$1, 228(%rsp)
	je	.L722
	movslq	%r9d, %rdi
	movq	%rdi, %rcx
	salq	$4, %rcx
	addq	160(%rsp), %rcx
	xorl	%eax, %eax
	vxorpd	%xmm3, %xmm3, %xmm3
.L714:
	vmovupd	(%rcx,%rax), %ymm0
	vmovupd	(%rdx,%rax), %ymm1
	vpermilpd	$5, %ymm0, %ymm4
	vpermilpd	$0, %ymm1, %ymm2
	vpermilpd	$15, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm1
	vmovapd	%ymm0, %ymm4
	addq	$32, %rax
	vfmadd132pd	%ymm2, %ymm1, %ymm4
	vfmsub132pd	%ymm2, %ymm1, %ymm0
	vshufpd	$10, %ymm4, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm3
	cmpq	%r11, %rax
	jne	.L714
	vextractf128	$0x1, %ymm3, %xmm0
	vaddpd	%xmm3, %xmm0, %xmm0
	movl	%r13d, %eax
	cmpl	%r13d, 228(%rsp)
	je	.L718
.L713:
	leaq	(%rax,%r10), %rcx
	addq	%rdi, %rax
	movq	160(%rsp), %rdi
	salq	$4, %rcx
	salq	$4, %rax
	vmovupd	(%rdi,%rax), %xmm2
	vmovupd	(%r15,%rcx), %xmm1
	vpermilpd	$1, %xmm2, %xmm3
	vpermilpd	$0, %xmm1, %xmm4
	vpermilpd	$3, %xmm1, %xmm1
	vmulpd	%xmm3, %xmm1, %xmm1
	vmovapd	%xmm2, %xmm3
	vfmadd132pd	%xmm4, %xmm1, %xmm3
	vfmsub132pd	%xmm4, %xmm1, %xmm2
	vmovsd	%xmm2, %xmm3, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
.L718:
	vmovupd	%xmm0, (%r8)
	addq	$16, %r8
	addl	228(%rsp), %r9d
	cmpq	%rsi, %r8
	jne	.L719
	incl	-40(%rsp)
	addl	20(%rsp), %ebx
	addl	228(%rsp), %r12d
	movl	-40(%rsp), %eax
	cmpl	%eax, -92(%rsp)
	jne	.L686
.L734:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L736:
	.cfi_restore_state
	xorl	%r15d, %r15d
	movq	$0x000000000, 648(%rsp)
	movq	%r15, 680(%rsp)
	movq	%r15, 168(%rsp)
	movq	%r15, 712(%rsp)
	movq	%r15, 176(%rsp)
	movq	%r15, 616(%rsp)
	movq	%r15, 184(%rsp)
	movq	%r15, 552(%rsp)
	movq	%r15, 192(%rsp)
	movq	%r15, 520(%rsp)
	movq	%r15, 200(%rsp)
	movq	%r15, 744(%rsp)
	movq	%r15, 264(%rsp)
	movq	%r15, 584(%rsp)
	movq	%r15, 296(%rsp)
	movq	%r15, 392(%rsp)
	movq	%r15, 328(%rsp)
	movq	%r15, 488(%rsp)
	movq	%r15, 360(%rsp)
	movq	%r15, 456(%rsp)
	movq	%r15, 424(%rsp)
	movq	%r15, 776(%rsp)
	movq	%r15, 808(%rsp)
	movq	%r15, 840(%rsp)
	movq	%r15, 872(%rsp)
	movq	%r15, 904(%rsp)
	movq	%r15, 936(%rsp)
	movq	%r15, 968(%rsp)
	movq	%r15, 1000(%rsp)
	movq	%r15, 1032(%rsp)
	movq	%r15, %r10
	jmp	.L701
	.p2align 4,,10
	.p2align 3
.L737:
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovapd	%xmm2, %xmm7
	vmovapd	%xmm2, %xmm5
	vmovapd	%xmm2, %xmm3
	jmp	.L710
.L721:
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovapd	%xmm2, %xmm7
	vmovapd	%xmm2, %xmm5
	vmovapd	%xmm2, %xmm3
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.L704
.L722:
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	movslq	%r9d, %rdi
	jmp	.L713
	.cfi_endproc
.LFE10940:
	.size	_Z10mul_st_c64P7ComplexIdvES1_S1_iii, .-_Z10mul_st_c64P7ComplexIdvES1_S1_iii
	.p2align 4
	.globl	_Z6mul_stPdS_S_iii
	.type	_Z6mul_stPdS_S_iii, @function
_Z6mul_stPdS_S_iii:
.LFB10943:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rdi, %r15
	pushq	%r14
	.cfi_offset 14, -32
	movq	%rsi, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$680, %rsp
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%ecx, -84(%rsp)
	andl	$-4, %ecx
	movq	%rdx, 24(%rsp)
	movl	%r8d, 356(%rsp)
	movl	%r9d, 12(%rsp)
	movl	%ecx, -60(%rsp)
	jle	.L745
	movl	%r8d, %eax
	andl	$-16, %eax
	movl	%eax, 324(%rsp)
	decl	%eax
	movl	%r9d, %esi
	shrl	$4, %eax
	andl	$-4, %esi
	salq	$4, %rax
	movq	%rax, 88(%rsp)
	movl	%esi, %eax
	imull	%r8d, %eax
	leal	0(,%r9,4), %edx
	movl	%r8d, %ebx
	movl	%eax, -28(%rsp)
	leal	-1(%r8), %eax
	movl	%eax, 84(%rsp)
	movl	%r8d, %eax
	shrl	$2, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movl	%r9d, %ecx
	sall	$6, %ecx
	andl	$-4, %ebx
	movl	%edx, -24(%rsp)
	movq	%rax, 64(%rsp)
	leal	(%r9,%r9), %edx
	leal	-1(%r9), %eax
	movl	%ecx, -92(%rsp)
	movl	%edx, -76(%rsp)
	movl	%ebx, 80(%rsp)
	leal	0(,%r8,4), %edx
	movslq	%esi, %rbx
	movl	%r8d, %ecx
	subl	%esi, %eax
	movl	%edx, 304(%rsp)
	sall	$6, %ecx
	leal	(%r8,%r8), %edx
	addq	%rbx, %rax
	movl	%esi, 8(%rsp)
	movl	%ecx, -80(%rsp)
	movl	%edx, -8(%rsp)
	movl	%r8d, -68(%rsp)
	movl	%r9d, -72(%rsp)
	movl	$0, -64(%rsp)
	movq	%rbx, -48(%rsp)
	movq	%rax, -56(%rsp)
.L744:
	movl	-64(%rsp), %ebx
	movl	-60(%rsp), %ecx
	movl	%ebx, %eax
	addl	$63, %eax
	movl	%ebx, -88(%rsp)
	addl	$64, %ebx
	cmpl	%eax, %ecx
	movl	%ecx, %eax
	cmovg	%ebx, %eax
	movl	8(%rsp), %r9d
	movl	%ebx, -64(%rsp)
	movl	%eax, -4(%rsp)
	testl	%r9d, %r9d
	jle	.L767
	movl	-76(%rsp), %eax
	movq	$0, (%rsp)
	addl	-72(%rsp), %eax
	movl	%eax, -100(%rsp)
	movl	-8(%rsp), %eax
	addl	-68(%rsp), %eax
	movl	%eax, -96(%rsp)
	movl	356(%rsp), %eax
	movl	%eax, -12(%rsp)
.L766:
	movq	(%rsp), %r11
	movl	8(%rsp), %ebx
	movl	%r11d, %eax
	leal	63(%r11), %edx
	addl	$64, %eax
	cmpl	%edx, %ebx
	cmovle	%ebx, %eax
	movl	-88(%rsp), %r8d
	movl	%eax, -16(%rsp)
	cmpl	%r8d, -4(%rsp)
	jle	.L747
	movl	-72(%rsp), %ebx
	subl	%r11d, %eax
	decl	%eax
	movl	-76(%rsp), %esi
	movl	%ebx, %ecx
	shrl	$2, %eax
	subl	12(%rsp), %ecx
	salq	$2, %rax
	addl	%ecx, %esi
	movl	%ecx, 32(%rsp)
	movq	%rax, -40(%rsp)
	movl	-68(%rsp), %ecx
	movl	-96(%rsp), %eax
	movl	-8(%rsp), %edx
	movl	%esi, 44(%rsp)
	movl	%eax, 60(%rsp)
	movl	%ecx, %esi
	movl	-100(%rsp), %eax
	subl	356(%rsp), %esi
	movl	%edx, %edi
	movl	%eax, 36(%rsp)
	addl	%esi, %edi
	addl	-12(%rsp), %edx
	leaq	128(%r14), %rax
	movl	%esi, 52(%rsp)
	movl	%edi, 352(%rsp)
	movl	%r11d, -20(%rsp)
	movl	%edx, -32(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%ebx, 40(%rsp)
	movl	%r8d, 48(%rsp)
	movq	%rax, 72(%rsp)
	movq	%r15, 16(%rsp)
	movq	%r14, 112(%rsp)
	.p2align 4,,10
	.p2align 3
.L748:
	movl	-20(%rsp), %ebx
	cmpl	%ebx, -16(%rsp)
	jle	.L752
	movq	(%rsp), %rcx
	movslq	32(%rsp), %r13
	movq	24(%rsp), %rsi
	leaq	(%rcx,%r13), %rax
	leaq	(%rsi,%rax,8), %rbx
	movslq	44(%rsp), %rax
	movslq	40(%rsp), %rdx
	addq	%rcx, %rax
	addq	%rcx, %rdx
	leaq	(%rsi,%rax,8), %r11
	movslq	36(%rsp), %rax
	leaq	(%rsi,%rdx,8), %r12
	movl	-12(%rsp), %edx
	addq	%rcx, %rax
	movl	-8(%rsp), %edi
	leaq	(%rsi,%rax,8), %r15
	movl	%edx, %eax
	subl	356(%rsp), %eax
	addl	%eax, %edi
	movl	%eax, 308(%rsp)
	movq	-40(%rsp), %rax
	movl	%edi, 316(%rsp)
	addq	%rcx, %rax
	addq	%r13, %rax
	leaq	32(%rsi,%rax,8), %rax
	movq	16(%rsp), %rcx
	movq	%rax, 104(%rsp)
	movslq	52(%rsp), %rax
	movl	%edx, 312(%rsp)
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 344(%rsp)
	movslq	56(%rsp), %rax
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 336(%rsp)
	movslq	352(%rsp), %rax
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 96(%rsp)
	movslq	60(%rsp), %rax
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 328(%rsp)
	movl	-32(%rsp), %eax
	movl	%eax, 320(%rsp)
	.p2align 4,,10
	.p2align 3
.L751:
	movl	324(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L796
	movq	112(%rsp), %rsi
	movslq	312(%rsp), %rcx
	movslq	308(%rsp), %rdx
	leaq	(%rsi,%rcx,8), %r10
	movslq	316(%rsp), %rcx
	leaq	(%rsi,%rdx,8), %rax
	leaq	(%rsi,%rcx,8), %r9
	movslq	320(%rsp), %rcx
	addq	88(%rsp), %rdx
	leaq	(%rsi,%rcx,8), %r8
	movq	72(%rsp), %rsi
	vxorpd	%xmm4, %xmm4, %xmm4
	leaq	(%rsi,%rdx,8), %r13
	movq	328(%rsp), %rdi
	movq	96(%rsp), %rsi
	movq	336(%rsp), %rcx
	movq	344(%rsp), %rdx
	vmovapd	%ymm4, %ymm2
	vmovapd	%ymm4, %ymm3
	vmovapd	%ymm4, %ymm7
	vmovapd	%ymm4, 360(%rsp)
	vmovapd	%ymm4, 392(%rsp)
	vmovapd	%ymm4, 424(%rsp)
	vmovapd	%ymm4, 456(%rsp)
	vmovapd	%ymm4, 488(%rsp)
	vmovapd	%ymm4, 520(%rsp)
	vmovapd	%ymm4, 552(%rsp)
	vmovapd	%ymm4, 584(%rsp)
	vmovapd	%ymm4, 616(%rsp)
	vmovapd	%ymm4, 648(%rsp)
	vmovapd	%ymm4, %ymm11
	vmovapd	%ymm4, %ymm10
	.p2align 4,,10
	.p2align 3
.L749:
	vmovupd	(%r9), %ymm1
	vmovupd	(%r8), %ymm13
	vmovupd	(%rdx), %ymm0
	vmovapd	648(%rsp), %ymm6
	vfmadd231pd	(%rax), %ymm0, %ymm10
	vfmadd231pd	(%r10), %ymm0, %ymm11
	vfmadd231pd	%ymm1, %ymm0, %ymm6
	vfmadd213pd	616(%rsp), %ymm13, %ymm0
	vmovupd	32(%rdx), %ymm9
	vmovupd	32(%r8), %ymm12
	vfmadd231pd	32(%rax), %ymm9, %ymm10
	vfmadd231pd	32(%r10), %ymm9, %ymm11
	vfmadd231pd	32(%r9), %ymm9, %ymm6
	vfmadd231pd	%ymm12, %ymm9, %ymm0
	vmovupd	64(%rdx), %ymm5
	vmovupd	96(%rdx), %ymm8
	vfmadd231pd	64(%rax), %ymm5, %ymm10
	vfmadd231pd	64(%r10), %ymm5, %ymm11
	vfmadd231pd	64(%r9), %ymm5, %ymm6
	vfmadd132pd	64(%r8), %ymm0, %ymm5
	vmovapd	584(%rsp), %ymm9
	vfmadd231pd	96(%rax), %ymm8, %ymm10
	vfmadd231pd	96(%r10), %ymm8, %ymm11
	vfmadd231pd	96(%r9), %ymm8, %ymm6
	vfmadd132pd	96(%r8), %ymm5, %ymm8
	vmovupd	(%rcx), %ymm0
	vmovupd	32(%rcx), %ymm15
	vmovupd	64(%rcx), %ymm5
	vmovupd	96(%rcx), %ymm14
	vmovapd	%ymm8, 616(%rsp)
	vmovapd	552(%rsp), %ymm8
	vfmadd231pd	(%rax), %ymm0, %ymm9
	vfmadd231pd	(%r10), %ymm0, %ymm8
	vmovapd	%ymm6, 648(%rsp)
	vmovapd	520(%rsp), %ymm6
	subq	$-128, %rax
	vfmadd231pd	%ymm1, %ymm0, %ymm6
	vfmadd231pd	32(%r10), %ymm15, %ymm8
	vfmadd231pd	-96(%rax), %ymm15, %ymm9
	vfmadd213pd	488(%rsp), %ymm13, %ymm0
	subq	$-128, %r10
	vfmadd231pd	32(%r9), %ymm15, %ymm6
	vfmadd231pd	-64(%r10), %ymm5, %ymm8
	vfmadd231pd	-64(%rax), %ymm5, %ymm9
	vfmadd231pd	%ymm12, %ymm15, %ymm0
	vmovupd	32(%rsi), %ymm15
	vfmadd231pd	64(%r9), %ymm5, %ymm6
	vfmadd231pd	-32(%r10), %ymm14, %ymm8
	vfmadd231pd	-32(%rax), %ymm14, %ymm9
	vfmadd132pd	64(%r8), %ymm0, %ymm5
	vmovupd	(%rsi), %ymm0
	vfmadd231pd	96(%r9), %ymm14, %ymm6
	vmovapd	%ymm8, 552(%rsp)
	vmovapd	%ymm9, 584(%rsp)
	vmovapd	424(%rsp), %ymm8
	vmovapd	456(%rsp), %ymm9
	vmovapd	%ymm6, 520(%rsp)
	vmovapd	392(%rsp), %ymm6
	vfmadd231pd	-128(%rax), %ymm0, %ymm9
	vfmadd231pd	-128(%r10), %ymm0, %ymm8
	vfmadd231pd	%ymm1, %ymm0, %ymm6
	vfmadd132pd	96(%r8), %ymm5, %ymm14
	vmovupd	64(%rsi), %ymm5
	vfmadd231pd	-96(%rax), %ymm15, %ymm9
	vfmadd231pd	-96(%r10), %ymm15, %ymm8
	vfmadd231pd	32(%r9), %ymm15, %ymm6
	vfmadd213pd	360(%rsp), %ymm13, %ymm0
	vmovapd	%ymm14, 488(%rsp)
	vfmadd231pd	-64(%rax), %ymm5, %ymm9
	vmovupd	96(%rsi), %ymm14
	vfmadd231pd	-64(%r10), %ymm5, %ymm8
	vfmadd231pd	64(%r9), %ymm5, %ymm6
	vfmadd231pd	%ymm12, %ymm15, %ymm0
	vfmadd231pd	-32(%rax), %ymm14, %ymm9
	subq	$-128, %r9
	vfmadd231pd	-32(%r10), %ymm14, %ymm8
	vfmadd231pd	-32(%r9), %ymm14, %ymm6
	vfmadd132pd	64(%r8), %ymm0, %ymm5
	vmovupd	64(%rdi), %ymm0
	vmovapd	%ymm9, 456(%rsp)
	vmovapd	%ymm8, 424(%rsp)
	vmovapd	%ymm6, 392(%rsp)
	vmovupd	(%rdi), %ymm6
	vfmadd132pd	96(%r8), %ymm5, %ymm14
	vfmadd231pd	-128(%rax), %ymm6, %ymm7
	vfmadd132pd	%ymm6, %ymm2, %ymm1
	vfmadd231pd	-128(%r10), %ymm6, %ymm3
	vfmadd132pd	%ymm13, %ymm4, %ymm6
	vmovupd	32(%rdi), %ymm5
	vmovapd	%ymm7, %ymm2
	vfmadd231pd	-96(%rax), %ymm5, %ymm2
	vfmadd231pd	-96(%r9), %ymm5, %ymm1
	vfmadd231pd	-96(%r10), %ymm5, %ymm3
	vfmadd132pd	%ymm12, %ymm6, %ymm5
	vmovupd	96(%rdi), %ymm8
	vfmadd231pd	-64(%rax), %ymm0, %ymm2
	vfmadd231pd	-64(%r9), %ymm0, %ymm1
	vfmadd231pd	-64(%r10), %ymm0, %ymm3
	vfmadd132pd	64(%r8), %ymm5, %ymm0
	vmovapd	%ymm8, %ymm4
	vmovapd	%ymm2, %ymm7
	vmovapd	%ymm1, %ymm2
	vfmadd231pd	-32(%rax), %ymm8, %ymm7
	vfmadd132pd	96(%r8), %ymm0, %ymm4
	vfmadd231pd	-32(%r10), %ymm8, %ymm3
	vfmadd231pd	-32(%r9), %ymm8, %ymm2
	vmovapd	%ymm14, 360(%rsp)
	subq	$-128, %r8
	subq	$-128, %rdx
	subq	$-128, %rcx
	subq	$-128, %rsi
	subq	$-128, %rdi
	cmpq	%rax, %r13
	jne	.L749
	vmovapd	424(%rsp), %ymm1
	vhaddpd	%xmm14, %xmm14, %xmm12
	vextractf128	$0x1, %ymm1, %xmm0
	vhaddpd	%xmm1, %xmm1, %xmm6
	vmovapd	392(%rsp), %ymm1
	vmovhpd	%xmm0, 424(%rsp)
	vmovlpd	%xmm0, 360(%rsp)
	vextractf128	$0x1, %ymm1, %xmm0
	vmovhpd	%xmm0, 392(%rsp)
	vmovlpd	%xmm0, 296(%rsp)
	vextractf128	$0x1, %ymm14, %xmm0
	vmovhpd	%xmm0, 288(%rsp)
	vmovlpd	%xmm0, 272(%rsp)
	vextractf128	$0x1, %ymm7, %xmm0
	vmovhpd	%xmm0, 264(%rsp)
	vmovlpd	%xmm0, 256(%rsp)
	vextractf128	$0x1, %ymm3, %xmm0
	vmovhpd	%xmm0, 248(%rsp)
	vmovlpd	%xmm0, 240(%rsp)
	vmovq	%xmm6, %rax
	vextractf128	$0x1, %ymm2, %xmm0
	vmovapd	488(%rsp), %ymm6
	vmovhpd	%xmm0, 232(%rsp)
	vmovsd	%xmm0, %xmm0, %xmm13
	vextractf128	$0x1, %ymm9, %xmm0
	vhaddpd	%xmm6, %xmm6, %xmm5
	vmovlpd	%xmm0, 456(%rsp)
	vmovhpd	%xmm0, 216(%rsp)
	vextractf128	$0x1, %ymm6, %xmm0
	vmovapd	520(%rsp), %ymm6
	vmovlpd	%xmm0, 488(%rsp)
	vmovhpd	%xmm0, 208(%rsp)
	vextractf128	$0x1, %ymm6, %xmm0
	vmovlpd	%xmm0, 520(%rsp)
	vmovhpd	%xmm0, 200(%rsp)
	vmovapd	552(%rsp), %ymm0
	vmovapd	584(%rsp), %ymm14
	vmovq	%xmm5, %rdx
	vhaddpd	%xmm6, %xmm6, %xmm5
	vhaddpd	%xmm0, %xmm0, %xmm6
	vextractf128	$0x1, %ymm0, %xmm0
	vmovlpd	%xmm0, 552(%rsp)
	vmovhpd	%xmm0, 192(%rsp)
	vhaddpd	%xmm14, %xmm14, %xmm0
	vhaddpd	%xmm1, %xmm1, %xmm1
	vhaddpd	%xmm9, %xmm9, %xmm15
	vmovq	%xmm0, %rcx
	vextractf128	$0x1, %ymm14, %xmm0
	vmovlpd	%xmm0, 584(%rsp)
	vmovhpd	%xmm0, 184(%rsp)
	vmovapd	616(%rsp), %ymm0
	vmovsd	%xmm1, 280(%rsp)
	vhaddpd	%xmm0, %xmm0, %xmm8
	vextractf128	$0x1, %ymm4, %xmm1
	vextractf128	$0x1, %ymm0, %xmm0
	vmovhpd	%xmm1, 224(%rsp)
	vmovlpd	%xmm0, 616(%rsp)
	vmovhpd	%xmm0, 176(%rsp)
	vmovapd	648(%rsp), %ymm0
	vhaddpd	%xmm7, %xmm7, %xmm7
	vhaddpd	%xmm0, %xmm0, %xmm9
	vextractf128	$0x1, %ymm0, %xmm0
	vmovlpd	%xmm0, 648(%rsp)
	vmovhpd	%xmm0, 168(%rsp)
	vhaddpd	%xmm11, %xmm11, %xmm0
	vhaddpd	%xmm4, %xmm4, %xmm4
	vhaddpd	%xmm3, %xmm3, %xmm3
	vmovq	%xmm0, %rsi
	vhaddpd	%xmm2, %xmm2, %xmm14
	vextractf128	$0x1, %ymm11, %xmm0
	vmovlpd	%xmm0, 160(%rsp)
	vmovhpd	%xmm0, 152(%rsp)
	vextractf128	$0x1, %ymm10, %xmm0
	vhaddpd	%xmm10, %xmm10, %xmm11
	vmovhpd	%xmm0, 144(%rsp)
	vmovsd	%xmm0, %xmm0, %xmm10
	vmovsd	%xmm7, 136(%rsp)
	vmovsd	%xmm4, 128(%rsp)
	vmovsd	%xmm3, 120(%rsp)
.L756:
	vmovq	%rsi, %xmm4
	vaddsd	160(%rsp), %xmm4, %xmm4
	vmovsd	264(%rsp), %xmm3
	vaddsd	648(%rsp), %xmm9, %xmm9
	vmovq	%xmm4, %r13
	vmovq	%rcx, %xmm4
	vaddsd	584(%rsp), %xmm4, %xmm4
	movl	324(%rsp), %ecx
	vaddsd	616(%rsp), %xmm8, %xmm8
	vmovq	%xmm4, %r10
	vmovq	%rdx, %xmm4
	vaddsd	488(%rsp), %xmm4, %xmm4
	vaddsd	%xmm10, %xmm11, %xmm11
	vaddsd	552(%rsp), %xmm6, %xmm6
	vmovq	%xmm4, %r8
	vaddsd	456(%rsp), %xmm15, %xmm4
	vaddsd	520(%rsp), %xmm5, %xmm5
	vaddsd	288(%rsp), %xmm12, %xmm12
	vmovsd	%xmm4, %xmm4, %xmm15
	vmovq	%rax, %xmm4
	vaddsd	424(%rsp), %xmm4, %xmm4
	vaddsd	232(%rsp), %xmm13, %xmm13
	vmovsd	%xmm4, 584(%rsp)
	vmovsd	392(%rsp), %xmm4
	vaddsd	296(%rsp), %xmm4, %xmm4
	vmovq	%xmm4, %r14
	vaddsd	256(%rsp), %xmm3, %xmm4
	vmovsd	%xmm4, 648(%rsp)
	vmovsd	248(%rsp), %xmm4
	vaddsd	240(%rsp), %xmm4, %xmm3
	vmovq	%xmm3, %r9
	vaddsd	224(%rsp), %xmm1, %xmm3
	vmovsd	%xmm3, 616(%rsp)
	cmpl	%ecx, 356(%rsp)
	jle	.L754
	movq	112(%rsp), %rcx
	movslq	308(%rsp), %rdx
	movslq	324(%rsp), %rax
	leaq	(%rcx,%rdx,8), %rdi
	movslq	312(%rsp), %rdx
	movq	%r10, 488(%rsp)
	leaq	(%rcx,%rdx,8), %rsi
	movslq	316(%rsp), %rdx
	movq	%rsi, %r10
	leaq	(%rcx,%rdx,8), %rdx
	movq	%rdx, 552(%rsp)
	movslq	320(%rsp), %rdx
	vmovsd	%xmm5, 520(%rsp)
	leaq	(%rcx,%rdx,8), %rdx
	movq	552(%rsp), %rcx
	movq	%rdx, %rsi
	.p2align 4,,10
	.p2align 3
.L753:
	movq	344(%rsp), %rdx
	vmovsd	(%rdi,%rax,8), %xmm4
	vmovsd	(%rdx,%rax,8), %xmm7
	vmovsd	%xmm4, %xmm4, %xmm10
	vfmadd213sd	(%rbx), %xmm7, %xmm10
	movq	336(%rsp), %rdx
	vmovsd	(%r10,%rax,8), %xmm3
	vmovsd	(%rdx,%rax,8), %xmm5
	movq	328(%rsp), %rdx
	vmovsd	(%rcx,%rax,8), %xmm2
	vmovsd	(%rdx,%rax,8), %xmm0
	vmovsd	(%rsi,%rax,8), %xmm1
	vmovsd	%xmm10, (%rbx)
	vmovsd	%xmm3, %xmm3, %xmm10
	vfmadd213sd	8(%rbx), %xmm7, %xmm10
	incq	%rax
	vmovsd	%xmm10, 8(%rbx)
	vmovsd	%xmm2, %xmm2, %xmm10
	vfmadd213sd	16(%rbx), %xmm7, %xmm10
	vfmadd213sd	24(%rbx), %xmm1, %xmm7
	vmovsd	%xmm10, 16(%rbx)
	vmovsd	%xmm7, 24(%rbx)
	vmovsd	%xmm4, %xmm4, %xmm7
	vfmadd213sd	(%r12), %xmm5, %xmm7
	vmovsd	%xmm7, (%r12)
	vmovsd	%xmm3, %xmm3, %xmm7
	vfmadd213sd	8(%r12), %xmm5, %xmm7
	vmovsd	%xmm7, 8(%r12)
	vmovsd	%xmm2, %xmm2, %xmm7
	vfmadd213sd	16(%r12), %xmm5, %xmm7
	vfmadd213sd	24(%r12), %xmm1, %xmm5
	vmovsd	%xmm7, 16(%r12)
	vmovsd	%xmm5, 24(%r12)
	vmovsd	%xmm4, %xmm4, %xmm5
	vfmadd213sd	(%r11), %xmm0, %xmm5
	vmovsd	%xmm5, (%r11)
	vmovsd	%xmm3, %xmm3, %xmm5
	vfmadd213sd	8(%r11), %xmm0, %xmm5
	vmovsd	%xmm5, 8(%r11)
	vmovsd	%xmm2, %xmm2, %xmm5
	vfmadd213sd	16(%r11), %xmm0, %xmm5
	vmovsd	%xmm5, 16(%r11)
	vmovsd	%xmm1, %xmm1, %xmm5
	vfmadd213sd	24(%r11), %xmm0, %xmm5
	vmovsd	%xmm5, 24(%r11)
	vfmadd213sd	(%r15), %xmm0, %xmm4
	vfmadd213sd	8(%r15), %xmm0, %xmm3
	vfmadd213sd	16(%r15), %xmm0, %xmm2
	vfmadd213sd	24(%r15), %xmm0, %xmm1
	vmovsd	%xmm4, (%r15)
	vmovsd	%xmm3, 8(%r15)
	vmovsd	%xmm2, 16(%r15)
	vmovsd	%xmm1, 24(%r15)
	cmpl	%eax, 356(%rsp)
	jg	.L753
	vmovsd	520(%rsp), %xmm5
	movq	488(%rsp), %r10
.L754:
	vmovsd	144(%rsp), %xmm3
	vmovsd	152(%rsp), %xmm4
	vaddsd	(%rbx), %xmm3, %xmm1
	vmovq	%r13, %xmm3
	vmovsd	280(%rsp), %xmm2
	vaddsd	%xmm11, %xmm1, %xmm1
	addq	$32, %rbx
	addq	$32, %r12
	vmovsd	%xmm1, -32(%rbx)
	vaddsd	-24(%rbx), %xmm4, %xmm1
	vmovsd	168(%rsp), %xmm4
	addq	$32, %r11
	vaddsd	%xmm3, %xmm1, %xmm1
	vmovsd	176(%rsp), %xmm3
	addq	$32, %r15
	vmovsd	%xmm1, -24(%rbx)
	vaddsd	-16(%rbx), %xmm4, %xmm1
	vmovsd	184(%rsp), %xmm4
	vaddsd	%xmm9, %xmm1, %xmm1
	vmovsd	%xmm1, -16(%rbx)
	vaddsd	-8(%rbx), %xmm3, %xmm1
	vmovq	%r10, %xmm3
	vaddsd	%xmm8, %xmm1, %xmm1
	vmovsd	%xmm1, -8(%rbx)
	vaddsd	-32(%r12), %xmm4, %xmm1
	vmovsd	192(%rsp), %xmm4
	vaddsd	%xmm3, %xmm1, %xmm1
	vmovsd	200(%rsp), %xmm3
	vmovsd	%xmm1, -32(%r12)
	vaddsd	-24(%r12), %xmm4, %xmm1
	vmovsd	208(%rsp), %xmm4
	vaddsd	%xmm6, %xmm1, %xmm1
	vmovsd	%xmm1, -24(%r12)
	vaddsd	-16(%r12), %xmm3, %xmm1
	vmovq	%r8, %xmm3
	vaddsd	%xmm5, %xmm1, %xmm1
	vmovsd	%xmm1, -16(%r12)
	vaddsd	-8(%r12), %xmm4, %xmm1
	vmovsd	216(%rsp), %xmm4
	vaddsd	%xmm3, %xmm1, %xmm1
	vmovsd	%xmm1, -8(%r12)
	vaddsd	-32(%r11), %xmm4, %xmm1
	vmovsd	360(%rsp), %xmm4
	vaddsd	%xmm15, %xmm1, %xmm1
	vmovsd	%xmm1, -32(%r11)
	vaddsd	-24(%r11), %xmm4, %xmm1
	vmovq	%r14, %xmm4
	vaddsd	584(%rsp), %xmm1, %xmm0
	vmovsd	%xmm0, -24(%r11)
	vaddsd	-16(%r11), %xmm2, %xmm0
	vmovsd	272(%rsp), %xmm3
	vmovsd	136(%rsp), %xmm2
	vaddsd	%xmm4, %xmm0, %xmm0
	vmovsd	128(%rsp), %xmm4
	movl	304(%rsp), %eax
	vmovsd	%xmm0, -16(%r11)
	vaddsd	-8(%r11), %xmm3, %xmm0
	vmovsd	120(%rsp), %xmm3
	addl	%eax, 308(%rsp)
	vaddsd	%xmm12, %xmm0, %xmm0
	addl	%eax, 312(%rsp)
	addl	%eax, 316(%rsp)
	vmovsd	%xmm0, -8(%r11)
	vaddsd	-32(%r15), %xmm2, %xmm0
	vmovq	%r9, %xmm2
	addl	%eax, 320(%rsp)
	vaddsd	648(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -32(%r15)
	vaddsd	-24(%r15), %xmm3, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, -24(%r15)
	vaddsd	-16(%r15), %xmm14, %xmm0
	vaddsd	%xmm13, %xmm0, %xmm0
	vmovsd	%xmm0, -16(%r15)
	vaddsd	-8(%r15), %xmm4, %xmm0
	vaddsd	616(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -8(%r15)
	cmpq	%rbx, 104(%rsp)
	jne	.L751
.L752:
	movl	12(%rsp), %ebx
	cmpl	%ebx, 8(%rsp)
	jge	.L757
	movslq	36(%rsp), %rdi
	movq	-48(%rsp), %rax
	movq	24(%rsp), %rbx
	addq	%rdi, %rax
	leaq	(%rbx,%rax,8), %rcx
	movq	-56(%rsp), %rax
	movslq	352(%rsp), %rdx
	addq	%rdi, %rax
	leaq	8(%rbx,%rax,8), %rax
	movq	16(%rsp), %rbx
	movslq	32(%rsp), %r13
	leaq	(%rbx,%rdx,8), %r9
	movq	%rdx, 584(%rsp)
	movslq	60(%rsp), %rdx
	movq	%rax, 488(%rsp)
	movslq	44(%rsp), %rax
	leaq	(%rbx,%rdx,8), %r8
	movq	%r13, %r12
	movq	%rdx, 616(%rsp)
	movslq	40(%rsp), %rdx
	movslq	52(%rsp), %r15
	movslq	56(%rsp), %rsi
	subq	%rdi, %r12
	subq	%rdi, %rax
	subq	%rdi, %rdx
	movq	%r12, 424(%rsp)
	movq	%rax, 392(%rsp)
	leaq	(%rbx,%r15,8), %r11
	leaq	(%rbx,%rsi,8), %r10
	movq	%rsi, 552(%rsp)
	movq	%rdx, 456(%rsp)
	movq	%r15, 520(%rsp)
	movq	%rbx, %rdx
	movl	-28(%rsp), %esi
	movl	56(%rsp), %r13d
	movl	60(%rsp), %r15d
	movl	52(%rsp), %r14d
	movq	112(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L758:
	movl	356(%rsp), %edi
	testl	%edi, %edi
	jle	.L797
	cmpl	$2, 84(%rsp)
	jbe	.L778
	vxorpd	%xmm1, %xmm1, %xmm1
	movslq	%esi, %rax
	movq	64(%rsp), %r12
	leaq	(%rbx,%rax,8), %rdi
	vmovapd	%ymm1, %ymm4
	xorl	%eax, %eax
	vmovapd	%ymm1, %ymm3
	vmovapd	%ymm1, %ymm2
	.p2align 4,,10
	.p2align 3
.L760:
	vmovupd	(%rdi,%rax), %ymm0
	vfmadd231pd	(%r11,%rax), %ymm0, %ymm2
	vfmadd231pd	(%r10,%rax), %ymm0, %ymm3
	vfmadd231pd	(%r9,%rax), %ymm0, %ymm4
	vfmadd231pd	(%r8,%rax), %ymm0, %ymm1
	addq	$32, %rax
	cmpq	%r12, %rax
	jne	.L760
	vextractf128	$0x1, %ymm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	movl	80(%rsp), %eax
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm1
	vextractf128	$0x1, %ymm4, %xmm0
	vaddpd	%xmm4, %xmm0, %xmm0
	movl	%eax, %edi
	vunpckhpd	%xmm0, %xmm0, %xmm4
	vaddpd	%xmm0, %xmm4, %xmm4
	vextractf128	$0x1, %ymm3, %xmm0
	vaddpd	%xmm3, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm3
	vaddpd	%xmm0, %xmm3, %xmm3
	vextractf128	$0x1, %ymm2, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm2
	cmpl	%eax, 356(%rsp)
	je	.L765
.L759:
	movl	356(%rsp), %r12d
	subl	%edi, %r12d
	movl	%r12d, 648(%rsp)
	cmpl	$1, %r12d
	je	.L762
	movslq	%esi, %r12
	addq	%rdi, %r12
	vmovupd	(%rbx,%r12,8), %xmm0
	movq	520(%rsp), %r12
	addq	%rdi, %r12
	vmulpd	(%rdx,%r12,8), %xmm0, %xmm6
	movq	552(%rsp), %r12
	addq	%rdi, %r12
	vmulpd	(%rdx,%r12,8), %xmm0, %xmm7
	movq	584(%rsp), %r12
	addq	%rdi, %r12
	addq	616(%rsp), %rdi
	vmulpd	(%rdx,%r12,8), %xmm0, %xmm8
	vmulpd	(%rdx,%rdi,8), %xmm0, %xmm0
	movl	648(%rsp), %r12d
	movl	%r12d, %edi
	andl	$-2, %edi
	vunpckhpd	%xmm0, %xmm0, %xmm5
	vaddpd	%xmm0, %xmm5, %xmm0
	addl	%edi, %eax
	vaddsd	%xmm0, %xmm1, %xmm1
	vunpckhpd	%xmm8, %xmm8, %xmm0
	vaddpd	%xmm8, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm4, %xmm4
	vunpckhpd	%xmm7, %xmm7, %xmm0
	vaddpd	%xmm7, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm3, %xmm3
	vunpckhpd	%xmm6, %xmm6, %xmm0
	vaddpd	%xmm6, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r12d, %edi
	je	.L765
.L762:
	leal	(%rsi,%rax), %edi
	movslq	%edi, %rdi
	vmovsd	(%rbx,%rdi,8), %xmm0
	leal	(%r14,%rax), %edi
	movslq	%edi, %rdi
	vfmadd231sd	(%rdx,%rdi,8), %xmm0, %xmm2
	leal	0(%r13,%rax), %edi
	movslq	%edi, %rdi
	vfmadd231sd	(%rdx,%rdi,8), %xmm0, %xmm3
	movl	352(%rsp), %edi
	addl	%eax, %edi
	addl	%r15d, %eax
	movslq	%edi, %rdi
	cltq
	vfmadd231sd	(%rdx,%rdi,8), %xmm0, %xmm4
	vfmadd231sd	(%rdx,%rax,8), %xmm0, %xmm1
.L765:
	movq	424(%rsp), %rax
	addl	356(%rsp), %esi
	vaddsd	(%rcx,%rax,8), %xmm2, %xmm2
	vmovsd	%xmm2, (%rcx,%rax,8)
	movq	456(%rsp), %rax
	vaddsd	(%rcx,%rax,8), %xmm3, %xmm3
	vmovsd	%xmm3, (%rcx,%rax,8)
	movq	392(%rsp), %rax
	vaddsd	(%rcx,%rax,8), %xmm4, %xmm4
	vmovsd	%xmm4, (%rcx,%rax,8)
	vaddsd	(%rcx), %xmm1, %xmm1
	addq	$8, %rcx
	vmovsd	%xmm1, -8(%rcx)
	cmpq	%rcx, 488(%rsp)
	jne	.L758
.L757:
	addl	$4, 48(%rsp)
	movl	-24(%rsp), %eax
	addl	%eax, 32(%rsp)
	addl	%eax, 36(%rsp)
	addl	%eax, 40(%rsp)
	addl	%eax, 44(%rsp)
	movl	48(%rsp), %ebx
	movl	304(%rsp), %eax
	addl	%eax, 52(%rsp)
	addl	%eax, 56(%rsp)
	addl	%eax, 352(%rsp)
	addl	%eax, 60(%rsp)
	cmpl	%ebx, -4(%rsp)
	jg	.L748
	movq	16(%rsp), %r15
	movq	112(%rsp), %r14
.L747:
	addq	$64, (%rsp)
	movl	-80(%rsp), %ebx
	addl	%ebx, -12(%rsp)
	movq	(%rsp), %rax
	cmpl	%eax, 8(%rsp)
	jg	.L766
.L767:
	movl	-92(%rsp), %ebx
	addl	%ebx, -72(%rsp)
	movl	-80(%rsp), %ebx
	addl	%ebx, -68(%rsp)
	movl	-64(%rsp), %ebx
	cmpl	%ebx, -60(%rsp)
	jg	.L744
.L745:
	movl	-60(%rsp), %eax
	movl	-84(%rsp), %ebx
	cmpl	%ebx, %eax
	jge	.L794
	movl	12(%rsp), %esi
	testl	%esi, %esi
	jle	.L794
	movl	356(%rsp), %ecx
	movl	%esi, %r13d
	imull	%eax, %r13d
	imull	%ecx, %eax
	movl	%eax, %ebx
	leal	-1(%rcx), %eax
	movl	%eax, 616(%rsp)
	movl	%ecx, %eax
	shrl	$2, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, %r12
	movq	24(%rsp), %rax
	andl	$-4, %ecx
	addq	$8, %rax
	movq	%rax, 552(%rsp)
	leal	-1(%rsi), %eax
	movq	%rax, 584(%rsp)
	movl	%ecx, %r11d
.L741:
	movq	24(%rsp), %rcx
	movslq	%r13d, %rax
	leaq	(%rcx,%rax,8), %r9
	movq	552(%rsp), %rcx
	addq	584(%rsp), %rax
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 648(%rsp)
	movslq	%ebx, %r10
	leaq	(%r15,%r10,8), %rsi
	xorl	%ecx, %ecx
.L776:
	movl	356(%rsp), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	testl	%eax, %eax
	jle	.L775
	cmpl	$2, 616(%rsp)
	jbe	.L779
	movslq	%ecx, %rax
	leaq	(%r14,%rax,8), %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
.L769:
	vmovupd	(%rdx,%rax), %ymm2
	vfmadd231pd	(%rsi,%rax), %ymm2, %ymm0
	addq	$32, %rax
	cmpq	%rax, %r12
	jne	.L769
	vextractf128	$0x1, %ymm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	cmpl	%r11d, 356(%rsp)
	je	.L775
	movl	%r11d, %edx
	movl	%r11d, %eax
.L768:
	movl	356(%rsp), %r8d
	subl	%edx, %r8d
	cmpl	$1, %r8d
	je	.L771
	movslq	%ecx, %rdi
	addq	%rdx, %rdi
	addq	%r10, %rdx
	vmovupd	(%r15,%rdx,8), %xmm2
	movl	%r8d, %edx
	vmulpd	(%r14,%rdi,8), %xmm2, %xmm2
	andl	$-2, %edx
	addl	%edx, %eax
	vunpckhpd	%xmm2, %xmm2, %xmm1
	vaddpd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%r8d, %edx
	je	.L775
.L771:
	leal	(%rcx,%rax), %edx
	movslq	%edx, %rdx
	vmovsd	(%r14,%rdx,8), %xmm2
	addl	%ebx, %eax
	cltq
	vfmadd231sd	(%r15,%rax,8), %xmm2, %xmm0
.L775:
	vmovsd	%xmm0, (%r9)
	addq	$8, %r9
	addl	356(%rsp), %ecx
	cmpq	648(%rsp), %r9
	jne	.L776
	incl	-60(%rsp)
	addl	12(%rsp), %r13d
	addl	356(%rsp), %ebx
	movl	-60(%rsp), %eax
	cmpl	%eax, -84(%rsp)
	jne	.L741
.L794:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L796:
	.cfi_restore_state
	vxorpd	%xmm14, %xmm14, %xmm14
	vmovsd	%xmm14, 120(%rsp)
	vmovsd	%xmm14, 128(%rsp)
	vmovsd	%xmm14, 136(%rsp)
	vmovsd	%xmm14, 144(%rsp)
	vmovsd	%xmm14, 152(%rsp)
	vmovsd	%xmm14, 160(%rsp)
	vmovsd	%xmm14, 168(%rsp)
	vmovsd	%xmm14, 648(%rsp)
	vmovsd	%xmm14, 176(%rsp)
	vmovsd	%xmm14, 616(%rsp)
	vmovsd	%xmm14, 184(%rsp)
	vmovsd	%xmm14, 584(%rsp)
	vmovsd	%xmm14, 192(%rsp)
	vmovsd	%xmm14, 552(%rsp)
	vmovsd	%xmm14, 200(%rsp)
	vmovsd	%xmm14, 520(%rsp)
	vmovsd	%xmm14, 208(%rsp)
	vmovsd	%xmm14, 488(%rsp)
	vmovsd	%xmm14, 216(%rsp)
	vmovsd	%xmm14, 456(%rsp)
	vmovsd	%xmm14, 224(%rsp)
	vmovsd	%xmm14, 232(%rsp)
	vmovsd	%xmm14, 240(%rsp)
	vmovsd	%xmm14, 248(%rsp)
	vmovsd	%xmm14, 256(%rsp)
	vmovsd	%xmm14, 264(%rsp)
	vmovsd	%xmm14, 272(%rsp)
	vmovsd	%xmm14, 280(%rsp)
	vmovsd	%xmm14, 288(%rsp)
	vmovsd	%xmm14, 296(%rsp)
	vmovsd	%xmm14, 392(%rsp)
	vmovsd	%xmm14, 360(%rsp)
	vmovsd	%xmm14, %xmm14, %xmm10
	vmovsd	%xmm14, %xmm14, %xmm11
	vmovq	%xmm14, %rsi
	vmovsd	%xmm14, %xmm14, %xmm9
	vmovsd	%xmm14, %xmm14, %xmm8
	vmovq	%xmm14, %rcx
	vmovsd	%xmm14, %xmm14, %xmm6
	vmovsd	%xmm14, %xmm14, %xmm5
	vmovq	%xmm14, %rdx
	vmovsd	%xmm14, %xmm14, %xmm15
	vmovsd	%xmm14, %xmm14, %xmm1
	vmovsd	%xmm14, %xmm14, %xmm13
	vmovsd	%xmm14, 424(%rsp)
	vmovsd	%xmm14, %xmm14, %xmm12
	vmovq	%xmm14, %rax
	jmp	.L756
	.p2align 4,,10
	.p2align 3
.L797:
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm4
	vmovsd	%xmm1, %xmm1, %xmm3
	vmovsd	%xmm1, %xmm1, %xmm2
	jmp	.L765
.L778:
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%edi, %edi
	xorl	%eax, %eax
	vmovsd	%xmm1, %xmm1, %xmm4
	vmovsd	%xmm1, %xmm1, %xmm3
	vmovsd	%xmm1, %xmm1, %xmm2
	jmp	.L759
.L779:
	xorl	%edx, %edx
	xorl	%eax, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	jmp	.L768
	.cfi_endproc
.LFE10943:
	.size	_Z6mul_stPdS_S_iii, .-_Z6mul_stPdS_S_iii
	.p2align 4
	.globl	_Z10mul_st_f32PfS_S_iii
	.type	_Z10mul_st_f32PfS_S_iii, @function
_Z10mul_st_f32PfS_S_iii:
.LFB10946:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rdi, %r15
	pushq	%r14
	.cfi_offset 14, -32
	movl	%r8d, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$928, %rsp
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%ecx, 52(%rsp)
	imull	%r9d, %ecx
	movq	%rsi, 232(%rsp)
	movq	%rdx, 152(%rsp)
	movslq	%ecx, %rbx
	movl	%ebx, %r12d
	andl	$-8, %r12d
	movslq	%r12d, %r12
	movl	%r9d, 148(%rsp)
	testq	%r12, %r12
	je	.L799
	movq	%rdx, %rdi
	xorl	%esi, %esi
	leaq	0(,%r12,4), %rdx
	call	memset@PLT
.L799:
	cmpq	%rbx, %r12
	jnb	.L803
	movq	152(%rsp), %rax
	subq	%r12, %rbx
	leaq	0(,%rbx,4), %rdx
	leaq	(%rax,%r12,4), %rdi
	xorl	%esi, %esi
	call	memset@PLT
.L803:
	movl	52(%rsp), %eax
	andl	$-4, %eax
	movl	%eax, 68(%rsp)
	jle	.L802
	movl	148(%rsp), %eax
	movl	%r14d, %esi
	movl	%eax, %ecx
	andl	$-4, %ecx
	movl	%ecx, %edi
	movl	%ecx, 144(%rsp)
	movl	%eax, %ecx
	sall	$8, %ecx
	leal	(%rax,%rax), %edx
	movl	%ecx, 36(%rsp)
	movl	%eax, %ecx
	movl	%r14d, %eax
	sall	$8, %eax
	movl	%eax, 48(%rsp)
	leal	0(,%rcx,4), %eax
	movl	%eax, 112(%rsp)
	leal	0(,%r14,4), %eax
	andl	$-32, %esi
	movl	%eax, 240(%rsp)
	leal	(%r14,%r14), %eax
	movl	%eax, 128(%rsp)
	leal	-1(%rsi), %eax
	shrl	$5, %eax
	salq	$5, %rax
	movq	%rax, 200(%rsp)
	movl	%edi, %eax
	imull	%r14d, %eax
	movl	%esi, 632(%rsp)
	movslq	%edi, %rsi
	movl	%eax, 96(%rsp)
	leal	-1(%r14), %eax
	movl	%eax, 208(%rsp)
	movl	%r14d, %eax
	shrl	$3, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, 88(%rsp)
	movl	%r14d, %eax
	andl	$-8, %eax
	movl	%eax, 188(%rsp)
	leal	-1(%rcx), %eax
	subl	%edi, %eax
	addq	%rsi, %rax
	movl	%edx, 40(%rsp)
	movl	%r14d, 60(%rsp)
	movl	%edx, 56(%rsp)
	movl	$0, 64(%rsp)
	movq	%rsi, 80(%rsp)
	movq	%rax, 72(%rsp)
	movl	%r14d, 636(%rsp)
.L808:
	movl	64(%rsp), %ecx
	movl	68(%rsp), %edi
	movl	%ecx, %eax
	addl	$255, %eax
	movl	%ecx, 44(%rsp)
	addl	$256, %ecx
	cmpl	%eax, %edi
	movl	%edi, %eax
	cmovg	%ecx, %eax
	movl	144(%rsp), %edx
	movl	%ecx, 64(%rsp)
	movl	%eax, 132(%rsp)
	testl	%edx, %edx
	jle	.L830
	movl	56(%rsp), %eax
	movq	$0, 136(%rsp)
	subl	40(%rsp), %eax
	movl	%eax, 28(%rsp)
	movl	128(%rsp), %eax
	addl	60(%rsp), %eax
	movl	%eax, 32(%rsp)
	movl	636(%rsp), %eax
	movl	%eax, 124(%rsp)
.L829:
	movq	136(%rsp), %r14
	movl	144(%rsp), %ecx
	movl	%r14d, %eax
	leal	255(%r14), %edx
	addl	$256, %eax
	cmpl	%edx, %ecx
	cmovle	%ecx, %eax
	movl	44(%rsp), %r11d
	movl	%eax, 120(%rsp)
	cmpl	%r11d, 132(%rsp)
	jle	.L810
	movl	56(%rsp), %ecx
	subl	%r14d, %eax
	movl	148(%rsp), %esi
	decl	%eax
	movl	%ecx, %edi
	shrl	$2, %eax
	subl	%esi, %edi
	salq	$2, %rax
	movl	%edi, 168(%rsp)
	movq	%rax, 104(%rsp)
	movl	%esi, %edi
	movl	32(%rsp), %eax
	addl	%ecx, %edi
	movl	%edi, 172(%rsp)
	movl	%eax, 252(%rsp)
	movl	60(%rsp), %edi
	movl	28(%rsp), %eax
	movl	128(%rsp), %edx
	movl	%eax, 160(%rsp)
	movl	%edi, %esi
	movq	232(%rsp), %rax
	subl	636(%rsp), %esi
	movl	%edx, %ebx
	addl	%esi, %ebx
	addl	124(%rsp), %edx
	subq	$-128, %rax
	movl	%esi, 212(%rsp)
	movl	%ebx, 248(%rsp)
	movl	%r14d, 116(%rsp)
	movl	%edx, 100(%rsp)
	movl	%edi, 244(%rsp)
	movl	%ecx, 164(%rsp)
	movl	%r11d, 184(%rsp)
	movq	%rax, 192(%rsp)
	movq	%r15, 176(%rsp)
	.p2align 4,,10
	.p2align 3
.L811:
	movl	116(%rsp), %ecx
	cmpl	%ecx, 120(%rsp)
	jle	.L815
	movq	136(%rsp), %rcx
	movslq	160(%rsp), %rax
	movq	152(%rsp), %rsi
	leaq	(%rcx,%rax), %rdx
	leaq	(%rsi,%rdx,4), %r12
	movslq	164(%rsp), %rdx
	movslq	168(%rsp), %rdi
	addq	%rcx, %rdx
	leaq	(%rsi,%rdx,4), %r15
	movslq	172(%rsp), %rdx
	addq	%rcx, %rdi
	addq	%rcx, %rdx
	leaq	(%rsi,%rdi,4), %rbx
	movq	%rcx, %rdi
	movl	124(%rsp), %ecx
	movl	128(%rsp), %r14d
	leaq	(%rsi,%rdx,4), %r11
	movl	%ecx, %edx
	subl	636(%rsp), %edx
	addq	104(%rsp), %rdi
	addl	%edx, %r14d
	movl	%edx, 592(%rsp)
	movq	%rdi, %rdx
	addq	%rax, %rdx
	leaq	16(%rsi,%rdx,4), %rax
	movq	176(%rsp), %rdi
	movq	%rax, 224(%rsp)
	movslq	212(%rsp), %rax
	movl	%r14d, 600(%rsp)
	leaq	(%rdi,%rax,4), %rax
	movq	%rax, 608(%rsp)
	movslq	244(%rsp), %rax
	movl	%ecx, 596(%rsp)
	leaq	(%rdi,%rax,4), %rax
	movq	%rax, 616(%rsp)
	movslq	248(%rsp), %rax
	leaq	(%rdi,%rax,4), %rax
	movq	%rax, 216(%rsp)
	movslq	252(%rsp), %rax
	leaq	(%rdi,%rax,4), %rax
	movq	%rax, 624(%rsp)
	movl	100(%rsp), %eax
	movl	%eax, 604(%rsp)
	.p2align 4,,10
	.p2align 3
.L814:
	movl	632(%rsp), %eax
	testl	%eax, %eax
	jle	.L856
	movq	232(%rsp), %rsi
	movslq	596(%rsp), %rcx
	movslq	592(%rsp), %rdx
	leaq	(%rsi,%rcx,4), %r10
	movslq	600(%rsp), %rcx
	leaq	(%rsi,%rdx,4), %rax
	leaq	(%rsi,%rcx,4), %r9
	movslq	604(%rsp), %rcx
	addq	200(%rsp), %rdx
	leaq	(%rsi,%rcx,4), %r8
	movq	192(%rsp), %rsi
	vxorps	%xmm3, %xmm3, %xmm3
	leaq	(%rsi,%rdx,4), %r13
	movq	624(%rsp), %rdi
	movq	216(%rsp), %rsi
	movq	616(%rsp), %rcx
	movq	608(%rsp), %rdx
	vmovaps	%ymm3, %ymm4
	vmovaps	%ymm3, %ymm5
	vmovaps	%ymm3, %ymm6
	vmovaps	%ymm3, 640(%rsp)
	vmovaps	%ymm3, 672(%rsp)
	vmovaps	%ymm3, 704(%rsp)
	vmovaps	%ymm3, 736(%rsp)
	vmovaps	%ymm3, 768(%rsp)
	vmovaps	%ymm3, 800(%rsp)
	vmovaps	%ymm3, 832(%rsp)
	vmovaps	%ymm3, 864(%rsp)
	vmovaps	%ymm3, 896(%rsp)
	vmovaps	%ymm3, %ymm9
	vmovaps	%ymm3, %ymm11
	vmovaps	%ymm3, %ymm10
	.p2align 4,,10
	.p2align 3
.L812:
	vmovups	(%r9), %ymm1
	vmovups	(%r8), %ymm13
	vmovups	(%rdx), %ymm0
	vmovups	32(%rdx), %ymm8
	vfmadd231ps	(%rax), %ymm0, %ymm10
	vfmadd231ps	(%r10), %ymm0, %ymm11
	vfmadd231ps	%ymm1, %ymm0, %ymm9
	vfmadd213ps	896(%rsp), %ymm13, %ymm0
	vmovups	64(%rdx), %ymm2
	vfmadd231ps	32(%rax), %ymm8, %ymm10
	vfmadd231ps	32(%r10), %ymm8, %ymm11
	vfmadd231ps	32(%r9), %ymm8, %ymm9
	vfmadd231ps	32(%r8), %ymm8, %ymm0
	vmovups	96(%rdx), %ymm7
	vfmadd231ps	64(%rax), %ymm2, %ymm10
	vfmadd231ps	64(%r10), %ymm2, %ymm11
	vfmadd231ps	64(%r9), %ymm2, %ymm9
	vfmadd132ps	64(%r8), %ymm0, %ymm2
	vmovaps	864(%rsp), %ymm12
	vfmadd231ps	96(%rax), %ymm7, %ymm10
	vfmadd231ps	96(%r10), %ymm7, %ymm11
	vfmadd231ps	96(%r9), %ymm7, %ymm9
	vfmadd132ps	96(%r8), %ymm2, %ymm7
	vmovups	(%rcx), %ymm0
	vmovaps	832(%rsp), %ymm8
	vfmadd231ps	(%rax), %ymm0, %ymm12
	vfmadd231ps	(%r10), %ymm0, %ymm8
	vmovaps	%ymm7, 896(%rsp)
	vmovaps	800(%rsp), %ymm7
	vmovups	32(%rcx), %ymm15
	vfmadd231ps	%ymm1, %ymm0, %ymm7
	vmovups	64(%rcx), %ymm2
	vmovups	96(%rcx), %ymm14
	vfmadd213ps	768(%rsp), %ymm13, %ymm0
	vfmadd231ps	32(%rax), %ymm15, %ymm12
	vfmadd231ps	32(%r10), %ymm15, %ymm8
	vfmadd231ps	32(%r9), %ymm15, %ymm7
	subq	$-128, %rax
	vfmadd231ps	32(%r8), %ymm15, %ymm0
	vfmadd231ps	-64(%rax), %ymm2, %ymm12
	vfmadd231ps	64(%r10), %ymm2, %ymm8
	vfmadd231ps	64(%r9), %ymm2, %ymm7
	vmovups	32(%rsi), %ymm15
	vfmadd132ps	64(%r8), %ymm0, %ymm2
	vfmadd231ps	-32(%rax), %ymm14, %ymm12
	vfmadd231ps	96(%r10), %ymm14, %ymm8
	vfmadd231ps	96(%r9), %ymm14, %ymm7
	vmovups	(%rsi), %ymm0
	vfmadd132ps	96(%r8), %ymm2, %ymm14
	vmovaps	%ymm12, 864(%rsp)
	vmovaps	%ymm8, 832(%rsp)
	vmovaps	736(%rsp), %ymm12
	vmovaps	704(%rsp), %ymm8
	vmovaps	%ymm7, 800(%rsp)
	vmovaps	672(%rsp), %ymm7
	vfmadd231ps	(%r10), %ymm0, %ymm8
	vfmadd231ps	-128(%rax), %ymm0, %ymm12
	vfmadd231ps	%ymm1, %ymm0, %ymm7
	vfmadd213ps	640(%rsp), %ymm13, %ymm0
	vmovups	64(%rsi), %ymm2
	vfmadd231ps	32(%r10), %ymm15, %ymm8
	vfmadd231ps	-96(%rax), %ymm15, %ymm12
	vfmadd231ps	32(%r9), %ymm15, %ymm7
	vfmadd231ps	32(%r8), %ymm15, %ymm0
	vmovaps	%ymm14, 768(%rsp)
	vfmadd231ps	64(%r10), %ymm2, %ymm8
	vmovups	96(%rsi), %ymm14
	vfmadd231ps	-64(%rax), %ymm2, %ymm12
	vfmadd231ps	64(%r9), %ymm2, %ymm7
	vfmadd132ps	64(%r8), %ymm0, %ymm2
	vfmadd231ps	96(%r10), %ymm14, %ymm8
	vmovups	64(%rdi), %ymm0
	vfmadd231ps	-32(%rax), %ymm14, %ymm12
	vfmadd231ps	96(%r9), %ymm14, %ymm7
	vfmadd132ps	96(%r8), %ymm2, %ymm14
	vmovups	32(%rdi), %ymm2
	vmovaps	%ymm8, 704(%rsp)
	vmovups	96(%rdi), %ymm8
	vmovaps	%ymm7, 672(%rsp)
	vmovups	(%rdi), %ymm7
	vmovaps	%ymm12, 736(%rsp)
	vfmadd231ps	-128(%rax), %ymm7, %ymm6
	vfmadd231ps	(%r10), %ymm7, %ymm5
	vfmadd132ps	%ymm7, %ymm4, %ymm1
	vfmadd132ps	%ymm13, %ymm3, %ymm7
	vmovaps	%ymm14, 640(%rsp)
	vfmadd231ps	-96(%rax), %ymm2, %ymm6
	vfmadd231ps	32(%r10), %ymm2, %ymm5
	vfmadd231ps	32(%r9), %ymm2, %ymm1
	vfmadd132ps	32(%r8), %ymm7, %ymm2
	subq	$-128, %r10
	vmovaps	%ymm6, %ymm3
	vfmadd231ps	-64(%rax), %ymm0, %ymm3
	vmovaps	%ymm5, %ymm4
	vfmadd231ps	-64(%r10), %ymm0, %ymm4
	vfmadd231ps	64(%r9), %ymm0, %ymm1
	vfmadd132ps	64(%r8), %ymm2, %ymm0
	vmovaps	%ymm3, %ymm6
	vmovaps	%ymm8, %ymm3
	vmovaps	%ymm4, %ymm5
	vmovaps	%ymm1, %ymm4
	vfmadd231ps	96(%r9), %ymm8, %ymm4
	vfmadd132ps	96(%r8), %ymm0, %ymm3
	vfmadd231ps	-32(%rax), %ymm8, %ymm6
	vfmadd231ps	-32(%r10), %ymm8, %ymm5
	subq	$-128, %r9
	subq	$-128, %r8
	subq	$-128, %rdx
	subq	$-128, %rcx
	subq	$-128, %rsi
	subq	$-128, %rdi
	cmpq	%rax, %r13
	jne	.L812
	vshufps	$85, %xmm3, %xmm3, %xmm2
	vaddss	%xmm3, %xmm2, %xmm1
	vextractps	$3, %xmm4, 560(%rsp)
	vmovaps	%xmm4, %xmm2
	vmovss	%xmm1, 544(%rsp)
	vextractf128	$0x1, %ymm4, %xmm1
	vmovss	%xmm1, 536(%rsp)
	vextractps	$2, %xmm1, 552(%rsp)
	vextractps	$1, %xmm1, 540(%rsp)
	vextractps	$2, %xmm4, 532(%rsp)
	vextractps	$3, %xmm3, 512(%rsp)
	vextractps	$2, %xmm3, 508(%rsp)
	vextractps	$3, %xmm1, %r9d
	vextractf128	$0x1, %ymm3, %xmm1
	vshufps	$85, %xmm6, %xmm6, %xmm3
	vaddss	%xmm3, %xmm6, %xmm4
	vmovss	%xmm1, 516(%rsp)
	vshufps	$85, %xmm14, %xmm14, %xmm3
	vmovss	%xmm4, 484(%rsp)
	vextractps	$3, %xmm1, 528(%rsp)
	vaddss	%xmm3, %xmm14, %xmm4
	vextractps	$2, %xmm1, 524(%rsp)
	vextractps	$1, %xmm1, 520(%rsp)
	vextractf128	$0x1, %ymm5, %xmm1
	vmovss	%xmm1, 500(%rsp)
	vextractps	$1, %xmm1, 496(%rsp)
	vextractps	$2, %xmm1, 492(%rsp)
	vextractps	$3, %xmm1, 488(%rsp)
	vextractf128	$0x1, %ymm6, %xmm1
	vmovss	%xmm1, 472(%rsp)
	vextractps	$1, %xmm1, 564(%rsp)
	vextractps	$2, %xmm1, 468(%rsp)
	vextractps	$3, %xmm1, 464(%rsp)
	vextractf128	$0x1, %ymm14, %xmm1
	vmovss	%xmm4, 460(%rsp)
	vmovss	%xmm1, 448(%rsp)
	vextractps	$2, %xmm5, 568(%rsp)
	vextractps	$3, %xmm5, 504(%rsp)
	vextractps	$2, %xmm14, 456(%rsp)
	vextractps	$3, %xmm14, 452(%rsp)
	vextractps	$1, %xmm1, 444(%rsp)
	vextractps	$2, %xmm1, 440(%rsp)
	vextractps	$3, %xmm1, 436(%rsp)
	vextractps	$2, %xmm6, 480(%rsp)
	vextractps	$3, %xmm6, 476(%rsp)
	vmovaps	672(%rsp), %ymm6
	vmovaps	800(%rsp), %ymm7
	vshufps	$85, %xmm6, %xmm6, %xmm3
	vaddss	%xmm3, %xmm6, %xmm4
	vextractf128	$0x1, %ymm6, %xmm1
	vextractps	$2, %xmm6, 428(%rsp)
	vextractps	$3, %xmm6, 424(%rsp)
	vmovaps	704(%rsp), %ymm6
	vmovss	%xmm4, 432(%rsp)
	vshufps	$85, %xmm6, %xmm6, %xmm3
	vaddss	%xmm3, %xmm6, %xmm4
	vshufps	$85, %xmm12, %xmm12, %xmm3
	vmovss	%xmm1, 420(%rsp)
	vmovss	%xmm4, 404(%rsp)
	vaddss	%xmm3, %xmm12, %xmm4
	vextractps	$1, %xmm1, 416(%rsp)
	vextractps	$2, %xmm1, 412(%rsp)
	vextractps	$3, %xmm1, 408(%rsp)
	vextractps	$2, %xmm6, 400(%rsp)
	vextractf128	$0x1, %ymm6, %xmm1
	vextractps	$3, %xmm6, 396(%rsp)
	vmovaps	768(%rsp), %ymm6
	vmovss	%xmm4, 380(%rsp)
	vshufps	$85, %xmm6, %xmm6, %xmm4
	vaddss	%xmm4, %xmm6, %xmm4
	vextractf128	$0x1, %ymm12, %xmm3
	vmovaps	%xmm5, %xmm0
	vmovss	%xmm3, 372(%rsp)
	vshufps	$85, %xmm7, %xmm7, %xmm5
	vmovss	%xmm4, 360(%rsp)
	vextractps	$2, %xmm3, 368(%rsp)
	vextractf128	$0x1, %ymm6, %xmm4
	vextractps	$3, %xmm3, 364(%rsp)
	vextractps	$2, %xmm6, 356(%rsp)
	vextractps	$1, %xmm3, %r8d
	vshufps	$255, %xmm6, %xmm6, %xmm3
	vaddss	%xmm5, %xmm7, %xmm6
	vextractf128	$0x1, %ymm7, %xmm5
	vmovss	%xmm1, 392(%rsp)
	vmovss	%xmm4, 352(%rsp)
	vmovss	%xmm6, 800(%rsp)
	vmovss	%xmm5, 332(%rsp)
	vextractps	$1, %xmm1, 556(%rsp)
	vextractps	$2, %xmm1, 388(%rsp)
	vextractps	$3, %xmm1, 384(%rsp)
	vextractps	$2, %xmm12, 376(%rsp)
	vextractps	$1, %xmm4, 348(%rsp)
	vextractps	$2, %xmm4, 344(%rsp)
	vextractps	$3, %xmm4, 340(%rsp)
	vextractps	$2, %xmm7, 336(%rsp)
	vextractps	$1, %xmm5, 328(%rsp)
	vmovaps	832(%rsp), %ymm15
	vextractps	$2, %xmm5, 324(%rsp)
	vshufps	$85, %xmm15, %xmm15, %xmm6
	vaddss	%xmm6, %xmm15, %xmm6
	vextractps	$3, %xmm5, 320(%rsp)
	vextractps	$2, %xmm15, 736(%rsp)
	vmovss	%xmm6, 832(%rsp)
	vshufps	$255, %xmm15, %xmm15, %xmm5
	vextractf128	$0x1, %ymm15, %xmm6
	vmovaps	864(%rsp), %ymm15
	vshufps	$255, %xmm7, %xmm7, %xmm4
	vshufps	$85, %xmm15, %xmm15, %xmm7
	vaddss	%xmm7, %xmm15, %xmm7
	vmovss	%xmm6, 316(%rsp)
	vextractps	$1, %xmm6, 768(%rsp)
	vmovss	%xmm7, 864(%rsp)
	vextractps	$2, %xmm6, 312(%rsp)
	vextractf128	$0x1, %ymm15, %xmm7
	vextractps	$3, %xmm6, 308(%rsp)
	vextractps	$2, %xmm15, 672(%rsp)
	vshufps	$255, %xmm15, %xmm15, %xmm6
	vmovaps	896(%rsp), %ymm15
	vshufps	$85, %xmm9, %xmm9, %xmm13
	vshufps	$85, %xmm15, %xmm15, %xmm8
	vmovss	%xmm7, 304(%rsp)
	vaddss	%xmm8, %xmm15, %xmm14
	vextractps	$1, %xmm7, 704(%rsp)
	vextractf128	$0x1, %ymm15, %xmm8
	vextractps	$2, %xmm7, 300(%rsp)
	vextractps	$3, %xmm7, 296(%rsp)
	vextractps	$2, %xmm15, 588(%rsp)
	vshufps	$255, %xmm15, %xmm15, %xmm7
	vaddss	%xmm13, %xmm9, %xmm15
	vmovss	%xmm8, 292(%rsp)
	vextractps	$1, %xmm8, 640(%rsp)
	vextractps	$2, %xmm8, 288(%rsp)
	vextractps	$3, %xmm8, 284(%rsp)
	vextractps	$2, %xmm9, 280(%rsp)
	vshufps	$255, %xmm9, %xmm9, %xmm8
	vextractf128	$0x1, %ymm9, %xmm9
	vextractf128	$0x1, %ymm10, %xmm13
	vmovss	%xmm9, 276(%rsp)
	vextractps	$1, %xmm9, %edx
	vextractps	$2, %xmm9, %ecx
	vextractps	$3, %xmm9, 272(%rsp)
	vextractf128	$0x1, %ymm11, %xmm9
	vmovss	%xmm14, 896(%rsp)
	vmovss	%xmm15, 580(%rsp)
	vextractps	$3, %xmm11, %eax
	vextractps	$1, %xmm9, %edi
	vextractps	$2, %xmm9, %esi
	vextractps	$3, %xmm10, %r10d
	vextractps	$1, %xmm13, %r13d
	vextractps	$2, %xmm13, %r14d
	vshufps	$255, %xmm12, %xmm12, %xmm1
	vextractps	$3, %xmm9, 268(%rsp)
	vshufps	$85, %xmm11, %xmm11, %xmm12
	vextractps	$3, %xmm13, 264(%rsp)
	vaddss	%xmm12, %xmm11, %xmm14
	vunpckhps	%xmm11, %xmm11, %xmm12
	vmovaps	%xmm9, %xmm11
	vshufps	$85, %xmm10, %xmm10, %xmm9
	vaddss	%xmm9, %xmm10, %xmm15
	vunpckhps	%xmm10, %xmm10, %xmm9
	vmovaps	%xmm13, %xmm10
	vshufps	$85, %xmm2, %xmm2, %xmm13
	vaddss	%xmm2, %xmm13, %xmm2
	vmovss	%xmm2, 260(%rsp)
	vshufps	$85, %xmm0, %xmm0, %xmm2
	vaddss	%xmm0, %xmm2, %xmm2
	vmovss	%xmm2, 256(%rsp)
.L819:
	vmovd	%r14d, %xmm0
	vmovd	%r13d, %xmm2
	vaddss	%xmm0, %xmm2, %xmm2
	vmovd	%esi, %xmm0
	vaddss	%xmm9, %xmm15, %xmm15
	vmovss	%xmm2, 572(%rsp)
	vmovd	%r10d, %xmm2
	vaddss	%xmm10, %xmm2, %xmm13
	vmovd	%edi, %xmm2
	vaddss	%xmm0, %xmm2, %xmm2
	vmovd	%ecx, %xmm0
	vaddss	276(%rsp), %xmm8, %xmm8
	vmovss	%xmm2, 576(%rsp)
	vmovd	%eax, %xmm2
	vaddss	%xmm11, %xmm2, %xmm9
	vmovd	%edx, %xmm2
	vaddss	%xmm0, %xmm2, %xmm2
	vaddss	292(%rsp), %xmm7, %xmm7
	vaddss	304(%rsp), %xmm6, %xmm6
	vmovss	%xmm2, 584(%rsp)
	vmovss	580(%rsp), %xmm2
	vaddss	316(%rsp), %xmm5, %xmm5
	vaddss	280(%rsp), %xmm2, %xmm0
	vaddss	%xmm13, %xmm15, %xmm13
	vaddss	%xmm12, %xmm14, %xmm14
	vaddss	%xmm8, %xmm0, %xmm2
	vaddss	%xmm9, %xmm14, %xmm14
	vmovss	%xmm2, 580(%rsp)
	vmovss	640(%rsp), %xmm2
	vaddss	288(%rsp), %xmm2, %xmm2
	vmovss	%xmm2, 640(%rsp)
	vmovss	896(%rsp), %xmm2
	vaddss	588(%rsp), %xmm2, %xmm0
	vaddss	%xmm7, %xmm0, %xmm2
	vmovss	%xmm2, 588(%rsp)
	vmovss	704(%rsp), %xmm2
	vaddss	300(%rsp), %xmm2, %xmm2
	vmovss	%xmm2, 704(%rsp)
	vmovss	864(%rsp), %xmm2
	vaddss	672(%rsp), %xmm2, %xmm0
	vaddss	%xmm6, %xmm0, %xmm6
	vmovss	%xmm6, 672(%rsp)
	vmovss	768(%rsp), %xmm6
	vaddss	312(%rsp), %xmm6, %xmm6
	vmovss	%xmm6, 768(%rsp)
	vmovss	832(%rsp), %xmm6
	vaddss	736(%rsp), %xmm6, %xmm0
	vaddss	%xmm5, %xmm0, %xmm5
	vmovss	%xmm5, 736(%rsp)
	vmovss	328(%rsp), %xmm5
	vaddss	324(%rsp), %xmm5, %xmm5
	vmovss	%xmm5, 832(%rsp)
	vmovss	800(%rsp), %xmm5
	vaddss	336(%rsp), %xmm5, %xmm0
	vaddss	332(%rsp), %xmm4, %xmm4
	vaddss	352(%rsp), %xmm3, %xmm3
	vaddss	372(%rsp), %xmm1, %xmm1
	vaddss	%xmm4, %xmm0, %xmm5
	vmovss	%xmm5, 800(%rsp)
	vmovss	348(%rsp), %xmm5
	vaddss	344(%rsp), %xmm5, %xmm5
	vmovss	%xmm5, 896(%rsp)
	vmovss	360(%rsp), %xmm5
	vaddss	356(%rsp), %xmm5, %xmm0
	vaddss	%xmm3, %xmm0, %xmm5
	vmovss	416(%rsp), %xmm3
	vmovss	%xmm5, 864(%rsp)
	vmovd	%r8d, %xmm5
	vaddss	368(%rsp), %xmm5, %xmm5
	vmovd	%xmm5, %r8d
	vmovss	380(%rsp), %xmm5
	vaddss	376(%rsp), %xmm5, %xmm0
	vaddss	%xmm1, %xmm0, %xmm6
	vmovaps	%xmm6, %xmm15
	vmovss	556(%rsp), %xmm6
	vaddss	388(%rsp), %xmm6, %xmm5
	vmovss	404(%rsp), %xmm6
	vaddss	400(%rsp), %xmm6, %xmm9
	vmovss	396(%rsp), %xmm6
	vmovss	%xmm5, 556(%rsp)
	vaddss	392(%rsp), %xmm6, %xmm0
	vmovss	424(%rsp), %xmm5
	vaddss	412(%rsp), %xmm3, %xmm6
	vaddss	%xmm0, %xmm9, %xmm9
	vaddss	420(%rsp), %xmm5, %xmm0
	vmovss	444(%rsp), %xmm5
	vmovd	%xmm6, %r14d
	vaddss	440(%rsp), %xmm5, %xmm3
	vmovss	432(%rsp), %xmm6
	vmovd	%xmm3, %r13d
	vmovss	460(%rsp), %xmm3
	vaddss	428(%rsp), %xmm6, %xmm7
	vaddss	456(%rsp), %xmm3, %xmm6
	vmovss	452(%rsp), %xmm3
	vaddss	%xmm0, %xmm7, %xmm7
	vaddss	448(%rsp), %xmm3, %xmm0
	vmovss	564(%rsp), %xmm5
	movl	632(%rsp), %edi
	vaddss	468(%rsp), %xmm5, %xmm3
	vmovss	484(%rsp), %xmm5
	vaddss	%xmm0, %xmm6, %xmm6
	vaddss	480(%rsp), %xmm5, %xmm4
	vmovss	%xmm3, 564(%rsp)
	vmovss	476(%rsp), %xmm5
	vmovss	492(%rsp), %xmm3
	vaddss	472(%rsp), %xmm5, %xmm0
	vaddss	488(%rsp), %xmm3, %xmm5
	vmovss	500(%rsp), %xmm3
	vaddss	%xmm0, %xmm4, %xmm4
	vaddss	496(%rsp), %xmm3, %xmm1
	vmovss	568(%rsp), %xmm3
	vmovd	%xmm5, %r10d
	vaddss	504(%rsp), %xmm3, %xmm0
	vaddss	%xmm0, %xmm1, %xmm3
	vmovss	%xmm3, 568(%rsp)
	vmovss	560(%rsp), %xmm3
	vaddss	532(%rsp), %xmm3, %xmm5
	vmovss	540(%rsp), %xmm3
	vmovss	%xmm5, 560(%rsp)
	vmovss	516(%rsp), %xmm5
	vaddss	536(%rsp), %xmm3, %xmm8
	vmovd	%r9d, %xmm3
	vaddss	552(%rsp), %xmm3, %xmm0
	vaddss	512(%rsp), %xmm5, %xmm3
	vmovss	544(%rsp), %xmm5
	vaddss	%xmm0, %xmm8, %xmm8
	vmovd	%xmm3, %r9d
	vmovss	524(%rsp), %xmm3
	vaddss	528(%rsp), %xmm5, %xmm5
	vaddss	520(%rsp), %xmm3, %xmm0
	vaddss	%xmm0, %xmm5, %xmm5
	cmpl	%edi, 636(%rsp)
	jle	.L817
	movq	232(%rsp), %rcx
	movslq	592(%rsp), %rdx
	movl	%r10d, 540(%rsp)
	leaq	(%rcx,%rdx,4), %rdi
	movslq	596(%rsp), %rdx
	movslq	632(%rsp), %rax
	leaq	(%rcx,%rdx,4), %rsi
	movslq	600(%rsp), %rdx
	vmovss	%xmm13, 552(%rsp)
	leaq	(%rcx,%rdx,4), %rdx
	movq	%rdx, 544(%rsp)
	movslq	604(%rsp), %rdx
	leaq	(%rcx,%rdx,4), %rdx
	movq	544(%rsp), %rcx
	.p2align 4,,10
	.p2align 3
.L816:
	movq	608(%rsp), %r10
	vmovss	(%rdi,%rax,4), %xmm10
	vmovss	(%r10,%rax,4), %xmm12
	vmovaps	%xmm10, %xmm13
	vfmadd213ss	(%r12), %xmm12, %xmm13
	movq	616(%rsp), %r10
	vmovss	(%rsi,%rax,4), %xmm3
	vmovss	(%r10,%rax,4), %xmm11
	movq	624(%rsp), %r10
	vmovss	(%rcx,%rax,4), %xmm2
	vmovss	(%r10,%rax,4), %xmm0
	vmovss	(%rdx,%rax,4), %xmm1
	vmovss	%xmm13, (%r12)
	vmovaps	%xmm3, %xmm13
	vfmadd213ss	4(%r12), %xmm12, %xmm13
	incq	%rax
	vmovss	%xmm13, 4(%r12)
	vmovaps	%xmm2, %xmm13
	vfmadd213ss	8(%r12), %xmm12, %xmm13
	vfmadd213ss	12(%r12), %xmm1, %xmm12
	vmovss	%xmm13, 8(%r12)
	vmovss	%xmm12, 12(%r12)
	vmovaps	%xmm10, %xmm12
	vfmadd213ss	(%rbx), %xmm11, %xmm12
	vmovss	%xmm12, (%rbx)
	vmovaps	%xmm3, %xmm12
	vfmadd213ss	4(%rbx), %xmm11, %xmm12
	vmovss	%xmm12, 4(%rbx)
	vmovaps	%xmm2, %xmm12
	vfmadd213ss	8(%rbx), %xmm11, %xmm12
	vfmadd213ss	12(%rbx), %xmm1, %xmm11
	vmovss	%xmm12, 8(%rbx)
	vmovss	%xmm11, 12(%rbx)
	vmovaps	%xmm10, %xmm11
	vfmadd213ss	(%r15), %xmm0, %xmm11
	vmovss	%xmm11, (%r15)
	vmovaps	%xmm3, %xmm11
	vfmadd213ss	4(%r15), %xmm0, %xmm11
	vmovss	%xmm11, 4(%r15)
	vmovaps	%xmm2, %xmm11
	vfmadd213ss	8(%r15), %xmm0, %xmm11
	vmovss	%xmm11, 8(%r15)
	vmovaps	%xmm1, %xmm11
	vfmadd213ss	12(%r15), %xmm0, %xmm11
	vmovss	%xmm11, 12(%r15)
	vfmadd213ss	(%r11), %xmm0, %xmm10
	vfmadd213ss	4(%r11), %xmm0, %xmm3
	vfmadd213ss	8(%r11), %xmm0, %xmm2
	vfmadd213ss	12(%r11), %xmm0, %xmm1
	vmovss	%xmm10, (%r11)
	vmovss	%xmm3, 4(%r11)
	vmovss	%xmm2, 8(%r11)
	vmovss	%xmm1, 12(%r11)
	cmpl	%eax, 636(%rsp)
	jg	.L816
	vmovss	552(%rsp), %xmm13
	movl	540(%rsp), %r10d
.L817:
	vmovss	264(%rsp), %xmm3
	vmovss	296(%rsp), %xmm1
	vaddss	(%r12), %xmm3, %xmm0
	vmovss	268(%rsp), %xmm3
	addq	$16, %r12
	vaddss	572(%rsp), %xmm0, %xmm0
	addq	$16, %rbx
	addq	$16, %r15
	vaddss	%xmm13, %xmm0, %xmm0
	addq	$16, %r11
	vmovss	%xmm0, -16(%r12)
	vaddss	-12(%r12), %xmm3, %xmm0
	vmovss	272(%rsp), %xmm3
	vaddss	576(%rsp), %xmm0, %xmm0
	vaddss	%xmm14, %xmm0, %xmm0
	vmovss	%xmm0, -12(%r12)
	vaddss	-8(%r12), %xmm3, %xmm0
	vmovss	284(%rsp), %xmm3
	vaddss	584(%rsp), %xmm0, %xmm0
	vaddss	580(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -8(%r12)
	vaddss	-4(%r12), %xmm3, %xmm0
	vmovss	308(%rsp), %xmm3
	vaddss	640(%rsp), %xmm0, %xmm0
	vaddss	588(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -4(%r12)
	vaddss	-16(%rbx), %xmm1, %xmm0
	vmovss	320(%rsp), %xmm1
	vaddss	704(%rsp), %xmm0, %xmm0
	vaddss	672(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -16(%rbx)
	vaddss	-12(%rbx), %xmm3, %xmm0
	vaddss	768(%rsp), %xmm0, %xmm0
	vaddss	736(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -12(%rbx)
	vaddss	-8(%rbx), %xmm1, %xmm0
	vaddss	832(%rsp), %xmm0, %xmm0
	vaddss	800(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -8(%rbx)
	vmovss	340(%rsp), %xmm3
	vmovss	364(%rsp), %xmm1
	vaddss	-4(%rbx), %xmm3, %xmm0
	vmovd	%r8d, %xmm3
	vaddss	896(%rsp), %xmm0, %xmm0
	vaddss	864(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -4(%rbx)
	vaddss	-16(%r15), %xmm1, %xmm0
	vmovd	%r14d, %xmm1
	vaddss	%xmm3, %xmm0, %xmm0
	vmovss	384(%rsp), %xmm3
	vaddss	%xmm15, %xmm0, %xmm0
	vmovss	%xmm0, -16(%r15)
	vaddss	-12(%r15), %xmm3, %xmm0
	vmovss	408(%rsp), %xmm3
	vaddss	556(%rsp), %xmm0, %xmm0
	vaddss	%xmm9, %xmm0, %xmm0
	vmovss	%xmm0, -12(%r15)
	vaddss	-8(%r15), %xmm3, %xmm0
	vmovss	436(%rsp), %xmm3
	vaddss	%xmm1, %xmm0, %xmm0
	vmovd	%r13d, %xmm1
	vaddss	%xmm7, %xmm0, %xmm0
	vmovss	%xmm0, -8(%r15)
	vaddss	-4(%r15), %xmm3, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm6, %xmm0, %xmm0
	vmovss	464(%rsp), %xmm6
	vmovss	%xmm0, -4(%r15)
	vaddss	-16(%r11), %xmm6, %xmm0
	vmovss	256(%rsp), %xmm6
	vaddss	564(%rsp), %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vmovd	%r9d, %xmm4
	vmovss	%xmm0, -16(%r11)
	vaddss	-12(%r11), %xmm6, %xmm0
	vmovd	%r10d, %xmm6
	vaddss	%xmm6, %xmm0, %xmm0
	vmovss	260(%rsp), %xmm6
	vaddss	568(%rsp), %xmm0, %xmm0
	vmovss	%xmm0, -12(%r11)
	vaddss	-8(%r11), %xmm6, %xmm0
	vmovss	508(%rsp), %xmm6
	vaddss	560(%rsp), %xmm0, %xmm0
	vaddss	%xmm8, %xmm0, %xmm0
	vmovss	%xmm0, -8(%r11)
	vaddss	-4(%r11), %xmm6, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm5, %xmm0, %xmm0
	vmovss	%xmm0, -4(%r11)
	movl	240(%rsp), %eax
	addl	%eax, 592(%rsp)
	addl	%eax, 596(%rsp)
	addl	%eax, 600(%rsp)
	addl	%eax, 604(%rsp)
	cmpq	%r12, 224(%rsp)
	jne	.L814
.L815:
	movl	148(%rsp), %ecx
	cmpl	%ecx, 144(%rsp)
	jge	.L820
	movslq	164(%rsp), %r12
	movq	80(%rsp), %rax
	movq	152(%rsp), %rsi
	addq	%r12, %rax
	leaq	(%rsi,%rax,4), %rcx
	movq	72(%rsp), %rax
	movslq	212(%rsp), %r15
	addq	%r12, %rax
	leaq	4(%rsi,%rax,4), %rax
	movq	%rax, 768(%rsp)
	movslq	248(%rsp), %rsi
	movq	176(%rsp), %rax
	movslq	244(%rsp), %rdi
	leaq	(%rax,%rsi,4), %r9
	movq	%rsi, 864(%rsp)
	movslq	252(%rsp), %rsi
	leaq	(%rax,%r15,4), %r11
	leaq	(%rax,%rdi,4), %r10
	leaq	(%rax,%rsi,4), %r8
	movslq	160(%rsp), %rax
	movq	%rdi, 832(%rsp)
	movslq	172(%rsp), %rdx
	movslq	168(%rsp), %rdi
	movq	%rax, %rbx
	subq	%r12, %rbx
	movq	%rdi, %r13
	subq	%r12, %rdx
	subq	%r12, %r13
	movq	%rbx, 736(%rsp)
	movq	%rdx, 672(%rsp)
	movq	%rsi, 896(%rsp)
	movq	%r13, 704(%rsp)
	movq	%r15, 800(%rsp)
	movl	96(%rsp), %esi
	movq	88(%rsp), %r12
	movq	176(%rsp), %rdi
	movq	232(%rsp), %r15
	movl	636(%rsp), %r13d
	.p2align 4,,10
	.p2align 3
.L821:
	testl	%r13d, %r13d
	jle	.L857
	cmpl	$6, 208(%rsp)
	jbe	.L841
	vxorps	%xmm4, %xmm4, %xmm4
	movslq	%esi, %rax
	leaq	(%r15,%rax,4), %rdx
	vmovaps	%ymm4, %ymm3
	xorl	%eax, %eax
	vmovaps	%ymm4, %ymm2
	vmovaps	%ymm4, %ymm1
	.p2align 4,,10
	.p2align 3
.L823:
	vmovups	(%rdx,%rax), %ymm0
	vfmadd231ps	(%r11,%rax), %ymm0, %ymm1
	vfmadd231ps	(%r10,%rax), %ymm0, %ymm2
	vfmadd231ps	(%r9,%rax), %ymm0, %ymm3
	vfmadd231ps	(%r8,%rax), %ymm0, %ymm4
	addq	$32, %rax
	cmpq	%r12, %rax
	jne	.L823
	vextractf128	$0x1, %ymm4, %xmm0
	vaddps	%xmm4, %xmm0, %xmm0
	movl	188(%rsp), %edx
	vmovhlps	%xmm0, %xmm0, %xmm4
	vaddps	%xmm0, %xmm4, %xmm4
	movl	%edx, %eax
	vshufps	$85, %xmm4, %xmm4, %xmm0
	vaddps	%xmm4, %xmm0, %xmm0
	vextractf128	$0x1, %ymm3, %xmm4
	vaddps	%xmm3, %xmm4, %xmm3
	vmovhlps	%xmm3, %xmm3, %xmm4
	vaddps	%xmm3, %xmm4, %xmm4
	vshufps	$85, %xmm4, %xmm4, %xmm3
	vaddps	%xmm4, %xmm3, %xmm3
	vextractf128	$0x1, %ymm2, %xmm4
	vaddps	%xmm2, %xmm4, %xmm2
	vmovhlps	%xmm2, %xmm2, %xmm4
	vaddps	%xmm2, %xmm4, %xmm4
	vshufps	$85, %xmm4, %xmm4, %xmm2
	vaddps	%xmm4, %xmm2, %xmm2
	vextractf128	$0x1, %ymm1, %xmm4
	vaddps	%xmm1, %xmm4, %xmm1
	vmovhlps	%xmm1, %xmm1, %xmm4
	vaddps	%xmm1, %xmm4, %xmm4
	vshufps	$85, %xmm4, %xmm4, %xmm1
	vaddps	%xmm4, %xmm1, %xmm1
	cmpl	%eax, %r13d
	je	.L828
.L822:
	movl	%r13d, %r14d
	subl	%eax, %r14d
	leal	-1(%r14), %ebx
	cmpl	$2, %ebx
	jbe	.L825
	movslq	%esi, %rbx
	addq	%rax, %rbx
	vmovups	(%r15,%rbx,4), %xmm4
	movq	800(%rsp), %rbx
	addq	%rax, %rbx
	vmulps	(%rdi,%rbx,4), %xmm4, %xmm6
	movq	832(%rsp), %rbx
	addq	%rax, %rbx
	vmulps	(%rdi,%rbx,4), %xmm4, %xmm7
	movq	864(%rsp), %rbx
	addq	%rax, %rbx
	addq	896(%rsp), %rax
	vmulps	(%rdi,%rbx,4), %xmm4, %xmm8
	vmulps	(%rdi,%rax,4), %xmm4, %xmm4
	movl	%r14d, %eax
	andl	$-4, %eax
	addl	%eax, %edx
	vmovhlps	%xmm4, %xmm4, %xmm5
	vaddps	%xmm4, %xmm5, %xmm5
	vshufps	$85, %xmm5, %xmm5, %xmm4
	vaddps	%xmm5, %xmm4, %xmm4
	vmovhlps	%xmm8, %xmm8, %xmm5
	vaddps	%xmm8, %xmm5, %xmm5
	vaddss	%xmm4, %xmm0, %xmm0
	vshufps	$85, %xmm5, %xmm5, %xmm4
	vaddps	%xmm5, %xmm4, %xmm4
	vmovhlps	%xmm7, %xmm7, %xmm5
	vaddps	%xmm7, %xmm5, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$85, %xmm5, %xmm5, %xmm4
	vaddps	%xmm5, %xmm4, %xmm4
	vmovhlps	%xmm6, %xmm6, %xmm5
	vaddps	%xmm6, %xmm5, %xmm5
	vaddss	%xmm4, %xmm2, %xmm2
	vshufps	$85, %xmm5, %xmm5, %xmm4
	vaddps	%xmm5, %xmm4, %xmm4
	vaddss	%xmm4, %xmm1, %xmm1
	cmpl	%r14d, %eax
	je	.L828
.L825:
	movl	212(%rsp), %r14d
	leal	(%rsi,%rdx), %eax
	cltq
	vmovss	(%r15,%rax,4), %xmm4
	leal	(%r14,%rdx), %eax
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm1
	movl	244(%rsp), %eax
	movl	248(%rsp), %ebx
	addl	%edx, %eax
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm2
	leal	(%rbx,%rdx), %eax
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm3
	movl	252(%rsp), %eax
	addl	%edx, %eax
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm0
	leal	1(%rdx), %eax
	cmpl	%r13d, %eax
	jge	.L828
	leal	(%rsi,%rax), %ebx
	movslq	%ebx, %rbx
	vmovss	(%r15,%rbx,4), %xmm4
	leal	(%r14,%rax), %ebx
	movslq	%ebx, %rbx
	vfmadd231ss	(%rdi,%rbx,4), %xmm4, %xmm1
	movl	244(%rsp), %ebx
	addl	$2, %edx
	addl	%eax, %ebx
	movslq	%ebx, %rbx
	vfmadd231ss	(%rdi,%rbx,4), %xmm4, %xmm2
	movl	248(%rsp), %ebx
	addl	%eax, %ebx
	addl	252(%rsp), %eax
	movslq	%ebx, %rbx
	cltq
	vfmadd231ss	(%rdi,%rbx,4), %xmm4, %xmm3
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm0
	cmpl	%edx, %r13d
	jle	.L828
	leal	(%rsi,%rdx), %eax
	cltq
	vmovss	(%r15,%rax,4), %xmm4
	movl	244(%rsp), %ebx
	leal	(%r14,%rdx), %eax
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm1
	leal	(%rbx,%rdx), %eax
	movl	248(%rsp), %ebx
	cltq
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm2
	leal	(%rbx,%rdx), %eax
	addl	252(%rsp), %edx
	cltq
	movslq	%edx, %rdx
	vfmadd231ss	(%rdi,%rax,4), %xmm4, %xmm3
	vfmadd231ss	(%rdi,%rdx,4), %xmm4, %xmm0
.L828:
	movq	736(%rsp), %rax
	addl	%r13d, %esi
	vaddss	(%rcx,%rax,4), %xmm1, %xmm1
	vmovss	%xmm1, (%rcx,%rax,4)
	movq	704(%rsp), %rax
	vaddss	(%rcx,%rax,4), %xmm2, %xmm2
	vmovss	%xmm2, (%rcx,%rax,4)
	vaddss	(%rcx), %xmm3, %xmm3
	movq	672(%rsp), %rax
	vmovss	%xmm3, (%rcx)
	vaddss	(%rcx,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rcx,%rax,4)
	addq	$4, %rcx
	cmpq	768(%rsp), %rcx
	jne	.L821
.L820:
	addl	$4, 184(%rsp)
	movl	112(%rsp), %eax
	addl	%eax, 160(%rsp)
	addl	%eax, 164(%rsp)
	addl	%eax, 168(%rsp)
	addl	%eax, 172(%rsp)
	movl	184(%rsp), %ecx
	movl	240(%rsp), %eax
	addl	%eax, 212(%rsp)
	addl	%eax, 244(%rsp)
	addl	%eax, 248(%rsp)
	addl	%eax, 252(%rsp)
	cmpl	%ecx, 132(%rsp)
	jg	.L811
	movq	176(%rsp), %r15
.L810:
	addq	$256, 136(%rsp)
	movl	48(%rsp), %ecx
	addl	%ecx, 124(%rsp)
	movq	136(%rsp), %rax
	cmpl	%eax, 144(%rsp)
	jg	.L829
.L830:
	movl	36(%rsp), %ecx
	addl	%ecx, 56(%rsp)
	movl	48(%rsp), %ecx
	addl	%ecx, 60(%rsp)
	movl	64(%rsp), %ecx
	cmpl	%ecx, 68(%rsp)
	jg	.L808
	movl	636(%rsp), %r14d
.L802:
	movl	68(%rsp), %eax
	movl	52(%rsp), %ecx
	cmpl	%ecx, %eax
	jge	.L854
	movl	148(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L854
	movl	%ecx, %r13d
	imull	%eax, %r13d
	imull	%r14d, %eax
	movl	%r14d, %r11d
	andl	$-8, %r11d
	movl	%eax, %ebx
	leal	-1(%r14), %eax
	movl	%eax, 864(%rsp)
	movl	%r14d, %eax
	shrl	$3, %eax
	decl	%eax
	incq	%rax
	salq	$5, %rax
	movq	%rax, %r12
	movq	152(%rsp), %rax
	addq	$4, %rax
	movq	%rax, 800(%rsp)
	leal	-1(%rcx), %eax
	movq	%rax, 832(%rsp)
.L805:
	movq	152(%rsp), %rcx
	movslq	%r13d, %rax
	leaq	(%rcx,%rax,4), %r9
	movq	800(%rsp), %rcx
	addq	832(%rsp), %rax
	leaq	(%rcx,%rax,4), %rax
	movq	%rax, 896(%rsp)
	movslq	%ebx, %r10
	leaq	(%r15,%r10,4), %rsi
	xorl	%ecx, %ecx
.L839:
	vxorps	%xmm0, %xmm0, %xmm0
	testl	%r14d, %r14d
	jle	.L838
	cmpl	$6, 864(%rsp)
	jbe	.L842
	movq	232(%rsp), %rdi
	movslq	%ecx, %rax
	leaq	(%rdi,%rax,4), %rdx
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
.L832:
	vmovups	(%rdx,%rax), %ymm6
	vfmadd231ps	(%rsi,%rax), %ymm6, %ymm0
	addq	$32, %rax
	cmpq	%r12, %rax
	jne	.L832
	vextractf128	$0x1, %ymm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	cmpl	%r11d, %r14d
	je	.L838
	movl	%r11d, %edx
	movl	%r11d, %eax
.L831:
	movl	%r14d, %r8d
	subl	%edx, %r8d
	leal	-1(%r8), %edi
	cmpl	$2, %edi
	jbe	.L834
	movslq	%ecx, %rdi
	addq	%rdx, %rdi
	addq	%r10, %rdx
	vmovups	(%r15,%rdx,4), %xmm1
	movq	232(%rsp), %rdx
	vmulps	(%rdx,%rdi,4), %xmm1, %xmm1
	movl	%r8d, %edx
	andl	$-4, %edx
	addl	%edx, %eax
	vmovhlps	%xmm1, %xmm1, %xmm2
	vaddps	%xmm1, %xmm2, %xmm2
	vshufps	$85, %xmm2, %xmm2, %xmm1
	vaddps	%xmm2, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	cmpl	%r8d, %edx
	je	.L838
.L834:
	leal	(%rbx,%rax), %edi
	movslq	%edi, %rdi
	movq	232(%rsp), %r8
	vmovss	(%r15,%rdi,4), %xmm6
	leal	(%rcx,%rax), %edx
	movslq	%edx, %rdx
	vfmadd231ss	(%r8,%rdx,4), %xmm6, %xmm0
	leal	1(%rax), %edx
	cmpl	%edx, %r14d
	jle	.L838
	leal	(%rcx,%rdx), %edi
	movslq	%edi, %rdi
	vmovss	(%r8,%rdi,4), %xmm6
	addl	%ebx, %edx
	movslq	%edx, %rdx
	addl	$2, %eax
	vfmadd231ss	(%r15,%rdx,4), %xmm6, %xmm0
	cmpl	%eax, %r14d
	jle	.L838
	leal	(%rcx,%rax), %edx
	movslq	%edx, %rdx
	vmovss	(%r8,%rdx,4), %xmm6
	addl	%ebx, %eax
	cltq
	vfmadd231ss	(%r15,%rax,4), %xmm6, %xmm0
.L838:
	vmovss	%xmm0, (%r9)
	addq	$4, %r9
	addl	%r14d, %ecx
	cmpq	896(%rsp), %r9
	jne	.L839
	incl	68(%rsp)
	addl	148(%rsp), %r13d
	addl	%r14d, %ebx
	movl	68(%rsp), %eax
	cmpl	%eax, 52(%rsp)
	jne	.L805
.L854:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L856:
	.cfi_restore_state
	vxorps	%xmm10, %xmm10, %xmm10
	movl	$0x00000000, 256(%rsp)
	movl	$0x00000000, 260(%rsp)
	movl	$0x00000000, 264(%rsp)
	vmovss	%xmm10, 268(%rsp)
	vmovss	%xmm10, 272(%rsp)
	vmovss	%xmm10, 276(%rsp)
	vmovss	%xmm10, 280(%rsp)
	vmovss	%xmm10, 580(%rsp)
	vmovss	%xmm10, 284(%rsp)
	vmovss	%xmm10, 288(%rsp)
	vmovss	%xmm10, 640(%rsp)
	vmovss	%xmm10, 292(%rsp)
	vmovss	%xmm10, 588(%rsp)
	vmovss	%xmm10, 896(%rsp)
	vmovss	%xmm10, 296(%rsp)
	vmovss	%xmm10, 300(%rsp)
	vmovss	%xmm10, 704(%rsp)
	vmovss	%xmm10, 304(%rsp)
	vmovss	%xmm10, 672(%rsp)
	vmovss	%xmm10, 864(%rsp)
	vmovss	%xmm10, 308(%rsp)
	vmovss	%xmm10, 312(%rsp)
	vmovss	%xmm10, 768(%rsp)
	vmovss	%xmm10, 316(%rsp)
	vmovss	%xmm10, 736(%rsp)
	vmovss	%xmm10, 832(%rsp)
	vmovss	%xmm10, 320(%rsp)
	vmovss	%xmm10, 324(%rsp)
	vmovss	%xmm10, 328(%rsp)
	vmovss	%xmm10, 332(%rsp)
	vmovss	%xmm10, 336(%rsp)
	vmovss	%xmm10, 800(%rsp)
	xorl	%r14d, %r14d
	vmovss	%xmm10, 340(%rsp)
	xorl	%r13d, %r13d
	vmovss	%xmm10, 344(%rsp)
	vmovss	%xmm10, 348(%rsp)
	vmovss	%xmm10, 352(%rsp)
	vmovss	%xmm10, 356(%rsp)
	vmovss	%xmm10, 360(%rsp)
	vmovss	%xmm10, 364(%rsp)
	vmovss	%xmm10, 368(%rsp)
	vmovss	%xmm10, 372(%rsp)
	vmovss	%xmm10, 376(%rsp)
	vmovss	%xmm10, 380(%rsp)
	vmovss	%xmm10, 384(%rsp)
	vmovss	%xmm10, 388(%rsp)
	vmovss	%xmm10, 556(%rsp)
	vmovss	%xmm10, 392(%rsp)
	vmovss	%xmm10, 396(%rsp)
	vmovss	%xmm10, 400(%rsp)
	vmovss	%xmm10, 404(%rsp)
	vmovss	%xmm10, 408(%rsp)
	vmovss	%xmm10, 412(%rsp)
	vmovss	%xmm10, 416(%rsp)
	vmovss	%xmm10, 420(%rsp)
	vmovss	%xmm10, 424(%rsp)
	vmovss	%xmm10, 428(%rsp)
	vmovss	%xmm10, 432(%rsp)
	vmovss	%xmm10, 436(%rsp)
	vmovss	%xmm10, 440(%rsp)
	vmovss	%xmm10, 444(%rsp)
	vmovss	%xmm10, 448(%rsp)
	vmovss	%xmm10, 452(%rsp)
	vmovss	%xmm10, 456(%rsp)
	vmovss	%xmm10, 460(%rsp)
	vmovss	%xmm10, 464(%rsp)
	vmovd	%xmm10, %r10d
	vmovss	%xmm10, 468(%rsp)
	vmovaps	%xmm10, %xmm9
	vmovaps	%xmm10, %xmm15
	vmovd	%xmm10, %esi
	vmovd	%xmm10, %edi
	vmovaps	%xmm10, %xmm11
	vmovd	%xmm10, %eax
	vmovaps	%xmm10, %xmm12
	vmovaps	%xmm10, %xmm14
	vmovd	%xmm10, %ecx
	vmovd	%xmm10, %edx
	vmovaps	%xmm10, %xmm8
	vmovaps	%xmm10, %xmm7
	vmovaps	%xmm10, %xmm6
	vmovaps	%xmm10, %xmm5
	vmovaps	%xmm10, %xmm4
	vmovaps	%xmm10, %xmm3
	vmovd	%xmm10, %r8d
	vmovaps	%xmm10, %xmm1
	vmovss	%xmm10, 564(%rsp)
	vmovss	%xmm10, 472(%rsp)
	vmovss	%xmm10, 476(%rsp)
	vmovss	%xmm10, 480(%rsp)
	vmovss	%xmm10, 484(%rsp)
	vmovss	%xmm10, 488(%rsp)
	vmovss	%xmm10, 492(%rsp)
	vmovss	%xmm10, 496(%rsp)
	vmovss	%xmm10, 500(%rsp)
	vmovss	%xmm10, 504(%rsp)
	vmovss	%xmm10, 568(%rsp)
	vmovss	%xmm10, 508(%rsp)
	vmovss	%xmm10, 512(%rsp)
	vmovss	%xmm10, 516(%rsp)
	vmovss	%xmm10, 520(%rsp)
	vmovss	%xmm10, 524(%rsp)
	vmovss	%xmm10, 528(%rsp)
	vmovss	%xmm10, 532(%rsp)
	vmovss	%xmm10, 560(%rsp)
	vmovss	%xmm10, 536(%rsp)
	vmovss	%xmm10, 540(%rsp)
	vmovss	%xmm10, 552(%rsp)
	vmovd	%xmm10, %r9d
	vmovss	%xmm10, 544(%rsp)
	jmp	.L819
	.p2align 4,,10
	.p2align 3
.L857:
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm0, %xmm2
	vmovaps	%xmm0, %xmm1
	jmp	.L828
.L841:
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	xorl	%edx, %edx
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm0, %xmm2
	vmovaps	%xmm0, %xmm1
	jmp	.L822
.L842:
	xorl	%edx, %edx
	xorl	%eax, %eax
	vxorps	%xmm0, %xmm0, %xmm0
	jmp	.L831
	.cfi_endproc
.LFE10946:
	.size	_Z10mul_st_f32PfS_S_iii, .-_Z10mul_st_f32PfS_S_iii
	.section	.text._ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z,"axG",@progbits,_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z,comdat
	.p2align 4
	.weak	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z
	.type	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z, @function
_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z:
.LFB11225:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %r10
	movq	%rcx, %r11
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	movq	%rdx, %rsi
	pushq	%r13
	pushq	%r12
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	movq	%rdi, %r12
	subq	$232, %rsp
	movq	%r8, -176(%rbp)
	movq	%r9, -168(%rbp)
	testb	%al, %al
	je	.L859
	vmovaps	%xmm0, -160(%rbp)
	vmovaps	%xmm1, -144(%rbp)
	vmovaps	%xmm2, -128(%rbp)
	vmovaps	%xmm3, -112(%rbp)
	vmovaps	%xmm4, -96(%rbp)
	vmovaps	%xmm5, -80(%rbp)
	vmovaps	%xmm6, -64(%rbp)
	vmovaps	%xmm7, -48(%rbp)
.L859:
	movq	%fs:40, %rax
	movq	%rax, -216(%rbp)
	xorl	%eax, %eax
	leaq	39(%rsi), %rax
	movq	%rax, %rdx
	movq	%rsp, %rcx
	andq	$-4096, %rax
	subq	%rax, %rcx
	andq	$-16, %rdx
	cmpq	%rcx, %rsp
	je	.L861
.L875:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rcx, %rsp
	jne	.L875
.L861:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L876
.L862:
	leaq	31(%rsp), %r14
	leaq	16(%rbp), %rax
	andq	$-32, %r14
	movq	%rax, -232(%rbp)
	movq	%r14, %rdi
	leaq	-208(%rbp), %rax
	leaq	-240(%rbp), %rcx
	movq	%r11, %rdx
	movl	$32, -240(%rbp)
	movl	$48, -236(%rbp)
	movq	%rax, -224(%rbp)
	call	*%r10
	movslq	%eax, %r13
	leaq	16(%r12), %rdi
	movq	%rdi, (%r12)
	movq	%r13, -248(%rbp)
	cmpq	$15, %r13
	ja	.L877
	cmpq	$1, %r13
	jne	.L865
	movzbl	(%r14), %eax
	movb	%al, 16(%r12)
.L866:
	movq	%r13, 8(%r12)
	movb	$0, (%rdi,%r13)
	movq	-216(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L878
	leaq	-24(%rbp), %rsp
	movq	%r12, %rax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L865:
	.cfi_restore_state
	testq	%r13, %r13
	je	.L866
	jmp	.L864
	.p2align 4,,10
	.p2align 3
.L877:
	movq	%r12, %rdi
	leaq	-248(%rbp), %rsi
	xorl	%edx, %edx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	movq	%rax, (%r12)
	movq	%rax, %rdi
	movq	-248(%rbp), %rax
	movq	%rax, 16(%r12)
.L864:
	movq	%r13, %rdx
	movq	%r14, %rsi
	call	memcpy@PLT
	movq	-248(%rbp), %r13
	movq	(%r12), %rdi
	jmp	.L866
	.p2align 4,,10
	.p2align 3
.L876:
	orq	$0, -8(%rsp,%rdx)
	jmp	.L862
.L878:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE11225:
	.size	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z, .-_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z
	.section	.text._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_,"axG",@progbits,_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_,comdat
	.p2align 4
	.weak	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
	.type	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_, @function
_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_:
.LFB11357:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdx, %r9
	movq	%rdi, %r12
	movq	8(%rsi), %r8
	movq	8(%rdx), %rdx
	movq	(%rsi), %rcx
	movq	%rsi, %rdi
	addq	$16, %rsi
	leaq	(%r8,%rdx), %rax
	cmpq	%rsi, %rcx
	je	.L890
	movq	16(%rdi), %r10
.L880:
	movq	(%r9), %rsi
	cmpq	%r10, %rax
	jbe	.L881
	leaq	16(%r9), %r10
	cmpq	%r10, %rsi
	je	.L891
	movq	16(%r9), %r10
.L882:
	cmpq	%r10, %rax
	jbe	.L895
.L881:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@PLT
	leaq	16(%r12), %rdx
	movq	%rdx, (%r12)
	leaq	16(%rax), %rdx
	movq	(%rax), %rcx
	cmpq	%rdx, %rcx
	je	.L896
.L893:
	movq	%rcx, (%r12)
	movq	16(%rax), %rcx
	movq	%rcx, 16(%r12)
.L889:
	movq	8(%rax), %rcx
	movq	%rcx, 8(%r12)
	movq	%rdx, (%rax)
	movq	$0, 8(%rax)
	movb	$0, 16(%rax)
	movq	%r12, %rax
	popq	%r12
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L895:
	.cfi_restore_state
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r9, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm@PLT
	leaq	16(%r12), %rdx
	movq	%rdx, (%r12)
	leaq	16(%rax), %rdx
	movq	(%rax), %rcx
	cmpq	%rdx, %rcx
	jne	.L893
	vmovdqu	16(%rax), %xmm1
	vmovdqu	%xmm1, 16(%r12)
	jmp	.L889
	.p2align 4,,10
	.p2align 3
.L896:
	vmovdqu	16(%rax), %xmm0
	vmovdqu	%xmm0, 16(%r12)
	jmp	.L889
	.p2align 4,,10
	.p2align 3
.L890:
	movl	$15, %r10d
	jmp	.L880
	.p2align 4,,10
	.p2align 3
.L891:
	movl	$15, %r10d
	jmp	.L882
	.cfi_endproc
.LFE11357:
	.size	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_, .-_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
	.section	.text._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_,"axG",@progbits,_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_,comdat
	.p2align 4
	.weak	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
	.type	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_, @function
_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_:
.LFB11358:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	movq	%rsi, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp
	call	strlen@PLT
	movq	%rax, %r8
	movq	%r13, %rcx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm@PLT
	leaq	16(%r12), %rdx
	movq	%rdx, (%r12)
	leaq	16(%rax), %rdx
	movq	(%rax), %rcx
	cmpq	%rdx, %rcx
	je	.L901
	movq	%rcx, (%r12)
	movq	16(%rax), %rcx
	movq	%rcx, 16(%r12)
.L899:
	movq	8(%rax), %rcx
	movq	%rdx, (%rax)
	movq	$0, 8(%rax)
	movq	%rcx, 8(%r12)
	movb	$0, 16(%rax)
	movq	%r12, %rax
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L901:
	.cfi_restore_state
	vmovdqu	16(%rax), %xmm0
	vmovdqu	%xmm0, 16(%r12)
	jmp	.L899
	.cfi_endproc
.LFE11358:
	.size	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_, .-_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
	.section	.text._ZN13MdStaticArrayI7ComplexIdvEED2Ev,"axG",@progbits,_ZN13MdStaticArrayI7ComplexIdvEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN13MdStaticArrayI7ComplexIdvEED2Ev
	.type	_ZN13MdStaticArrayI7ComplexIdvEED2Ev, @function
_ZN13MdStaticArrayI7ComplexIdvEED2Ev:
.LFB11395:
	.cfi_startproc
	endbr64
	cmpb	$0, (%rdi)
	je	.L920
	ret
	.p2align 4,,10
	.p2align 3
.L920:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L904
	call	free@PLT
.L904:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L905
	call	free@PLT
.L905:
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L915
	popq	%rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L915:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11395:
	.size	_ZN13MdStaticArrayI7ComplexIdvEED2Ev, .-_ZN13MdStaticArrayI7ComplexIdvEED2Ev
	.weak	_ZN13MdStaticArrayI7ComplexIdvEED1Ev
	.set	_ZN13MdStaticArrayI7ComplexIdvEED1Ev,_ZN13MdStaticArrayI7ComplexIdvEED2Ev
	.text
	.align 2
	.p2align 4
	.globl	_ZN3FFT8ifft_intERK13MdStaticArrayI7ComplexIdvEE
	.type	_ZN3FFT8ifft_intERK13MdStaticArrayI7ComplexIdvEE, @function
_ZN3FFT8ifft_intERK13MdStaticArrayI7ComplexIdvEE:
.LFB10516:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$64, %rsp
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	32(%rsi), %rbx
	movb	$0, (%rdi)
	movq	%rsi, 48(%rsp)
	movq	%rbx, %rsi
	salq	$4, %rsi
	movl	$64, %edi
	call	aligned_alloc@PLT
	movq	%rax, 8(%r13)
	movq	%rbx, 32(%r13)
	movl	$8, %edi
	movq	%rax, 56(%rsp)
	call	malloc@PLT
	movq	%rax, 16(%r13)
	movl	$8, %edi
	movq	%rax, %r12
	call	malloc@PLT
	movq	%rax, 24(%r13)
	movq	$1, (%rax)
	cmpq	$100000, %rbx
	movl	$1, %eax
	movq	%rbx, (%r12)
	movw	%ax, 40(%r13)
	movq	56(%rsp), %r8
	movq	48(%rsp), %r9
	jbe	.L1027
	movq	%rbx, %rdx
	shrq	%rdx
	salq	$5, %rdx
	movq	%r8, %rax
	addq	%r8, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
.L925:
	vmovapd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L925
	movq	%rbx, %rax
	andq	$-2, %rax
	testb	$1, %bl
	je	.L1012
	salq	$4, %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, (%r8,%rax)
	testb	$1, %bl
	je	.L1012
	vzeroupper
	jmp	.L975
	.p2align 4,,10
	.p2align 3
.L1027:
	testq	%rbx, %rbx
	je	.L1028
	cmpq	$1, %rbx
	je	.L978
	movq	%rbx, %rdx
	shrq	%rdx
	salq	$5, %rdx
	movq	%r8, %rax
	addq	%r8, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L928:
	vmovapd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L928
	movq	%rbx, %rax
	andq	$-2, %rax
	testb	$1, %bl
	je	.L1029
	vzeroupper
.L927:
	salq	$4, %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, (%r8,%rax)
	testb	$1, %bl
	je	.L1013
.L975:
	movq	32(%r9), %rdx
	testq	%rdx, %rdx
	je	.L933
	movq	8(%r9), %rcx
	salq	$4, %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L932:
	vmovdqu	(%rcx,%rax), %xmm4
	vmovdqa	%xmm4, (%r8,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L932
.L933:
	movl	%ebx, %edx
	xorl	%esi, %esi
	movq	%r8, %rdi
	call	_Z33idft_subarray_inplace_without_divP7ComplexIdvEii
.L921:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	movq	%r13, %rax
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L1029:
	.cfi_restore_state
	vzeroupper
.L1013:
	leaq	0(,%rbx,8), %r14
	blsmsk	%rbx, %rcx
	incq	%rcx
	shrq	%rcx
	movq	%r14, %rsi
	movl	$64, %edi
	movq	%r9, 24(%rsp)
	movq	%r8, 32(%rsp)
	movq	%rcx, 40(%rsp)
	call	aligned_alloc@PLT
	movl	$8, %edi
	movq	%rax, %r12
	call	malloc@PLT
	movl	$8, %edi
	movq	%rax, %r15
	movq	%rax, 56(%rsp)
	call	malloc@PLT
	movq	$1, (%rax)
	movq	%rbx, (%r15)
	movq	%r14, %rdx
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	%rax, 48(%rsp)
	movq	%rbx, %r15
	call	memset@PLT
	movq	40(%rsp), %rcx
	movq	32(%rsp), %r8
	movq	24(%rsp), %r9
	shrq	%r15
	movq	%rbx, %r14
.L974:
	movl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L935:
	movq	%r14, %rdi
	shrq	%r14
	cmpq	%rdi, %r14
	jnb	.L940
	movq	%rdi, %r10
	subq	%r14, %r10
	leaq	-1(%r10), %rax
	cmpq	$2, %rax
	jbe	.L979
	movq	%r10, %rdx
	shrq	$2, %rdx
	vmovq	%rsi, %xmm7
	leaq	(%r12,%r14,8), %rax
	salq	$5, %rdx
	vpbroadcastq	%xmm7, %ymm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L938:
	vmovdqu	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L938
	movq	%r10, %rdx
	andq	$-4, %rdx
	leaq	(%r14,%rdx), %rax
	cmpq	%rdx, %r10
	je	.L940
.L937:
	leaq	1(%rax), %r10
	movq	%rsi, (%r12,%rax,8)
	leaq	0(,%rax,8), %rdx
	cmpq	%r10, %rdi
	jbe	.L940
	addq	$2, %rax
	movq	%rsi, 8(%r12,%rdx)
	cmpq	%rdi, %rax
	jnb	.L940
	movq	%rsi, 16(%r12,%rdx)
.L940:
	addq	%rsi, %rsi
	testb	$1, %r14b
	je	.L935
	leaq	8(%r12), %rax
	leaq	(%r12,%r14,8), %rsi
	cmpq	$1, %r14
	je	.L946
	.p2align 4,,10
	.p2align 3
.L945:
	movq	-8(%rax), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	incq	%rdx
	movq	%rdx, (%rax,%r15,8)
	addq	$8, %rax
	cmpq	%rax, %rsi
	jne	.L945
.L946:
	movq	%r14, %rdx
	cmpq	%r15, %r14
	jnb	.L944
	vmovdqa	.LC16(%rip), %xmm2
	vmovdqa	.LC15(%rip), %ymm1
	.p2align 4,,10
	.p2align 3
.L943:
	leaq	8(,%rdx,8), %r10
	leaq	-16(%r10), %rax
	cmpq	$16, %rax
	seta	%r11b
	leaq	(%rdx,%r15), %rdi
	cmpq	$1, %rdx
	setne	%al
	leaq	0(,%rdi,8), %rsi
	andl	%eax, %r11d
	movq	%rsi, %rax
	subq	%r10, %rax
	cmpq	$16, %rax
	seta	%r10b
	leaq	0(,%rdx,8), %rcx
	testb	%r10b, %r11b
	je	.L949
	leaq	-8(%rsi), %rax
	cmpq	$16, %rax
	jbe	.L949
	leaq	-1(%rdx), %rax
	cmpq	$2, %rax
	jbe	.L981
	movq	%rdx, %r10
	shrq	$2, %r10
	addq	%r12, %rcx
	addq	%r12, %rsi
	salq	$5, %r10
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L951:
	vmovdqu	(%rcx,%rax), %ymm3
	vpaddq	(%r12,%rax), %ymm3, %ymm0
	vmovdqu	%ymm0, (%rcx,%rax)
	vpaddq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rsi,%rax)
	addq	$32, %rax
	cmpq	%r10, %rax
	jne	.L951
	movq	%rdx, %rsi
	andq	$-4, %rsi
	testb	$3, %dl
	je	.L956
	movq	%rdx, %rax
	subq	%rsi, %rax
	cmpq	$1, %rax
	je	.L953
.L950:
	leaq	(%rsi,%rdx), %rcx
	leaq	(%r12,%rcx,8), %rcx
	vmovdqu	(%rcx), %xmm5
	addq	%rsi, %rdi
	vpaddq	(%r12,%rsi,8), %xmm5, %xmm0
	vmovdqu	%xmm0, (%rcx)
	movq	%rax, %rcx
	vpaddq	%xmm2, %xmm0, %xmm0
	andq	$-2, %rcx
	vmovdqu	%xmm0, (%r12,%rdi,8)
	addq	%rcx, %rsi
	cmpq	%rcx, %rax
	je	.L956
.L953:
	leaq	(%rdx,%rsi), %rcx
	leaq	(%r12,%rcx,8), %rdi
	movq	(%rdi), %rax
	addq	%r15, %rcx
	addq	(%r12,%rsi,8), %rax
	movq	%rax, (%rdi)
	incq	%rax
	movq	%rax, (%r12,%rcx,8)
.L956:
	addq	%rdx, %rdx
	cmpq	%r15, %rdx
	jb	.L943
.L944:
	testq	%rbx, %rbx
	je	.L1026
	movq	8(%r9), %rdi
	movq	%r12, %rax
	movq	%r8, %rcx
	leaq	(%r12,%rbx,8), %rsi
	.p2align 4,,10
	.p2align 3
.L957:
	movl	$4, %edx
	shlx	%rdx, (%rax), %rdx
	vmovdqu	(%rdi,%rdx), %xmm6
	addq	$8, %rax
	vmovdqa	%xmm6, (%rcx)
	addq	$16, %rcx
	cmpq	%rax, %rsi
	jne	.L957
	movl	%r14d, %eax
	xorl	%r15d, %r15d
	cmpq	$1, %r14
	je	.L1026
	movq	%r12, 40(%rsp)
	movq	%r8, %rdi
	movq	%r15, %r12
	movl	%eax, %r15d
	vzeroupper
	jmp	.L959
	.p2align 4,,10
	.p2align 3
.L1030:
	movq	8(%r13), %rdi
.L959:
	leal	(%r15,%r12), %edx
	movl	%r12d, %esi
	addq	%r14, %r12
	call	_Z33idft_subarray_inplace_without_divP7ComplexIdvEii
	cmpq	%rbx, %r12
	jb	.L1030
	movq	40(%rsp), %r12
.L948:
	testq	%r12, %r12
	je	.L960
	movq	%r12, %rdi
	call	free@PLT
.L960:
	movq	56(%rsp), %rdi
	addl	%r14d, %r14d
	call	free@PLT
	movq	48(%rsp), %rdi
	movl	%ebx, %r12d
	call	free@PLT
	movq	8(%r13), %r15
	cmpl	%r14d, %ebx
	jge	.L965
	jmp	.L972
	.p2align 4,,10
	.p2align 3
.L1031:
	movl	%r14d, %edx
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	_Z8ifft_oddP7ComplexIdvEii
.L964:
	addl	%r14d, %r14d
	cmpl	%r14d, %r12d
	jl	.L972
.L965:
	cmpl	$2, %r14d
	je	.L961
	cmpl	$4, %r14d
	jne	.L1031
	movl	%r12d, %esi
	movq	%r15, %rdi
	addl	%r14d, %r14d
	call	_Z7ifft_b4P7ComplexIdvEi
	cmpl	%r14d, %r12d
	jge	.L965
.L972:
	testl	%ebx, %ebx
	jle	.L921
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	vmovsd	.LC5(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm1
	cmpl	$1, %ebx
	je	.L982
	movl	%ebx, %edx
	shrl	%edx
	decl	%edx
	salq	$5, %rdx
	vbroadcastsd	%xmm1, %ymm2
	movq	%r15, %rax
	leaq	32(%r15,%rdx), %rdx
	.p2align 4,,10
	.p2align 3
.L968:
	vmulpd	(%rax), %ymm2, %ymm0
	addq	$32, %rax
	vmovupd	%ymm0, -32(%rax)
	cmpq	%rax, %rdx
	jne	.L968
	movl	%ebx, %eax
	andl	$-2, %eax
	andl	$1, %ebx
	je	.L1032
	vzeroupper
.L967:
	salq	$4, %rax
	addq	%r15, %rax
	vmovddup	%xmm1, %xmm0
	vmulpd	(%rax), %xmm0, %xmm0
	vmovupd	%xmm0, (%rax)
	jmp	.L921
	.p2align 4,,10
	.p2align 3
.L961:
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	_Z6fft_b2P7ComplexIdvEi
	jmp	.L964
	.p2align 4,,10
	.p2align 3
.L949:
	movq	%rdx, %rdi
	movq	%rdx, %rsi
	salq	$4, %rdi
	negq	%rsi
	leaq	(%r12,%rcx), %rax
	addq	%r12, %rdi
	salq	$3, %rsi
	.p2align 4,,10
	.p2align 3
.L955:
	movq	(%rax), %rcx
	addq	(%rax,%rsi), %rcx
	movq	%rcx, (%rax)
	incq	%rcx
	movq	%rcx, (%rax,%r15,8)
	addq	$8, %rax
	cmpq	%rdi, %rax
	jne	.L955
	jmp	.L956
.L979:
	movq	%r14, %rax
	jmp	.L937
.L981:
	movq	%rdx, %rax
	xorl	%esi, %esi
	jmp	.L950
.L1032:
	vzeroupper
	jmp	.L921
.L1028:
	xorl	%esi, %esi
	movl	$64, %edi
	movq	%r9, 32(%rsp)
	movq	%r8, 40(%rsp)
	call	aligned_alloc@PLT
	movl	$8, %edi
	movq	%rax, %r12
	call	malloc@PLT
	movl	$8, %edi
	movq	%rax, %r15
	movq	%rax, 56(%rsp)
	call	malloc@PLT
	movq	%rax, 48(%rsp)
	movq	$0, (%r15)
	movq	$1, (%rax)
	movq	40(%rsp), %r8
	movq	32(%rsp), %r9
	xorl	%r15d, %r15d
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	jmp	.L974
	.p2align 4,,10
	.p2align 3
.L1012:
	leaq	0(,%rbx,8), %r14
	movq	%r14, %rsi
	movl	$64, %edi
	movq	%r9, 32(%rsp)
	movq	%r8, 40(%rsp)
	vzeroupper
	call	aligned_alloc@PLT
	movl	$8, %edi
	movq	%rax, %r12
	call	malloc@PLT
	movl	$8, %edi
	movq	%rax, %r15
	movq	%rax, 56(%rsp)
	call	malloc@PLT
	movq	$1, (%rax)
	movq	%rbx, (%r15)
	movq	%r14, %rdx
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	%rax, 48(%rsp)
	movq	%rbx, %r15
	call	memset@PLT
	blsmsk	%rbx, %rcx
	incq	%rcx
	movq	40(%rsp), %r8
	movq	32(%rsp), %r9
	shrq	%rcx
	shrq	%r15
	movq	%rbx, %r14
	jmp	.L974
.L1026:
	vzeroupper
	jmp	.L948
.L978:
	xorl	%eax, %eax
	jmp	.L927
.L982:
	xorl	%eax, %eax
	jmp	.L967
	.cfi_endproc
.LFE10516:
	.size	_ZN3FFT8ifft_intERK13MdStaticArrayI7ComplexIdvEE, .-_ZN3FFT8ifft_intERK13MdStaticArrayI7ComplexIdvEE
	.align 2
	.p2align 4
	.globl	_ZN3FFT8ifft_intERK10ArraySliceI7ComplexIdvEE
	.type	_ZN3FFT8ifft_intERK10ArraySliceI7ComplexIdvEE, @function
_ZN3FFT8ifft_intERK10ArraySliceI7ComplexIdvEE:
.LFB10518:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	16(%rsi), %rax
	movq	(%rsi), %rdi
	movzwl	24(%rsi), %edx
	salq	$4, %rax
	vmovq	%rax, %xmm1
	movzwl	%dx, %esi
	movzwl	40(%rdi), %eax
	salq	$3, %rsi
	vpinsrq	$1, %rsi, %xmm1, %xmm0
	subl	%edx, %eax
	movq	16(%rdi), %rcx
	vpaddq	8(%rdi), %xmm0, %xmm0
	addq	24(%rdi), %rsi
	movw	%ax, 40(%rsp)
	movq	32(%rdi), %rax
	movq	%rsi, 24(%rsp)
	movq	%rax, 32(%rsp)
	vmovdqu	%xmm0, 8(%rsp)
	testw	%dx, %dx
	je	.L1038
	decl	%edx
	movzwl	%dx, %edx
	leaq	(%rcx,%rdx,8), %rsi
	.p2align 4,,10
	.p2align 3
.L1037:
	xorl	%edx, %edx
	divq	(%rcx)
	movq	%rcx, %rdx
	addq	$8, %rcx
	movq	%rax, 32(%rsp)
	cmpq	%rsi, %rdx
	jne	.L1037
.L1038:
	movq	%rsp, %rsi
	movq	%r12, %rdi
	movb	$1, (%rsp)
	call	_ZN3FFT8ifft_intERK13MdStaticArrayI7ComplexIdvEE
	cmpb	$0, (%rsp)
	jne	.L1033
	movq	8(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1039
	call	free@PLT
.L1039:
	movq	16(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1040
	call	free@PLT
.L1040:
	movq	24(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1033
	call	free@PLT
.L1033:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1054
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movq	%r12, %rax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L1054:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE10518:
	.size	_ZN3FFT8ifft_intERK10ArraySliceI7ComplexIdvEE, .-_ZN3FFT8ifft_intERK10ArraySliceI7ComplexIdvEE
	.align 2
	.p2align 4
	.globl	_ZN3FFT8ifft_intERK21MdStaticAxisReferenceI7ComplexIdvEE
	.type	_ZN3FFT8ifft_intERK21MdStaticAxisReferenceI7ComplexIdvEE, @function
_ZN3FFT8ifft_intERK21MdStaticAxisReferenceI7ComplexIdvEE:
.LFB10517:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rsi, %r15
	pushq	%r14
	.cfi_offset 14, -32
	movq	%rdi, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	48(%rsi), %rbx
	movb	$0, (%rdi)
	movq	%rbx, %rsi
	salq	$4, %rsi
	movl	$64, %edi
	call	aligned_alloc@PLT
	movq	%rax, 8(%r14)
	movq	%rbx, 32(%r14)
	movl	$8, %edi
	movq	%rax, %r13
	call	malloc@PLT
	movq	%rax, 16(%r14)
	movl	$8, %edi
	movq	%rax, %r12
	call	malloc@PLT
	movq	%rax, 24(%r14)
	movq	$1, (%rax)
	movl	$1, %eax
	movq	%rbx, (%r12)
	movw	%ax, 40(%r14)
	cmpq	$100000, %rbx
	jbe	.L1157
	movq	%rbx, %rdx
	shrq	%rdx
	salq	$5, %rdx
	movq	%r13, %rax
	addq	%r13, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
.L1059:
	vmovapd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L1059
	movq	%rbx, %rax
	andq	$-2, %rax
	testb	$1, %bl
	je	.L1154
	salq	$4, %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 0(%r13,%rax)
	vzeroupper
	jmp	.L1064
	.p2align 4,,10
	.p2align 3
.L1157:
	testq	%rbx, %rbx
	je	.L1068
	cmpq	$1, %rbx
	je	.L1115
	movq	%rbx, %rdx
	shrq	%rdx
	salq	$5, %rdx
	movq	%r13, %rax
	addq	%r13, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L1062:
	vmovapd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L1062
	movq	%rbx, %rax
	andq	$-2, %rax
	testb	$1, %bl
	je	.L1154
	vzeroupper
.L1061:
	salq	$4, %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 0(%r13,%rax)
.L1064:
	cmpq	$64, %rbx
	jbe	.L1111
	testb	$1, %bl
	je	.L1158
.L1111:
	movq	(%r15), %rcx
	movq	16(%r15), %rax
	movq	40(%r15), %rdx
	movq	8(%rcx), %rcx
	cmpq	$1, %rax
	jne	.L1159
	salq	$4, %rdx
	addq	%rdx, %rcx
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1069:
	vmovdqu	(%rcx,%rax), %xmm4
	incq	%rdx
	vmovdqa	%xmm4, 0(%r13,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rbx
	ja	.L1069
.L1068:
	movl	%ebx, %edx
	xorl	%esi, %esi
	movq	%r13, %rdi
	call	_Z33idft_subarray_inplace_without_divP7ComplexIdvEii
.L1055:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	movq	%r14, %rax
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1154:
	.cfi_restore_state
	vzeroupper
	jmp	.L1064
	.p2align 4,,10
	.p2align 3
.L1158:
	leaq	0(,%rbx,8), %rdx
	blsmsk	%rbx, %r8
	incq	%r8
	shrq	%r8
	movq	%rdx, %rsi
	movl	$64, %edi
	movq	%r8, (%rsp)
	movq	%rdx, 8(%rsp)
	call	aligned_alloc@PLT
	movl	$8, %edi
	movq	%rax, %r12
	call	malloc@PLT
	movl	$8, %edi
	movq	%rax, 24(%rsp)
	call	malloc@PLT
	movq	24(%rsp), %rcx
	movq	(%rsp), %r8
	cmpq	$100000, %rbx
	movq	8(%rsp), %rdx
	movq	%rax, 16(%rsp)
	movq	%rbx, (%rcx)
	movq	$1, (%rax)
	movq	%r8, 8(%rsp)
	jbe	.L1071
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	memset@PLT
	movq	8(%rsp), %r8
.L1073:
	movq	%rbx, %rcx
	movl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L1072:
	movq	%rcx, %rdi
	shrq	%rcx
	cmpq	%rcx, %rdi
	jbe	.L1079
	movq	%rdi, %r9
	subq	%rcx, %r9
	leaq	-1(%r9), %rax
	cmpq	$2, %rax
	jbe	.L1116
	movq	%r9, %rdx
	shrq	$2, %rdx
	vmovq	%rsi, %xmm7
	leaq	(%r12,%rcx,8), %rax
	salq	$5, %rdx
	vpbroadcastq	%xmm7, %ymm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L1077:
	vmovdqu	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L1077
	movq	%r9, %rdx
	andq	$-4, %rdx
	leaq	(%rcx,%rdx), %rax
	cmpq	%rdx, %r9
	je	.L1079
.L1076:
	leaq	1(%rax), %r9
	movq	%rsi, (%r12,%rax,8)
	leaq	0(,%rax,8), %rdx
	cmpq	%r9, %rdi
	jbe	.L1079
	addq	$2, %rax
	movq	%rsi, 8(%r12,%rdx)
	cmpq	%rdi, %rax
	jnb	.L1079
	movq	%rsi, 16(%r12,%rdx)
.L1079:
	addq	%rsi, %rsi
	testb	$1, %cl
	je	.L1072
	movq	%rbx, %rdi
	shrq	%rdi
	leaq	8(%r12), %rax
	leaq	(%r12,%rcx,8), %rsi
	cmpq	$1, %rcx
	je	.L1082
	.p2align 4,,10
	.p2align 3
.L1084:
	movq	-8(%rax), %rdx
	addq	%r8, %rdx
	movq	%rdx, (%rax)
	incq	%rdx
	movq	%rdx, (%rax,%rdi,8)
	addq	$8, %rax
	cmpq	%rax, %rsi
	jne	.L1084
	cmpq	%rdi, %rcx
	jnb	.L1083
.L1082:
	vmovdqa	.LC16(%rip), %xmm2
	vmovdqa	.LC15(%rip), %ymm1
	movq	%rcx, %rdx
	.p2align 4,,10
	.p2align 3
.L1096:
	leaq	8(,%rdx,8), %r10
	leaq	-16(%r10), %rax
	cmpq	$16, %rax
	seta	%r11b
	leaq	(%rdx,%rdi), %r9
	cmpq	$1, %rdx
	setne	%al
	leaq	0(,%r9,8), %r8
	andl	%eax, %r11d
	movq	%r8, %rax
	subq	%r10, %rax
	cmpq	$16, %rax
	seta	%r10b
	leaq	0(,%rdx,8), %rsi
	testb	%r10b, %r11b
	je	.L1088
	leaq	-8(%r8), %rax
	cmpq	$16, %rax
	jbe	.L1088
	leaq	-1(%rdx), %rax
	cmpq	$2, %rax
	jbe	.L1118
	movq	%rdx, %r10
	shrq	$2, %r10
	addq	%r12, %rsi
	addq	%r12, %r8
	salq	$5, %r10
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1090:
	vmovdqu	(%rsi,%rax), %ymm3
	vpaddq	(%r12,%rax), %ymm3, %ymm0
	vmovdqu	%ymm0, (%rsi,%rax)
	vpaddq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, (%r8,%rax)
	addq	$32, %rax
	cmpq	%r10, %rax
	jne	.L1090
	movq	%rdx, %r8
	andq	$-4, %r8
	testb	$3, %dl
	je	.L1095
	movq	%rdx, %rax
	subq	%r8, %rax
	cmpq	$1, %rax
	je	.L1092
.L1089:
	leaq	(%r8,%rdx), %rsi
	leaq	(%r12,%rsi,8), %rsi
	vmovdqu	(%rsi), %xmm5
	addq	%r8, %r9
	vpaddq	(%r12,%r8,8), %xmm5, %xmm0
	vmovdqu	%xmm0, (%rsi)
	movq	%rax, %rsi
	vpaddq	%xmm2, %xmm0, %xmm0
	andq	$-2, %rsi
	vmovdqu	%xmm0, (%r12,%r9,8)
	addq	%rsi, %r8
	cmpq	%rsi, %rax
	je	.L1095
.L1092:
	leaq	(%r8,%rdx), %rsi
	leaq	(%r12,%rsi,8), %r9
	movq	(%r9), %rax
	addq	%rdi, %rsi
	addq	(%r12,%r8,8), %rax
	movq	%rax, (%r9)
	incq	%rax
	movq	%rax, (%r12,%rsi,8)
.L1095:
	addq	%rdx, %rdx
	cmpq	%rdi, %rdx
	jb	.L1096
.L1083:
	movq	(%r15), %rax
	movq	16(%r15), %rsi
	movq	8(%rax), %rdi
	movq	40(%r15), %r8
	cmpq	$1, %rsi
	jne	.L1117
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1087:
	movq	(%r12,%rax,8), %rdx
	movq	%rax, %rsi
	addq	%r8, %rdx
	salq	$4, %rdx
	vmovdqu	(%rdi,%rdx), %xmm2
	salq	$4, %rsi
	incq	%rax
	vmovdqa	%xmm2, 0(%r13,%rsi)
	cmpq	%rax, %rbx
	ja	.L1087
.L1097:
	movq	%r12, %rdi
	movq	%rcx, 8(%rsp)
	vzeroupper
	call	free@PLT
	movq	24(%rsp), %rdi
	movl	%ebx, %r12d
	call	free@PLT
	movq	16(%rsp), %rdi
	xorl	%r15d, %r15d
	call	free@PLT
	movq	8(%rsp), %rcx
	movl	%ecx, %eax
	cmpq	$1, %rcx
	je	.L1160
	movl	%r12d, 24(%rsp)
	movq	%r13, %rdi
	movq	%r15, %r12
	movq	%rcx, %r13
	movl	%eax, %r15d
	jmp	.L1099
	.p2align 4,,10
	.p2align 3
.L1161:
	movq	8(%r14), %rdi
.L1099:
	leal	(%r15,%r12), %edx
	movl	%r12d, %esi
	addq	%r13, %r12
	call	_Z33idft_subarray_inplace_without_divP7ComplexIdvEii
	cmpq	%rbx, %r12
	jb	.L1161
	movq	%r13, %rcx
	leal	(%rcx,%rcx), %r15d
	movl	24(%rsp), %r12d
	movq	8(%r14), %r13
	cmpl	%ebx, %r15d
	jle	.L1100
	jmp	.L1055
	.p2align 4,,10
	.p2align 3
.L1162:
	movl	%r15d, %edx
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	_Z8ifft_oddP7ComplexIdvEii
.L1104:
	addl	%r15d, %r15d
	cmpl	%r12d, %r15d
	jg	.L1055
.L1100:
	cmpl	$2, %r15d
	je	.L1101
	cmpl	$4, %r15d
	jne	.L1162
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	_Z7ifft_b4P7ComplexIdvEi
	jmp	.L1104
	.p2align 4,,10
	.p2align 3
.L1101:
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	_Z6fft_b2P7ComplexIdvEi
	jmp	.L1104
	.p2align 4,,10
	.p2align 3
.L1088:
	movq	%rdx, %r9
	movq	%rdx, %r8
	salq	$4, %r9
	negq	%r8
	leaq	(%r12,%rsi), %rax
	addq	%r12, %r9
	salq	$3, %r8
	.p2align 4,,10
	.p2align 3
.L1094:
	movq	(%rax), %rsi
	addq	(%rax,%r8), %rsi
	movq	%rsi, (%rax)
	incq	%rsi
	movq	%rsi, (%rax,%rdi,8)
	addq	$8, %rax
	cmpq	%rax, %r9
	jne	.L1094
	jmp	.L1095
	.p2align 4,,10
	.p2align 3
.L1159:
	salq	$4, %rax
	salq	$4, %rdx
	movq	%rax, %rsi
	leaq	(%rcx,%rdx), %rax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1067:
	vmovdqu	(%rax), %xmm6
	movq	%rdx, %rcx
	salq	$4, %rcx
	incq	%rdx
	vmovdqa	%xmm6, 0(%r13,%rcx)
	addq	%rsi, %rax
	cmpq	%rdx, %rbx
	ja	.L1067
	jmp	.L1068
.L1116:
	movq	%rcx, %rax
	jmp	.L1076
.L1118:
	movq	%rdx, %rax
	xorl	%r8d, %r8d
	jmp	.L1089
.L1071:
	testq	%rbx, %rbx
	movl	$8, %eax
	cmove	%rax, %rdx
	movq	%r12, %rdi
	xorl	%esi, %esi
	call	memset@PLT
	movq	8(%rsp), %r8
	jmp	.L1073
.L1115:
	xorl	%eax, %eax
	jmp	.L1061
.L1160:
	cmpl	$1, %ebx
	jle	.L1055
	movl	$2, %ebx
	jmp	.L1110
	.p2align 4,,10
	.p2align 3
.L1163:
	movl	%ebx, %edx
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	_Z8ifft_oddP7ComplexIdvEii
.L1109:
	addl	%ebx, %ebx
	cmpl	%r12d, %ebx
	jg	.L1055
.L1110:
	cmpl	$2, %ebx
	je	.L1106
	cmpl	$4, %ebx
	jne	.L1163
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	_Z7ifft_b4P7ComplexIdvEi
	jmp	.L1109
.L1106:
	movl	%r12d, %esi
	movq	%r13, %rdi
	call	_Z6fft_b2P7ComplexIdvEi
	jmp	.L1109
.L1117:
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1086:
	movq	(%r12,%rdx,8), %rax
	movq	%rdx, %r9
	imulq	%rsi, %rax
	salq	$4, %r9
	incq	%rdx
	addq	%r8, %rax
	salq	$4, %rax
	vmovdqu	(%rdi,%rax), %xmm7
	vmovdqa	%xmm7, 0(%r13,%r9)
	cmpq	%rdx, %rbx
	ja	.L1086
	jmp	.L1097
	.cfi_endproc
.LFE10517:
	.size	_ZN3FFT8ifft_intERK21MdStaticAxisReferenceI7ComplexIdvEE, .-_ZN3FFT8ifft_intERK21MdStaticAxisReferenceI7ComplexIdvEE
	.section	.text._ZNSt6vectorISt6threadSaIS0_EED2Ev,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorISt6threadSaIS0_EED2Ev
	.type	_ZNSt6vectorISt6threadSaIS0_EED2Ev, @function
_ZNSt6vectorISt6threadSaIS0_EED2Ev:
.LFB11421:
	.cfi_startproc
	endbr64
	movq	8(%rdi), %rdx
	movq	(%rdi), %r8
	cmpq	%r8, %rdx
	je	.L1165
	movq	%r8, %rax
	.p2align 4,,10
	.p2align 3
.L1167:
	cmpq	$0, (%rax)
	jne	.L1174
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L1167
.L1165:
	testq	%r8, %r8
	je	.L1170
	movq	16(%rdi), %rsi
	movq	%r8, %rdi
	subq	%r8, %rsi
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L1170:
	ret
.L1174:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_ZSt9terminatev@PLT
	.cfi_endproc
.LFE11421:
	.size	_ZNSt6vectorISt6threadSaIS0_EED2Ev, .-_ZNSt6vectorISt6threadSaIS0_EED2Ev
	.weak	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	.set	_ZNSt6vectorISt6threadSaIS0_EED1Ev,_ZNSt6vectorISt6threadSaIS0_EED2Ev
	.section	.text.unlikely
.LCOLDB17:
	.text
.LHOTB17:
	.p2align 4
	.globl	_Z10mul_mt_c32P7ComplexIfvES1_S1_iii
	.type	_Z10mul_mt_c32P7ComplexIfvES1_S1_iii, @function
_Z10mul_mt_c32P7ComplexIfvES1_S1_iii:
.LFB10928:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA10928
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movl	%ecx, %r15d
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%r9d, %ebx
	imull	%ecx, %ebx
	subq	$152, %rsp
	movq	%rdi, 72(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movl	%r8d, 12(%rsp)
	movl	%r9d, 8(%rsp)
	movl	%ebx, %r12d
	andl	$-4, %r12d
	movslq	%r12d, %r12
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	testq	%r12, %r12
	je	.L1176
	movq	%rdx, %rdi
	xorl	%esi, %esi
	leaq	0(,%r12,8), %rdx
	call	memset@PLT
.L1176:
	movslq	%ebx, %rdx
	cmpq	%r12, %rdx
	jbe	.L1183
	subq	%r12, %rdx
	leaq	-1(%rdx), %rax
	cmpq	$2, %rax
	jbe	.L1211
	movq	24(%rsp), %rax
	movq	%rdx, %rcx
	shrq	$2, %rcx
	leaq	(%rax,%r12,8), %rax
	salq	$5, %rcx
	addq	%rax, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L1181:
	vmovups	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rcx, %rax
	jne	.L1181
	movq	%rdx, %rcx
	andq	$-4, %rcx
	leaq	(%rcx,%r12), %rax
	cmpq	%rdx, %rcx
	je	.L1255
	vzeroupper
.L1180:
	subq	%rcx, %rdx
	cmpq	$1, %rdx
	je	.L1185
	movq	24(%rsp), %rsi
	addq	%r12, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, (%rsi,%rcx,8)
	movq	%rdx, %rcx
	andq	$-2, %rcx
	addq	%rcx, %rax
	cmpq	%rcx, %rdx
	je	.L1183
.L1185:
	movq	24(%rsp), %rsi
	movq	$0, (%rsi,%rax,8)
.L1183:
	movq	$0, 112(%rsp)
	movq	$0, 120(%rsp)
	movq	$0, 128(%rsp)
	cmpl	$1023, %r15d
	jle	.L1256
	movl	%r15d, %eax
	sarl	$4, %eax
	movl	%eax, 4(%rsp)
	movl	$15, (%rsp)
	movq	$15, 64(%rsp)
.L1209:
	movslq	4(%rsp), %rax
	vmovd	8(%rsp), %xmm7
	vmovq	24(%rsp), %xmm4
	vpinsrd	$1, 12(%rsp), %xmm7, %xmm7
	vpinsrq	$1, 16(%rsp), %xmm4, %xmm1
	movq	%rax, 56(%rsp)
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	leaq	112(%rsp), %r14
	vmovq	%xmm7, 48(%rsp)
	vmovdqa	%xmm1, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L1194:
	movl	$72, %edi
	movq	%rbx, %r12
	movq	$0, 88(%rsp)
	incq	%r13
	addq	56(%rsp), %rbx
.LEHB2:
	call	_Znwm@PLT
.LEHE2:
	movq	48(%rsp), %rdx
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE(%rip), %rcx
	movq	%rcx, (%rax)
	movq	72(%rsp), %rcx
	movq	%rdx, 24(%rax)
	leaq	_Z19mul_mt_internal_c32P7ComplexIfvES1_S1_iiiii(%rip), %rdx
	movq	%rdx, 64(%rax)
	vmovdqa	32(%rsp), %xmm3
	vmovq	%rbx, %xmm2
	movl	%r15d, 32(%rax)
	movq	%rcx, 56(%rax)
	vpinsrq	$1, %r12, %xmm2, %xmm0
	leaq	88(%rsp), %r12
	vmovdqu	%xmm0, 8(%rax)
	vmovdqu	%xmm3, 40(%rax)
	leaq	104(%rsp), %rsi
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rax, 104(%rsp)
.LEHB3:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE3:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1188
	movq	(%rdi), %rax
	call	*8(%rax)
.L1188:
	movq	%r12, %rsi
	movq	%r14, %rdi
.LEHB4:
	call	_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJS0_EEERS0_DpOT_.isra.0
.LEHE4:
	cmpq	$0, 88(%rsp)
	jne	.L1199
	cmpq	64(%rsp), %r13
	jb	.L1194
	movl	(%rsp), %ebx
	imull	4(%rsp), %ebx
.L1187:
	movl	$64, %edi
	movq	$0, 96(%rsp)
.LEHB5:
	call	_Znwm@PLT
.LEHE5:
	vmovd	8(%rsp), %xmm4
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE(%rip), %rsi
	vpinsrd	$1, 12(%rsp), %xmm4, %xmm1
	vmovd	%r15d, %xmm5
	vpinsrd	$1, %ebx, %xmm5, %xmm0
	movq	%rsi, (%rax)
	vmovq	24(%rsp), %xmm6
	movq	72(%rsp), %rsi
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	leaq	_Z19mul_mt_internal_c32P7ComplexIfvES1_S1_iiiii(%rip), %rbx
	movq	%rsi, 48(%rax)
	vmovdqu	%xmm0, 8(%rax)
	movl	%r15d, 24(%rax)
	vpinsrq	$1, 16(%rsp), %xmm6, %xmm0
	movq	%rbx, 56(%rax)
	leaq	96(%rsp), %r12
	vmovdqu	%xmm0, 32(%rax)
	leaq	104(%rsp), %rsi
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rax, 104(%rsp)
.LEHB6:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE6:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1195
	movq	(%rdi), %rax
	call	*8(%rax)
.L1195:
	movq	%r12, %rsi
	movq	%r14, %rdi
.LEHB7:
	call	_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJS0_EEERS0_DpOT_.isra.0
.LEHE7:
	cmpq	$0, 96(%rsp)
	jne	.L1199
	movq	112(%rsp), %r13
	movq	120(%rsp), %r12
	movq	%r13, %rbx
	cmpq	%r13, %r12
	je	.L1205
	.p2align 4,,10
	.p2align 3
.L1203:
	movq	%rbx, %rdi
.LEHB8:
	call	_ZNSt6thread4joinEv@PLT
.LEHE8:
	addq	$8, %rbx
	cmpq	%rbx, %r12
	jne	.L1203
	movq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L1204:
	cmpq	$0, (%rax)
	jne	.L1199
	addq	$8, %rax
	cmpq	%rax, %r12
	jne	.L1204
.L1205:
	testq	%r13, %r13
	je	.L1257
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1253
	movq	128(%rsp), %rsi
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	subq	%r13, %rsi
	movq	%r13, %rdi
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L1257:
	.cfi_restore_state
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1253
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1256:
	.cfi_restore_state
	testl	%r15d, %r15d
	leal	63(%r15), %ecx
	cmovns	%r15d, %ecx
	movl	%r15d, %eax
	sarl	$6, %ecx
	cltd
	idivl	%ecx
	movl	%eax, 4(%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, (%rsp)
	cltq
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	jne	.L1209
	xorl	%ebx, %ebx
	leaq	112(%rsp), %r14
	jmp	.L1187
	.p2align 4,,10
	.p2align 3
.L1255:
	vzeroupper
	jmp	.L1183
.L1211:
	movq	%r12, %rax
	xorl	%ecx, %ecx
	jmp	.L1180
.L1199:
	call	_ZSt9terminatev@PLT
.L1253:
	call	__stack_chk_fail@PLT
.L1213:
	endbr64
	movq	%rax, %r12
	jmp	.L1207
.L1215:
	endbr64
	movq	%rax, %r12
	jmp	.L1208
.L1216:
	endbr64
	movq	%rax, %r12
	jmp	.L1197
.L1217:
	endbr64
	movq	%rax, %r12
	jmp	.L1197
.L1214:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1192
	.section	.gcc_except_table
.LLSDA10928:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE10928-.LLSDACSB10928
.LLSDACSB10928:
	.uleb128 .LEHB2-.LFB10928
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L1214-.LFB10928
	.uleb128 0
	.uleb128 .LEHB3-.LFB10928
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L1216-.LFB10928
	.uleb128 0
	.uleb128 .LEHB4-.LFB10928
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L1213-.LFB10928
	.uleb128 0
	.uleb128 .LEHB5-.LFB10928
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L1214-.LFB10928
	.uleb128 0
	.uleb128 .LEHB6-.LFB10928
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L1217-.LFB10928
	.uleb128 0
	.uleb128 .LEHB7-.LFB10928
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L1215-.LFB10928
	.uleb128 0
	.uleb128 .LEHB8-.LFB10928
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L1214-.LFB10928
	.uleb128 0
.LLSDACSE10928:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC10928
	.type	_Z10mul_mt_c32P7ComplexIfvES1_S1_iii.cold, @function
_Z10mul_mt_c32P7ComplexIfvES1_S1_iii.cold:
.LFSB10928:
.L1208:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	cmpq	$0, 96(%rsp)
	je	.L1247
	vzeroupper
	jmp	.L1199
.L1197:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	jne	.L1258
.L1247:
	vzeroupper
.L1192:
	movq	%r14, %rdi
	call	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	movq	%r12, %rdi
.LEHB9:
	call	_Unwind_Resume@PLT
.LEHE9:
.L1207:
	cmpq	$0, 88(%rsp)
	je	.L1247
	vzeroupper
	jmp	.L1199
.L1258:
	movq	(%rdi), %rax
	vzeroupper
	call	*8(%rax)
	jmp	.L1192
	.cfi_endproc
.LFE10928:
	.section	.gcc_except_table
.LLSDAC10928:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC10928-.LLSDACSBC10928
.LLSDACSBC10928:
	.uleb128 .LEHB9-.LCOLDB17
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
.LLSDACSEC10928:
	.section	.text.unlikely
	.text
	.size	_Z10mul_mt_c32P7ComplexIfvES1_S1_iii, .-_Z10mul_mt_c32P7ComplexIfvES1_S1_iii
	.section	.text.unlikely
	.size	_Z10mul_mt_c32P7ComplexIfvES1_S1_iii.cold, .-_Z10mul_mt_c32P7ComplexIfvES1_S1_iii.cold
.LCOLDE17:
	.text
.LHOTE17:
	.section	.text.unlikely
.LCOLDB18:
	.text
.LHOTB18:
	.p2align 4
	.globl	_Z10mul_mt_c64P7ComplexIdvES1_S1_iii
	.type	_Z10mul_mt_c64P7ComplexIdvES1_S1_iii, @function
_Z10mul_mt_c64P7ComplexIdvES1_S1_iii:
.LFB10942:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA10942
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movl	%ecx, %r15d
	movl	%r9d, %ecx
	pushq	%r14
	imull	%r15d, %ecx
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdx, %rbx
	subq	$152, %rsp
	movq	%rdx, 24(%rsp)
	movq	%rdi, 72(%rsp)
	movq	%rsi, 16(%rsp)
	movl	%r8d, 12(%rsp)
	movl	%r9d, 8(%rsp)
	movl	%ecx, %edx
	andl	$-4, %edx
	movslq	%edx, %rdx
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	testq	%rdx, %rdx
	je	.L1260
	movq	%rdx, %rsi
	salq	$4, %rsi
	movq	%rbx, %rax
	addq	%rbx, %rsi
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L1261:
	vmovupd	%ymm0, (%rax)
	addq	$64, %rax
	cmpq	%rsi, %rax
	jne	.L1261
.L1260:
	movslq	%ecx, %rcx
	cmpq	%rdx, %rcx
	jbe	.L1268
	subq	%rdx, %rcx
	cmpq	$1, %rcx
	je	.L1265
	movq	%rdx, %rax
	movq	%rcx, %rsi
	salq	$4, %rax
	shrq	%rsi
	addq	24(%rsp), %rax
	salq	$5, %rsi
	addq	%rax, %rsi
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L1266:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rax, %rsi
	jne	.L1266
	movq	%rcx, %rax
	andq	$-2, %rax
	addq	%rax, %rdx
	cmpq	%rax, %rcx
	je	.L1268
.L1265:
	movq	24(%rsp), %rax
	salq	$4, %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%xmm0, (%rax,%rdx)
.L1268:
	movq	$0, 112(%rsp)
	movq	$0, 120(%rsp)
	movq	$0, 128(%rsp)
	cmpl	$511, %r15d
	jle	.L1337
	movl	%r15d, %eax
	sarl	$4, %eax
	movl	%eax, 4(%rsp)
	movl	$15, (%rsp)
	movq	$15, 64(%rsp)
.L1292:
	vmovd	8(%rsp), %xmm7
	vmovq	24(%rsp), %xmm4
	movslq	4(%rsp), %rax
	vpinsrd	$1, 12(%rsp), %xmm7, %xmm7
	vpinsrq	$1, 16(%rsp), %xmm4, %xmm1
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	leaq	112(%rsp), %r14
	movq	%rax, 56(%rsp)
	vmovq	%xmm7, 48(%rsp)
	vmovdqa	%xmm1, 32(%rsp)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L1277:
	movl	$72, %edi
	movq	%rbx, %r12
	movq	$0, 88(%rsp)
	incq	%r13
	addq	56(%rsp), %rbx
.LEHB10:
	call	_Znwm@PLT
.LEHE10:
	movq	48(%rsp), %rdx
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE(%rip), %rcx
	movq	%rcx, (%rax)
	movq	72(%rsp), %rcx
	movq	%rdx, 24(%rax)
	leaq	_Z15mul_mt_internalP7ComplexIdvES1_S1_iiiii(%rip), %rdx
	movq	%rdx, 64(%rax)
	vmovdqa	32(%rsp), %xmm3
	vmovq	%rbx, %xmm2
	movl	%r15d, 32(%rax)
	movq	%rcx, 56(%rax)
	vpinsrq	$1, %r12, %xmm2, %xmm0
	leaq	88(%rsp), %r12
	vmovdqu	%xmm0, 8(%rax)
	vmovdqu	%xmm3, 40(%rax)
	leaq	104(%rsp), %rsi
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rax, 104(%rsp)
.LEHB11:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE11:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1271
	movq	(%rdi), %rax
	call	*8(%rax)
.L1271:
	movq	%r12, %rsi
	movq	%r14, %rdi
.LEHB12:
	call	_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJS0_EEERS0_DpOT_.isra.0
.LEHE12:
	cmpq	$0, 88(%rsp)
	jne	.L1282
	cmpq	64(%rsp), %r13
	jb	.L1277
	movl	(%rsp), %ebx
	imull	4(%rsp), %ebx
.L1270:
	movl	$64, %edi
	movq	$0, 96(%rsp)
.LEHB13:
	call	_Znwm@PLT
.LEHE13:
	vmovd	8(%rsp), %xmm4
	vmovd	%r15d, %xmm5
	vpinsrd	$1, %ebx, %xmm5, %xmm0
	vpinsrd	$1, 12(%rsp), %xmm4, %xmm1
	movq	72(%rsp), %rbx
	vmovq	24(%rsp), %xmm6
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	movq	%rbx, 48(%rax)
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE(%rip), %rcx
	leaq	_Z15mul_mt_internalP7ComplexIdvES1_S1_iiiii(%rip), %rbx
	vmovdqu	%xmm0, 8(%rax)
	movq	%rcx, (%rax)
	vpinsrq	$1, 16(%rsp), %xmm6, %xmm0
	movl	%r15d, 24(%rax)
	movq	%rbx, 56(%rax)
	leaq	96(%rsp), %r12
	vmovdqu	%xmm0, 32(%rax)
	leaq	104(%rsp), %rsi
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rax, 104(%rsp)
.LEHB14:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE14:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1278
	movq	(%rdi), %rax
	call	*8(%rax)
.L1278:
	movq	%r12, %rsi
	movq	%r14, %rdi
.LEHB15:
	call	_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJS0_EEERS0_DpOT_.isra.0
.LEHE15:
	cmpq	$0, 96(%rsp)
	jne	.L1282
	movq	112(%rsp), %r13
	movq	120(%rsp), %r12
	movq	%r13, %rbx
	cmpq	%r13, %r12
	je	.L1288
	.p2align 4,,10
	.p2align 3
.L1286:
	movq	%rbx, %rdi
.LEHB16:
	call	_ZNSt6thread4joinEv@PLT
.LEHE16:
	addq	$8, %rbx
	cmpq	%rbx, %r12
	jne	.L1286
	movq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L1287:
	cmpq	$0, (%rax)
	jne	.L1282
	addq	$8, %rax
	cmpq	%rax, %r12
	jne	.L1287
.L1288:
	testq	%r13, %r13
	je	.L1338
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1335
	movq	128(%rsp), %rsi
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	subq	%r13, %rsi
	movq	%r13, %rdi
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L1338:
	.cfi_restore_state
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1335
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1337:
	.cfi_restore_state
	testl	%r15d, %r15d
	leal	31(%r15), %ecx
	cmovns	%r15d, %ecx
	movl	%r15d, %eax
	sarl	$5, %ecx
	cltd
	idivl	%ecx
	movl	%eax, 4(%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, (%rsp)
	cltq
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	jne	.L1292
	xorl	%ebx, %ebx
	leaq	112(%rsp), %r14
	vzeroupper
	jmp	.L1270
.L1282:
	call	_ZSt9terminatev@PLT
.L1335:
	call	__stack_chk_fail@PLT
.L1299:
	endbr64
	movq	%rax, %r12
	jmp	.L1280
.L1295:
	endbr64
	movq	%rax, %r12
	jmp	.L1290
.L1296:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1275
.L1298:
	endbr64
	movq	%rax, %r12
	jmp	.L1280
.L1297:
	endbr64
	movq	%rax, %r12
	jmp	.L1291
	.section	.gcc_except_table
.LLSDA10942:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE10942-.LLSDACSB10942
.LLSDACSB10942:
	.uleb128 .LEHB10-.LFB10942
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L1296-.LFB10942
	.uleb128 0
	.uleb128 .LEHB11-.LFB10942
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L1298-.LFB10942
	.uleb128 0
	.uleb128 .LEHB12-.LFB10942
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L1295-.LFB10942
	.uleb128 0
	.uleb128 .LEHB13-.LFB10942
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L1296-.LFB10942
	.uleb128 0
	.uleb128 .LEHB14-.LFB10942
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L1299-.LFB10942
	.uleb128 0
	.uleb128 .LEHB15-.LFB10942
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L1297-.LFB10942
	.uleb128 0
	.uleb128 .LEHB16-.LFB10942
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L1296-.LFB10942
	.uleb128 0
.LLSDACSE10942:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC10942
	.type	_Z10mul_mt_c64P7ComplexIdvES1_S1_iii.cold, @function
_Z10mul_mt_c64P7ComplexIdvES1_S1_iii.cold:
.LFSB10942:
.L1290:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	cmpq	$0, 88(%rsp)
	je	.L1329
	vzeroupper
	jmp	.L1282
.L1291:
	cmpq	$0, 96(%rsp)
	je	.L1329
	vzeroupper
	jmp	.L1282
.L1280:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	jne	.L1339
.L1329:
	vzeroupper
.L1275:
	movq	%r14, %rdi
	call	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	movq	%r12, %rdi
.LEHB17:
	call	_Unwind_Resume@PLT
.LEHE17:
.L1339:
	movq	(%rdi), %rax
	vzeroupper
	call	*8(%rax)
	jmp	.L1275
	.cfi_endproc
.LFE10942:
	.section	.gcc_except_table
.LLSDAC10942:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC10942-.LLSDACSBC10942
.LLSDACSBC10942:
	.uleb128 .LEHB17-.LCOLDB18
	.uleb128 .LEHE17-.LEHB17
	.uleb128 0
	.uleb128 0
.LLSDACSEC10942:
	.section	.text.unlikely
	.text
	.size	_Z10mul_mt_c64P7ComplexIdvES1_S1_iii, .-_Z10mul_mt_c64P7ComplexIdvES1_S1_iii
	.section	.text.unlikely
	.size	_Z10mul_mt_c64P7ComplexIdvES1_S1_iii.cold, .-_Z10mul_mt_c64P7ComplexIdvES1_S1_iii.cold
.LCOLDE18:
	.text
.LHOTE18:
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4
	.globl	_Z6mul_mtPdS_S_iii
	.type	_Z6mul_mtPdS_S_iii, @function
_Z6mul_mtPdS_S_iii:
.LFB10945:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA10945
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdx, 16(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%r9d, 28(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	movq	$0, 112(%rsp)
	movq	$0, 120(%rsp)
	movq	$0, 128(%rsp)
	cmpl	$1023, %ecx
	jle	.L1416
	movl	%ecx, %eax
	sarl	$4, %eax
	movl	%eax, 72(%rsp)
	movl	$15, 76(%rsp)
	movq	$15, 40(%rsp)
.L1373:
	movslq	72(%rsp), %rax
	xorl	%ebp, %ebp
	movq	%rax, 32(%rsp)
	xorl	%r12d, %r12d
	jmp	.L1358
	.p2align 4,,10
	.p2align 3
.L1344:
	movq	$0, (%rbx)
	addq	$8, %rbx
	movq	88(%rsp), %rax
	movq	%rax, -8(%rbx)
	movq	%rbx, 120(%rsp)
.L1349:
	cmpq	40(%rsp), %r12
	jnb	.L1417
.L1358:
	movl	$72, %edi
	movq	%rbp, %rbx
	movq	$0, 88(%rsp)
	incq	%r12
	addq	32(%rsp), %rbp
	leaq	112(%rsp), %r13
.LEHB18:
	call	_Znwm@PLT
.LEHE18:
	vmovd	28(%rsp), %xmm3
	vmovq	%rbp, %xmm2
	vpinsrq	$1, %rbx, %xmm2, %xmm0
	movq	(%rsp), %rdx
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE(%rip), %rcx
	vmovq	16(%rsp), %xmm4
	vmovdqu	%xmm0, 8(%rax)
	vpinsrd	$1, 24(%rsp), %xmm3, %xmm0
	movq	%rcx, (%rax)
	leaq	_Z19mul_mt_internal_f64PdS_S_iiiii(%rip), %rcx
	movq	%rdx, 56(%rax)
	vmovq	%xmm0, 24(%rax)
	movl	%r14d, 32(%rax)
	vpinsrq	$1, 8(%rsp), %xmm4, %xmm0
	movq	%rcx, 64(%rax)
	vmovdqu	%xmm0, 40(%rax)
	leaq	104(%rsp), %rsi
	leaq	88(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rax, 104(%rsp)
.LEHB19:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE19:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1343
	movq	(%rdi), %rax
	call	*8(%rax)
.L1343:
	movq	120(%rsp), %rbx
	movq	128(%rsp), %r13
	cmpq	%r13, %rbx
	jne	.L1344
	movq	112(%rsp), %r15
	movq	%rbx, %rax
	subq	%r15, %rax
	movq	%rax, 48(%rsp)
	movabsq	$1152921504606846975, %rsi
	sarq	$3, %rax
	cmpq	%rsi, %rax
	je	.L1418
	testq	%rax, %rax
	movl	$1, %edx
	cmovne	%rax, %rdx
	addq	%rdx, %rax
	jc	.L1352
	testq	%rax, %rax
	jne	.L1419
	movl	$8, %edx
	xorl	%r8d, %r8d
	xorl	%eax, %eax
.L1354:
	movq	88(%rsp), %rcx
	movq	48(%rsp), %rsi
	movq	$0, 88(%rsp)
	movq	%rcx, (%rax,%rsi)
	cmpq	%r15, %rbx
	je	.L1355
	subq	%r15, %rbx
	addq	%rax, %rbx
	movq	%r15, %rcx
	movq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L1356:
	movq	(%rcx), %rsi
	addq	$8, %rdx
	movq	%rsi, -8(%rdx)
	addq	$8, %rcx
	cmpq	%rbx, %rdx
	jne	.L1356
	addq	$8, %rdx
.L1355:
	vmovq	%rax, %xmm5
	vpinsrq	$1, %rdx, %xmm5, %xmm0
	testq	%r15, %r15
	je	.L1357
	movq	%r13, %rsi
	subq	%r15, %rsi
	movq	%r15, %rdi
	movq	%r8, 64(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	call	_ZdlPvm@PLT
	movq	64(%rsp), %r8
	vmovdqa	48(%rsp), %xmm0
.L1357:
	cmpq	$0, 88(%rsp)
	movq	%r8, 128(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	je	.L1349
.L1363:
	call	_ZSt9terminatev@PLT
	.p2align 4,,10
	.p2align 3
.L1417:
	movl	72(%rsp), %ebx
	imull	76(%rsp), %ebx
.L1342:
	movl	$64, %edi
	movq	$0, 96(%rsp)
	leaq	112(%rsp), %r13
.LEHB20:
	call	_Znwm@PLT
.LEHE20:
	vmovd	28(%rsp), %xmm6
	vmovd	%r14d, %xmm7
	vpinsrd	$1, 24(%rsp), %xmm6, %xmm1
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE(%rip), %rdx
	vpinsrd	$1, %ebx, %xmm7, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	movq	%rdx, (%rax)
	vmovq	16(%rsp), %xmm1
	movq	(%rsp), %rdx
	leaq	_Z19mul_mt_internal_f64PdS_S_iiiii(%rip), %rsi
	movq	%rdx, 48(%rax)
	movq	%rsi, 56(%rax)
	vmovdqu	%xmm0, 8(%rax)
	movl	%r14d, 24(%rax)
	vpinsrq	$1, 8(%rsp), %xmm1, %xmm0
	leaq	96(%rsp), %rbp
	vmovdqu	%xmm0, 32(%rax)
	leaq	104(%rsp), %rsi
	xorl	%edx, %edx
	movq	%rbp, %rdi
	movq	%rax, 104(%rsp)
.LEHB21:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE21:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1359
	movq	(%rdi), %rax
	call	*8(%rax)
.L1359:
	leaq	112(%rsp), %r13
	movq	%rbp, %rsi
	movq	%r13, %rdi
.LEHB22:
	call	_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJS0_EEERS0_DpOT_.isra.0
.LEHE22:
	cmpq	$0, 96(%rsp)
	jne	.L1363
	movq	112(%rsp), %r12
	movq	120(%rsp), %rbp
	movq	%r12, %rbx
	cmpq	%r12, %rbp
	je	.L1369
	.p2align 4,,10
	.p2align 3
.L1367:
	movq	%rbx, %rdi
.LEHB23:
	call	_ZNSt6thread4joinEv@PLT
.LEHE23:
	addq	$8, %rbx
	cmpq	%rbx, %rbp
	jne	.L1367
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L1368:
	cmpq	$0, (%rax)
	jne	.L1363
	addq	$8, %rax
	cmpq	%rax, %rbp
	jne	.L1368
.L1369:
	testq	%r12, %r12
	je	.L1420
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1413
	movq	128(%rsp), %rsi
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	subq	%r12, %rsi
	movq	%r12, %rdi
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L1420:
	.cfi_restore_state
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1413
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1416:
	.cfi_restore_state
	testl	%r14d, %r14d
	leal	63(%rcx), %ecx
	cmovns	%r14d, %ecx
	movl	%r14d, %eax
	sarl	$6, %ecx
	cltd
	idivl	%ecx
	movl	%eax, 72(%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, 76(%rsp)
	cltq
	movq	%rax, 40(%rsp)
	testq	%rax, %rax
	jne	.L1373
	xorl	%ebx, %ebx
	jmp	.L1342
.L1419:
	movabsq	$1152921504606846975, %rdx
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
	salq	$3, %rax
	movq	%rax, 64(%rsp)
	movq	%rax, %rdi
.L1353:
.LEHB24:
	call	_Znwm@PLT
	movq	64(%rsp), %r8
	leaq	8(%rax), %rdx
	addq	%rax, %r8
	jmp	.L1354
.L1352:
	movabsq	$9223372036854775800, %rax
	movq	%rax, 64(%rsp)
	movq	%rax, %rdi
	jmp	.L1353
.L1413:
	call	__stack_chk_fail@PLT
.L1418:
	leaq	.LC4(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE24:
.L1378:
	endbr64
	movq	%rax, %rbp
	jmp	.L1371
.L1382:
	endbr64
	movq	%rax, %rbp
	jmp	.L1361
.L1379:
	endbr64
	movq	%rax, %rbp
	vzeroupper
	jmp	.L1348
.L1381:
	endbr64
	movq	%rax, %rbp
	jmp	.L1361
.L1380:
	endbr64
	movq	%rax, %rbp
	jmp	.L1372
	.section	.gcc_except_table
.LLSDA10945:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE10945-.LLSDACSB10945
.LLSDACSB10945:
	.uleb128 .LEHB18-.LFB10945
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L1379-.LFB10945
	.uleb128 0
	.uleb128 .LEHB19-.LFB10945
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L1381-.LFB10945
	.uleb128 0
	.uleb128 .LEHB20-.LFB10945
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L1379-.LFB10945
	.uleb128 0
	.uleb128 .LEHB21-.LFB10945
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L1382-.LFB10945
	.uleb128 0
	.uleb128 .LEHB22-.LFB10945
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L1380-.LFB10945
	.uleb128 0
	.uleb128 .LEHB23-.LFB10945
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L1379-.LFB10945
	.uleb128 0
	.uleb128 .LEHB24-.LFB10945
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L1378-.LFB10945
	.uleb128 0
.LLSDACSE10945:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC10945
	.type	_Z6mul_mtPdS_S_iii.cold, @function
_Z6mul_mtPdS_S_iii.cold:
.LFSB10945:
.L1361:
	.cfi_def_cfa_offset 208
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1408
	movq	(%rdi), %rax
	vzeroupper
	call	*8(%rax)
.L1362:
	leaq	112(%rsp), %r13
.L1348:
	movq	%r13, %rdi
	call	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	movq	%rbp, %rdi
.LEHB25:
	call	_Unwind_Resume@PLT
.LEHE25:
.L1372:
	cmpq	$0, 96(%rsp)
	je	.L1421
	vzeroupper
	jmp	.L1363
.L1408:
	vzeroupper
	jmp	.L1362
.L1371:
	cmpq	$0, 88(%rsp)
	je	.L1422
	vzeroupper
	jmp	.L1363
.L1422:
	leaq	112(%rsp), %r13
	vzeroupper
	jmp	.L1348
.L1421:
	vzeroupper
	jmp	.L1348
	.cfi_endproc
.LFE10945:
	.section	.gcc_except_table
.LLSDAC10945:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC10945-.LLSDACSBC10945
.LLSDACSBC10945:
	.uleb128 .LEHB25-.LCOLDB19
	.uleb128 .LEHE25-.LEHB25
	.uleb128 0
	.uleb128 0
.LLSDACSEC10945:
	.section	.text.unlikely
	.text
	.size	_Z6mul_mtPdS_S_iii, .-_Z6mul_mtPdS_S_iii
	.section	.text.unlikely
	.size	_Z6mul_mtPdS_S_iii.cold, .-_Z6mul_mtPdS_S_iii.cold
.LCOLDE19:
	.text
.LHOTE19:
	.section	.text.unlikely
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4
	.globl	_Z10mul_mt_f32PfS_S_iii
	.type	_Z10mul_mt_f32PfS_S_iii, @function
_Z10mul_mt_f32PfS_S_iii:
.LFB10948:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA10948
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, (%rsp)
	movl	%r8d, 28(%rsp)
	movl	%r9d, 24(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	movl	%r9d, %eax
	imull	%ecx, %eax
	movl	%eax, %ecx
	andl	$-8, %ecx
	movslq	%ecx, %rcx
	cltq
	cmpq	%rax, %rcx
	jnb	.L1427
	subq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	movq	(%rsp), %rax
	xorl	%esi, %esi
	leaq	(%rax,%rcx,4), %rdi
	call	memset@PLT
.L1427:
	movq	$0, 112(%rsp)
	movq	$0, 120(%rsp)
	movq	$0, 128(%rsp)
	cmpl	$2047, %r14d
	jle	.L1503
	movl	%r14d, %eax
	sarl	$4, %eax
	movl	%eax, 72(%rsp)
	movq	$15, 40(%rsp)
	movl	$15, 76(%rsp)
.L1459:
	movslq	72(%rsp), %rax
	xorl	%ebp, %ebp
	movq	%rax, 32(%rsp)
	xorl	%r12d, %r12d
	jmp	.L1444
	.p2align 4,,10
	.p2align 3
.L1430:
	movq	$0, (%rbx)
	addq	$8, %rbx
	movq	88(%rsp), %rax
	movq	%rax, -8(%rbx)
	movq	%rbx, 120(%rsp)
.L1435:
	cmpq	40(%rsp), %r12
	jnb	.L1504
.L1444:
	movl	$72, %edi
	movq	%rbp, %rbx
	movq	$0, 88(%rsp)
	incq	%r12
	addq	32(%rsp), %rbp
	leaq	112(%rsp), %r13
.LEHB26:
	call	_Znwm@PLT
.LEHE26:
	vmovd	24(%rsp), %xmm3
	vmovq	%rbp, %xmm2
	vpinsrq	$1, %rbx, %xmm2, %xmm0
	movq	8(%rsp), %rdx
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE(%rip), %rcx
	vmovq	(%rsp), %xmm4
	vmovdqu	%xmm0, 8(%rax)
	vpinsrd	$1, 28(%rsp), %xmm3, %xmm0
	movq	%rcx, (%rax)
	leaq	_Z19mul_mt_f32_internalPfS_S_iiiii(%rip), %rcx
	movq	%rdx, 56(%rax)
	vmovq	%xmm0, 24(%rax)
	movl	%r14d, 32(%rax)
	vpinsrq	$1, 16(%rsp), %xmm4, %xmm0
	movq	%rcx, 64(%rax)
	vmovdqu	%xmm0, 40(%rax)
	leaq	104(%rsp), %rsi
	leaq	88(%rsp), %rdi
	xorl	%edx, %edx
	movq	%rax, 104(%rsp)
.LEHB27:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE27:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1429
	movq	(%rdi), %rax
	call	*8(%rax)
.L1429:
	movq	120(%rsp), %rbx
	movq	128(%rsp), %r13
	cmpq	%r13, %rbx
	jne	.L1430
	movq	112(%rsp), %r15
	movq	%rbx, %rax
	subq	%r15, %rax
	movq	%rax, 64(%rsp)
	movabsq	$1152921504606846975, %rsi
	sarq	$3, %rax
	cmpq	%rsi, %rax
	je	.L1505
	testq	%rax, %rax
	movl	$1, %edx
	cmovne	%rax, %rdx
	addq	%rdx, %rax
	jc	.L1438
	testq	%rax, %rax
	jne	.L1506
	movl	$8, %edx
	xorl	%r8d, %r8d
	xorl	%eax, %eax
.L1440:
	movq	88(%rsp), %rcx
	movq	64(%rsp), %rsi
	movq	$0, 88(%rsp)
	movq	%rcx, (%rax,%rsi)
	cmpq	%r15, %rbx
	je	.L1441
	subq	%r15, %rbx
	addq	%rax, %rbx
	movq	%r15, %rcx
	movq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L1442:
	movq	(%rcx), %rsi
	addq	$8, %rdx
	movq	%rsi, -8(%rdx)
	addq	$8, %rcx
	cmpq	%rbx, %rdx
	jne	.L1442
	addq	$8, %rdx
.L1441:
	vmovq	%rax, %xmm5
	vpinsrq	$1, %rdx, %xmm5, %xmm0
	testq	%r15, %r15
	je	.L1443
	movq	%r13, %rsi
	subq	%r15, %rsi
	movq	%r15, %rdi
	movq	%r8, 64(%rsp)
	vmovdqa	%xmm0, 48(%rsp)
	call	_ZdlPvm@PLT
	vmovdqa	48(%rsp), %xmm0
	movq	64(%rsp), %r8
.L1443:
	cmpq	$0, 88(%rsp)
	movq	%r8, 128(%rsp)
	vmovdqa	%xmm0, 112(%rsp)
	je	.L1435
.L1449:
	call	_ZSt9terminatev@PLT
	.p2align 4,,10
	.p2align 3
.L1504:
	movl	72(%rsp), %ebx
	imull	76(%rsp), %ebx
.L1428:
	movl	$64, %edi
	movq	$0, 96(%rsp)
	leaq	112(%rsp), %r13
.LEHB28:
	call	_Znwm@PLT
.LEHE28:
	vmovd	24(%rsp), %xmm6
	vmovd	%r14d, %xmm7
	vpinsrd	$1, 28(%rsp), %xmm6, %xmm1
	vpinsrd	$1, %ebx, %xmm7, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	movq	8(%rsp), %rdi
	vmovq	(%rsp), %xmm1
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE(%rip), %rsi
	leaq	_Z19mul_mt_f32_internalPfS_S_iiiii(%rip), %rdx
	movq	%rsi, (%rax)
	movq	%rdi, 48(%rax)
	movq	%rdx, 56(%rax)
	vmovdqu	%xmm0, 8(%rax)
	movl	%r14d, 24(%rax)
	vpinsrq	$1, 16(%rsp), %xmm1, %xmm0
	leaq	96(%rsp), %rbp
	vmovdqu	%xmm0, 32(%rax)
	leaq	104(%rsp), %rsi
	xorl	%edx, %edx
	movq	%rbp, %rdi
	movq	%rax, 104(%rsp)
.LEHB29:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE29:
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1445
	movq	(%rdi), %rax
	call	*8(%rax)
.L1445:
	leaq	112(%rsp), %r13
	movq	%rbp, %rsi
	movq	%r13, %rdi
.LEHB30:
	call	_ZNSt6vectorISt6threadSaIS0_EE12emplace_backIJS0_EEERS0_DpOT_.isra.0
.LEHE30:
	cmpq	$0, 96(%rsp)
	jne	.L1449
	movq	112(%rsp), %r12
	movq	120(%rsp), %rbp
	movq	%r12, %rbx
	cmpq	%r12, %rbp
	je	.L1455
	.p2align 4,,10
	.p2align 3
.L1453:
	movq	%rbx, %rdi
.LEHB31:
	call	_ZNSt6thread4joinEv@PLT
.LEHE31:
	addq	$8, %rbx
	cmpq	%rbx, %rbp
	jne	.L1453
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L1454:
	cmpq	$0, (%rax)
	jne	.L1449
	addq	$8, %rax
	cmpq	%rax, %rbp
	jne	.L1454
.L1455:
	testq	%r12, %r12
	je	.L1507
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1500
	movq	128(%rsp), %rsi
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	subq	%r12, %rsi
	movq	%r12, %rdi
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L1507:
	.cfi_restore_state
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1500
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1503:
	.cfi_restore_state
	testl	%r14d, %r14d
	leal	127(%r14), %ecx
	cmovns	%r14d, %ecx
	movl	%r14d, %eax
	sarl	$7, %ecx
	cltd
	idivl	%ecx
	movl	%eax, 72(%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, 76(%rsp)
	cltq
	movq	%rax, 40(%rsp)
	testq	%rax, %rax
	jne	.L1459
	xorl	%ebx, %ebx
	jmp	.L1428
.L1506:
	movabsq	$1152921504606846975, %rdx
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
	salq	$3, %rax
	movq	%rax, 48(%rsp)
	movq	%rax, %rdi
.L1439:
.LEHB32:
	call	_Znwm@PLT
	movq	48(%rsp), %r8
	leaq	8(%rax), %rdx
	addq	%rax, %r8
	jmp	.L1440
.L1438:
	movabsq	$9223372036854775800, %rax
	movq	%rax, 48(%rsp)
	movq	%rax, %rdi
	jmp	.L1439
.L1500:
	call	__stack_chk_fail@PLT
.L1505:
	leaq	.LC4(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE32:
.L1464:
	endbr64
	movq	%rax, %rbp
	jmp	.L1457
.L1468:
	endbr64
	movq	%rax, %rbp
	jmp	.L1447
.L1465:
	endbr64
	movq	%rax, %rbp
	vzeroupper
	jmp	.L1434
.L1467:
	endbr64
	movq	%rax, %rbp
	jmp	.L1447
.L1466:
	endbr64
	movq	%rax, %rbp
	jmp	.L1458
	.section	.gcc_except_table
.LLSDA10948:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE10948-.LLSDACSB10948
.LLSDACSB10948:
	.uleb128 .LEHB26-.LFB10948
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L1465-.LFB10948
	.uleb128 0
	.uleb128 .LEHB27-.LFB10948
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L1467-.LFB10948
	.uleb128 0
	.uleb128 .LEHB28-.LFB10948
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L1465-.LFB10948
	.uleb128 0
	.uleb128 .LEHB29-.LFB10948
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L1468-.LFB10948
	.uleb128 0
	.uleb128 .LEHB30-.LFB10948
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L1466-.LFB10948
	.uleb128 0
	.uleb128 .LEHB31-.LFB10948
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L1465-.LFB10948
	.uleb128 0
	.uleb128 .LEHB32-.LFB10948
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L1464-.LFB10948
	.uleb128 0
.LLSDACSE10948:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC10948
	.type	_Z10mul_mt_f32PfS_S_iii.cold, @function
_Z10mul_mt_f32PfS_S_iii.cold:
.LFSB10948:
.L1447:
	.cfi_def_cfa_offset 208
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	104(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1495
	movq	(%rdi), %rax
	vzeroupper
	call	*8(%rax)
.L1448:
	leaq	112(%rsp), %r13
.L1434:
	movq	%r13, %rdi
	call	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	movq	%rbp, %rdi
.LEHB33:
	call	_Unwind_Resume@PLT
.LEHE33:
.L1458:
	cmpq	$0, 96(%rsp)
	je	.L1508
	vzeroupper
	jmp	.L1449
.L1495:
	vzeroupper
	jmp	.L1448
.L1457:
	cmpq	$0, 88(%rsp)
	je	.L1509
	vzeroupper
	jmp	.L1449
.L1509:
	leaq	112(%rsp), %r13
	vzeroupper
	jmp	.L1434
.L1508:
	vzeroupper
	jmp	.L1434
	.cfi_endproc
.LFE10948:
	.section	.gcc_except_table
.LLSDAC10948:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC10948-.LLSDACSBC10948
.LLSDACSBC10948:
	.uleb128 .LEHB33-.LCOLDB20
	.uleb128 .LEHE33-.LEHB33
	.uleb128 0
	.uleb128 0
.LLSDACSEC10948:
	.section	.text.unlikely
	.text
	.size	_Z10mul_mt_f32PfS_S_iii, .-_Z10mul_mt_f32PfS_S_iii
	.section	.text.unlikely
	.size	_Z10mul_mt_f32PfS_S_iii.cold, .-_Z10mul_mt_f32PfS_S_iii.cold
.LCOLDE20:
	.text
.LHOTE20:
	.section	.text._ZN13MdStaticArrayIdEC2ERKSt6vectorImSaImEERKd,"axG",@progbits,_ZN13MdStaticArrayIdEC5ERKSt6vectorImSaImEERKd,comdat
	.align 2
	.p2align 4
	.weak	_ZN13MdStaticArrayIdEC2ERKSt6vectorImSaImEERKd
	.type	_ZN13MdStaticArrayIdEC2ERKSt6vectorImSaImEERKd, @function
_ZN13MdStaticArrayIdEC2ERKSt6vectorImSaImEERKd:
.LFB11537:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	andq	$-32, %rsp
	subq	$32, %rsp
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movq	%rdx, 8(%rsp)
	movb	$0, (%rdi)
	movq	(%rsi), %r14
	movq	8(%rsi), %r12
	cmpq	%r12, %r14
	je	.L1527
	movq	%r14, %rax
	movl	$1, %r13d
	.p2align 4,,10
	.p2align 3
.L1512:
	imulq	(%rax), %r13
	addq	$8, %rax
	cmpq	%rax, %r12
	jne	.L1512
	leaq	0(,%r13,8), %rsi
.L1511:
	subq	%r14, %r12
	movl	$64, %edi
	call	aligned_alloc@PLT
	movq	%r12, %rsi
	sarq	$3, %rsi
	movzwl	%si, %edx
	movw	%si, 40(%rbx)
	movq	%rax, 8(%rbx)
	movq	%r13, 32(%rbx)
	leaq	0(,%rdx,8), %r12
	movq	%r12, %rdi
	movq	%rsi, 24(%rsp)
	movq	%rax, 16(%rsp)
	call	malloc@PLT
	movq	%rax, 16(%rbx)
	movq	%r12, %rdi
	movq	%rax, %r15
	call	malloc@PLT
	movq	24(%rsp), %rsi
	movq	-8(%r14,%r12), %rcx
	movl	%esi, %edx
	subw	$2, %dx
	movq	%rax, 24(%rbx)
	movq	%rcx, -8(%r15,%r12)
	movq	$1, -8(%rax,%r12)
	movq	16(%rsp), %r8
	js	.L1517
	movswq	%dx, %rdx
	movq	8(%rax,%rdx,8), %rcx
	.p2align 4,,10
	.p2align 3
.L1516:
	movq	(%r14,%rdx,8), %rsi
	movq	%rsi, (%r15,%rdx,8)
	imulq	8(%r14,%rdx,8), %rcx
	movq	%rcx, (%rax,%rdx,8)
	decq	%rdx
	testw	%dx, %dx
	jns	.L1516
.L1517:
	cmpq	$100000, %r13
	jbe	.L1540
	movq	8(%rsp), %rax
	movq	%r13, %rdx
	vmovsd	(%rax), %xmm1
	shrq	$2, %rdx
	salq	$5, %rdx
	vbroadcastsd	%xmm1, %ymm0
	movq	%r8, %rax
	addq	%r8, %rdx
.L1519:
	vmovapd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L1519
	movq	%r13, %rax
	andq	$-4, %rax
	testb	$3, %r13b
	je	.L1536
	leaq	1(%rax), %rcx
	leaq	0(,%rax,8), %rdx
	vmovsd	%xmm1, (%r8,%rax,8)
	cmpq	%rcx, %r13
	jbe	.L1536
	addq	$2, %rax
	vmovsd	%xmm1, 8(%r8,%rdx)
	cmpq	%rax, %r13
	jbe	.L1536
	vmovsd	%xmm1, 16(%r8,%rdx)
	vzeroupper
.L1538:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1540:
	.cfi_restore_state
	testq	%r13, %r13
	je	.L1538
	movq	8(%rsp), %rax
	vmovsd	(%rax), %xmm1
	leaq	-1(%r13), %rax
	cmpq	$2, %rax
	jbe	.L1528
	movq	%r13, %rdx
	shrq	$2, %rdx
	salq	$5, %rdx
	vbroadcastsd	%xmm1, %ymm0
	movq	%r8, %rax
	addq	%r8, %rdx
	.p2align 4,,10
	.p2align 3
.L1524:
	vmovapd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L1524
	movq	%r13, %rax
	andq	$-4, %rax
	testb	$3, %r13b
	je	.L1536
	vzeroupper
.L1523:
	leaq	1(%rax), %rcx
	leaq	0(,%rax,8), %rdx
	vmovsd	%xmm1, (%r8,%rax,8)
	cmpq	%rcx, %r13
	jbe	.L1538
	addq	$2, %rax
	vmovsd	%xmm1, 8(%r8,%rdx)
	cmpq	%rax, %r13
	jbe	.L1538
	vmovsd	%xmm1, 16(%r8,%rdx)
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1536:
	.cfi_restore_state
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1527:
	.cfi_restore_state
	movl	$8, %esi
	movl	$1, %r13d
	jmp	.L1511
.L1528:
	xorl	%eax, %eax
	jmp	.L1523
	.cfi_endproc
.LFE11537:
	.size	_ZN13MdStaticArrayIdEC2ERKSt6vectorImSaImEERKd, .-_ZN13MdStaticArrayIdEC2ERKSt6vectorImSaImEERKd
	.weak	_ZN13MdStaticArrayIdEC1ERKSt6vectorImSaImEERKd
	.set	_ZN13MdStaticArrayIdEC1ERKSt6vectorImSaImEERKd,_ZN13MdStaticArrayIdEC2ERKSt6vectorImSaImEERKd
	.section	.text._ZN13MdStaticArrayIdED2Ev,"axG",@progbits,_ZN13MdStaticArrayIdED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN13MdStaticArrayIdED2Ev
	.type	_ZN13MdStaticArrayIdED2Ev, @function
_ZN13MdStaticArrayIdED2Ev:
.LFB11540:
	.cfi_startproc
	endbr64
	cmpb	$0, (%rdi)
	je	.L1559
	ret
	.p2align 4,,10
	.p2align 3
.L1559:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L1543
	call	free@PLT
.L1543:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1544
	call	free@PLT
.L1544:
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1554
	popq	%rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L1554:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11540:
	.size	_ZN13MdStaticArrayIdED2Ev, .-_ZN13MdStaticArrayIdED2Ev
	.weak	_ZN13MdStaticArrayIdED1Ev
	.set	_ZN13MdStaticArrayIdED1Ev,_ZN13MdStaticArrayIdED2Ev
	.section	.rodata._ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei.str1.8,"aMS",@progbits,1
	.align 8
.LC21:
	.string	"Matrix dimension do not match for matrix multiplication."
	.align 8
.LC22:
	.string	"Total column of first matrix are not same as total rows in second matrix."
	.section	.text._ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei,"axG",@progbits,_ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei,comdat
	.align 2
	.p2align 4
	.weak	_ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei
	.type	_ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei, @function
_ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei:
.LFB11553:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA11553
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movq	%rsi, 40(%rsp)
	movq	%rdx, 56(%rsp)
	movl	%ecx, 92(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	cmpw	$2, 40(%rsi)
	jne	.L1561
	cmpw	$2, 40(%rdx)
	jne	.L1561
	movq	56(%rsp), %rax
	movq	16(%rsi), %rdx
	movq	16(%rax), %rax
	movq	%rdi, %r12
	movq	(%rax), %rbx
	movq	8(%rdx), %rdi
	movq	%rdi, 48(%rsp)
	cmpq	%rbx, %rdi
	jne	.L1609
	movq	(%rdx), %r15
	movq	8(%rax), %rbp
	vmovq	%r15, %xmm3
	movq	%r15, 80(%rsp)
	imulq	%rbp, %r15
	vpinsrq	$1, %rbp, %xmm3, %xmm1
	movl	$16, %edi
	vmovdqa	%xmm1, (%rsp)
.LEHB34:
	call	_Znwm@PLT
.LEHE34:
	vmovdqa	(%rsp), %xmm1
	vmovq	%rbp, %xmm5
	movb	$0, (%r12)
	leaq	0(,%r15,8), %r9
	vpinsrq	$1, 48(%rsp), %xmm5, %xmm4
	vmovdqu	%xmm1, (%rax)
	movq	%r9, %rsi
	movl	$64, %edi
	movq	%r9, 72(%rsp)
	vmovdqa	%xmm4, 16(%rsp)
	movq	%rax, %r14
	call	aligned_alloc@PLT
	movl	$2, %edx
	movw	%dx, 40(%r12)
	movq	%rax, 8(%r12)
	movq	%r15, 32(%r12)
	movl	$16, %edi
	movq	%rax, %r13
	call	malloc@PLT
	movq	%rax, 16(%r12)
	movl	$16, %edi
	movq	%rax, 64(%rsp)
	call	malloc@PLT
	vmovdqa	(%rsp), %xmm1
	movq	64(%rsp), %rdx
	cmpq	$100000, %r15
	movq	%rax, 24(%r12)
	movq	$1, 8(%rax)
	movq	%rbp, (%rax)
	movq	72(%rsp), %r9
	vmovdqu	%xmm1, (%rdx)
	ja	.L1565
	testq	%r15, %r15
	je	.L1566
.L1565:
	movq	%r9, %rdx
	xorl	%esi, %esi
	movq	%r13, %rdi
	call	memset@PLT
.L1566:
	movq	%r14, %rdi
	movl	$16, %esi
	call	_ZdlPvm@PLT
	movl	$16, %edi
.LEHB35:
	call	_Znwm@PLT
.LEHE35:
	movq	%rbx, %r15
	imulq	%rbp, %r15
	vmovdqa	16(%rsp), %xmm2
	movl	$64, %edi
	leaq	0(,%r15,8), %rdx
	vmovdqu	%xmm2, (%rax)
	movq	%rdx, %rsi
	movq	%rdx, 72(%rsp)
	movq	%rax, 64(%rsp)
	movb	$0, 96(%rsp)
	call	aligned_alloc@PLT
	movq	%rax, 104(%rsp)
	movl	$16, %edi
	movq	%rax, %r14
	movl	$2, %eax
	movq	%r15, 128(%rsp)
	movw	%ax, 136(%rsp)
	call	malloc@PLT
	movl	$16, %edi
	movq	%rax, (%rsp)
	movq	%rax, 112(%rsp)
	call	malloc@PLT
	movq	$1, 8(%rax)
	movq	%rax, %r13
	movq	%rax, 120(%rsp)
	vmovdqa	16(%rsp), %xmm2
	movq	(%rsp), %rax
	cmpq	$100000, %r15
	movq	%rbx, 0(%r13)
	movq	72(%rsp), %rdx
	vmovdqu	%xmm2, (%rax)
	jbe	.L1610
.L1568:
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	memset@PLT
.L1569:
	movq	64(%rsp), %rdi
	movl	$16, %esi
	call	_ZdlPvm@PLT
	testq	%rbp, %rbp
	je	.L1579
	testq	%rbx, %rbx
	je	.L1579
	movq	56(%rsp), %rax
	salq	$3, %rbx
	movq	8(%rax), %r8
	leaq	(%r14,%rbx), %rcx
	leaq	0(,%rbp,8), %rsi
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L1580:
	movq	%rcx, %rax
	leaq	(%r8,%rdi,8), %rdx
	subq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L1570:
	vmovsd	(%rdx), %xmm0
	addq	$8, %rax
	vmovsd	%xmm0, -8(%rax)
	addq	%rsi, %rdx
	cmpq	%rax, %rcx
	jne	.L1570
	incq	%rdi
	addq	%rbx, %rcx
	cmpq	%rdi, %rbp
	jne	.L1580
.L1579:
	movq	40(%rsp), %rax
	cmpq	$100000, 32(%r12)
	movl	80(%rsp), %ecx
	movq	8(%r12), %rdx
	movq	8(%rax), %rdi
	movl	48(%rsp), %r8d
	movl	%ebp, %r9d
	movq	%r14, %rsi
	jbe	.L1572
	cmpl	$1, 92(%rsp)
	jg	.L1611
.L1572:
	call	_Z6mul_stPdS_S_iii
.L1573:
	testq	%r14, %r14
	je	.L1574
	movq	%r14, %rdi
	call	free@PLT
.L1574:
	movq	(%rsp), %rdi
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	152(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1612
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1610:
	.cfi_restore_state
	testq	%r15, %r15
	jne	.L1568
	jmp	.L1569
.L1611:
.LEHB36:
	call	_Z6mul_mtPdS_S_iii
.LEHE36:
	jmp	.L1573
.L1612:
	call	__stack_chk_fail@PLT
.L1561:
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rdi
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rbp
.LEHB37:
	call	_ZNSt13runtime_errorC1EPKc@PLT
.LEHE37:
.L1607:
	movq	_ZNSt13runtime_errorD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt13runtime_error(%rip), %rsi
	movq	%rbp, %rdi
.LEHB38:
	call	__cxa_throw@PLT
.L1585:
	endbr64
	movq	%rax, %rbp
	jmp	.L1578
.L1583:
	endbr64
.L1608:
	movq	%rax, %r12
	jmp	.L1576
.L1577:
	leaq	96(%rsp), %rdi
	vzeroupper
	call	_ZN13MdStaticArrayIdED1Ev
.L1578:
	movq	%r12, %rdi
	vzeroupper
	call	_ZN13MdStaticArrayIdED1Ev
	movq	%rbp, %rdi
	call	_Unwind_Resume@PLT
.LEHE38:
.L1609:
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rdi
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rbp
.LEHB39:
	call	_ZNSt13runtime_errorC1EPKc@PLT
.LEHE39:
	jmp	.L1607
.L1586:
	endbr64
	movq	%rax, %rbp
	jmp	.L1577
.L1576:
	movq	%rbp, %rdi
	vzeroupper
	call	__cxa_free_exception@PLT
	movq	%r12, %rdi
.LEHB40:
	call	_Unwind_Resume@PLT
.LEHE40:
.L1584:
	endbr64
	jmp	.L1608
	.cfi_endproc
.LFE11553:
	.section	.gcc_except_table
.LLSDA11553:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE11553-.LLSDACSB11553
.LLSDACSB11553:
	.uleb128 .LEHB34-.LFB11553
	.uleb128 .LEHE34-.LEHB34
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB35-.LFB11553
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L1585-.LFB11553
	.uleb128 0
	.uleb128 .LEHB36-.LFB11553
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L1586-.LFB11553
	.uleb128 0
	.uleb128 .LEHB37-.LFB11553
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L1583-.LFB11553
	.uleb128 0
	.uleb128 .LEHB38-.LFB11553
	.uleb128 .LEHE38-.LEHB38
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB39-.LFB11553
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L1584-.LFB11553
	.uleb128 0
	.uleb128 .LEHB40-.LFB11553
	.uleb128 .LEHE40-.LEHB40
	.uleb128 0
	.uleb128 0
.LLSDACSE11553:
	.section	.text._ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei,"axG",@progbits,_ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei,comdat
	.size	_ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei, .-_ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei
	.section	.rodata._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_.str1.1,"aMS",@progbits,1
.LC23:
	.string	"basic_string::append"
	.section	.text._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_,"axG",@progbits,_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_,comdat
	.p2align 4
	.weak	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
	.type	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_, @function
_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_:
.LFB12073:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	movq	%rdx, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp
	call	strlen@PLT
	movq	%rax, %rdx
	movabsq	$4611686018427387903, %rax
	subq	8(%rbp), %rax
	cmpq	%rax, %rdx
	ja	.L1618
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@PLT
	leaq	16(%r12), %rdx
	movq	%rdx, (%r12)
	leaq	16(%rax), %rdx
	movq	(%rax), %rcx
	cmpq	%rdx, %rcx
	je	.L1619
	movq	%rcx, (%r12)
	movq	16(%rax), %rcx
	movq	%rcx, 16(%r12)
.L1616:
	movq	8(%rax), %rcx
	movq	%rdx, (%rax)
	movq	$0, 8(%rax)
	movq	%rcx, 8(%r12)
	movb	$0, 16(%rax)
	movq	%r12, %rax
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1619:
	.cfi_restore_state
	vmovdqu	16(%rax), %xmm0
	vmovdqu	%xmm0, 16(%r12)
	jmp	.L1616
.L1618:
	leaq	.LC23(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE12073:
	.size	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_, .-_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB12199:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA12199
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	144(%rsp), %rax
	movq	8(%rdi), %r15
	movq	%rdx, (%rsp)
	movq	%rcx, 24(%rsp)
	movq	%r8, 32(%rsp)
	movq	%r9, 40(%rsp)
	movq	%rax, 48(%rsp)
	movq	(%rdi), %r14
	movq	%r15, %r12
	subq	%r14, %r12
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	sarq	$3, %r12
	movabsq	$1152921504606846975, %rax
	cmpq	%rax, %r12
	je	.L1658
	testq	%r12, %r12
	movl	$1, %eax
	cmovne	%r12, %rax
	movq	%rsi, %rdx
	addq	%rax, %r12
	setc	%al
	movzbl	%al, %eax
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	subq	%r14, %rdx
	testq	%rax, %rax
	jne	.L1640
	testq	%r12, %r12
	jne	.L1625
	xorl	%r13d, %r13d
.L1638:
	leaq	0(%r13,%rdx), %rax
	movq	$0, (%rax)
	movl	$48, %edi
	movq	%rax, 56(%rsp)
.LEHB41:
	call	_Znwm@PLT
.LEHE41:
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE(%rip), %rsi
	movq	%rsi, (%rax)
	movq	48(%rsp), %rsi
	movq	56(%rsp), %rdi
	vmovsd	(%rsi), %xmm0
	movq	40(%rsp), %rsi
	vmovsd	%xmm0, 8(%rax)
	movq	(%rsi), %rdx
	movq	32(%rsp), %rsi
	movq	%rdx, 16(%rax)
	vmovsd	(%rsi), %xmm0
	movq	24(%rsp), %rsi
	vmovsd	%xmm0, 24(%rax)
	movq	(%rsi), %rdx
	movq	(%rsp), %rsi
	movq	%rdx, 32(%rax)
	movq	(%rsi), %rdx
	leaq	64(%rsp), %rsi
	movq	%rdx, 40(%rax)
	xorl	%edx, %edx
	movq	%rax, 64(%rsp)
.LEHB42:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE42:
	movq	64(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1626
	movq	(%rdi), %rax
	call	*8(%rax)
.L1626:
	movq	%rbp, %rsi
	subq	%r14, %rsi
	movq	%r14, %rax
	movq	%r13, %rdx
	movq	%r13, %rcx
	cmpq	%r14, %rbp
	je	.L1628
	.p2align 4,,10
	.p2align 3
.L1632:
	movq	(%rax), %rcx
	addq	$8, %rax
	movq	%rcx, (%rdx)
	addq	$8, %rdx
	cmpq	%rbp, %rax
	jne	.L1632
	leaq	0(%r13,%rsi), %rcx
.L1628:
	addq	$8, %rcx
	cmpq	%r15, %rbp
	je	.L1633
	subq	%rbp, %r15
	movq	%rcx, %rdi
	movq	%r15, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	movq	%rax, %rcx
	addq	%r15, %rcx
.L1633:
	vmovq	%r13, %xmm1
	vpinsrq	$1, %rcx, %xmm1, %xmm0
	testq	%r14, %r14
	je	.L1634
	movq	16(%rbx), %rsi
	movq	%r14, %rdi
	subq	%r14, %rsi
	vmovdqa	%xmm0, (%rsp)
	call	_ZdlPvm@PLT
	vmovdqa	(%rsp), %xmm0
.L1634:
	addq	%r12, %r13
	movq	%r13, 16(%rbx)
	vmovdqu	%xmm0, (%rbx)
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1659
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1640:
	.cfi_restore_state
	movabsq	$9223372036854775800, %r12
.L1624:
	movq	%r12, %rdi
	movq	%rdx, 56(%rsp)
.LEHB43:
	call	_Znwm@PLT
	movq	%rax, %r13
	movq	56(%rsp), %rdx
	jmp	.L1638
.L1625:
	movabsq	$1152921504606846975, %rax
	cmpq	%rax, %r12
	cmovbe	%r12, %rax
	leaq	0(,%rax,8), %r12
	jmp	.L1624
.L1658:
	leaq	.LC4(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE43:
.L1659:
	call	__stack_chk_fail@PLT
.L1641:
	endbr64
	movq	%rax, %rdi
	jmp	.L1631
.L1643:
	endbr64
	movq	%rax, %rbx
.L1629:
	movq	64(%rsp), %rdi
	testq	%rdi, %rdi
	jne	.L1660
.L1630:
	movq	%rbx, %rdi
.L1631:
	vzeroupper
	call	__cxa_begin_catch@PLT
	testq	%r13, %r13
	je	.L1661
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	_ZdlPvm@PLT
.L1636:
.LEHB44:
	call	__cxa_rethrow@PLT
.LEHE44:
.L1661:
	movq	56(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L1636
	call	_ZSt9terminatev@PLT
.L1642:
	endbr64
	movq	%rax, %rbp
.L1637:
	vzeroupper
	call	__cxa_end_catch@PLT
	movq	%rbp, %rdi
.LEHB45:
	call	_Unwind_Resume@PLT
.LEHE45:
.L1660:
	movq	(%rdi), %rax
	vzeroupper
	call	*8(%rax)
	jmp	.L1630
	.cfi_endproc
.LFE12199:
	.section	.gcc_except_table
	.align 4
.LLSDA12199:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT12199-.LLSDATTD12199
.LLSDATTD12199:
	.byte	0x1
	.uleb128 .LLSDACSE12199-.LLSDACSB12199
.LLSDACSB12199:
	.uleb128 .LEHB41-.LFB12199
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L1641-.LFB12199
	.uleb128 0x1
	.uleb128 .LEHB42-.LFB12199
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L1643-.LFB12199
	.uleb128 0x3
	.uleb128 .LEHB43-.LFB12199
	.uleb128 .LEHE43-.LEHB43
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB44-.LFB12199
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L1642-.LFB12199
	.uleb128 0
	.uleb128 .LEHB45-.LFB12199
	.uleb128 .LEHE45-.LEHB45
	.uleb128 0
	.uleb128 0
.LLSDACSE12199:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT12199:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdRmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdRmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdRmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdRmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdRmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB12201:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA12201
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	144(%rsp), %rax
	movq	8(%rdi), %r15
	movq	%rdx, (%rsp)
	movq	%rcx, 24(%rsp)
	movq	%r8, 32(%rsp)
	movq	%r9, 40(%rsp)
	movq	%rax, 48(%rsp)
	movq	(%rdi), %r14
	movq	%r15, %r12
	subq	%r14, %r12
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	sarq	$3, %r12
	movabsq	$1152921504606846975, %rax
	cmpq	%rax, %r12
	je	.L1700
	testq	%r12, %r12
	movl	$1, %eax
	cmovne	%r12, %rax
	movq	%rsi, %rdx
	addq	%rax, %r12
	setc	%al
	movzbl	%al, %eax
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	subq	%r14, %rdx
	testq	%rax, %rax
	jne	.L1682
	testq	%r12, %r12
	jne	.L1667
	xorl	%r13d, %r13d
.L1680:
	leaq	0(%r13,%rdx), %rax
	movq	$0, (%rax)
	movl	$48, %edi
	movq	%rax, 56(%rsp)
.LEHB46:
	call	_Znwm@PLT
.LEHE46:
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE(%rip), %rsi
	movq	%rsi, (%rax)
	movq	48(%rsp), %rsi
	movq	56(%rsp), %rdi
	vmovsd	(%rsi), %xmm0
	movq	40(%rsp), %rsi
	vmovsd	%xmm0, 8(%rax)
	movq	(%rsi), %rdx
	movq	32(%rsp), %rsi
	movq	%rdx, 16(%rax)
	vmovsd	(%rsi), %xmm0
	movq	24(%rsp), %rsi
	vmovsd	%xmm0, 24(%rax)
	movq	(%rsi), %rdx
	movq	(%rsp), %rsi
	movq	%rdx, 32(%rax)
	movq	(%rsi), %rdx
	leaq	64(%rsp), %rsi
	movq	%rdx, 40(%rax)
	xorl	%edx, %edx
	movq	%rax, 64(%rsp)
.LEHB47:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE47:
	movq	64(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1668
	movq	(%rdi), %rax
	call	*8(%rax)
.L1668:
	movq	%rbp, %rsi
	subq	%r14, %rsi
	movq	%r14, %rax
	movq	%r13, %rdx
	movq	%r13, %rcx
	cmpq	%r14, %rbp
	je	.L1670
	.p2align 4,,10
	.p2align 3
.L1674:
	movq	(%rax), %rcx
	addq	$8, %rax
	movq	%rcx, (%rdx)
	addq	$8, %rdx
	cmpq	%rbp, %rax
	jne	.L1674
	leaq	0(%r13,%rsi), %rcx
.L1670:
	addq	$8, %rcx
	cmpq	%r15, %rbp
	je	.L1675
	subq	%rbp, %r15
	movq	%rcx, %rdi
	movq	%r15, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	movq	%rax, %rcx
	addq	%r15, %rcx
.L1675:
	vmovq	%r13, %xmm1
	vpinsrq	$1, %rcx, %xmm1, %xmm0
	testq	%r14, %r14
	je	.L1676
	movq	16(%rbx), %rsi
	movq	%r14, %rdi
	subq	%r14, %rsi
	vmovdqa	%xmm0, (%rsp)
	call	_ZdlPvm@PLT
	vmovdqa	(%rsp), %xmm0
.L1676:
	addq	%r12, %r13
	movq	%r13, 16(%rbx)
	vmovdqu	%xmm0, (%rbx)
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1701
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1682:
	.cfi_restore_state
	movabsq	$9223372036854775800, %r12
.L1666:
	movq	%r12, %rdi
	movq	%rdx, 56(%rsp)
.LEHB48:
	call	_Znwm@PLT
	movq	%rax, %r13
	movq	56(%rsp), %rdx
	jmp	.L1680
.L1667:
	movabsq	$1152921504606846975, %rax
	cmpq	%rax, %r12
	cmovbe	%r12, %rax
	leaq	0(,%rax,8), %r12
	jmp	.L1666
.L1700:
	leaq	.LC4(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE48:
.L1701:
	call	__stack_chk_fail@PLT
.L1683:
	endbr64
	movq	%rax, %rdi
	jmp	.L1673
.L1685:
	endbr64
	movq	%rax, %rbx
.L1671:
	movq	64(%rsp), %rdi
	testq	%rdi, %rdi
	jne	.L1702
.L1672:
	movq	%rbx, %rdi
.L1673:
	vzeroupper
	call	__cxa_begin_catch@PLT
	testq	%r13, %r13
	je	.L1703
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	_ZdlPvm@PLT
.L1678:
.LEHB49:
	call	__cxa_rethrow@PLT
.LEHE49:
.L1703:
	movq	56(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L1678
	call	_ZSt9terminatev@PLT
.L1684:
	endbr64
	movq	%rax, %rbp
.L1679:
	vzeroupper
	call	__cxa_end_catch@PLT
	movq	%rbp, %rdi
.LEHB50:
	call	_Unwind_Resume@PLT
.LEHE50:
.L1702:
	movq	(%rdi), %rax
	vzeroupper
	call	*8(%rax)
	jmp	.L1672
	.cfi_endproc
.LFE12201:
	.section	.gcc_except_table
	.align 4
.LLSDA12201:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT12201-.LLSDATTD12201
.LLSDATTD12201:
	.byte	0x1
	.uleb128 .LLSDACSE12201-.LLSDACSB12201
.LLSDACSB12201:
	.uleb128 .LEHB46-.LFB12201
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L1683-.LFB12201
	.uleb128 0x1
	.uleb128 .LEHB47-.LFB12201
	.uleb128 .LEHE47-.LEHB47
	.uleb128 .L1685-.LFB12201
	.uleb128 0x3
	.uleb128 .LEHB48-.LFB12201
	.uleb128 .LEHE48-.LEHB48
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB49-.LFB12201
	.uleb128 .LEHE49-.LEHB49
	.uleb128 .L1684-.LFB12201
	.uleb128 0
	.uleb128 .LEHB50-.LFB12201
	.uleb128 .LEHE50-.LEHB50
	.uleb128 0
	.uleb128 0
.LLSDACSE12201:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT12201:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdRmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdRmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdRmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdRmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text.unlikely
	.align 2
.LCOLDB26:
	.text
.LHOTB26:
	.align 2
	.p2align 4
	.type	_ZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES2_S2_T0_.constprop.0, @function
_ZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES2_S2_T0_.constprop.0:
.LFB12835:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA12835
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movq	%rdi, %r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	vcvttsd2siq	%xmm0, %rbx
	subq	$160, %rsp
	vmovsd	.LC24(%rip), %xmm5
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vcomisd	%xmm5, %xmm0
	vmovsd	.LC5(%rip), %xmm2
	vmovsd	%xmm2, -128(%rbp)
	jb	.L1706
	vsubsd	%xmm5, %xmm0, %xmm3
	vcvttsd2siq	%xmm3, %rbx
	btcq	$63, %rbx
.L1706:
	vcomisd	.LC25(%rip), %xmm1
	vxorps	%xmm3, %xmm3, %xmm3
	jne	.L1765
	movq	%rbx, -136(%rbp)
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovsd	%xmm4, -152(%rbp)
	vmovsd	%xmm2, %xmm2, %xmm1
.L1709:
	movb	$0, (%r14)
	leaq	0(,%rbx,8), %rsi
	movl	$64, %edi
	vmovsd	%xmm1, -160(%rbp)
	call	aligned_alloc@PLT
	movq	%rax, 8(%r14)
	movq	%rbx, 32(%r14)
	movl	$8, %edi
	movq	%rax, %r12
	call	malloc@PLT
	movq	%rax, 16(%r14)
	movl	$8, %edi
	movq	%rax, %r13
	call	malloc@PLT
	movl	$1, %edi
	cmpq	$99999, %rbx
	movq	%rax, 24(%r14)
	movq	%rbx, 0(%r13)
	movq	$1, (%rax)
	movw	%di, 40(%r14)
	movq	%r14, -120(%rbp)
	vmovsd	-160(%rbp), %xmm1
	vxorps	%xmm3, %xmm3, %xmm3
	jbe	.L1771
	movq	%rbx, %rax
	shrq	$4, %rax
	vcvtsi2sdq	%rax, %xmm3, %xmm3
	vmovsd	-152(%rbp), %xmm6
	movq	%rax, -176(%rbp)
	movq	$0, -80(%rbp)
	vmulsd	%xmm1, %xmm3, %xmm4
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	$15, -192(%rbp)
	movq	$0, -160(%rbp)
	vmovsd	%xmm4, -184(%rbp)
	vmovsd	%xmm6, -112(%rbp)
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	jmp	.L1730
	.p2align 4,,10
	.p2align 3
.L1773:
	movq	$0, (%r12)
	movl	$48, %edi
	leaq	-80(%rbp), %r15
.LEHB51:
	call	_Znwm@PLT
.LEHE51:
	movq	-120(%rbp), %rdx
	movq	-168(%rbp), %rcx
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE(%rip), %rsi
	movq	%rsi, (%rax)
	movq	%rdx, 40(%rax)
	vmovsd	-128(%rbp), %xmm0
	vmovsd	-152(%rbp), %xmm6
	movq	%r13, 16(%rax)
	movq	%rcx, 32(%rax)
	vmovsd	%xmm0, 8(%rax)
	vmovsd	%xmm6, 24(%rax)
	leaq	-88(%rbp), %rsi
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rax, -88(%rbp)
.LEHB52:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE52:
	movq	-88(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1725
	movq	(%rdi), %rax
	call	*8(%rax)
.L1725:
	addq	$8, %r12
	movq	%r12, -72(%rbp)
.L1726:
	vmovsd	-152(%rbp), %xmm6
	decq	-192(%rbp)
	vaddsd	-184(%rbp), %xmm6, %xmm7
	vmovsd	%xmm7, -152(%rbp)
	vmovsd	%xmm7, -112(%rbp)
	je	.L1772
.L1730:
	movq	%r13, %rax
	addq	-176(%rbp), %r13
	movq	%r13, -96(%rbp)
	movq	%rax, -168(%rbp)
	movq	%rax, -104(%rbp)
	cmpq	%r12, -160(%rbp)
	jne	.L1773
	subq	$8, %rsp
	leaq	-128(%rbp), %rax
	pushq	%rax
	leaq	-80(%rbp), %r15
	movq	-160(%rbp), %rsi
	leaq	-104(%rbp), %rcx
	leaq	-120(%rbp), %rdx
	leaq	-96(%rbp), %r9
	leaq	-112(%rbp), %r8
	movq	%r15, %rdi
.LEHB53:
	.cfi_escape 0x2e,0x10
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	vmovsd	-112(%rbp), %xmm4
	movq	-64(%rbp), %rax
	popq	%rcx
	movq	%rax, -160(%rbp)
	movq	-72(%rbp), %r12
	popq	%rsi
	vmovsd	%xmm4, -152(%rbp)
	jmp	.L1726
	.p2align 4,,10
	.p2align 3
.L1771:
	testq	%rbx, %rbx
	je	.L1704
	leaq	-1(%rbx), %rax
	cmpq	$2, %rax
	jbe	.L1743
	vmovsd	-152(%rbp), %xmm5
	movq	%rbx, %rdx
	vaddsd	%xmm5, %xmm1, %xmm0
	shrq	$2, %rdx
	salq	$5, %rdx
	vaddsd	%xmm1, %xmm0, %xmm2
	vunpcklpd	%xmm0, %xmm5, %xmm0
	movq	%r12, %rax
	vaddsd	%xmm2, %xmm1, %xmm4
	addq	%r12, %rdx
	vunpcklpd	%xmm4, %xmm2, %xmm2
	vmulsd	.LC0(%rip), %xmm1, %xmm4
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0
	vbroadcastsd	%xmm4, %ymm4
	.p2align 4,,10
	.p2align 3
.L1720:
	vmovapd	%ymm0, %ymm2
	vmovapd	%ymm2, (%rax)
	addq	$32, %rax
	vaddpd	%ymm4, %ymm0, %ymm0
	cmpq	%rax, %rdx
	jne	.L1720
	movq	%rbx, %rax
	andq	$-4, %rax
	vcvtsi2sdq	%rax, %xmm3, %xmm3
	vfmadd213sd	-152(%rbp), %xmm1, %xmm3
	vmovsd	%xmm3, -152(%rbp)
	cmpq	%rbx, %rax
	je	.L1774
	vzeroupper
.L1719:
	leaq	1(%rax), %rcx
	vaddsd	%xmm3, %xmm1, %xmm0
	leaq	0(,%rax,8), %rdx
	vmovsd	%xmm3, (%r12,%rax,8)
	cmpq	%rbx, %rcx
	jnb	.L1704
	addq	$2, %rax
	vaddsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm0, 8(%r12,%rdx)
	cmpq	%rbx, %rax
	jnb	.L1704
	vmovsd	%xmm1, 16(%r12,%rdx)
.L1704:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L1775
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	movq	%r14, %rax
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1765:
	.cfi_restore_state
	vsubsd	%xmm0, %xmm1, %xmm4
	testq	%rbx, %rbx
	js	.L1710
	vcvtsi2sdq	%rbx, %xmm3, %xmm6
	vcomisd	%xmm0, %xmm1
	vmovsd	%xmm6, -152(%rbp)
	jbe	.L1766
.L1777:
	vmaxsd	.LC1(%rip), %xmm4, %xmm4
	vroundsd	$10, %xmm4, %xmm4, %xmm4
	vcomisd	%xmm5, %xmm4
	vcvttsd2siq	%xmm4, %rbx
	jnb	.L1776
	movq	%rbx, -136(%rbp)
	vmovsd	%xmm2, %xmm2, %xmm1
	jmp	.L1709
	.p2align 4,,10
	.p2align 3
.L1710:
	movq	%rbx, %rax
	shrq	%rax
	andl	$1, %ebx
	orq	%rbx, %rax
	vcvtsi2sdq	%rax, %xmm3, %xmm6
	vcomisd	%xmm0, %xmm1
	vaddsd	%xmm6, %xmm6, %xmm6
	vmovsd	%xmm6, -152(%rbp)
	ja	.L1777
.L1766:
	vxorpd	%xmm1, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm4, %xmm4
	movq	$0x000000000, -128(%rbp)
	vcvttsd2sil	%xmm4, %ebx
	movl	%ebx, %eax
	sarl	$31, %eax
	xorl	%eax, %ebx
	subl	%eax, %ebx
	movslq	%ebx, %rbx
	movq	%rbx, -136(%rbp)
	jmp	.L1709
	.p2align 4,,10
	.p2align 3
.L1772:
	movq	-176(%rbp), %rcx
	movq	%rcx, %rax
	salq	$4, %rax
	subq	%rcx, %rax
	movq	%rax, -96(%rbp)
	movq	%rax, %r13
	cmpq	-160(%rbp), %r12
	je	.L1731
	movq	$0, (%r12)
	movl	$48, %edi
	leaq	-80(%rbp), %r15
	.cfi_escape 0x2e,0
	call	_Znwm@PLT
.LEHE53:
	movq	-120(%rbp), %rdx
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE(%rip), %rcx
	movq	%rdx, 40(%rax)
	vmovsd	-128(%rbp), %xmm0
	vmovsd	-152(%rbp), %xmm2
	movq	%rcx, (%rax)
	movq	%rbx, 16(%rax)
	movq	%r13, 32(%rax)
	vmovsd	%xmm0, 8(%rax)
	vmovsd	%xmm2, 24(%rax)
	leaq	-88(%rbp), %rsi
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rax, -88(%rbp)
.LEHB54:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE54:
	movq	-88(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1732
	movq	(%rdi), %rax
	call	*8(%rax)
.L1732:
	movq	-80(%rbp), %rax
	addq	$8, %r12
	movq	%r12, -72(%rbp)
	movq	%rax, -152(%rbp)
	cmpq	%rax, %r12
	je	.L1734
.L1733:
	movq	-152(%rbp), %rbx
	leaq	-80(%rbp), %r13
	.p2align 4,,10
	.p2align 3
.L1738:
	movq	%rbx, %rdi
	movq	%r13, %r15
.LEHB55:
	call	_ZNSt6thread4joinEv@PLT
	addq	$8, %rbx
	cmpq	%rbx, %r12
	jne	.L1738
	movq	-152(%rbp), %rax
	.p2align 4,,10
	.p2align 3
.L1740:
	cmpq	$0, (%rax)
	jne	.L1778
	addq	$8, %rax
	cmpq	%rax, %r12
	jne	.L1740
.L1741:
	cmpq	$0, -152(%rbp)
	je	.L1704
.L1734:
	movq	-64(%rbp), %rsi
	movq	-152(%rbp), %rdi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
	jmp	.L1704
	.p2align 4,,10
	.p2align 3
.L1774:
	vzeroupper
	jmp	.L1704
	.p2align 4,,10
	.p2align 3
.L1776:
	vsubsd	%xmm5, %xmm4, %xmm4
	vmovsd	%xmm2, %xmm2, %xmm1
	vcvttsd2siq	%xmm4, %rbx
	btcq	$63, %rbx
	movq	%rbx, -136(%rbp)
	jmp	.L1709
	.p2align 4,,10
	.p2align 3
.L1731:
	subq	$8, %rsp
	leaq	-128(%rbp), %rax
	pushq	%rax
	leaq	-80(%rbp), %r15
	leaq	-96(%rbp), %rcx
	leaq	-120(%rbp), %rdx
	leaq	-136(%rbp), %r9
	leaq	-112(%rbp), %r8
	movq	%r12, %rsi
	movq	%r15, %rdi
	.cfi_escape 0x2e,0x10
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRKZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES7_S7_T0_EUlmdmdE_mRdRmSD_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
.LEHE55:
	popq	%rax
	movq	-72(%rbp), %r12
	movq	-80(%rbp), %rax
	popq	%rdx
	movq	%rax, -152(%rbp)
	cmpq	%r12, %rax
	jne	.L1733
	jmp	.L1741
.L1743:
	vmovsd	-152(%rbp), %xmm3
	xorl	%eax, %eax
	jmp	.L1719
.L1778:
	call	_ZSt9terminatev@PLT
.L1775:
	call	__stack_chk_fail@PLT
.L1746:
	endbr64
	movq	%rax, %r12
	jmp	.L1735
.L1745:
	endbr64
	movq	%rax, %r12
	jmp	.L1727
.L1744:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1729
	.section	.gcc_except_table
.LLSDA12835:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE12835-.LLSDACSB12835
.LLSDACSB12835:
	.uleb128 .LEHB51-.LFB12835
	.uleb128 .LEHE51-.LEHB51
	.uleb128 .L1744-.LFB12835
	.uleb128 0
	.uleb128 .LEHB52-.LFB12835
	.uleb128 .LEHE52-.LEHB52
	.uleb128 .L1745-.LFB12835
	.uleb128 0
	.uleb128 .LEHB53-.LFB12835
	.uleb128 .LEHE53-.LEHB53
	.uleb128 .L1744-.LFB12835
	.uleb128 0
	.uleb128 .LEHB54-.LFB12835
	.uleb128 .LEHE54-.LEHB54
	.uleb128 .L1746-.LFB12835
	.uleb128 0
	.uleb128 .LEHB55-.LFB12835
	.uleb128 .LEHE55-.LEHB55
	.uleb128 .L1744-.LFB12835
	.uleb128 0
.LLSDACSE12835:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC12835
	.type	_ZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES2_S2_T0_.constprop.0.cold, @function
_ZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES2_S2_T0_.constprop.0.cold:
.LFSB12835:
.L1735:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movq	-88(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1769
	movq	(%rdi), %rax
	vzeroupper
	call	*8(%rax)
.L1736:
	leaq	-80(%rbp), %r15
.L1729:
	movq	%r15, %rdi
	call	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	movq	%r14, %rdi
	call	_ZN13MdStaticArrayIdED1Ev
	movq	%r12, %rdi
.LEHB56:
	call	_Unwind_Resume@PLT
.LEHE56:
.L1727:
	movq	-88(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1768
	movq	(%rdi), %rax
	vzeroupper
	call	*8(%rax)
.L1728:
	leaq	-80(%rbp), %r15
	jmp	.L1729
.L1768:
	vzeroupper
	jmp	.L1728
.L1769:
	vzeroupper
	jmp	.L1736
	.cfi_endproc
.LFE12835:
	.section	.gcc_except_table
.LLSDAC12835:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC12835-.LLSDACSBC12835
.LLSDACSBC12835:
	.uleb128 .LEHB56-.LCOLDB26
	.uleb128 .LEHE56-.LEHB56
	.uleb128 0
	.uleb128 0
.LLSDACSEC12835:
	.section	.text.unlikely
	.text
	.size	_ZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES2_S2_T0_.constprop.0, .-_ZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES2_S2_T0_.constprop.0
	.section	.text.unlikely
	.size	_ZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES2_S2_T0_.constprop.0.cold, .-_ZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES2_S2_T0_.constprop.0.cold
.LCOLDE26:
	.text
.LHOTE26:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC27:
	.string	"Index out of bounds while accessing index "
	.section	.rodata.str1.1
.LC28:
	.string	" ( >= "
.LC29:
	.string	")"
	.section	.rodata.str1.8
	.align 8
.LC30:
	.string	"Assignment error between ArraySlice of size "
	.section	.rodata.str1.1
.LC31:
	.string	" and MdStaticArray of size "
.LC33:
	.string	"Time: "
.LC34:
	.string	"s"
.LC35:
	.string	" "
	.section	.text.unlikely
.LCOLDB36:
	.section	.text.startup,"ax",@progbits
.LHOTB36:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11023:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA11023
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	movl	$2, %edx
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	leaq	-304(%rbp), %r15
	movq	%r15, %rdi
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$448, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movq	%rax, -464(%rbp)
	movq	$0x000000000, -352(%rbp)
	movq	$1024, -96(%rbp)
	movq	$1024, -88(%rbp)
.LEHB57:
	call	_ZNSt6vectorImSaImEEC2ESt16initializer_listImERKS0_.constprop.0
.LEHE57:
	leaq	-400(%rbp), %rax
	leaq	-352(%rbp), %rdx
	movq	%rax, %rdi
	movq	%r15, %rsi
	movq	%rdx, -472(%rbp)
	movq	%rax, -480(%rbp)
	call	_ZN13MdStaticArrayIdEC1ERKSt6vectorImSaImEERKd
	movq	-304(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1780
	movq	-288(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L1780:
	leaq	-432(%rbp), %r12
	movq	-464(%rbp), %rsi
	movl	$2, %edx
	movq	%r12, %rdi
	movq	$0x000000000, -304(%rbp)
	movq	$1024, -96(%rbp)
	movq	$1024, -88(%rbp)
.LEHB58:
	call	_ZNSt6vectorImSaImEEC2ESt16initializer_listImERKS0_.constprop.0
.LEHE58:
	movq	-472(%rbp), %rdi
	movq	%r15, %rdx
	movq	%r12, %rsi
	call	_ZN13MdStaticArrayIdEC1ERKSt6vectorImSaImEERKd
	movq	-432(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1781
	movq	-416(%rbp), %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L1781:
	movl	$1024, %r14d
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L1902:
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%r14, %xmm6, %xmm0
	movq	%r13, %rax
	salq	$10, %rax
	movq	%r15, %rdi
	vmovq	%xmm0, %rbx
	vcvtsi2sdq	%rax, %xmm6, %xmm0
	vmovq	%rbx, %xmm1
	vmovsd	%xmm0, -456(%rbp)
.LEHB59:
	call	_ZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES2_S2_T0_.constprop.0
	movq	-384(%rbp), %rax
	movq	(%rax), %rsi
	cmpq	%r13, %rsi
	jbe	.L2004
	movq	-376(%rbp), %rax
	movq	-368(%rbp), %rdi
	movq	(%rax), %rcx
	xorl	%edx, %edx
	movq	%rdi, %rax
	divq	%rsi
	imulq	%r13, %rcx
	movq	%rax, %r12
	cmpq	-272(%rbp), %rax
	jne	.L2022
	cmpq	$99999, %rax
	jbe	.L1810
	cmpq	%rdi, %rsi
	ja	.L1812
	movq	-392(%rbp), %rdi
	movq	-296(%rbp), %rdx
	leaq	(%rdi,%rcx,8), %rsi
	leaq	8(%rdx), %r8
	movq	%rsi, %rax
	subq	%r8, %rax
	cmpq	$16, %rax
	jbe	.L1912
	movq	%r12, %r8
	shrq	$2, %r8
	salq	$5, %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1821:
	vmovupd	(%rdx,%rax), %ymm3
	vmovupd	%ymm3, (%rsi,%rax)
	addq	$32, %rax
	cmpq	%rax, %r8
	jne	.L1821
	movq	%r12, %rax
	andq	$-4, %rax
	testb	$3, %r12b
	je	.L2014
	subq	%rax, %r12
	cmpq	$1, %r12
	je	.L1824
	vmovupd	(%rdx,%rax,8), %xmm7
	leaq	(%rax,%rcx), %rsi
	vmovupd	%xmm7, (%rdi,%rsi,8)
	movq	%r12, %rsi
	andq	$-2, %rsi
	addq	%rsi, %rax
	cmpq	%rsi, %r12
	je	.L2014
.L1824:
	vmovsd	(%rdx,%rax,8), %xmm0
	addq	%rax, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	vzeroupper
.L1812:
	cmpb	$0, -304(%rbp)
	jne	.L1827
	movq	-296(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1840
	call	free@PLT
.L1840:
	movq	-288(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1841
	call	free@PLT
.L1841:
	movq	-280(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1827
	call	free@PLT
.L1827:
	vmovsd	-456(%rbp), %xmm0
	vmovq	%rbx, %xmm1
	movq	%r15, %rdi
	call	_ZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES2_S2_T0_.constprop.0
	movq	-336(%rbp), %rax
	movq	(%rax), %rsi
	cmpq	%r13, %rsi
	jbe	.L2005
	movq	-328(%rbp), %rax
	movq	-320(%rbp), %rdi
	movq	(%rax), %rcx
	xorl	%edx, %edx
	movq	%rdi, %rax
	divq	%rsi
	imulq	%r13, %rcx
	movq	%rax, %r12
	cmpq	-272(%rbp), %rax
	jne	.L2023
	cmpq	$99999, %rax
	jbe	.L1870
	cmpq	%rdi, %rsi
	ja	.L1872
	movq	-344(%rbp), %rdi
	movq	-296(%rbp), %rdx
	leaq	(%rdi,%rcx,8), %rsi
	leaq	8(%rdx), %r8
	movq	%rsi, %rax
	subq	%r8, %rax
	cmpq	$16, %rax
	jbe	.L1915
	movq	%r12, %r8
	shrq	$2, %r8
	salq	$5, %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1881:
	vmovupd	(%rdx,%rax), %ymm5
	vmovupd	%ymm5, (%rsi,%rax)
	addq	$32, %rax
	cmpq	%r8, %rax
	jne	.L1881
	movq	%r12, %rax
	andq	$-4, %rax
	testb	$3, %r12b
	je	.L2019
	subq	%rax, %r12
	cmpq	$1, %r12
	je	.L1884
	vmovupd	(%rdx,%rax,8), %xmm1
	leaq	(%rcx,%rax), %rsi
	vmovupd	%xmm1, (%rdi,%rsi,8)
	movq	%r12, %rsi
	andq	$-2, %rsi
	addq	%rsi, %rax
	cmpq	%r12, %rsi
	je	.L2019
.L1884:
	vmovsd	(%rdx,%rax,8), %xmm0
	addq	%rax, %rcx
	vmovsd	%xmm0, (%rdi,%rcx,8)
	vzeroupper
.L1872:
	cmpb	$0, -304(%rbp)
	jne	.L1887
	movq	-296(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1900
	call	free@PLT
.L1900:
	movq	-288(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1901
	call	free@PLT
.L1901:
	movq	-280(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L1887
	call	free@PLT
.L1887:
	incq	%r13
	addq	$1024, %r14
	cmpq	$1024, %r13
	jne	.L1902
	leaq	_ZSt4cout(%rip), %r12
	movq	-368(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %rdi
	leaq	-433(%rbp), %rsi
	movl	$1, %edx
	movb	$10, -433(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	-472(%rbp), %rdx
	movq	-480(%rbp), %rsi
	movl	$-1, %ecx
	movq	%r15, %rdi
	movq	%rax, %rbx
	call	_ZN15MdLinearAlgebra12mat_multiplyIdddEE13MdStaticArrayIT_ERKS1_IT0_ERKS1_IT1_Ei
.LEHE59:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%rbx, %rax
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	movl	$6, %edx
	leaq	.LC33(%rip), %rsi
	movq	%r12, %rdi
	vmulsd	.LC32(%rip), %xmm0, %xmm1
	vmovq	%xmm1, %rbx
.LEHB60:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovq	%rbx, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$1, %edx
	leaq	.LC34(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$1, %edx
	leaq	.LC35(%rip), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%r12), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %r13
	testq	%r13, %r13
	je	.L2024
	cmpb	$0, 56(%r13)
	je	.L1904
	movsbl	67(%r13), %esi
.L1905:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movq	%r15, %rdi
	call	_ZN13MdStaticArrayIdED1Ev
	movq	-472(%rbp), %rdi
	call	_ZN13MdStaticArrayIdED1Ev
	movq	-480(%rbp), %rdi
	call	_ZN13MdStaticArrayIdED1Ev
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L2025
	addq	$448, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	xorl	%eax, %eax
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1870:
	.cfi_restore_state
	cmpq	%rdi, %rsi
	ja	.L1872
	movq	-344(%rbp), %rdi
	movq	-296(%rbp), %rdx
	leaq	(%rdi,%rcx,8), %rsi
	leaq	8(%rdx), %r8
	movq	%rsi, %rax
	subq	%r8, %rax
	cmpq	$16, %rax
	jbe	.L1913
	cmpq	$1, %r12
	jbe	.L1913
	cmpq	$3, %r12
	jbe	.L1914
	movq	%r12, %r8
	shrq	$2, %r8
	salq	$5, %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1875:
	vmovupd	(%rdx,%rax), %ymm4
	vmovupd	%ymm4, (%rsi,%rax)
	addq	$32, %rax
	cmpq	%r8, %rax
	jne	.L1875
	movq	%r12, %rax
	andq	$-4, %rax
	testb	$3, %r12b
	je	.L2019
	vzeroupper
.L1874:
	subq	%rax, %r12
	cmpq	$1, %r12
	je	.L1877
	vmovupd	(%rdx,%rax,8), %xmm7
	leaq	(%rcx,%rax), %rsi
	vmovupd	%xmm7, (%rdi,%rsi,8)
	movq	%r12, %rsi
	andq	$-2, %rsi
	addq	%rsi, %rax
	cmpq	%r12, %rsi
	je	.L1872
.L1877:
	vmovsd	(%rdx,%rax,8), %xmm0
	addq	%rcx, %rax
	vmovsd	%xmm0, (%rdi,%rax,8)
	jmp	.L1872
	.p2align 4,,10
	.p2align 3
.L1810:
	cmpq	%rdi, %rsi
	ja	.L1812
	movq	-392(%rbp), %rdi
	movq	-296(%rbp), %rdx
	leaq	(%rdi,%rcx,8), %rsi
	leaq	8(%rdx), %r8
	movq	%rsi, %rax
	subq	%r8, %rax
	cmpq	$16, %rax
	jbe	.L1910
	cmpq	$1, %r12
	jbe	.L1910
	cmpq	$3, %r12
	jbe	.L1911
	movq	%r12, %r8
	shrq	$2, %r8
	salq	$5, %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1815:
	vmovupd	(%rdx,%rax), %ymm2
	vmovupd	%ymm2, (%rsi,%rax)
	addq	$32, %rax
	cmpq	%r8, %rax
	jne	.L1815
	movq	%r12, %rax
	andq	$-4, %rax
	testb	$3, %r12b
	je	.L2014
	vzeroupper
.L1814:
	subq	%rax, %r12
	cmpq	$1, %r12
	je	.L1817
	vmovupd	(%rdx,%rax,8), %xmm7
	leaq	(%rcx,%rax), %rsi
	vmovupd	%xmm7, (%rdi,%rsi,8)
	movq	%r12, %rsi
	andq	$-2, %rsi
	addq	%rsi, %rax
	cmpq	%r12, %rsi
	je	.L1812
.L1817:
	vmovsd	(%rdx,%rax,8), %xmm0
	addq	%rcx, %rax
	vmovsd	%xmm0, (%rdi,%rax,8)
	jmp	.L1812
	.p2align 4,,10
	.p2align 3
.L2019:
	vzeroupper
	jmp	.L1872
	.p2align 4,,10
	.p2align 3
.L2014:
	vzeroupper
	jmp	.L1812
	.p2align 4,,10
	.p2align 3
.L1915:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1880:
	vmovsd	(%rdx,%rax,8), %xmm0
	vmovsd	%xmm0, (%rsi,%rax,8)
	incq	%rax
	cmpq	%rax, %r12
	jne	.L1880
	jmp	.L1872
	.p2align 4,,10
	.p2align 3
.L1912:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1820:
	vmovsd	(%rdx,%rax,8), %xmm0
	vmovsd	%xmm0, (%rsi,%rax,8)
	incq	%rax
	cmpq	%rax, %r12
	jne	.L1820
	jmp	.L1812
	.p2align 4,,10
	.p2align 3
.L1910:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1813:
	vmovsd	(%rdx,%rax,8), %xmm0
	vmovsd	%xmm0, (%rsi,%rax,8)
	incq	%rax
	cmpq	%rax, %r12
	ja	.L1813
	jmp	.L1812
	.p2align 4,,10
	.p2align 3
.L1913:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L1873:
	vmovsd	(%rdx,%rax,8), %xmm0
	vmovsd	%xmm0, (%rsi,%rax,8)
	incq	%rax
	cmpq	%rax, %r12
	ja	.L1873
	jmp	.L1872
.L1911:
	xorl	%eax, %eax
	jmp	.L1814
.L1914:
	xorl	%eax, %eax
	jmp	.L1874
.L1904:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	movl	$10, %esi
	movq	%r13, %rdi
	call	*48(%rax)
	movsbl	%al, %esi
	jmp	.L1905
.L2024:
	call	_ZSt16__throw_bad_castv@PLT
.LEHE60:
.L2025:
	call	__stack_chk_fail@PLT
.L1916:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1908
.L1917:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1906
.L1920:
	endbr64
	movq	%rax, %rbx
	jmp	.L1907
.L2023:
	jmp	.L1849
.L2022:
	jmp	.L1789
	.section	.gcc_except_table
.LLSDA11023:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE11023-.LLSDACSB11023
.LLSDACSB11023:
	.uleb128 .LEHB57-.LFB11023
	.uleb128 .LEHE57-.LEHB57
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB58-.LFB11023
	.uleb128 .LEHE58-.LEHB58
	.uleb128 .L1916-.LFB11023
	.uleb128 0
	.uleb128 .LEHB59-.LFB11023
	.uleb128 .LEHE59-.LEHB59
	.uleb128 .L1917-.LFB11023
	.uleb128 0
	.uleb128 .LEHB60-.LFB11023
	.uleb128 .LEHE60-.LEHB60
	.uleb128 .L1920-.LFB11023
	.uleb128 0
.LLSDACSE11023:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC11023
	.type	main.cold, @function
main.cold:
.LFSB11023:
.L2004:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, -456(%rbp)
	movq	-384(%rbp), %rax
	leaq	-160(%rbp), %r12
	movq	(%rax), %rsi
	movq	%r12, %rdi
.LEHB61:
	call	_ZNSt7__cxx119to_stringEm
.LEHE61:
	leaq	-256(%rbp), %rbx
	movq	%r13, %rsi
	movq	%rbx, %rdi
.LEHB62:
	call	_ZNSt7__cxx119to_stringEm
.LEHE62:
	leaq	-224(%rbp), %r14
	movq	%rbx, %rdx
	leaq	.LC27(%rip), %rsi
	movq	%r14, %rdi
.LEHB63:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
.LEHE63:
	leaq	-192(%rbp), %r13
	leaq	.LC28(%rip), %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
.LEHB64:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE64:
	leaq	-128(%rbp), %r14
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
.LEHB65:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
.LEHE65:
	movq	-464(%rbp), %rdi
	leaq	.LC29(%rip), %rdx
	movq	%r14, %rsi
.LEHB66:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE66:
	movq	-464(%rbp), %rsi
	movq	-456(%rbp), %rdi
.LEHB67:
	call	_ZNSt13runtime_errorC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE67:
	movq	-96(%rbp), %rdi
	leaq	-80(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1783
	movq	-80(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1783:
	movq	-128(%rbp), %rdi
	leaq	-112(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1784
	movq	-112(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1784:
	movq	-192(%rbp), %rdi
	leaq	-176(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1785
	movq	-176(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1785:
	movq	-224(%rbp), %rdi
	leaq	-208(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1786
	movq	-208(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1786:
	movq	-256(%rbp), %rdi
	leaq	-240(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1787
	movq	-240(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1787:
	movq	-160(%rbp), %rdi
	leaq	-144(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1788
	movq	-144(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1788:
	movq	_ZNSt13runtime_errorD1Ev@GOTPCREL(%rip), %rdx
	movq	-456(%rbp), %rdi
	leaq	_ZTISt13runtime_error(%rip), %rsi
.LEHB68:
	call	__cxa_throw@PLT
.LEHE68:
.L1921:
	endbr64
	movq	%rax, %rbx
	vzeroupper
.L1803:
	movq	-456(%rbp), %rdi
	call	__cxa_free_exception@PLT
.L1804:
	movq	%r15, %rdi
	call	_ZN13MdStaticArrayIdED1Ev
.L1906:
	movq	-472(%rbp), %rdi
	call	_ZN13MdStaticArrayIdED1Ev
.L1908:
	movq	-480(%rbp), %rdi
	call	_ZN13MdStaticArrayIdED1Ev
	movq	%rbx, %rdi
.LEHB69:
	call	_Unwind_Resume@PLT
.LEHE69:
.L1918:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1804
.L1926:
	endbr64
	movq	%rax, %rbx
	vzeroupper
.L1793:
	movq	-128(%rbp), %rdi
	leaq	-112(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1795
	movq	-112(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1795:
	movq	-192(%rbp), %rdi
	leaq	-176(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1797
	movq	-176(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1797:
	movq	-224(%rbp), %rdi
	leaq	-208(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1799
	movq	-208(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1799:
	movq	-256(%rbp), %rdi
	leaq	-240(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1801
	movq	-240(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1801:
	movq	-160(%rbp), %rdi
	leaq	-144(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1803
	movq	-144(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
	jmp	.L1803
.L1925:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1795
.L1927:
	endbr64
	movq	-96(%rbp), %rdi
	movq	%rax, %rbx
	leaq	-80(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L2011
	movq	-80(%rbp), %rax
	leaq	1(%rax), %rsi
	vzeroupper
	call	_ZdlPvm@PLT
	jmp	.L1793
.L2011:
	vzeroupper
	jmp	.L1793
.L1924:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1797
.L1923:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1799
.L1922:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1801
.L1907:
	movq	%r15, %rdi
	vzeroupper
	call	_ZN13MdStaticArrayIdED1Ev
	jmp	.L1906
.L1849:
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	leaq	-192(%rbp), %r13
	movq	-272(%rbp), %rsi
	movq	%r13, %rdi
	movq	%rax, %rbx
.LEHB70:
	call	_ZNSt7__cxx119to_stringEm
.LEHE70:
	movq	-464(%rbp), %rdi
	movq	%r12, %rsi
.LEHB71:
	call	_ZNSt7__cxx119to_stringEm
.LEHE71:
	leaq	-128(%rbp), %r14
	movq	-464(%rbp), %rdx
	leaq	.LC30(%rip), %rsi
	movq	%r14, %rdi
.LEHB72:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
.LEHE72:
	leaq	-160(%rbp), %r12
	leaq	.LC31(%rip), %rdx
	movq	%r14, %rsi
	movq	%r12, %rdi
.LEHB73:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE73:
	leaq	-224(%rbp), %r14
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
.LEHB74:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
.LEHE74:
	movq	%r14, %rsi
	movq	%rbx, %rdi
.LEHB75:
	call	_ZNSt13runtime_errorC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE75:
	movq	-224(%rbp), %rdi
	leaq	-208(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1865
	movq	-208(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1865:
	movq	-160(%rbp), %rdi
	leaq	-144(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1866
	movq	-144(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1866:
	movq	-128(%rbp), %rdi
	leaq	-112(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1867
	movq	-112(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1867:
	movq	-96(%rbp), %rdi
	leaq	-80(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1868
	movq	-80(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1868:
	movq	-192(%rbp), %rdi
	leaq	-176(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1869
	movq	-176(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1869:
	movq	_ZNSt13runtime_errorD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt13runtime_error(%rip), %rsi
	movq	%rbx, %rdi
.LEHB76:
	call	__cxa_throw@PLT
.LEHE76:
.L2005:
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, -456(%rbp)
	movq	-336(%rbp), %rax
	leaq	-160(%rbp), %r12
	movq	(%rax), %rsi
	movq	%r12, %rdi
.LEHB77:
	call	_ZNSt7__cxx119to_stringEm
.LEHE77:
	leaq	-256(%rbp), %rbx
	movq	%r13, %rsi
	movq	%rbx, %rdi
.LEHB78:
	call	_ZNSt7__cxx119to_stringEm
.LEHE78:
	leaq	-224(%rbp), %r14
	movq	%rbx, %rdx
	leaq	.LC27(%rip), %rsi
	movq	%r14, %rdi
.LEHB79:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
.LEHE79:
	leaq	-192(%rbp), %r13
	leaq	.LC28(%rip), %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
.LEHB80:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE80:
	leaq	-128(%rbp), %r14
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
.LEHB81:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
.LEHE81:
	movq	-464(%rbp), %rdi
	leaq	.LC29(%rip), %rdx
	movq	%r14, %rsi
.LEHB82:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE82:
	movq	-464(%rbp), %rsi
	movq	-456(%rbp), %rdi
.LEHB83:
	call	_ZNSt13runtime_errorC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE83:
	movq	-96(%rbp), %rdi
	leaq	-80(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1843
	movq	-80(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1843:
	movq	-128(%rbp), %rdi
	leaq	-112(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1844
	movq	-112(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1844:
	movq	-192(%rbp), %rdi
	leaq	-176(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1845
	movq	-176(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1845:
	movq	-224(%rbp), %rdi
	leaq	-208(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1846
	movq	-208(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1846:
	movq	-256(%rbp), %rdi
	leaq	-240(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1847
	movq	-240(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1847:
	movq	-160(%rbp), %rdi
	leaq	-144(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1848
	movq	-144(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1848:
	movq	_ZNSt13runtime_errorD1Ev@GOTPCREL(%rip), %rdx
	movq	-456(%rbp), %rdi
	leaq	_ZTISt13runtime_error(%rip), %rsi
.LEHB84:
	call	__cxa_throw@PLT
.LEHE84:
.L1789:
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	leaq	-192(%rbp), %r13
	movq	-272(%rbp), %rsi
	movq	%r13, %rdi
	movq	%rax, %rbx
.LEHB85:
	call	_ZNSt7__cxx119to_stringEm
.LEHE85:
	movq	-464(%rbp), %rdi
	movq	%r12, %rsi
.LEHB86:
	call	_ZNSt7__cxx119to_stringEm
.LEHE86:
	leaq	-128(%rbp), %r14
	movq	-464(%rbp), %rdx
	leaq	.LC30(%rip), %rsi
	movq	%r14, %rdi
.LEHB87:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
.LEHE87:
	leaq	-160(%rbp), %r12
	leaq	.LC31(%rip), %rdx
	movq	%r14, %rsi
	movq	%r12, %rdi
.LEHB88:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE88:
	leaq	-224(%rbp), %r14
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
.LEHB89:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
.LEHE89:
	movq	%r14, %rsi
	movq	%rbx, %rdi
.LEHB90:
	call	_ZNSt13runtime_errorC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE90:
	movq	-224(%rbp), %rdi
	leaq	-208(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1805
	movq	-208(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1805:
	movq	-160(%rbp), %rdi
	leaq	-144(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1806
	movq	-144(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1806:
	movq	-128(%rbp), %rdi
	leaq	-112(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1807
	movq	-112(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1807:
	movq	-96(%rbp), %rdi
	leaq	-80(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1808
	movq	-80(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1808:
	movq	-192(%rbp), %rdi
	leaq	-176(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1809
	movq	-176(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1809:
	movq	_ZNSt13runtime_errorD1Ev@GOTPCREL(%rip), %rdx
	leaq	_ZTISt13runtime_error(%rip), %rsi
	movq	%rbx, %rdi
.LEHB91:
	call	__cxa_throw@PLT
.LEHE91:
.L1919:
	endbr64
	movq	%rax, %rbx
	vzeroupper
.L1864:
	movq	%r15, %rdi
	call	_ZN13MdStaticArrayIdED1Ev
	jmp	.L1906
.L1931:
	endbr64
	movq	%rax, %r12
	vzeroupper
.L1833:
	movq	-128(%rbp), %rdi
	leaq	-112(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1835
	movq	-112(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1835:
	movq	-96(%rbp), %rdi
	leaq	-80(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1837
	movq	-80(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1837:
	movq	-192(%rbp), %rdi
	leaq	-176(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1839
	movq	-176(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1839:
	movq	%rbx, %rdi
	call	__cxa_free_exception@PLT
	movq	%r12, %rbx
	jmp	.L1804
.L1930:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1835
.L1933:
	endbr64
	movq	-224(%rbp), %rdi
	movq	%rax, %r12
	leaq	-208(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L2015
	movq	-208(%rbp), %rax
	leaq	1(%rax), %rsi
	vzeroupper
	call	_ZdlPvm@PLT
.L1831:
	movq	-160(%rbp), %rdi
	leaq	-144(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1833
	movq	-144(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
	jmp	.L1833
.L1932:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1831
.L2015:
	vzeroupper
	jmp	.L1831
.L1929:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1837
.L1928:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1839
.L1946:
	endbr64
	movq	-224(%rbp), %rdi
	movq	%rax, %r12
	leaq	-208(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L2020
	movq	-208(%rbp), %rax
	leaq	1(%rax), %rsi
	vzeroupper
	call	_ZdlPvm@PLT
.L1891:
	movq	-160(%rbp), %rdi
	leaq	-144(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1893
	movq	-144(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1893:
	movq	-128(%rbp), %rdi
	leaq	-112(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1895
	movq	-112(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1895:
	movq	-96(%rbp), %rdi
	leaq	-80(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1897
	movq	-80(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1897:
	movq	-192(%rbp), %rdi
	leaq	-176(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1899
	movq	-176(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1899:
	movq	%rbx, %rdi
	call	__cxa_free_exception@PLT
	movq	%r12, %rbx
	jmp	.L1864
.L1945:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1891
.L2020:
	vzeroupper
	jmp	.L1891
.L1944:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1893
.L1943:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1895
.L1942:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1897
.L1941:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L1899
.L1937:
	endbr64
	movq	%rax, %rbx
	vzeroupper
.L1857:
	movq	-224(%rbp), %rdi
	leaq	-208(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1859
	movq	-208(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1859:
	movq	-256(%rbp), %rdi
	leaq	-240(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1861
	movq	-240(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1861:
	movq	-160(%rbp), %rdi
	leaq	-144(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1863
	movq	-144(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1863:
	movq	-456(%rbp), %rdi
	call	__cxa_free_exception@PLT
	jmp	.L1864
.L1936:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1859
.L1935:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1861
.L1934:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1863
.L1939:
	endbr64
	movq	%rax, %rbx
	vzeroupper
.L1853:
	movq	-128(%rbp), %rdi
	leaq	-112(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1855
	movq	-112(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
.L1855:
	movq	-192(%rbp), %rdi
	leaq	-176(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L1857
	movq	-176(%rbp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm@PLT
	jmp	.L1857
.L1938:
	endbr64
	movq	%rax, %rbx
	vzeroupper
	jmp	.L1855
.L1940:
	endbr64
	movq	-96(%rbp), %rdi
	movq	%rax, %rbx
	leaq	-80(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L2016
	movq	-80(%rbp), %rax
	leaq	1(%rax), %rsi
	vzeroupper
	call	_ZdlPvm@PLT
	jmp	.L1853
.L2016:
	vzeroupper
	jmp	.L1853
	.cfi_endproc
.LFE11023:
	.section	.gcc_except_table
.LLSDAC11023:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC11023-.LLSDACSBC11023
.LLSDACSBC11023:
	.uleb128 .LEHB61-.LCOLDB36
	.uleb128 .LEHE61-.LEHB61
	.uleb128 .L1921-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB62-.LCOLDB36
	.uleb128 .LEHE62-.LEHB62
	.uleb128 .L1922-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB63-.LCOLDB36
	.uleb128 .LEHE63-.LEHB63
	.uleb128 .L1923-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB64-.LCOLDB36
	.uleb128 .LEHE64-.LEHB64
	.uleb128 .L1924-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB65-.LCOLDB36
	.uleb128 .LEHE65-.LEHB65
	.uleb128 .L1925-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB66-.LCOLDB36
	.uleb128 .LEHE66-.LEHB66
	.uleb128 .L1926-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB67-.LCOLDB36
	.uleb128 .LEHE67-.LEHB67
	.uleb128 .L1927-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB68-.LCOLDB36
	.uleb128 .LEHE68-.LEHB68
	.uleb128 .L1918-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB69-.LCOLDB36
	.uleb128 .LEHE69-.LEHB69
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB70-.LCOLDB36
	.uleb128 .LEHE70-.LEHB70
	.uleb128 .L1941-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB71-.LCOLDB36
	.uleb128 .LEHE71-.LEHB71
	.uleb128 .L1942-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB72-.LCOLDB36
	.uleb128 .LEHE72-.LEHB72
	.uleb128 .L1943-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB73-.LCOLDB36
	.uleb128 .LEHE73-.LEHB73
	.uleb128 .L1944-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB74-.LCOLDB36
	.uleb128 .LEHE74-.LEHB74
	.uleb128 .L1945-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB75-.LCOLDB36
	.uleb128 .LEHE75-.LEHB75
	.uleb128 .L1946-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB76-.LCOLDB36
	.uleb128 .LEHE76-.LEHB76
	.uleb128 .L1919-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB77-.LCOLDB36
	.uleb128 .LEHE77-.LEHB77
	.uleb128 .L1934-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB78-.LCOLDB36
	.uleb128 .LEHE78-.LEHB78
	.uleb128 .L1935-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB79-.LCOLDB36
	.uleb128 .LEHE79-.LEHB79
	.uleb128 .L1936-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB80-.LCOLDB36
	.uleb128 .LEHE80-.LEHB80
	.uleb128 .L1937-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB81-.LCOLDB36
	.uleb128 .LEHE81-.LEHB81
	.uleb128 .L1938-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB82-.LCOLDB36
	.uleb128 .LEHE82-.LEHB82
	.uleb128 .L1939-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB83-.LCOLDB36
	.uleb128 .LEHE83-.LEHB83
	.uleb128 .L1940-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB84-.LCOLDB36
	.uleb128 .LEHE84-.LEHB84
	.uleb128 .L1919-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB85-.LCOLDB36
	.uleb128 .LEHE85-.LEHB85
	.uleb128 .L1928-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB86-.LCOLDB36
	.uleb128 .LEHE86-.LEHB86
	.uleb128 .L1929-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB87-.LCOLDB36
	.uleb128 .LEHE87-.LEHB87
	.uleb128 .L1930-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB88-.LCOLDB36
	.uleb128 .LEHE88-.LEHB88
	.uleb128 .L1931-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB89-.LCOLDB36
	.uleb128 .LEHE89-.LEHB89
	.uleb128 .L1932-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB90-.LCOLDB36
	.uleb128 .LEHE90-.LEHB90
	.uleb128 .L1933-.LCOLDB36
	.uleb128 0
	.uleb128 .LEHB91-.LCOLDB36
	.uleb128 .LEHE91-.LEHB91
	.uleb128 .L1918-.LCOLDB36
	.uleb128 0
.LLSDACSEC11023:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE36:
	.section	.text.startup
.LHOTE36:
	.p2align 4
	.type	_GLOBAL__sub_I__Z12dft_subarrayP7ComplexIdvEiiS1_, @function
_GLOBAL__sub_I__Z12dft_subarrayP7ComplexIdvEiiS1_:
.LFB12809:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	_ZStL8__ioinit(%rip), %rbp
	movq	%rbp, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	movq	%rbp, %rsi
	leaq	__dso_handle(%rip), %rdx
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE12809:
	.size	_GLOBAL__sub_I__Z12dft_subarrayP7ComplexIdvEiiS1_, .-_GLOBAL__sub_I__Z12dft_subarrayP7ComplexIdvEiiS1_
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z12dft_subarrayP7ComplexIdvEiiS1_
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, 96
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, 96
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, 96
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, 96
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, 85
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, 85
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, 85
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, 85
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE, 125
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIfvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiimmEEEEE6_M_runEv
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvP7ComplexIdvES5_S5_iiiiiES5_S5_S5_iiiiiEEEEE6_M_runEv
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPdS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiimmEEEEE6_M_runEv
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvPfS3_S3_iiiiiES3_S3_S3_iiiiiEEEEE6_M_runEv
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN14MdArrayUtility5rangeIddvEE13MdStaticArrayIT_ES6_S6_T0_EUlmdmdE_mdmdEEEEE6_M_runEv
	.weak	_ZZNSt8__detail18__to_chars_10_implImEEvPcjT_E8__digits
	.section	.rodata._ZZNSt8__detail18__to_chars_10_implImEEvPcjT_E8__digits,"aG",@progbits,_ZZNSt8__detail18__to_chars_10_implImEEvPcjT_E8__digits,comdat
	.align 32
	.type	_ZZNSt8__detail18__to_chars_10_implImEEvPcjT_E8__digits, @gnu_unique_object
	.size	_ZZNSt8__detail18__to_chars_10_implImEEvPcjT_E8__digits, 201
_ZZNSt8__detail18__to_chars_10_implImEEvPcjT_E8__digits:
	.string	"00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899"
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1074790400
	.set	.LC1,.LC10+8
	.set	.LC5,.LC9
	.align 8
.LC6:
	.long	1413754136
	.long	1075388923
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.set	.LC8,.LC10
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC9:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.align 32
.LC10:
	.long	0
	.long	1072693248
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	-1074790400
	.align 32
.LC13:
	.long	0
	.long	1072693248
	.long	0
	.long	0
	.long	856972295
	.long	1016178214
	.long	0
	.long	1072693248
	.align 32
.LC15:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.set	.LC16,.LC15
	.section	.rodata.cst8
	.align 8
.LC24:
	.long	0
	.long	1138753536
	.set	.LC25,.LC9+16
	.align 8
.LC32:
	.long	-400107883
	.long	1041313291
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
