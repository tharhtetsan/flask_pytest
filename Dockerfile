# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8

EXPOSE 3000
#ENV PORT=8080

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY . /app



###########################################################


# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD exec gunicorn --bind :$PORT  --workers 1 --threads 8 --timeout 0 main:app

