ArgoCD Rollout 관련 
======================

> ※ ArgoCD의 배포전략을 구성하기위해서는 추가 설치가 필요합니다.

> ArgoCD rollout은 Progressive Deliver를 지원하는 툴임
![ex_screenshot](./img/image(1878).png)

> 데모화면 예시
![ex_screenshot](./img/img.png)
![ex_screenshot](./img/img2.png)


> 각각의 배포전략을 테스트하기 위한 deployment에 대한 yaml이 저장되어 있습니다.



# 설치관련
### 아래 내용은 (https://devocean.sk.com/blog/techBoardDetail.do?ID=163189)링크의 정보를 토대로 함.

### git yaml활용시에는 아래의 블로그를 참고할 것.
1. https://teichae.tistory.com/entry/Argo-CD%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-BlueGreen-%EB%B0%B0%ED%8F%AC-3
2. https://teichae.tistory.com/entry/Argo-CD%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-Canary-%EB%B0%B0%ED%8F%AC-4

## 1. Argo Quick 설치하기

 

```
kubectl create namespace argo-rollouts
```
    
```  	
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
```

## 2. kubectl plugin 설치하기
```
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
```
```
chmod +x ./kubectl-argo-rollouts-linux-amd64
```
```
mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts
```
```
kubectl argo rollouts version
```

## 3. Basic Rollout 설치하기
```
cd ~/argo-rollout-demo
```
```
curl -Lo basic-rollout-blue.yaml https://raw.githubusercontent.com/argoproj/argo-rollouts/master/docs/getting-started/basic/rollout.yaml
```
```
curl -Lo basic-service.yaml https://raw.githubusercontent.com/argoproj/argo-rollouts/master/docs/getting-started/basic/service.yaml
```
```
kubectl apply -f basic-rollout-blue.yaml
```
```
kubectl apply -f basic-service.yaml
```
```
kubectl patch svc rollouts-demo --patch \
'{"spec": { "type": "NodePort", "ports": [ { "nodePort": 31080, "port": 80, "protocol": "TCP", "targetPort": "http", "name": "http" } ] } }'
```
## 4. 화면 접속
http://아이피:포트
## 5. 콘솔 보기
```
kubectl argo rollouts get rollout rollouts-demo --watch
```