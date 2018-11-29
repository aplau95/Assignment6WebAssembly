(module
  (memory $0 4)
  (data (i32.const 0) "\01\03\06\02\09\0C\03\0F\12\00\04\00\00\03\00\00\07\00\00\02\00")
  (data (i32.const 128) "\01\03\06\00\05\00\01\09\0C\00\06\00\00\07\00")
  
  (func $deref (param i32 i32) (result i32)
    get_local 0
  	get_local 1
  	i32.add
    i32.load8_u)
  
  (func $interpr (param i32 i32) (result i32)
    get_local 0
    get_local 1
    call $deref
    i32.const 0
    i32.eq
    if 
      get_local 0
      i32.const 1
      i32.add
      get_local 1
      call $deref
      return
    end
    
    get_local 0
    get_local 1
    call $deref
    i32.const 1
    i32.eq
    if
      get_local 0
      i32.const 1
      i32.add
      get_local 1	
      call $deref
      get_local 1
      call $interpr
      get_local 0
      i32.const 2
      i32.add
      get_local 1
      call $deref
      get_local 1
      call $interpr
      i32.add
      return
    end
 
    get_local 0
    get_local 1
    call $deref
    i32.const 2
    i32.eq
    if 
      get_local 0
      i32.const 1
      i32.add
      get_local 1
      call $deref
      get_local 1
      call $interpr
      get_local 0
      i32.const 2
      i32.add
      get_local 1
      call $deref
      get_local 1
      call $interpr
      i32.sub
      return
    end
    
    get_local 0
    get_local 1
    call $deref
    i32.const 3
    i32.eq
    if 
      get_local 0
      i32.const 1
      i32.add
      get_local 1
      call $deref
      get_local 1
      call $interpr
      get_local 0
      i32.const 2
      i32.add
      get_local 1
      call $deref
      get_local 1
      call $interpr
      i32.mul
      return
    end
    
    get_local 0
    get_local 1
    call $deref
    i32.const 4
    i32.eq
    if 
      get_local 0
      i32.const 1
      i32.add
      get_local 1
      call $deref
      get_local 1
      call $interpr
      get_local 0
      i32.const 2
      i32.add
      get_local 1
      call $deref
      get_local 1
      call $interpr
      i32.div_u
      return
    end
    
    i32.const -1000)
  
  (func $interp (param i32) (result i32)
    i32.const 0
    get_local 0
    call $interpr)
  (export "interp" (func $interp)))
