프로브 설명서
======================

> 해당 프로브의 사용 및 PoC에 있어 정리

> 참고 URL : https://bcho.tistory.com/1264


# 1. Liveness Probe
## 1.1. 활용 방법
/livenessprobe  디렉토리의 yaml을 배포

아래 경로의 파일을 삭제
```
/tmp/healthy

```

삭제 명령어
```
kubectl exec 파드명 -n 네임스페이스 -- rm /tmp/healthy
```

pod가 재기동되며 성공함.