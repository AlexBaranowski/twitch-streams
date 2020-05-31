package main

import "fmt"

func castTwoIntToFloat(a, b int) (float64, float64) {
	af := float64(a)
	bf := float64(b)
	return af, bf
}

func calculateSquareArea(a float64) float64 {
	return a * a
}

//func calculateRectangleArea(a, b float64) float64 // It's also OK
func calculateRectangleArea(a float64, b float64) float64 {
	return a * b
}
func main() {
	fmt.Println("vim-go")
}
