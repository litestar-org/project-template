# project-template

<!-- markdownlint-disable -->
<img alt="Starlite logo" src="./starlite-banner.svg" width="100%" height="auto">
<!-- markdownlint-restore -->

<div align="center">

[![Discord](https://img.shields.io/discord/919193495116337154?color=blue&label=chat%20on%20discord&logo=discord)](https://discord.gg/X3FJqy8d2j)
[![Matrix](https://img.shields.io/badge/%5Bm%5D%20chat%20on%20Matrix-bridged-blue)](https://matrix.to/#/#starlitespace:matrix.org)

</div>

Template repository for packages belonging to Starlite-API org.

Usage:

- Pick this template in GitHub.
- If you don't want to use the `src` folder, rename it and replace all references to `src` with the new target folder.
- Run `pre-commit install && pre-commit autoupdate`
- Update pyproject.toml with your dependencies and run `poetry update` to create a lock file.
- Update the project description, keywords, author, maintainers etc. in pyproject.toml

## Docs

Update the `mkdocs.yml` file to point at the repository and docs site by replacing all places that have values
inside brackets, e.g. `<repo>.`

## Sonar

- Import the repository into sonarcloud and update the sonar properties file to use the correct project key.
- Add the `SONAR_TOKEN` secret in GitHub as an action secret.

## Release

- To release you need to set the `PYPI_TOKEN` value in GitHub.
