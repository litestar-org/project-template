Contribution Guide
==================

Thank you for your interest in contributing to ``project-template``! This guide
describes how to set up your environment and the workflow we follow.

By contributing you agree to follow the `Litestar Code of Conduct
<https://github.com/litestar-org/.github/blob/main/CODE_OF_CONDUCT.md>`_.

Getting Started
---------------

Supported Python versions
+++++++++++++++++++++++++

The lowest currently supported version is Python 3.8. At a minimum you will need
Python 3.8 for code changes, and 3.12 if you plan on building the documentation.

You can use various tools to manage multiple Python versions on your system:

* `pyenv <https://github.com/pyenv/pyenv>`_ (and `pyenv-win <https://github.com/pyenv-win/pyenv-win>`_ for Windows)
* `mise <https://mise.jdx.dev/>`_
* `asdf <https://asdf-vm.com/>`_
* `uv <https://docs.astral.sh/uv/guides/install-python/>`_, which can install and pin Python versions for you

We run type-checking against the lowest supported version in CI to ensure changes
remain backward compatible.

Setting up the environment
++++++++++++++++++++++++++

This project uses `uv <https://docs.astral.sh/uv/>`_ for package and environment
management, and a ``Makefile`` with shortcuts for common tasks. Run ``make help``
to see all available targets.

#. Install `uv <https://docs.astral.sh/uv/getting-started/installation/>`_. You can
   let the ``Makefile`` do it for you:

   .. code-block:: bash

      make install-uv

#. Install the project together with all dependency groups. This creates a
   `virtual environment <https://docs.python.org/3/tutorial/venv.html>`_ in ``.venv``:

   .. code-block:: bash

      make install

   This is equivalent to running ``uv sync --all-groups`` directly.

#. Install the ``pre-commit`` hooks so linters and formatters run automatically
   before each commit:

   .. code-block:: bash

      uv run pre-commit install --install-hooks

.. tip::

   Most modern IDEs (PyCharm, VS Code) will detect and use the ``.venv``
   virtual environment automatically. If yours does not, activate it manually with
   ``source .venv/bin/activate`` (``.venv\Scripts\activate`` on Windows), or prefix
   commands with ``uv run``. The rest of this document assumes the environment is active.

Code contributions
------------------

Workflow
++++++++

#. `Fork <https://github.com/litestar-org/project-template/fork>`_ the
   `project-template repository <https://github.com/litestar-org/project-template>`_
#. Clone your fork locally with git
#. Set up the environment as described above
#. Make your changes
#. (Optional) Run ``make lint`` to run linters, formatters, and type checks. This
   runs automatically via ``pre-commit`` before each commit, but you may want to run
   it manually to apply fixes
#. Commit your changes. We follow `Conventional Commits
   <https://www.conventionalcommits.org/>`_, which is enforced by a ``pre-commit`` hook
#. Push the changes to your fork
#. Open a `pull request <https://docs.github.com/en/pull-requests>`_. Give it a
   descriptive title that also follows `Conventional Commits
   <https://www.conventionalcommits.org/>`_ — this is enforced by a GitHub Action
#. Add yourself as a contributor using the `all-contributors bot
   <https://allcontributors.org/docs/en/bot/usage>`_

Guidelines for writing code
+++++++++++++++++++++++++++

- Code should be `Pythonic and zen <https://peps.python.org/pep-0020/>`_.
- All code should be fully `typed <https://peps.python.org/pep-0484/>`_. This is
  enforced via `mypy <https://mypy.readthedocs.io/en/stable/>`_, which runs as part of
  ``make lint``. `Pyright <https://github.com/microsoft/pyright/>`_ configuration is
  also provided.

  * If something cannot be typed correctly due to a limitation of the type checkers,
    you may use a properly scoped ``type: ignore`` — always supply the specific error
    code, e.g. ``type: ignore[attr-defined]``, never a bare ``type: ignore``.

- If you add or modify code, ensure it is fully tested. 100% test coverage is the goal
  and is reported via `Codecov <https://codecov.io/>`_ and `SonarCloud
  <https://www.sonarsource.com/products/sonarcloud/>`_.
- All public functions, methods, classes, and attributes should have a docstring. We
  use the `Google docstring style
  <https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html>`_.

Writing and running tests
+++++++++++++++++++++++++

Tests live in the ``tests`` directory and mirror the structure of the
``project_template`` package. The ``Makefile`` provides several targets:

- ``make test`` — run the tests in ``tests``
- ``make test-examples`` — run the documentation example tests in ``docs/examples``
- ``make test-all`` — run all tests
- ``make coverage`` — run the tests with coverage and generate HTML and XML reports
- ``make check-all`` — run linting, all tests, and coverage together

Project documentation
----------------------

The documentation lives in the ``docs`` directory and is written in
`reStructuredText <https://docutils.sourceforge.io/rst.html>`_ using
`Sphinx <https://www.sphinx-doc.org/en/master/>`_.

Running the docs locally
++++++++++++++++++++++++

Install the documentation dependencies and serve the docs with live reload:

.. code-block:: bash

   make docs-install
   make docs-serve

Use ``make docs`` to build the static HTML output.

Writing and editing docs
++++++++++++++++++++++++

When contributing to the docs, please:

- Write in idiomatic English, using simple language.
- Avoid contractions to ease reading for non-native English speakers.
- Use `Oxford commas <https://en.wikipedia.org/wiki/Serial_comma>`_ when listing terms.
- Keep examples simple and self-contained (see `Adding examples`_) so they are tested
  alongside the rest of the suite.
- Provide links where applicable and use `intersphinx
  <https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html>`_ when
  referencing external libraries.

Adding examples
~~~~~~~~~~~~~~~~

Documentation examples live in ``docs/examples`` so they can be tested alongside the
rest of the suite. When adding one:

- Add the example in the corresponding module directory under ``docs/examples`` (create
  one if necessary).
- Add a test for it under ``docs/examples/tests``.
- Reference it in the ``.rst`` file with a literal include, e.g.:

  .. code-block:: rst

     .. literalinclude:: /examples/test_thing.py
        :caption: A descriptive caption
