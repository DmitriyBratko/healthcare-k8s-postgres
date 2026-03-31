# Відмовостійка БД для e-health: Bare Metal K8s (kubeadm)

Це демонстраційний проєкт інфраструктури для медичної сфери. Замість використання керованих рішень (EKS/GKE) або полегшених дистрибутивів (K3s), цей кластер розгортається з нуля за допомогою **kubeadm**. 

Мета проєкту — продемонструвати глибоке розуміння архітектури Kubernetes на рівні операційної системи: налаштування ядра Linux, container runtime (containerd), мережевих плагінів (CNI) та ініціалізацію Control Plane.

## 1. Архітектура

* **IaC:** Terraform піднімає VPC та EC2 інстанси в AWS (імітація Bare Metal).
* **Bootstrap:** Bash-скрипти (`user_data`) автоматизують встановлення залежностей (sysctl, containerd, kubelet) та ініціалізують кластер через `kubeadm`.
* **CNI:** Calico (для підтримки NetworkPolicies).
* **Storage:** Local Path Provisioner (для симуляції роботи з локальними дисками ноди).
* **Workload:** PostgreSQL (StatefulSet) із суворою мережевою ізоляцією.

## 2. Структура репозиторію

| Директорія | Призначення |
| :--- | :--- |
| `infra/dev/` | Terraform-код для підняття серверів та налаштування мережі. |
| `infra/dev/scripts/` | Скрипти ініціалізації (`master.sh`, `worker.sh`) для налаштування Linux та `kubeadm`. |
| `k8s/` | Маніфести кластера (StorageClass, NetworkPolicies, StatefulSet). |

## 3. Як запустити

```bash
# 1. Підняти інфраструктуру
cd infra/dev
terraform init
terraform apply -auto-approve

# 2. Підключитися до Master-ноди (IP в outputs) і перевірити статус
ssh -i <your-key.pem> ubuntu@<master-ip>
kubectl get nodes
kubectl get pods -n kube-system
