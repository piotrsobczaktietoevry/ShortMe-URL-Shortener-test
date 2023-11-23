FROM python:3.9.18

WORKDIR /app

COPY requirements.txt .

# RUN pip install --no-cache-dir -r requirements.txt

RUN pip install -r requirements.txt

COPY . .
RUN ls
RUN export $(cat .env) | xargs
 
CMD ["python", "run.py"]
