# SubWhisper: Automated Subdomain & Live Host Reconnaissance

#### Version: 1.0.0

**SubWhisper** is a command-line tool designed to automate subdomain enumeration and live host detection for cybersecurity professionals, bug bounty hunters, and researchers. It leverages multiple industry-standard tools to discover subdomains and identify which ones are active for a given domain.

## Purpose

SubWhisper simplifies the process of mapping an organization's external attack surface. By automating subdomain discovery and verification, it enables users to quickly find potential entry points, forgotten assets, or misconfigured services that could pose security risks.

## Features

- **Integrated Recon Tools**: Automates the use of popular utilities:
  - **assetfinder**: Fast passive subdomain discovery.
  - **subfinder**: Extensive passive enumeration from OSINT sources.
  - **amass**: Comprehensive passive and active mapping.
  - **httpx**: Probes HTTP/S endpoints to identify live servers.
- **Dependency Checks**: Verifies Go (Golang) and required tools, prompting for installation if missing.
- **Tool Updates**: Optionally updates all integrated tools.
- **Subdomain Exclusion**: Allows specifying subdomains to exclude from results.
- **Organized Output**: Creates a dedicated output directory per scan, storing raw outputs, consolidated lists, and live domains.
- **Interactive Prompts**: Requests user approval before installing dependencies.
- **Graceful Exit**: Cleans up output directories if interrupted (Ctrl+C).
- **Reporting**: Generates:
  - **HTML Report**: Interactive file listing live domains, status codes, titles, and links.
  - **Plain Text Report**: Summarizes scan details and lists live domains.
- **Browser Integration**: Attempts to open the HTML report in Chrome, Chromium, or Firefox.

## Dependencies

- **Bash**: Scripting language.
- **Standard Linux/Unix Utilities**: cat, sort, uniq, wc, grep, sed, mkdir, pkill, awk, tr.

## Installation

### 1. Git clone

```bash
git clone https://github.com/Alchemist501/SubWhisper.git
cd SubWhisper
```

### 2. Installing tool:

You have two primary options for setting up SubWhisper:

**Option 1: System-Wide Installation (Recommended)**

This method installs SubWhisper and its report templates to standard system paths, allowing you to run it from any directory.

1. Run the installer script as a root user:

```
sudo bash install.sh
```

2. Clean up (Optional): Once installed, the downloaded folder is no longer required for operation and can be deleted to reclaim disk space.

```bash
cd ..
rm -rf SubWhisper
```

**Option 2: Direct Execution (No System-Wide Install)**

This method allows you to run SubWhisper directly from its downloaded location without installing it to system paths.

    chmod +x subwhisper
    ./subwhisper

You will need to run it from within the SubWhisper directory or provide its full path.

## Usage

```bash
subwhisper -d domain.com [-x exclude1,exclude2] [-u] [-h]
```

- **-d**: Target domain (required), e.g., example.com.
- **-x**: (Optional) Comma-separated subdomains to exclude, e.g., dev.example.com,test.example.com.
- **-u**, **--update**: (Optional) Update all tools.
- **-h**: (Optional) Show help.
- **--version**: (Optional) Show version.

## Examples

Basic scan:

```bash
subwhisper -d example.com
```

Scan with exclusions:

```bash
subwhisper -d example.com -x admin.example.com,internal.example.com
```

Update tools:

```bash
subwhisper --update
```

## Screenshots

### Running SubWhisper

![Running SubWhisper](screenshots/SubWhisper.png)

### HTML Report

![HTML Report](screenshots/Index.png)

### Text Report

![Text Report](screenshots/Report.png)

## Output

After running, the script creates a directory named `recon_<DOMAIN>_<DATE_TIME>` (e.g., `recon_example.com_2025-07-26_13-45-00`) containing:

- `subfinder.txt`: Raw subfinder output.
- `amass.txt`: Raw amass output.
- `assetfinder.txt`: Raw assetfinder output.
- `domains.txt`: Consolidated, unique subdomain list.
- `livedomains.txt`: Live subdomains with status codes and titles.
- `report.html`: Interactive HTML report (auto-opens in browser).
- `Subwhisper_Report_<DOMAIN>.txt`: Plain text report with scan summary and live domains.

## Acknowledgements

SubWhisper is made possible by the open-source community and the creators of these essential tools:

- **amass**: OWASP Amass Project
- **assetfinder**: TomNomNom (Tom Hudson)
- **httpx**: ProjectDiscovery
- **subfinder**: ProjectDiscovery

We thank these developers for their contributions to cybersecurity.

## Versioning & Future Plans

This is Version 1.0.0, the initial release with core subdomain enumeration and live host identification features.

Future updates will focus on integrating advanced reconnaissance tools, enhancing reporting, and expanding functionality for more comprehensive attack surface mapping. Stay tuned for new features!

> **Disclaimer**: Use this tool only on domains you have explicit permission to test. Unauthorized scanning is illegal and unethical.
