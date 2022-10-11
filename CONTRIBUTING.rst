############
Contributing
############

This document briefly describes how to contribute to
`psm_utils <https://github.com/compomics/psm_utils>`_.



Before you begin
################

If you have an idea for a feature, use case to add or an approach for a bugfix,
you are welcome to communicate it with the community by opening a
thread in
`GitHub Discussions <https://github.com/compomics/psm_utils/discussions>`_
or in `GitHub Issues <https://github.com/compomics/psm_utils/issues>`_.



Development setup
#################

Local install
*************

#. Setup Python 3, and preferably create a virtual environment.
#. Clone the `psm_utils repository <https://github.com/compomics/psm_utils>`_.
#. Use pip in editable mode to setup the development environment:

.. code-block:: sh

    pip install --editable .[dev,doc]



Unit tests
**********

Run tests with ``pytest``:

.. code-block:: sh

    pytest ./tests


Documentation
*************

To work on the documentation and get a live preview, install the requirements
and run ``sphinx-autobuild``:

.. code-block:: sh

    pip install .[doc]
    sphinx-autobuild  --watch ./psm_utils ./docs/source/ ./docs/_build/html/

Then browse to http://localhost:8000 to watch the live preview.


How to contribute
#################

- Fork `psm_utils <https://github.com/compomics/psm_utils>`_ on GitHub to
  make your changes.
- Commit and push your changes to your
  `fork <https://help.github.com/articles/pushing-to-a-remote/>`_.
- Ensure that the tests and documentation (both Python docstrings and files in
  ``/docs/source/``) have been updated according to your changes. Python
  docstrings are formatted in the
  `numpydoc style <https://numpydoc.readthedocs.io/en/latest/format.html>`_.
- Open a
  `pull request <https://help.github.com/articles/creating-a-pull-request/>`_
  with these changes. You pull request message ideally should include:

    - A description of why the changes should be made.
    - A description of the implementation of the changes.
    - A description of how to test the changes.

- The pull request should pass all the continuous integration tests which are
  automatically run by
  `GitHub Actions <https://github.com/compomics/psm_utils/actions>`_.



Release workflow
################

- When a new version is ready to be published:

    #. Change the ``__version__`` in ``psm_utils/__init__.py`` following
       `semantic versioning <https://semver.org/>`_.
    #. Update the changelog (if not already done) in ``CHANGELOG.md`` according to
       `Keep a Changelog <https://keepachangelog.com/en/1.0.0/>`_.
    #. Merge all final changes with the ``main`` branch.
    #. On ``main``, set a new tag with the version number, e.g. ``git tag v0.1.5``.
    #. Push to GitHub, with the tag: ``git push; git push --tags``.

- When a new tag is pushed to (or made on) GitHub that matches ``v*``, the
  following GitHub Actions are triggered:

    #. The Python package is build and published to PyPI.
    #. Using the `Git Release <https://github.com/marketplace/actions/git-release>`_
       action, a new GitHub release is made with the changes that are listed in
       ``CHANGELOG.md``.