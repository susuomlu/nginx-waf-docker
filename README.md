# Secure Nginx WAF (ModSecurity v3 + OWASP CRS)

<div align="center">

<img src="https://img.shields.io/badge/Nginx-v1.28.0-009639?style=flat-square&logo=nginx&logoColor=white" alt="Nginx v1.28.0" />
<img src="https://img.shields.io/badge/ModSecurity-v3.0/master-005C9F?style=flat-square&logo=auth0&logoColor=white" alt="ModSecurity v3" />
<img src="https://img.shields.io/badge/OWASP_CRS-v4.0-181717?style=flat-square&logo=owasp&logoColor=white" alt="OWASP CRS v4" />

</div>

---

This project provides a **hardened Nginx Reverse Proxy** infrastructure, integrating **ModSecurity v3** and the **OWASP Core Rule Set (CRS)**.

It is designed to protect backend services (Plex, APIs, Websites) against the **OWASP Top 10** and automated scans (SQLi, XSS, LFI, RFI, Shellshock, etc.). The environment is containerized via Docker.

Run Project

docker build -t waf-nginx .
---

## Project Architecture



```text
.
├── config/
│   ├── custom/
│   │   ├── html/
│   │   │   └── error-pages/
│   │   │       ├── 401.html
│   │   │       ├── 404.html
│   │   │       └── 50x.html
│   │   └── snippets/
│   │       └── error-pages.conf
│   ├── modsec/
│   │   └── modsecurity.conf
│   ├── nginx/
│   │   └── conf.d/
│   │       ├── 00-geoip.conf
│   │       ├── 01-log_enriched.conf
│   │       └── 02-default.conf
│   ├── nginx.conf
│   └── owasp-crs/
│       ├── crs-setup.conf
│       └── rules
├── docker-compose.yml
├── Dockerfile
├── logs/
│   ├── access.log
│   └── error.log
├── README.md

