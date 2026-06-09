FROM python:3.11-slim
 
WORKDIR /app
 
# 캐시 최적화: 의존성부터 복사
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt gunicorn
 
COPY app.py ./
 
EXPOSE 5000
# Flask 기본 dev 서버 대신 gunicorn으로 서비스
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
