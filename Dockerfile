# stage 1: builder
FROM alpine:latest as builder

RUN apk --no-cache add nasm gcc make

COPY . /usr/src
WORKDIR /usr/src

RUN make ros.img

# stage 2: emulator
FROM alpine:latest

RUN apk --no-cache add qemu-system-x86_64 qemu-ui-curses

COPY --from=builder /usr/src/ros.img /ros.img

CMD ["qemu-system-x86_64", "-curses", "-drive", "file=/ros.img,format=raw,index=0,media=disk"]
