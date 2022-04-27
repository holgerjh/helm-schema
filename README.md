# Helm Plugin for Schema Generation

This is a plugin for helm that adds the `helm schema` command.

## Demo

[![asciicast](https://asciinema.org/a/SHK3tI9X7OwZ4tW4M9ZDYcRz4.png)](https://asciinema.org/a/SHK3tI9X7OwZ4tW4M9ZDYcRz4)

## Installation

* Run `helm plugin install https://github.com/holgerjh/helm-schema`.

* Run `helm schema`. It should output a help.

## Usage

### Schema Creation

The syntax to create a JSON Schema from files FILE-1 ... FILE-N is:

`helm create FILE-1 [-f FILE-2] [-f ...] [-f FILE-N] [-o OUTPUT-FILE]`.

To create a schema from a chart with a single values.yaml: 

`helm create values.yaml -o values.schema.json`

To create a schema from a chart with multiple yaml files: 

`helm create values.yaml -f my-other-values.yaml -o values.schema.json`

### Schema Verification

Verify the newly generated schema against the chart: `helm lint .`

## Restrictions

Currently only linux is supported.

## Uninstall

Run `helm plugin uninstall schema`.
