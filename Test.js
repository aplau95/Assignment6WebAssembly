const wasmInstance =
      new WebAssembly.Instance(wasmModule, {});
const { checkEquals, interp } = wasmInstance.exports;
console.log(checkEquals(15, interp(0)));
console.log(checkEquals(18, interp(128)));
