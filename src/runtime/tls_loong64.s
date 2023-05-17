// Copyright 2022 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#include "textflag.h"

// If !iscgo, this is a no-op.
TEXT runtime·save_g(SB),NOSPLIT,$0-0
	MOVB	runtime·iscgo(SB), R30
	BEQ	R30, nocgo
	MOVV	g, runtime·tls_g(SB)

nocgo:
	RET

TEXT runtime·load_g(SB),NOSPLIT,$0-0
	MOVV	runtime·tls_g(SB), g
	RET

GLOBL runtime·tls_g(SB), TLSBSS, $8
