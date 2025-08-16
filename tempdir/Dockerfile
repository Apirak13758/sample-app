FROM python:3.10-slim
WORKDIR /home/myapp
RUN pip install --no-cache-dir --progress-bar=off --root-user-action=ignore flask
COPY ./static ./static/
COPY ./templates ./templates/
COPY sample_app.py .
EXPOSE 5050
CMD ["python3", "sample_app.py"]
