# MERN Stack Application on EKS with CI/CD Automation

## CI/CD Pipeline with Jenkins, Docker, Kubernetes, and Monitoring
 CI-CD-architecture:

![CI-CD-architecture](https://github.com/user-attachments/assets/0799e41c-6f8b-4f80-8eaa-0f2036f630cb)

 Project Architcture:

 ![project-architcture](https://github.com/user-attachments/assets/00a4f741-0edc-4067-a2a3-a38c3a579aac)



This project outlines a robust CI/CD pipeline using Jenkins, GitHub, Docker, Kubernetes, and monitoring tools like Prometheus and Grafana. It ensures secure, automated, and observable deployment of applications to a Kubernetes cluster.

---

## 🧑‍💻 Developer Workflow

1. **Code Push to GitHub**
   - Developer pushes the latest code to a GitHub repository.

---

## 🚀 Jenkins CI (Continuous Integration)

Triggered automatically on code push.

### Steps:
1. **Pull Code** from GitHub.
2. **OWASP Dependency Check**
   - Scans for vulnerabilities in project dependencies.
3. **Code Quality Analysis** using **SonarQube**
   - Static code analysis to maintain coding standards.
4. **Filesystem Scan** with **Trivy**
   - Detects vulnerabilities in the file system or Docker images.
5. **Build Docker Image**
   - Image is created once all checks pass successfully.

---

## 📦 Jenkins CD (Continuous Deployment)

Triggered automatically after CI job completion.

### Steps:
1. **Update Docker Image Version**
   - The new version is tagged and pushed.
2. **Pull Deployment Config from GitHub**
   - Pulls Helm charts or Kubernetes manifests.
3. **Deploy to Kubernetes** using **ArgoCD** and **Helm**
   - GitOps-based deployment for better version control.

---

## 📈 Monitoring and Notifications

- **Monitoring**: 
  - **Prometheus** and **Grafana** provide performance and health monitoring.
- **Notifications**: 
  - Email notifications (via Gmail) are sent on deployment success/failure.

---

## 🔧 Tools Used

| Tool        | Purpose                                  |
|-------------|------------------------------------------|
| GitHub      | Source code repository                   |
| Jenkins     | CI/CD pipeline automation                |
| OWASP       | Dependency vulnerability check           |
| SonarQube   | Code quality and static analysis         |
| Trivy       | Filesystem and Docker image scanning     |
| Docker      | Containerization                         |
| Helm        | Kubernetes package manager               |
| ArgoCD      | GitOps-based continuous delivery         |
| Kubernetes  | Container orchestration                  |
| Prometheus  | Monitoring                               |
| Grafana     | Dashboards and visualization             |
| Gmail       | Email notifications                      |

---

## 📌 Summary

This pipeline ensures:
- Secure and validated code deployment
- Continuous integration and delivery
- Automated scanning and monitoring
- Full visibility with alerts and reports

## Contributors

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/vinayakz">
        <img src="https://avatars.githubusercontent.com/u/33689324?v=4" width="100px;" alt="vinayakz"/><br />
        <sub><b>Vinayak Z.</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/kartik07g">
        <img src="https://avatars.githubusercontent.com/u/72117498?v=4" width="100px;" alt="kartik07g"/><br />
        <sub><b>Kartik</b></sub>
      </a>
    </td>
  </tr>
</table>

