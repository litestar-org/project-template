<!-- markdownlint-disable -->
<p align="center">
  <img src="artwork/banner-light.svg#gh-light-mode-only" alt="Litestar Logo - Light" width="100%" height="auto" />
  <img src="artwork/banner-dark.svg#gh-dark-mode-only" alt="Litestar Logo - Dark" width="100%" height="auto" />
</p>
<!-- markdownlint-restore -->

<div align="center">

[![ci](https://github.com/litestar-org/litestar/actions/workflows/ci.yaml/badge.svg)](https://github.com/litestar-org/project-template/actions/workflows/ci.yaml)
[![PyPI - Version](https://badge.fury.io/py/litestar.svg)](https://badge.fury.io/py/litestar-project-template)
![PyPI - License](https://img.shields.io/pypi/l/litestar-project-template?color=blue)
![PyPI - Support Python Versions](https://img.shields.io/pypi/pyversions/litestar-project-template)

[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=litestar-org_project-template&metric=coverage)](https://sonarcloud.io/summary/new_code?id=litestar-org_project-template)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=litestar-org_project-template&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=litestar-org_project-template)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=litestar-org_project-template&metric=sqale_rating)](https://sonarcloud.io/summary/new_code?id=litestar-org_project-template)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=litestar-org_project-template&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=litestar-org_project-template)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=litestar-org_project-template&metric=security_rating)](https://sonarcloud.io/summary/new_code?id=litestar-org_project-template)

<!-- prettier-ignore-start -->
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-107-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
<!-- prettier-ignore-end -->

[![Reddit](https://img.shields.io/reddit/subreddit-subscribers/litestarapi?label=r%2FLitestar&logo=reddit)](https://reddit.com/r/litestarapi)
[![Discord](https://img.shields.io/discord/919193495116337154?color=blue&label=chat%20on%20discord&logo=discord)](https://discord.gg/X3FJqy8d2j)
[![Matrix](https://img.shields.io/badge/%5Bm%5D%20chat%20on%20Matrix-bridged-blue)](https://matrix.to/#/#litestar:matrix.org)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=flat&logo=medium&logoColor=white)](https://blog.litestar.dev)

</div>

# project-template

Template repository for packages belonging to Starlite-API org.

Usage:

- Pick this template in GitHub.
- If you don't want to use the `src` folder, rename it and replace all references to `src` with the new target folder.
- Run `pre-commit install && pre-commit autoupdate`
- Update pyproject.toml with your dependencies and run `poetry update` to create a lock file.
- Update the project description, keywords, author, maintainers etc. in pyproject.toml

## Docs

TODO

## Sonar

- Import the repository into sonarcloud and update the sonar properties file to use the correct project key.
- Add the `SONAR_TOKEN` secret in GitHub as an action secret.

## Release

- To release you need to set the `PYPI_TOKEN` value in GitHub.
