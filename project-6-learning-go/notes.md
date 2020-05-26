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
var name1 [name...] [TYPE FOR ALL NAMES] =   ...
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

