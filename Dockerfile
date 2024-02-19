FROM golang:1.21

# Set destination for COPY
WORKDIR /app

# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/engine/reference/builder/#copy
COPY <<EOF ./main.go
package main
import (
 "fmt"
 "net/http"
)
func handler(w http.ResponseWriter, r *http.Request) {
 fmt.Fprintf(w, "Hello World!")
}
func main() {
 http.HandleFunc("/", handler)
 fmt.Println("Server running...")
 http.ListenAndServe(":8080", nil)
}
EOF

COPY <<EOF ./go.mod
module JSchuenke/gihub.com/shank-jumpbox

go 1.21.5
EOF

# Build
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o /app

FROM busybox
COPY --from=0 /app /app

CMD /app/shank-jumpbox