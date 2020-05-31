package main

import "fmt"
import "math"

func main() {

	fmt.Println("vim-go")
	x := math.Sqrt(4)
	const z float64 = 2.0000
	//const y float64 = math.Sqrt(16) // this will fail
	fmt.Println("x: ", x)
	fmt.Println("const z: ", z)
	const a = 1
	var int32Var = a
	var int64Var int64 = a
	var float64Var float64 = a
	var complex128Var complex128 = a
	fmt.Println(int32Var, int64Var, float64Var, complex128Var)

	const b = 1.5
	// var int32Var = a
	var bint64Var int64 = b
	var bfloat64Var float64 = b
	var bcomplex128Var complex128 = b
	fmt.Println(bint64Var, bfloat64Var, bcomplex128Var)
}
