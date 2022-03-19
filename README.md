# pre-commit-afcmf

pre-commit hooks to validate commit messages against the afcmf standard.

## Usage

Add the following to your `.pre-commit-config.yaml` in your repository:

```
repos:
- repo: https://github.com/FXinnovation/fx-pre-commit-afcmf
  rev: <put version here>
  hooks:
    - id: afcmf_commit_validation
```

and run the following command:

```
pre-commit install -t commit-msg
```

## AFCMF

AFCM stands for Automation Friendly Commit Message Format. *Pronunciation: af-se-məf*

The rationale behind these conventions is to provide a simple yet effective way to communicate changes, browse through the history of changes and automatically generate changelog files and release notes.

The following best practices were inspired by https://www.conventionalcommits.org/en/v1.0.0/ but we did make a couple of adjustments to better fit our needs.

* Commit messages MUST be split into sections.
* Commit messages SHOULD NOT contain typo's
* Commit messages MUST explain what changes are brought to the code.

### commit sections

* There MUST be a blank line between each commit section
* More commit sections MAY exist. e.g. commit footer

### commit title

* The commit title MUST exists.
* The commit title MUST be on the first line of the commit message.
* The commit title MUST be on a single line.
* The commit title SHOULD NOT have over 51 characters.
* The commit title MUST be prefixed with a type, which consists of a noun.
* The type MUST be one of the following: feat, refactor, chore, maintenance, fix, test, doc, revert
* The type MUST be followed by a colon and space.
* The feat type MUST be used for changes that brings a new functionnality.
* The refactor type MUST be used for code refactoring. These MUST NOT add new features, fix bugs, change test coverage, etc
* The chore type MUST be used for maintenance tasks that do not impact the final artifact. e.g. .gitignore, Jenkinsfile, etc
* The maintenance type MUST be used for maintenance tasks that do impact the final artifact. e.g. dependency updates, etc
* The fix type MUST be used for code changes that fixes a bug on an existent feature.
* The test type MUST be used for code changes on all types of tests.
* The doc type MUST be used for changes in documentation files e.g. README.md, CHANGELOG.md, etc
* The revert type MUST be used when reverting a commit.
* If the commit contains a breaking change (user will have to adapt their usage of the application) the type MUST be followed by the following: (BREAKING).
* The rest of the line SHOULD be used to briefly explain the objective of the commit.
* The commit title MAY contain references to external tools (ticket number, etc)

### commit body

* The commit body is OPTIONAL
* The commit body SHOULD contain detailed information and explanation on the change that is included in the code.
* The commit body MAY span over multiple lines

## Versioning

This repository follows [Semantic Versioning 2.0.0](https://semver.org/).

## Git Hooks

This repository uses [pre-commit](https://pre-commit.com/) hooks.

### Usage

```
pre-commit install
pre-commit install -t commit-msg
```

## Commit Messages

This repository follows the [afcmf](https://github.com/FXinnovation/fx-pre-commit-afcmf) standard for it's commit messages.

## Changelog

The changelog message is generated using the `git-extras` package using the following command:
```
git changelog -a -t <target-version> -p
```
