# Secure Nginx WAF (ModSecurity v3 + OWASP CRS)

<div align="center">

<img src="https://img.shields.io/badge/Nginx-v1.28.0-009639?style=flat-square&logo=nginx&logoColor=white" alt="Nginx v1.28.0" />
<img src="https://img.shields.io/badge/ModSecurity-v3.0/master-005C9F?style=flat-square&logo=auth0&logoColor=white" alt="ModSecurity v3" />
<img src="https://img.shields.io/badge/OWASP_CRS-v4.0-181717?style=flat-square&logo=owasp&logoColor=white" alt="OWASP CRS v4" />

</div>

---

This project provides a **hardened Nginx Reverse Proxy** infrastructure, integrating **ModSecurity v3** and the **OWASP Core Rule Set (CRS)**.

It is designed to protect backend services (Plex, APIs, Websites) against the **OWASP Top 10** and automated scans (SQLi, XSS, LFI, RFI, Shellshock, etc.). The environment is containerized via Docker.

## Table of Contents

1. [Introduction](#secure-nginx-waf-modsecurity-v3--owasp-crs)
2. [Project Architecture](#project-architecture)
3. [Installation & Project Launch](#installation--project-launch)
    - [Docker Installation](#0-docker-installation)
    - [Retrieving the Sources](#1-retrieving-the-sources)
    - [Environment Initialization](#2-environment-initialization)
    - [Starting docker-compose](#3-starting-docker-compose)
4. [Adding a New Domain (Vhost)](#adding-a-new-domain-vhost)
5. [Validation & Penetration Testing/Audit (WAF)](#validation--penetration-testingaudit-waf)
    - [Test Suites (OWASP Top 10)](#1-test-suites-owasp-top-10)
        - [Path Traversal / LFI](#path-traversal--lfi)
        - [XSS Injection (Cross-Site Scripting)](#xss-injection-cross-site-scripting)
        - [Remote File Inclusion (RFI)](#remote-file-inclusion-rfi)
6. [WAF Architecture & Operation](#waf-architecture--operation)
7. [Creating Custom Rules (Virtual Patching)](#creating-custom-rules-virtual-patching)
    - [Example: IP Blacklist](#example--ip-blacklist)
    - [Configuration File](#configuration-file)
8. [Star History](#star-history)
9. [Official Documentation](#official-documentation)

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
├── .dockerignore
├── entrypoint.sh
├── logs/
│   ├── access.log
│   └── error.log
├── Makefile
├── README.md
└── setup.sh
