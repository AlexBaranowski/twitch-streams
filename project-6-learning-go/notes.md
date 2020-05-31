Go -> Golang, compiled statically typed made by Rob Pike and Ken Thompson (Unix
legends) during they work for Google. Go was made publicly available in November 2009.

Why GO?

- Simple syntax
- Easy to write concurrency (gorutines and channels)
- Compiled
- Fast compilation - go use reproducible build/compilation
- Static linking (faster but fatter and harder to maintain)
- A lot of good tools like `gofmt`(formatter), `vet` (code analyzer) and `golint` (linter).

So what is written in Go?

- Kubernetes
- Docker
- Traefik
- caddy
- Hugo

## Installation (EuroLinux (or any other Enterprise Linux) 7 )
https://golang.org/dl/ 

```
cd tmp
wget https://dl.google.com/go/go1.14.3.linux-amd64.tar.gz
sudo tar xvzf go1.14.3.linux-amd64.tar.gz  -C /usr/local/
```

set path in fish shell:
```
set -U fish_user_paths /usr/local/go/bin $fish_user_paths
```

Test if go is installed
```
go version
```

## First programs

```
package main

import "fmt" // load libs

func main() {
    fmt.Println("Hello World!")
}
```

To run program we can

```bash
go run helloword.go # compile and run
go install helloword.go # compile and install into (GOBIN env variable ex. ~/go/bin )
go build helloword.go # compile and saves into helloworld
```

to make variable in go use following syntax

```
var name type
var name type = SOMEVALUE
var name = SOMEVALUE
```

If initial value is not set Go set it to "zero" of that value.  If
SOMEVALUE is set the type can be skipped, because Go will guess (infer)
type.

Multiple vars can be declared
```go
var name,age = 'Alex', 25
var name1 [, name...] [TYPE FOR ALL NAMES] =   ...
var name1 type1, name2 type2 =   ... // This will fail
// There is also special construct
var (
    name1 = type1
    name2 = type2
    name3 = type3
)
```
There is also short hand declaration

```
name := type
name1, name2, name3 := type1, type2, type3
```

Some titbit - := can be used as long as ONE on the left side is new

```
var name string = "Alex"
name, age := "Ala", 25
```

### Types

- bool (or operator is || and and operator is &&)
- Numeric:
    - int{8,16,32,64}, int
    - uint{8,16,32,64}, uint
    - float32, float64, BUT there is no float
    - complex64, complex128
    - byte
    - rune (alias for int32)
- string

IMPORTANT int and uint are platform dependable (32 or 64 bits)
IMPORTANT float64 is default float type


```go
c := 6 + 8i // shorthand for complex numbers
```

Go is strict when it comes to types and operations on them. One can NOT add
float and int

```
i := 64
j := 64.2
sum := i + j // fail
```

The variables must be explicit casted

```go
//my_float = float32(my_int) //  This will fail!
my_float = float64(my_int) 
```

### Constants

In go constant is constant, and it must be know during compilation phase.

```go
x := math.Sqrt(4)
const z float64 = 2.0000
//const y float64 = math.Sqrt(16) // this will fail
fmt.Println("x: ", x)
fmt.Println("const z: ", z)
```

BTW. By the default the constants don't have any type as long as the code program
ask about type. There is also possibility to make typed constants.

```go
const typedconststring String = "aaaaa"
const nottyped = "aaaaab"
```

When it comes to numeric constants, they type can be determined on fly:

```go
const a = 1
var int32Var = a
var int64Var int64 = a
var float64Var float64 = a
var complex128Var complex128 = a
```

```go
const b = 1.5
// var int32Var = b 
// var int64Var int64 = b // fail with: constant 1.5 truncated to integer
var float64Var float64 = b
var complex128Var complex128 = b
```


### Functions

General syntax is:

```go
func function_name([parameter type],[parameters types]) returntype {
    // body
}
```

The funny things

- You can return multiple values
  ```go
func castTwoIntToFloat(a,b int)(float64, float64){
    return (float64)a, (float64)b
}
```

TODO "Named return values"


