package main

import (
	"fmt"
	"net/http"
)

func main() {
    http.HandleFunc("/", HelloServer)
    http.ListenAndServe(":8080", nil)
}
// remark
func HelloServer(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello World Again Ver1.3  Hello Ahmed Fathy, %s!", r.URL.Path[1:])
}
