# 정적 웹페이지(index.html)를 사내 서버에서 보여주기 위한 표준 Dockerfile
FROM nginx:1.27-alpine

# 정적 파일을 nginx 기본 웹 루트로 복사
COPY index.html /usr/share/nginx/html/

EXPOSE 80

# 상태 점검: / 경로가 정상 응답하는지 확인
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
