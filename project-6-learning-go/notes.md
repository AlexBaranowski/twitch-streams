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

Funny thing that we can return named values, that are returned in order when
`return` statement is executed


```go 
func myfunction123(a,b,c int)(x,y int){
    x = a*b
    y = b*c
    return // return x and y even without explicite 
}
```

#### Blank Identifier
`_` is blank identifier it can mean any value of any type. It can be used to discard some input


```go
func function123123()(int, int){
    return 1, 2
}

func otherfunction()(a int){
    a, _ = function123123()
    return a
}
```

## Packages

Module = collection of packages

To start own module use

```bash
go mod init mypackage
```

It creates go.mod file. Each package should have own directory. Each file in package should start with `package NAME` statement.

** IN Go any Capitalized function or variable in package is exported! **

Every package can have init function, that is automatically invoked (once) when
package is initialized. Important note this function cannot be explicite called.

It's also illegal in go ti import package and not use it. But there is nasty hack for it

```go

import (
    "unused/some/myyyypackage"
)

var _ = myyyypackage.SomeSymbol
```

Other hack:


```go
import (  
    _ "learnpackage/simpleinterest"
)
```
Both of this hack make package init function run (WTF grammar xD?).


## If else

like in any sensible langugae

```go

if cond {

} else if cond2 {

}
else{

}
```

Go also have special construct with additional statement run before condition

```go
if statement; condition {

}
```
One thing that is ~~specific~~ is that else must be in one line with if closing bracket `}`

## Loops


```
for init; condition; post{

}
```
there is `break` and `continue`.

Go also support labels in loops, but it looks like hell to maintain and understand

```go
package main

import (  
    "fmt"
)

func main() {  
outer:  
    for i := 0; i < 3; i++ {
        for j := 1; j < 4; j++ {
            fmt.Printf("i = %d , j = %d\n", i, j)
            if i == j {
                break outer // break to the outer loop
            }
        }

    }
}
```

To make while loop use for with condition only.


## Switch

Looks like switch in other languages
```go
func xxx() {
    x := 1
    swich x {
        case 1: 
            something
        case 2: 
            something22
        case 3: 
            something22
        default:
            executethis
    }
}
```
switch support multiple expressions


```
case 1,3,5,7,9:
    odd_function()
```


In go expression on which switch is made is optional.

```go
    switch {
    case v1 > 100 && v2 > 100:
        do_this
    case v1 > 10 && v2 > 100:
        do_this2
    case v1 > 1 && v2 > 100:
        do_this3
    default:
        do_this4
    }
```

In go it's possible to execute multiple statement with fallthrough, it return
program execution to the next case.


```go
    switch {
    case v1 > 100 && v2 > 100:
        do_this
        fallthrough
    case v1 > 10 && v2 > 100:
        do_this2
        fallthrough
    case v1 > 1 && v2 > 100:
        do_this3
        fallthrough
    default:
        do_this4
    }
```

Switch also supports breaks that will break even if there is fallthrough.

https://golangbot.com/arrays-and-slices/

