package main

import "fmt"

func main() {
	//var age = 25.8123
	//var name string = "Alex"

	//var name, age, my_float = "Alex", 25, 123.123123
	// or
	//var (
	//name     = "Alex"
	//age      = 25
	//my_float = 123.123123
	//)

	//var name string, age int = "Alex", 25
	//var age, time = 25, 123123.12
	var time = 123123

	// shorthand declaration works with multiple vars and multiple types
	name, age, my_float := "Alex", 25, 123.123123
	// Illegal redelaration, short hand delcartion is full declaration with same scope
	//var name = "Ala"
	fmt.Println("My age is", age)
	fmt.Println("My time is", time)
	fmt.Println("My name is", name)
	fmt.Println("My float is", my_float)

	var name2 string = "Alex"
	name2, age2 := "Ala", 25
	fmt.Println("My name2 is", name2)
	fmt.Println("My age2 is", age2)
}
