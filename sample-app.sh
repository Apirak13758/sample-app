#!/bin/bash

# Setup
rm -rf tempdir
mkdir -p tempdir/templates tempdir/static

# Copy files
cp sample_app.py tempdir/
[ -d templates ] && cp -r templates/* tempdir/templates/
[ -d static ] && cp -r static/* tempdir/static/

# Create Dockerfile
cat <<EOF > tempdir/Dockerfile
FROM python:3.10-slim
WORKDIR /home/myapp
RUN pip install --no-cache-dir --progress-bar=off --root-user-action=ignore flask
COPY ./static ./static/
COPY ./templates ./templates/
COPY sample_app.py .
EXPOSE 5050
CMD ["python3", "sample_app.py"]
EOF

# Build and run
cd tempdir || exit
docker build -t sampleapp .
docker run -t -d -p 5050:5050 --memory=1g --name samplerunning sampleapp
docker ps -a
