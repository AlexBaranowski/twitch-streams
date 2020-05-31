package main

import (
	"fmt"
	"unsafe"
)

func main() {

	//var my_float float THERE IS NO F
	var my_float float64
	fmt.Println(my_float)
	var my_int int64 = 123123123123123
	fmt.Println(my_int)
	var my_int2 int
	fmt.Printf("Variable my_int2 is %T its size is %d\n", my_int2, unsafe.Sizeof(my_int2))

	//my_float = float32(my_int) //  This will fail!
	//my_float = float32(my_int) //  This will fail!
	my_float = float64(my_int) //
	fmt.Println(my_float)

}
