# Helm Plugin for Schema Generation

This is a plugin for helm that adds the `helm schema` command.

## Installation

* Run `helm plugin install https://github.com/holgerjh/helm-schema`.

* Run `helm schema`. It should output a help.

## Usage

The basic syntax to create a JSON Schema from files FILE...FILE-N is `helm create FILE [-f FILE2] [-f ...] [-f FILE-N] [-o OUTPUT]`.

Simple example: `helm create values.yaml -o values.schema.json`

Verify the newly generated schema against the chart: `helm lint .`

## Restrictions

Currently only linux is supported.

