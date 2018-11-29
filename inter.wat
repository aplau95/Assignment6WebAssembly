(module
  (memory $0 4)
  (data (i32.const 0) "\01\03\06\02\09\0C\03\0F\12\00\04\00\00\03\00\00\07\00\00\02\00")
  
  (func $deref (param i32) (result i32)
    get_local 0
    i32.load8_u)
  
  (func $interp (param i32) (result i32)
    get_local 0
    call $deref
    i32.const 0
    i32.eq
    if 
      get_local 0
      i32.const 1
      i32.add
      call $deref
      return
    end
    
    get_local 0
    call $deref
    i32.const 1
    i32.eq
    if
      get_local 0
      i32.const 1
      i32.add
      call $deref
      call $interp
      get_local 0
      i32.const 2
      i32.add
      call $deref
      call $interp
      i32.add
      return
    end
 
    get_local 0
    call $deref
    i32.const 2
    i32.eq
    if 
    get_local 0
      i32.const 1
      i32.add
      call $deref
      call $interp
      get_local 0
      i32.const 2
      i32.add
      call $deref
      call $interp
      i32.sub
      return
    end
    
    get_local 0
    call $deref
    i32.const 3
    i32.eq
    if 
      get_local 0
      i32.const 1
      i32.add
      call $deref
      call $interp
      get_local 0
      i32.const 2
      i32.add
      call $deref
      call $interp
      i32.mul
      return
    end
    
    i32.const -1000)
  (export "interp" (func $interp)))
