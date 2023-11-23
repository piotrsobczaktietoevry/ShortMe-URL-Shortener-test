FROM python:3.9.18

WORKDIR /app

COPY requirements.txt .

# RUN pip install --no-cache-dir -r requirements.txt

RUN pip install -r requirements.txt

COPY . .

ENV SQLALCHEMY_DATABASE_URI=sqlite:///db.sqlite3 \
    SQLALCHEMY_TRACK_MODIFICATIONS=False \ 
    SECRET_KEY=randomKey \ 
    MAIL_SERVER=smtp.gmail.com \
    MAIL_PORT=465 \
    MAIL_USERNAME=email@email.com \
    MAIL_PASSWORD=password
 
CMD ["python", "run.py"]
