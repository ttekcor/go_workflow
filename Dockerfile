FROM golang:1.24

WORKDIR /app/hello-golang

# Сначала копируем файлы модулей для кеширования зависимостей
COPY hello-golang/go.mod ./
RUN go mod tidy

# Затем копируем исходники
COPY hello-golang/ ./

# Сборка бинарника из корня модуля
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main .


CMD ["/main"]