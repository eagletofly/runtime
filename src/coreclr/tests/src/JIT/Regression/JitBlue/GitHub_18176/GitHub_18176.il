// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern mscorlib { auto }
.assembly GitHub_18176 { }

// Ensure the jit is not tripped up by a foldable zero-length localloc

.class private auto ansi beforefieldinit X
       extends [mscorlib]System.Object
{
  .method private hidebysig static void  Foo(int32* x) cil managed noinlining
  {
    ret
  }

  .method public hidebysig static int32  Main() cil managed
  {
    .entrypoint
    .maxstack  2
    .locals init (int32* V_0)
    ldc.i4.0
    conv.u
    ldc.i4.4
    mul.ovf.un
    localloc
    stloc.0
    ldloc.0
    call       void X::Foo(int32*)
    ldc.i4.s   100
    ret
  }

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // Code size       7 (0x7)
    .maxstack  8
    ldarg.0
    call       instance void [mscorlib]System.Object::.ctor()
    ret
  }

}
