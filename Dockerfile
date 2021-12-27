# build
FROM python:3.9 AS builder
WORKDIR /build
COPY app/requirements.txt .
RUN python3 -m pip install -r requirements.txt
RUN git clone "https://github.com/cssnr/vultr-python.git"
COPY theme /build/theme
WORKDIR /build/"vultr-python"
RUN mkdir -p /html && \
    mv "vultr.py" "vultr-python.py" && \
    python3 -m pdoc -t /build/theme -o /html "vultr-python.py"

# run
FROM nginx:alpine
ENV TZ=UTC
COPY app/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /html /html
