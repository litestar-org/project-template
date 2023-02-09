# project-template

<!-- markdownlint-disable -->
<p align="center">
  <img src="https://github.com/starlite-api/branding/blob/9ab099a2089219c07727baaa29f67e9474ff93c8/assets/Starlite%20Branding%20-%20SVG%20-%20Transparent/Logo%20-%20Banner%20-%20Inline%20-%20Light.svg#gh-light-mode-only" alt="Starlite Logo - Light" width="100%" height="auto" />
  <img src="https://github.com/starlite-api/branding/blob/9ab099a2089219c07727baaa29f67e9474ff93c8/assets/Starlite%20Branding%20-%20SVG%20-%20Transparent/Logo%20-%20Banner%20-%20Inline%20-%20Dark.svg#gh-dark-mode-only" alt="Starlite Logo - Dark" width="100%" height="auto" />
</p>
<!-- markdownlint-restore -->

<div align="center">

[![Discord](https://img.shields.io/discord/919193495116337154?color=202235&label=%20Discord&logo=discord)](https://discord.gg/X3FJqy8d2j)                                 [![Matrix](https://img.shields.io/badge/%5Bm%5D%20Matrix-bridged-blue?color=202235)](https://matrix.to/#/#starlitespace:matrix.org)                                       [![Reddit](https://img.shields.io/reddit/subreddit-subscribers/starlite?label=r%2FStarlite&logo=reddit)](https://reddit.com/r/starlite)
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
