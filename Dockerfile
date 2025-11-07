# 1. 베이스 이미지 설정
FROM python:3.8-slim-buster

# 2. 메타데이터 (Docker Hub에 등록 시 유용)
LABEL Maintainer="0427paul@gmail.com"

# 3. 컨테이너 내부 작업 디렉터리 설정
WORKDIR /app

# 4. 의존성 및 코드 파일 복사
# 의존성 파일을 먼저 복사하여 캐시를 활용합니다.
COPY requirements.txt ./

# 5. 의존성 설치
RUN pip3 install -r requirements.txt

# 6. 나머지 애플리케이션 코드 복사
COPY app.py ./

# 7. 서비스 포트 노출 (Dockerfile의 EXPOSE와 Flask의 포트 4000 일치)
EXPOSE 4000

# 8. 컨테이너 실행 명령어 정의
# Flask 앱을 4000번 포트, 0.0.0.0 (외부 접근 허용)으로 실행합니다.
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=4000"]