# Installation 

This page provides guidance on how to run the hands-on modules using minikube.

## Prerequisites

* **Operating System**: A compatible OS (Linux, macOS, or Windows). If using Windows, WSL2 is recommended for compatibility.
* V**irtualization Support**: Ensure virtualization is enabled in the BIOS/UEFI settings, as it's required for running Minikube or Docker.

## Installation Steps

### Install Docker

- Linux: Follow Docker's installation guide.
- macOS and Windows: Install Docker Desktop.

### Install Minikube

Download Minikube from the official site.

Follow the installation instructions based on the OS.

* macOS: `brew install minikube`
* Linux: Use the binary or package manager (e.g., apt for Ubuntu).
* Windows: Install using Chocolatey: `choco install minikube`

### Install Kubectl

Download the `kubectl` binary from Kubernetes' official site.

Alternatively, use a package manager:

* macOS: `brew install kubectl`
* Linux: `sudo apt-get install -y kubectl` (debian based)
* Windows: `choco install kubernetes-cli`

### Install Skaffold

Follow the installation steps from Skaffold’s official documentation.

Examples:

- macOS: `brew install skaffold`
- Linux: Download the binary and move it to /usr/local/bin/.
- Windows: Use Chocolatey: `choco install skaffold`

### Install Helm

Follow the installation steps from Helm's official documentation 

- macOS: `brew install helm`
- Linux: Follow Helm's installation guide.
- Windows: `choco install kubernetes-helm`

### Set Up Minikube

Start Minikube: `minikube start`

Verify it’s running: `kubectl get nodes`

If necessary, specify a driver (e.g., Docker): `minikube start --driver=docker`

## Deploy the module

Create the namespace with: 

```
kubectl create ns eoap-quickwin
```

Type `skaffold dev -p coder`

This prints:

```
No tags generated
Starting deploy...
 - deployment.apps/code-server-deployment created
 - persistentvolumeclaim/code-server-pvc created
 - service/code-server-service created
 - configmap/init created
 - configmap/bash-rc created
 - configmap/bash-login created
 - serviceaccount/localstack created
 - role.rbac.authorization.k8s.io/localstack created
 - rolebinding.rbac.authorization.k8s.io/localstack created
 - service/localstack created
 - deployment.apps/localstack created
Waiting for deployments to stabilize...
Deployments stabilized in 26.042192ms
Starting post-deploy hooks...
Waiting for deployment and pod to be running...
Deployment replicas: 
Pod status: Pending
Waiting for deployment and pod to be running...
Deployment replicas: 1
Pod status: Running
Deployment with label app=code-server is running and a pod is in Running state
Completed post-deploy hooks
Port forwarding service/code-server-service in namespace eoap-quickwin, remote port 8080 -> http://127.0.0.1:8001
No artifacts found to watch
Press Ctrl+C to exit
Watching for changes...
```

Open your browser on the link printed in the log 